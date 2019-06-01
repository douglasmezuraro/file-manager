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
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.TreeView,
  FMX.Types,
  Helper.FMX,
  Model.Config,
  Rest.Json,
  System.Actions,
  System.Classes,
  System.Generics.Collections,
  System.IOUtils,
  System.Rtti,
  System.SysUtils,
  System.TypInfo,
  System.UITypes,
  Template.AbstractClass,
  Template.TabItem,
  Types.Binding,
  Types.DTO,
  Types.Path,
  Types.Paths,
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
    FPaths: TPaths<TConfig>;
    FLockOnNotifyEvent: Boolean;
    function HasChanges: Boolean;
    procedure ControlView(const NewCaption: string = string.Empty);
    function MakeNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
    procedure MakeTree;
    procedure ModelToView(const Obj: TObject; const Parent: IControl);
    procedure Notify(Sender: TObject);
    procedure ReadFile(const Text: string);
    procedure ReadInput;
    procedure Replace;
    procedure RestoreView;
    procedure Save;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
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
  ReadInput;
end;

destructor TMain.Destroy;
begin
  FBinding.Free;
  FInvoker.Free;
  FPaths.Free;
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

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HasChanges and not TUtils.Dialogs.Confirmation('Existem alterações não salvas, deseja sair mesmo assim?') then
    Abort;

  inherited;
end;

procedure TMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Shift <> [ssCtrl] then
    Exit;

  FLockOnNotifyEvent := True;
  try
    case Key of
      vkZ:
        begin
          FInvoker.Execute;
          ControlView;
        end;
      vkY:
        begin
          // TODO: Implement redo
        end;
    end;
  finally
    FLockOnNotifyEvent := False;
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

function TMain.MakeNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
var
  Delimiter: Integer;
  Item, Child: string;
begin
  Child := string.Empty;
  Item := Text;

  if Text.Contains('.') then
  begin
    Delimiter := Text.IndexOf('.');
    Item := Text.Substring(0, Delimiter);
    Child := Text.Substring(Succ(Delimiter));
  end;

  if Item.Trim.IsEmpty then
    Exit(nil);

  Result := TreeViewItems.ItemByText(Item);

  if not Assigned(Result) then
  begin
    Result := TTreeViewItem.Create(Owner);
    Result.Text := Item;
    Result.Parent := Owner;
  end;

  if not Child.IsEmpty then
    Result := MakeNode(Result, Child);
end;

procedure TMain.MakeTree;
var
  Path: TPath<TConfig>;
  Item, Group: TTreeViewItem;
begin
  for Path in FPaths.Items do
  begin
    Group := MakeNode(TreeViewItems, Path.Group);
    if Assigned(Group) then
    begin
      Item := TTreeViewItem.Create(Group);
      Item.Text := Path.Name;
      Item.Parent := Group;
    end;
  end;
  TreeViewItems.ExpandAll;
end;

procedure TMain.ModelToView(const Obj: TObject; const Parent: IControl);
var
  Context: TRttiContext;
  Control: IControl;
  DTO: TControlDTO;
  Prop: TRttiProperty;
  Template: TControlTemplate;
begin
  FLockOnNotifyEvent := True;

  DTO := TControlDTO.Create(10, 10);
  Context := TRttiContext.Create;
  for Prop in Context.GetType(Obj.ClassType).GetProperties do
  begin
    DTO.Model    := Obj;
    DTO.OnNotify := Notify;
    DTO.Owner    := Self;
    DTO.Parent   := Parent;
    DTO.Prop     := Prop;

    Template := TControlTemplateFactory.Fabricate(Prop);
    try
      if Assigned(Template) then
      begin
        Template.DTO := DTO;
        Control := Template.CreateControl;
        DTO := Template.DTO;

        FBinding.Add(Obj, Prop, Control);

        if Template is TTabItemTemplate then
          ModelToView(Prop.GetValue(Obj).AsObject, Control);
      end;
    finally
      if Assigned(Template) then
        Template.Free;
    end;
  end;

  FLockOnNotifyEvent := False;
end;

procedure TMain.Notify(Sender: TObject);
var
  Control: TControl;
  Receiver: TReceiver;
  OldValue, NewValue: TValue;
begin
  if FLockOnNotifyEvent then
    Exit;

  Control := Sender as TControl;

  OldValue := FBinding.Values[Control];
  NewValue := Control.Value;

  Receiver := TReceiver.Create(Control, OldValue);
  FInvoker.Add(TUndoableCommand.Create(Receiver));
  FBinding.Values[Control] := NewValue;

  ControlView;
end;

procedure TMain.ReadFile(const Text: string);
begin
  if HasChanges and not TUtils.Dialogs.Confirmation('Existem alterações não salvas, deseja trocas mesmo assim?') then
    Exit;

  if Assigned(FPaths.Current) and FPaths.Current.Name.Equals(Text) then
    Exit;

  FPaths.Current := FPaths.Item[Text];

  TabControlView.ActiveTab := TabItemSelectedFile;

  RestoreView;

  ControlView(FPaths.Current.Source);

  ModelToView(FPaths.Current.Model, TabControlFile);
end;

procedure TMain.ReadInput;
var
  JSON: string;
begin
  try
    JSON := TFile.ReadAllText(TUtils.Methods.FilePath(TUtils.Constants.InputFile));
    FPaths := TJson.JsonToObject<TPaths<TConfig>>(JSON);

    MakeTree;

    FPaths.Populate;
  except
    on E: EFileNotFoundException do
    begin
      TUtils.Dialogs.Information('Arquivo %s não encontrado.', [TUtils.Constants.InputFile]);
      Halt;
    end;
  end;
end;

procedure TMain.Replace;
begin
  FPaths.Current.Model.Write;
  FInvoker.Clear;
  ControlView;
end;

procedure TMain.RestoreView;
var
  I, J: Integer;
begin
  FBinding.Clear;
  FInvoker.Clear;

  for I := Pred(TabControlFile.TabCount) downto 0 do
  begin
    for J := Pred(TabControlFile.Tabs[I].ComponentCount) downto 0 do
    begin
      TabControlFile.Tabs[I].RemoveComponent(TabControlFile.Tabs[I].Components[J]);
    end;
    TabControlFile.Delete(I);
  end;
end;

procedure TMain.Save;
begin
  FPaths.Current.Model.Write(FPaths.Current.Target);
  FInvoker.Clear;
  ControlView;
end;

procedure TMain.TreeViewItemsDblClick(Sender: TObject);
begin
  ReadFile(TreeViewItems.Selected.Text);
end;

procedure TMain.ControlView(const NewCaption: string);
begin
  if not NewCaption.Trim.IsEmpty then
    TabItemSelectedFile.Text := NewCaption;

  TabItemSelectedFile.Text := TabItemSelectedFile.Text.Replace(TUtils.Constants.ChangeChar, string.Empty);
  if HasChanges and not TabItemSelectedFile.Text.Contains(TUtils.Constants.ChangeChar) then
    TabItemSelectedFile.Text := TabItemSelectedFile.Text + TUtils.Constants.ChangeChar;

  ActionSave.Enabled := Assigned(FPaths.Current) and (not FInvoker.IsEmpty);
  ActionReplace.Enabled := Assigned(FPaths.Current) and (not FInvoker.IsEmpty) and FPaths.Current.CanOverride;
end;

end.

