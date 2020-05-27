unit Form.Main;

interface

uses
  Command.API,
  Command.Invoker,
  Command.Receiver,
  Command.Undoable,
  Component.Factory.Method,
  Component.Factory.API,
  FMX.ActnList,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Forms,
  FMX.ImgList,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.TreeView,
  FMX.Types,
  Helper.FMX.Lang,
  Helper.FMX.FMXObject,
  Helper.FMX.Hyperlink,
  Helper.FMX.TabControl,
  Helper.FMX.TreeView,
  Rest.Json,
  System.Actions,
  System.Classes,
  System.Generics.Collections,
  System.ImageList,
  System.IOUtils,
  System.Rtti,
  System.StrUtils,
  System.SysUtils,
  System.UITypes,
  Types.Binding,
  Component.DTO,
  Input.Config,
  Input.Item,
  Types.Dialogs,
  Types.Utils,
  Types.Lock,
  Types.Consts,
  Validation.Validator,
  Types.RegisterClass,
  Ini.Base,
  Ini.API;

type
  TMain = class sealed(TForm)
    ActionCancel: TAction;
    ActionList: TActionList;
    ActionSaveTarget: TAction;
    ActionSaveSource: TAction;
    ButtonCancel: TButton;
    ButtonSaveSource: TButton;
    ButtonSaveTarget: TButton;
    Panel: TPanel;
    TabControl: TTabControl;
    TabTreeView: TTabItem;
    TreeView: TTreeView;
    TabFile: TTabItem;
    TabControlFile: TTabControl;
    ImageList: TImageList;
    StatusBar: TStatusBar;
    LabelHelp: TLabel;
    EditFilter: TEdit;
    ActionSelectFile: TAction;
    Language: TLang;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionSaveTargetExecute(Sender: TObject);
    procedure ActionSaveSourceExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure LabelHelpMouseLeave(Sender: TObject);
    procedure LabelHelpMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure LabelHelpClick(Sender: TObject);
    procedure ActionSelectFileExecute(Sender: TObject);
    procedure EditFilterChangeTracking(Sender: TObject);
  strict private
    FFiles: TDictionary<TTreeViewItem, TItem>;
    FModel: IIniMappedObject;
    FInvoker: ICommandInvoker;
    FBinding: TBinding;
    FLock: TLock;
    FCurrent: TItem;
    FInput: TInput;
  private
    function HasChanges: Boolean;
    function CanSelectFile(const Item: TItem): Boolean;
    function ValidateValue(const Control: IControl; out Error: string): Boolean;
    procedure ControlView;
    procedure MakeTree;
    procedure ModelToView; overload;
    procedure ModelToView(const Model: TObject; const Owner: IControl); overload;
    procedure OnNotify(Sender: TObject);
    procedure ReadInput;
    procedure ClearView;
    procedure WriteFile(const FileName: TFileName);
    procedure AfterSelectCurrent;
    procedure Translate;
    procedure UpdateValue(const Control: IControl);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
  end;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

constructor TMain.Create(AOwner: TComponent);
begin
  inherited;
  TUtils.DefineBoolStrs('N', 'S');

  FInvoker := TCommandInvoker.Create;
  FBinding := TBinding.Create;
  FLock := TLock.Create;
  FFiles := TDictionary<TTreeViewItem, TItem>.Create;
end;

destructor TMain.Destroy;
begin
  FInput.Free;
  FFiles.Free;
  FLock.Free;
  FBinding.Free;
  inherited;
end;

procedure TMain.EditFilterChangeTracking(Sender: TObject);
begin
  TreeView.Filter((Sender as TEdit).Text);
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TMain.ActionSelectFileExecute(Sender: TObject);
var
  Item: TItem;
begin
  if not FFiles.ContainsKey(TreeView.Selected) then
  begin
    Exit;
  end;

  Item := FFiles.Items[TreeView.Selected];
  if CanSelectFile(Item) then
  begin
    FCurrent := Item;
    try
      FModel := TIniMappedObjectClass(RegisteredClasses.FindClass(FCurrent.ClassName)).Create(FCurrent.Source);
      AfterSelectCurrent;
    except
      on Exception: EClassNotFound do
      begin
        TDialogs.Warning(SClassShouldBeRegistrated, [FCurrent.ClassName]);
      end;
    end;
  end;
end;

procedure TMain.ActionSaveSourceExecute(Sender: TObject);
begin
  WriteFile(FCurrent.Source);
end;

procedure TMain.ActionSaveTargetExecute(Sender: TObject);
begin
  WriteFile(FCurrent.Target);
end;

procedure TMain.AfterConstruction;
begin
  inherited;
  ReadInput;
  MakeTree;
  Translate;
  TabControl.ActiveTab := TabTreeView;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HasChanges and not TDialogs.Confirmation(SUnsavedChangesWantToExitAnyway) then
    Abort;

  inherited;
end;

procedure TMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vkZ) then
  begin
    FLock.Execute(
      procedure
      begin
        FInvoker.Execute;
        ControlView;
      end);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  ControlView;
end;

function TMain.HasChanges: Boolean;
begin
  Result := not FInvoker.IsEmpty;
end;

procedure TMain.LabelHelpClick(Sender: TObject);
begin
  TUtils.OpenURL(FInput.HelpURL);
end;

