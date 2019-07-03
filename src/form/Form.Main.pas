﻿unit Form.Main;

interface

uses
  Command.Invoker,
  Command.Receiver,
  Command.Undoable,
  FactoryMethod.Control,
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
  Helper.FMX.FMXObject,
  Helper.FMX.TreeView,
  Helper.Rtti,
  Model.Config,
  Rest.Json,
  System.Actions,
  System.Classes,
  System.Generics.Collections,
  System.ImageList,
  System.IOUtils,
  System.Rtti,
  System.StrUtils,
  System.SysUtils,
  System.TypInfo,
  System.UITypes,
  Template.AbstractClass,
  Template.TabItem,
  Types.Binding,
  Types.DTO,
  Types.Input,
  Types.Input.Item,
  Types.Utils,
  Types.Validator, FMX.Menus, FMX.Ani;

type
  TMain = class(TForm)
    ActionCancel: TAction;
    ActionList: TActionList;
    ActionSaveTarget: TAction;
    ActionSaveSource: TAction;
    ButtonCancel: TButton;
    ButtonSaveSource: TButton;
    ButtonSaveTarget: TButton;
    PanelButtons: TPanel;
    TabControlView: TTabControl;
    TabItemFiles: TTabItem;
    TreeViewItems: TTreeView;
    TabItemSelectedFile: TTabItem;
    TabControlFile: TTabControl;
    ImageListIcons: TImageList;
    StatusBar: TStatusBar;
    LabelHelp: TLabel;
    EditFilter: TEdit;
    ActionEdit: TAction;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionSaveTargetExecute(Sender: TObject);
    procedure ActionSaveSourceExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure LabelHelpMouseLeave(Sender: TObject);
    procedure LabelHelpMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure LabelHelpClick(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure EditFilterChangeTracking(Sender: TObject);
  private
    FBinding: TBinding;
    FInvoker: TCommandInvoker;
    FInput: TInput<TConfig>;
    FLock: Boolean;
    function HasChanges: Boolean;
    procedure ControlView(const Text: string = string.Empty);
    procedure ExecuteWithLock(const Proc: TProc);
    procedure MakeTree;
    procedure ModelToView(const Model: TObject; const Parent: IControl);
    procedure Notify(Sender: TObject);
    procedure ReadInput;
    procedure RestoreView;
    procedure Save(const FileName: TFileName);
    procedure SelectFile(const InputItem: TObject);
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
  TUtils.Conversions.DefineBoolean('N', 'S');
  FInvoker := TCommandInvoker.Create;
  FBinding := TBinding.Create;
end;

destructor TMain.Destroy;
begin
  FBinding.Free;
  FInvoker.Free;
  FInput.Free;
  inherited;
end;

procedure TMain.EditFilterChangeTracking(Sender: TObject);
begin
  TreeViewItems.Filter((Sender as TEdit).Text);
end;

procedure TMain.ExecuteWithLock(const Proc: TProc);
begin
  FLock := True;
  try
    Proc;
  finally
    FLock := False;
  end;
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TMain.ActionSaveTargetExecute(Sender: TObject);
begin
  Save(FInput.Current.Target);
end;

procedure TMain.ActionEditExecute(Sender: TObject);
begin
  if Assigned(TreeViewItems.Selected) then
    SelectFile(TreeViewItems.Selected.TagObject);
end;

procedure TMain.ActionSaveSourceExecute(Sender: TObject);
begin
  Save(FInput.Current.Source);
end;

procedure TMain.AfterConstruction;
begin
  inherited;
  ReadInput;
  MakeTree;
  TabControlView.ActiveTab := TabItemFiles;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HasChanges and not TUtils.Dialogs.Confirmation('Existem alterações não salvas, deseja sair mesmo assim?') then
    Abort;

  inherited;
end;

procedure TMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Shift <> [ssCtrl] then
    Exit;

  if Key <> vkZ then
    Exit;

  ExecuteWithLock(
    procedure
    begin
      FInvoker.Execute;
      ControlView;
    end);
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
  TUtils.Methods.OpenURL(TUtils.Constants.HelpURL);
end;

procedure TMain.LabelHelpMouseLeave(Sender: TObject);
begin
  (Sender as TLabel).SetStyle(TLabel.TLabelStyle.lsNone);
end;

procedure TMain.LabelHelpMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  (Sender as TLabel).SetStyle(TLabel.TLabelStyle.lsHyperLink);
end;

procedure TMain.MakeTree;
var
  Item: TInputItem<TConfig>;
  Node: TTreeViewItem;
  Text: string;
begin
  for Item in FInput.Items do
  begin
    Text := IfThen(Item.Group.IsEmpty, 'Sem grupo', Item.Group) + TTreeView.Separator + Item.Name;

    Node := TreeViewItems.MakeNode(Text);
    if Assigned(Node) then
    begin
      Node.TagObject := Item;
      Node.ImageIndex := Item.CanOverride.ToInteger;
    end;
  end;
end;

procedure TMain.ModelToView(const Model: TObject; const Parent: IControl);
var
  Context: TRttiContext;
  Control: IControl;
  DTO: TControlDTO;
  Prop: TRttiProperty;
  Template: TControlTemplate;
begin
  FLock := True;
  DTO := TControlDTO.Create;
  try
    Context := TRttiContext.Create;
    for Prop in Context.GetType(Model.ClassType).GetProperties do
    begin
      DTO.Model    := Model;
      DTO.OnNotify := Notify;
      DTO.Owner    := Self;
      DTO.Parent   := Parent;
      DTO.Prop     := Prop;

      Template := TControlFactory.Fabricate(DTO);
      if Assigned(Template) then
      begin
        try
          Control := Template.New;

          FBinding.Add(Control, Model, Prop);

          if Template is TTabItemTemplate then
            ModelToView(Prop.GetValue(Model).AsObject, Control);
        finally
          Template.Free;
        end;
      end;
    end;
  finally
    DTO.Free;
    FLock := False;
  end;
end;

procedure TMain.Notify(Sender: TObject);

  function Validate(const Control: TControl; out Error: string): Boolean;
  var
    Prop: TRttiProperty;
  begin
    Result := False;

    Prop := FBinding.Prop[Control];
    if not Assigned(Prop) then
      Exit;

    Result := TValidator.Validate(Prop, Control.Value);
    Error := TValidator.Error;
  end;

  procedure UpdateValue(const Control: TControl);
  var
    Receiver: TReceiver;
    Old, New: TValue;
  begin
    Old := FBinding.Values[Control];
    New := Control.Value;

    Receiver := TReceiver.Create(Control, Old);
    FInvoker.Add(TUndoableCommand.Create(Receiver));
    FBinding.Values[Control] := New;
  end;

var
  Control: TControl;
  Error: string;
begin
  if FLock then
    Exit;

  Control := Sender as TControl;

  UpdateValue(Control);
  if not Validate(Control, Error) then
  begin
    TUtils.Dialogs.Warning(Error);
    ExecuteWithLock(FInvoker.Execute);
    Abort;
  end;
  ControlView;
end;

procedure TMain.SelectFile(const InputItem: TObject);
begin
  if not Assigned(InputItem) then
    Exit;

  if Assigned(FInput.Current) and FInput.Current.Equals(InputItem) then
    Exit;

  if HasChanges and not TUtils.Dialogs.Confirmation('Existem alterações não salvas, deseja trocar mesmo assim?') then
    Exit;

  FInput.Current := InputItem as TInputItem<TConfig>;

  TabControlView.ActiveTab := TabItemSelectedFile;

  RestoreView;

  ControlView(FInput.Current.Source);

  ModelToView(FInput.Current.Model, TabControlFile);

  TabControlFile.OrderTabs(FInput.Tabs);
end;

procedure TMain.ReadInput;
var
  FileName: TFileName;
begin
  try
    FileName := TUtils.Methods.FilePath(TInput<TConfig>.FileName);
    FInput := TJson.JsonToObject<TInput<TConfig>>(TFile.ReadAllText(FileName));
    FInput.Read;
  except
    on Exception: EFileNotFoundException do
    begin
      TUtils.Dialogs.Warning('Arquivo não encontrado: %s.', [Exception.Message]);
      Halt;
    end;
  end;
end;

procedure TMain.RestoreView;
var
  TabIndex: Integer;
begin
  FBinding.Clear;
  FInvoker.Clear;
  for TabIndex := Pred(TabControlFile.TabCount) downto 0 do
  begin
    TabControlFile.Delete(TabIndex);
  end;
end;

procedure TMain.Save(const FileName: TFileName);
begin
  FInput.Current.Model.Write(FileName);
  FInvoker.Clear;
  ControlView;
  TUtils.Dialogs.Information('O arquivo foi salvo com sucesso!');
end;

procedure TMain.ControlView(const Text: string);
var
  LText: string;
begin
  LText := IfThen(Text.IsEmpty, TabItemSelectedFile.Text, Text);
  LText := LText.Replace(TUtils.Constants.ChangeIndicator, string.Empty);

  if HasChanges and not LText.Contains(TUtils.Constants.ChangeIndicator) then
    LText := LText + TUtils.Constants.ChangeIndicator;

  ActionSaveSource.Enabled := Assigned(FInput.Current) and HasChanges and FInput.Current.CanOverride;
  ActionSaveTarget.Enabled := Assigned(FInput.Current);

  TabItemSelectedFile.Text := LText;
  TabItemSelectedFile.Visible := Assigned(FInput.Current);

  if Assigned(FInput.Current) then
  begin
    ButtonSaveSource.Hint := FInput.Current.Source;
    ButtonSaveTarget.Hint := FInput.Current.Target;
  end;
end;

end.

