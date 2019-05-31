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
  FMX.ListBox,
  FMX.StdCtrls,
  FMX.TabControl,
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
  Util.Binding,
  Util.DTO,
  Util.Methods,
  Util.Types.Path;

type
  TMain = class(TForm)
    ActionCancel: TAction;
    ActionList: TActionList;
    ActionSave: TAction;
    ExpanderItems: TExpander;
    ListPaths: TListBox;
    PanelButtons: TPanel;
    TabControlWizard: TTabControl;
    ActionReplace: TAction;
    ButtonReplace: TButton;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ListPathsDblClick(Sender: TObject);
    procedure ActionReplaceExecute(Sender: TObject);
  private
    FBinding: TBinding;
    FInvoker: TCommandInvoker;
    FPaths: TPaths<TConfig>;
    FLockOnNotifyEvent: Boolean;
    function HasChanges: Boolean;
    procedure ModelToView(const Obj: TObject; const Parent: IControl);
    procedure Notify(Sender: TObject);
    procedure ReadFile(const Index: Integer);
    procedure ReadInput;
    procedure RestoreView;
    procedure Save;
    procedure Replace;
    procedure ControlView(const NewCaption: string = string.Empty);
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

procedure TMain.ReadFile(const Index: Integer);
begin
  if HasChanges and not TUtils.Dialogs.Confirmation('Existem alterações não salvas, deseja trocas mesmo assim?') then
    Exit;

  if Assigned(FPaths.Current) and (FPaths.Current.Id = Index) then
    Exit;

  FPaths.Current := FPaths.Items[Index];

  RestoreView;

  ControlView(FPaths.Current.Source);

  ModelToView(FPaths.Current.Model, TabControlWizard);
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
      ListPaths.Items.AddObject(Path.Name, Path);

    ExpanderItems.Height := ExpanderItems.HeaderHeight + ListPaths.BorderHeight + (ListPaths.ItemHeight * ListPaths.Count);

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

  for I := Pred(TabControlWizard.TabCount) downto 0 do
  begin
    for J := Pred(TabControlWizard.Tabs[I].ComponentCount) downto 0 do
    begin
      TabControlWizard.Tabs[I].RemoveComponent(TabControlWizard.Tabs[I].Components[J]);
    end;
    TabControlWizard.Delete(I);
  end;
end;

procedure TMain.Save;
begin
  FPaths.Current.Model.Write(FPaths.Current.Target);
  FInvoker.Clear;
  ControlView;
end;

procedure TMain.ControlView(const NewCaption: string);
begin
  if not NewCaption.Trim.IsEmpty then
    Caption := NewCaption;

  Caption := Caption.Replace(TUtils.Constants.ChangeChar, string.Empty);
  if HasChanges and not Caption.Contains(TUtils.Constants.ChangeChar) then
    Caption := Caption + TUtils.Constants.ChangeChar;

  ActionSave.Enabled := Assigned(FPaths.Current) and (not FInvoker.IsEmpty);
  ActionReplace.Enabled := Assigned(FPaths.Current) and (not FInvoker.IsEmpty) and FPaths.Current.CanOverride;
end;

end.