procedure TMain.LabelHelpMouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Style := TLabelStyle.None;
end;

procedure TMain.LabelHelpMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  (Sender as TLabel).Style := TLabelStyle.HyperLink;
end;

procedure TMain.MakeTree;
var
  Item: TItem;
  Node: TTreeViewItem;
  Text: string;
begin
  for Item in FInput.Items do
  begin
    Text := IfThen(Item.Group.IsEmpty, SUngrouped, Item.Group) + TTreeView.Separator + Item.Name;

    Node := TreeView.MakeNode(Text);
    Node.ImageIndex := Item.CanOverride.ToInteger;

    FFiles.AddOrSetValue(Node, Item);
  end;
end;

procedure TMain.ModelToView;
begin
  ModelToView(FModel.GetObject, TabControlFile);
end;

procedure TMain.ModelToView(const Model: TObject; const Owner: IControl);
begin
  FLock.Execute<TObject, IControl>(
    procedure(Model: TObject; Owner: IControl)
    var
      Context: TRttiContext;
      Factory: IComponentFactory;
      Component: IControl;
      DTO: TComponentDTO;
      Prop: TRttiProperty;
    begin
      DTO := TComponentDTO.Create(DEFAULT_COMPONENT_OFFSET);
      try
        Context := TRttiContext.Create;
        for Prop in Context.GetType(Model.ClassType).GetProperties do
        begin
          DTO.OnNotify := OnNotify;
          DTO.Owner := Owner;
          DTO.Prop := Prop;

          Factory := TComponentFactoryMethod.Fabricate(DTO);
          if not Assigned(Factory) then
          begin
            Continue;
          end;

          Component := Factory.New;
          Component.GetObject.Value := Prop.GetValue(Model);
          FBinding.Add(Component, Model, Prop);

          if Component is TScrollBox then
          begin
            ModelToView(Prop.GetValue(Model).AsObject, Component);
          end;
        end;
      finally
        DTO.Free;
      end;
    end, Model, Owner);
end;

procedure TMain.OnNotify(Sender: TObject);
var
  Control: IControl;
  Error: string;
begin
  if FLock.Locked then
    Exit;

  Control := Sender as TControl;

  UpdateValue(Control);
  if ValidateValue(Control, Error) then
  begin
    ControlView;
    Exit;
  end;

  FLock.Execute(procedure
                begin
                  FInvoker.Execute;
                  TDialogs.Warning(Error);
                  Abort;
                end);
end;

procedure TMain.AfterSelectCurrent;
begin
  ClearView;
  ControlView;
  ModelToView;

  TabControl.ActiveTab := TabFile;
  TabControlFile.OrderTabs(FCurrent.Tabs);
end;

procedure TMain.Translate;
begin
  Language.Translate(FInput.Language);
end;

procedure TMain.UpdateValue(const Control: IControl);
var
  Old, New: TValue;
begin
  Old := FBinding.Value[Control];
  New := Control.GetObject.Value;

  FInvoker.Add(TUndoableCommand.Create(TReceiver.Create(Control, Old)));

  FBinding.Value[Control] := New;
end;

function TMain.ValidateValue(const Control: IControl; out Error: string): Boolean;
var
  Validator: TValidator;
  ValidationResult: TValidationResult;
begin
  Validator := TValidator.Create(FBinding.Prop[Control], Control.GetObject.Value);
  try
    ValidationResult := Validator.Validate;

    Error := ValidationResult.Value;
    Result := ValidationResult.Key;
  finally
    Validator.Free
  end;
end;

procedure TMain.ReadInput;
begin
  try
    FInput := TJson.JsonToObject<TInput>(TFile.ReadAllText(TInput.Path));
  except
    on Exception: EFileNotFoundException do
    begin
      TDialogs.Warning(SFileNotFound, [Exception.Message]);
      Halt;
    end;
  end;
end;

procedure TMain.ClearView;
begin
  FBinding.Clear;
  FInvoker.Clear;
  TabControlFile.Clear;
end;

procedure TMain.WriteFile(const FileName: TFileName);
begin
  FModel.Write(FileName);
  TDialogs.Information(SFileSuccessfullySaved);

  FInvoker.Clear;
  ControlView;
end;

function TMain.CanSelectFile(const Item: TItem): Boolean;
begin
  Result := False;

  if not Assigned(Item) then
  begin
    Exit;
  end;

  if Item.Equals(FCurrent) then
  begin
    Exit;
  end;

  if HasChanges and not TDialogs.Confirmation(SUnsavedChangesWantToChangeFileAnyway) then
  begin
    Exit;
  end;

  if not TFile.Exists(Item.Source) then
  begin
    TDialogs.Warning(SFileNotFound, [Item.Source]);
    Exit;
  end;

  Result := True;
end;

procedure TMain.ControlView;
begin
  TabFile.Visible := Assigned(FCurrent);

  if not TabFile.Visible then
    Exit;

  TabFile.Text := FCurrent.Source + CHANGE_INDICATOR[HasChanges];
  ActionSaveSource.Enabled := Assigned(FCurrent) and FCurrent.CanOverride;
  ActionSaveTarget.Enabled := Assigned(FCurrent);
  ButtonSaveSource.Hint := FCurrent.Source;
  ButtonSaveTarget.Hint := FCurrent.Target;
end;

end.

