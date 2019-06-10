unit Form.Main;

interface

uses
  Command.Invoker,
  Command.Receiver,
  Command.Undoable,
  FactoryMethod.ControlTemplate,
  FMX.ActnList,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.ImgList,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.TreeView,
  FMX.Types,
  Helper.FMX.FMXObject,
  Helper.FMX.TreeView,
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
  Types.Path,
  Types.Utils;

type
  TMain = class(TForm)
    ActionCancel: TAction;
    ActionList: TActionList;
    ActionReplace: TAction;
    ActionSave: TAction;
    ButtonCancel: TButton;
    ButtonReplace: TButton;
    ButtonSave: TButton;
    PanelButtons: TPanel;
    TabControlView: TTabControl;
    TabItemFiles: TTabItem;
    TreeViewItems: TTreeView;
    TabItemSelectedFile: TTabItem;
    TabControlFile: TTabControl;
    ImageListIcons: TImageList;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionReplaceExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TreeViewItemsDblClick(Sender: TObject);
  private
    FBinding: TBinding;
    FInvoker: TCommandInvoker;
    FInput: TInput<TConfig>;
    FLockNotify: Boolean;
    function HasChanges: Boolean;
    procedure ControlView(const Text: string = string.Empty);
    procedure MakeTree;
    procedure ModelToView(const Model: TObject; const Parent: IControl);
    procedure Notify(Sender: TObject);
    procedure ReadInput;
    procedure Replace;
    procedure RestoreView;
    procedure Save;
    procedure SelectFile(const Path: TObject);
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

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TMain.ActionReplaceExecute(Sender: TObject);
begin
  Replace;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  Save;
end;

procedure TMain.AfterConstruction;
begin
  inherited;
  ReadInput;
  FInput.Read;
  MakeTree;
  TabControlView.ActiveTab := TabItemFiles;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HasChanges and not TUtils.Dialogs.Confirmation('Existem altera��es n�o salvas, deseja sair mesmo assim?') then
    Abort;

  inherited;
end;

procedure TMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Shift <> [ssCtrl] then
    Exit;

  if Key <> vkZ then
    Exit;

  FLockNotify := True;
  try
    FInvoker.Execute;
    ControlView;
  finally
    FLockNotify := False;
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

procedure TMain.MakeTree;
var
  Path: TPath<TConfig>;
  Node: TTreeViewItem;
  Text: string;
begin
  for Path in FInput.Items do
  begin
    Text := IfThen(Path.Group.IsEmpty, 'Sem grupo', Path.Group) + '/' + Path.Name;

    Node := TreeViewItems.MakeNode(Text);
    if Assigned(Node) then
    begin
      Node.TagObject := Path;
      Node.ImageIndex := Path.CanOverride.ToInteger;
    end;
  end;

  TreeViewItems.ExpandAll;
end;

procedure TMain.ModelToView(const Model: TObject; const Parent: IControl);
var
  Context: TRttiContext;
  Control: IControl;
  DTO: TControlDTO;
  Prop: TRttiProperty;
  Template: TControlTemplate;
begin
  FLockNotify := True;
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

      Template := TControlTemplateFactory.Fabricate(DTO);
      try
        if Assigned(Template) then
        begin
          Control := Template.CreateControl;

          FBinding.Add(Model, Prop, Control);

          if Template is TTabItemTemplate then
            ModelToView(Prop.GetValue(Model).AsObject, Control);
        end;
      finally
        if Assigned(Template) then
          Template.Free;
      end;
    end;
  finally
    DTO.Free;
    FLockNotify := False;
  end;
end;

procedure TMain.Notify(Sender: TObject);
var
  Control: TControl;
  Receiver: TReceiver;
  Old, New: TValue;
begin
  if FLockNotify then
    Exit;

  Control := Sender as TControl;

  Old := FBinding.Values[Control];
  New := Control.Value;

  Receiver := TReceiver.Create(Control, Old);
  FInvoker.Add(TUndoableCommand.Create(Receiver));
  FBinding.Values[Control] := New;

  ControlView;
end;

procedure TMain.SelectFile(const Path: TObject);
begin
  if not Assigned(Path) then
    Exit;

  if HasChanges and not TUtils.Dialogs.Confirmation('Existem altera��es n�o salvas, deseja trocas mesmo assim?') then
    Exit;

  if Assigned(FInput.Current) and FInput.Current.Equals(Path) then
    Exit;

  FInput.Current := Path as TPath<TConfig>;

  TabControlView.ActiveTab := TabItemSelectedFile;

  RestoreView;

  ControlView(FInput.Current.Source);

  ModelToView(FInput.Current.Model, TabControlFile);
end;

procedure TMain.ReadInput;
var
  FileName: TFileName;
begin
  try
    FileName := TUtils.Methods.FilePath(TInput<TConfig>.FileName);
    FInput := TJson.JsonToObject<TInput<TConfig>>(TFile.ReadAllText(FileName));
  except
    on E: EFileNotFoundException do
    begin
      TUtils.Dialogs.Warning('Arquivo "%s" não encontrado.', [FileName]);
      Halt;
    end;
  end;
end;

procedure TMain.Replace;
begin
  FInput.Current.Model.Write(FInput.Current.Target);
  FInvoker.Clear;
  ControlView;
  TUtils.Dialogs.Information('O arquivo foi substituido com sucesso!');
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

procedure TMain.Save;
begin
  FInput.Current.Model.Write;
  FInvoker.Clear;
  ControlView;
  TUtils.Dialogs.Information('O arquivo foi salvo com sucesso!');
end;

procedure TMain.TreeViewItemsDblClick(Sender: TObject);
begin
  if Assigned(TreeViewItems.Selected) then
    SelectFile(TreeViewItems.Selected.TagObject);
end;

procedure TMain.ControlView(const Text: string);
var
  LText: string;
begin
  LText := Text;
  if LText.Trim.IsEmpty then
    LText := TabItemSelectedFile.Text;

  LText := LText.Replace(TUtils.Constants.ChangeChar, string.Empty);
  if HasChanges and not LText.Contains(TUtils.Constants.ChangeChar) then
    LText := LText + TUtils.Constants.ChangeChar;

  TabItemSelectedFile.Text := LText;

  ActionSave.Enabled := Assigned(FInput.Current) and HasChanges;
  ActionReplace.Enabled := ActionSave.Enabled and FInput.Current.CanOverride;
end;

end.

