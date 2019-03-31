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
  Util.Methods;

type
  TMain = class(TForm)
    PanelButtons: TPanel;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    ActionList: TActionList;
    ActionSave: TAction;
    ActionCancel: TAction;
    TabControlWizard: TTabControl;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FBinding: TBinding;
    FModel: TConfig;
    FIniFile: TIniFile;
    FInvoker: TCommandInvoker;
    function SaveChanges: Boolean;
    procedure ModelToView(const Obj: TObject; const Parent: IControl);
    procedure Notify(Sender: TObject);
    procedure ExecuteWithDisabledControls(const Proc: TProc);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.fmx}

constructor TMain.Create(AOwner: TComponent);
begin
  inherited;
  FModel := TConfig.Create;
  FIniFile := TIniFile.Create(TUtils.Methods.IniPath('spCfg.ini'));
  FInvoker := TCommandInvoker.Create;
  FBinding := TBinding.Create;
end;

destructor TMain.Destroy;
begin
  FBinding.Free;
  FInvoker.Free;
  FIniFile.Free;
  FModel.Free;
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
  FIniFile.WriteObject(FModel);
  Close;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if SaveChanges then
    FIniFile.WriteObject(FModel);
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
  TUtils.Conversions.DefineBoolean('N', 'S');

  FIniFile.ReadObject(FModel);
  ModelToView(FModel, TabControlWizard);

  FInvoker.Clear;

  Caption := FIniFile.FileName;
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
  try
    DTO := TControlDTO.Create(10, 10);
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
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
      finally
        Template.Free;
      end;

      FBinding.Add(Obj, Prop, Control);

      if Template is TTabItemTemplate then
        ModelToView(Prop.GetValue(Obj).AsObject, Control);
    end;
  finally
    Context.Free;
  end;
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

function TMain.SaveChanges: Boolean;
var
  lResult: Boolean;
begin
  Result := False;

  if FInvoker.IsEmpty then
    Exit;

  TDialogService.MessageDialog(
    'Existem alterações não salvas, deseja salvar?',
    TMsgDlgType.mtConfirmation,
    FMX.Dialogs.mbYesNo,
    TMsgDlgBtn.mbNo,
    TUtils.Constants.NumericNull,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes : lResult := True;
        mrNo  : lResult := False;
      end;
    end);

  Result := lResult;
end;

end.

