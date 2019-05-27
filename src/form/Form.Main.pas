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
  FMX.Dialogs,
  FMX.DialogService,
  FMX.Edit,
  FMX.Forms,
  FMX.ListBox,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  Helper.FMX,
  Helper.Ini,
  Model.Config,
  System.Actions,
  System.Classes,
  System.Generics.Collections,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.UITypes,
  Template.AbstractClass,
  Template.TabItem,
  Util.Binding,
  Util.DTO,
  Util.Methods, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,
  Util.Types,
  Rest.Json, System.TypInfo,
  System.IOUtils, FMX.Layouts;

type
  TMain = class(TForm)
    PanelButtons: TPanel;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    ActionList: TActionList;
    ActionSave: TAction;
    ActionCancel: TAction;
    TabControlWizard: TTabControl;
    ExpanderItems: TExpander;
    ListPaths: TListBox;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListPathsDblClick(Sender: TObject);
  private
    FBinding: TBinding;
    FInvoker: TCommandInvoker;
    FPaths: TPaths<TConfig>;
    procedure ModelToView(const Obj: TObject; const Parent: IControl);
    procedure Notify(Sender: TObject);
    procedure ExecuteWithDisabledControls(const Proc: TProc);
    procedure ReadInput;
    procedure ReadFile(const Index: Integer);
    procedure Clear;
    function HasChanges: Boolean;
    procedure SaveChanges;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.fmx}

procedure TMain.Clear;
var
  I, J: Integer;
begin
  for I := Pred(TabControlWizard.TabCount) downto 0 do
  begin
    for J := Pred(TabControlWizard.Tabs[I].ComponentCount) downto 0 do
    begin
      TabControlWizard.Tabs[I].RemoveComponent(TabControlWizard.Tabs[I].Components[J]);
    end;
    TabControlWizard.Delete(I);
  end;
end;

constructor TMain.Create(AOwner: TComponent);
begin
  inherited;
  FInvoker := TCommandInvoker.Create;
  FBinding := TBinding.Create;

  TUtils.Conversions.DefineBoolean('N', 'S');

  ReadInput;
end;

destructor TMain.Destroy;
begin
  FBinding.Free;
  FInvoker.Free;
  FPaths.Free;
  inherited;
end;

procedure TMain.ExecuteWithDisabledControls(const Proc: TProc);
var
  Control: IControl;
begin
  for Control in FBinding.Keys do
  begin
    if Control is TEdit then
      (Control as TEdit).OnChange := nil;

    if Control is TComboBox then
      (Control as TComboBox).OnChange := nil;

    if Control is TCheckBox then
      (Control as TCheckBox).OnChange := nil;
  end;

  Proc;

  for Control in FBinding.Keys do
  begin
    if Control is TEdit then
      (Control as TEdit).OnChange := Notify;

    if Control is TComboBox then
      (Control as TComboBox).OnChange := Notify;

    if Control is TCheckBox then
      (Control as TCheckBox).OnChange := Notify;
  end;
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  SaveChanges;
  Close;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HasChanges and TUtils.Dialogs.Confirmation('Existem alterações não salvas, deseja salvar?') then
    FPaths.Curr.Model.Write;
end;

procedure TMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vkZ) then
  begin
    ExecuteWithDisabledControls(FInvoker.Execute);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  FInvoker.Clear;
end;

function TMain.HasChanges: Boolean;
begin
  Result := not FInvoker.IsEmpty;
end;

procedure TMain.ListPathsDblClick(Sender: TObject);
begin
  ReadFile((Sender as TListBox).Selected.Index);
end;

procedure TMain.ModelToView(const Obj: TObject; const Parent: IControl);
var
  Context: TRttiContext;
  Control: IControl;
  DTO: TControlDTO;
  Prop: TRttiProperty;
  Template: TControlTemplate;
begin
  Context := TRttiContext.Create;
  DTO := TControlDTO.Create(10, 10);
  for Prop in Context.GetType(Obj.ClassType).GetProperties do
  begin
    if Prop.Visibility <> mvPublic then
      Continue;

    if Length(Prop.GetAttributes) = 0 then
      Continue;

    DTO.Model    := Obj;
    DTO.OnNotify := Notify;
    DTO.Owner    := Self;
    DTO.Parent   := Parent;
    DTO.Prop     := Prop;

    Template := TControlTemplateFactory.Fabricate(Prop);
    try
      Template.DTO := DTO;
      Control := Template.CreateControl;
      DTO := Template.DTO;

      FBinding.Add(Obj, Prop, Control);

      if Template is TTabItemTemplate then
        ModelToView(Prop.GetValue(Obj).AsObject, Control);
    finally
      Template.Free;
    end;
  end;
  FInvoker.Clear;
end;

procedure TMain.Notify(Sender: TObject);
var
  Control: TControl;
  Receiver: TReceiver;
  OldValue, NewValue: TValue;
begin
  Control := Sender as TControl;

  OldValue := FBinding.Values[Control];
  NewValue := Control.Value;

  Receiver := TReceiver.Create(Control, OldValue);
  FInvoker.Add(TUndoableCommand.Create(Receiver));
  FBinding.Values[Control] := NewValue;
end;

procedure TMain.ReadFile(const Index: Integer);
begin
  if HasChanges then
  begin
    if TUtils.Dialogs.Confirmation('Deseja salvar as alterações?') then
      SaveChanges
    else
      Abort;
  end;

  FPaths.Curr := FPaths.Items[Index];

  if Assigned(FPaths.Curr) and (FPaths.Curr.Path = Self.Caption) then
    Exit;

  FBinding.Clear;
  Clear;

  Caption := FPaths.Curr.Path;

  ModelToView(FPaths.Curr.Model, TabControlWizard);
end;

procedure TMain.ReadInput;
var
  JSON: string;
  Path: TFilePath<TConfig>;
begin
  try
    JSON := TFile.ReadAllText(TUtils.Methods.FilePath(TUtils.Constants.InputFile));
    FPaths := TJson.JsonToObject<TPaths<TConfig>>(JSON);

    for Path in FPaths.Items do
    begin
      ListPaths.Items.AddObject(Path.Name, Path);
    end;

    FPaths.Foo;

  except
    on E: EFileNotFoundException do
    begin
      TUtils.Dialogs.Information('Arquivo não encontrado');
    end;
  end;
end;

procedure TMain.SaveChanges;
begin
  FPaths.Curr.Model.Write;
  FInvoker.Clear;
end;

end.

