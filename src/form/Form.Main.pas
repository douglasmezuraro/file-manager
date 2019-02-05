unit Form.Main;

interface

uses
  AbstractFactory.API,
  AbstractFactory.Control,
  Attribute.Control,
  Attribute.Ini,
  Command.Invoker,
  Command.Receiver,
  Command.Undoable,
  FMX.ActnList,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  Helper.FMX,
  Helper.Ini,
  Helper.Rtti,
  Model.Config,
  System.Actions,
  System.Classes,
  System.Generics.Collections,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.UITypes,
  Util.Methods,
  Util.Types;

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
  private
    FControlBinding: TControlBinding;
    FModel: TConfig;
    FIniFile: TIniFile;
    FInvoker: TCommandInvoker;

    { ModelToView }
    procedure ModelToView(Obj: TObject; Parent: IControl);

    { Utils }
    function GetModelValue(const Control: TControl): TValue;
    procedure SetModelValue(const Control: TControl);

    function SaveChanges: Boolean;
    procedure Notify(Sender: TObject);
    procedure ExecuteWithDisabledControls(Proc: TProc);
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
  FIniFile := TIniFile.Create(Util.Methods.TMethods.GetIniPath);
  FInvoker := TCommandInvoker.Create;
  FControlBinding := TControlBinding.Create;
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  FInvoker.Free;
  FControlBinding.Free;
  inherited;
end;

procedure TMain.ExecuteWithDisabledControls(Proc: TProc);
var
  Control: IControl;
begin
  for Control in FControlBinding.Keys do
    TControl(Control).OnExit := nil;

  Proc;

  for Control in FControlBinding.Keys do
     TControl(Control).OnExit:= Notify;
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  if SaveChanges then
    ActionSave.Execute;
  Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  FIniFile.WriteObject(FModel);
  Close;
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
  FIniFile.ReadObject(FModel);
  ModelToView(FModel, TabControlWizard);
end;

function TMain.GetModelValue(const Control: TControl): TValue;
var
  Binding: TPropertyBinding;
begin
  Result.Empty;
  if FControlBinding.ContainsKey(Control) then
  begin
    Binding := FControlBinding.Items[Control];
    Result := Binding.Value.GetValue(Binding.Key);
  end;
end;

procedure TMain.ModelToView(Obj: TObject; Parent: IControl);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Factory: IAbstractFactory;
  DTO: TDTO;
  Control: IControl;
begin
  Context := TRttiContext.Create;
  try
    DTO := TDTO.Create(10, 10);
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
      DTO.Owner            := Self;
      DTO.Parent           := Parent;
      DTO.Value            := Prop.GetValue(Obj);
      DTO.ControlAttribute := Prop.GetAtribute<TControlAttribute>();
      DTO.IniAttribute     := Prop.GetAtribute<TIniAttribute>();
      DTO.OnNotify         := Notify;

      Factory := TControlFactory.Create;

      Control := Factory.Fabricate(DTO);
      FControlBinding.Add(Control, TPropertyBinding.Create(Obj, Prop));

      if not DTO.Value.IsObject then
        Continue;

      ModelToView(DTO.Value.AsObject, Control);
    end;
  finally
    Context.Free;
  end;
end;

procedure TMain.Notify(Sender: TObject);
var
  Control: TControl;
  Receiver: TReceiver;
  OldValue: TValue;
begin
  Control := Sender as TControl;

  OldValue := GetModelValue(Control);

  if Control.Value.Equals(OldValue) then
    Exit;

  Receiver := TReceiver.Create(Control, OldValue);
  FInvoker.Add(TUndoableCommand.Create(Receiver));
  SetModelValue(Control);
end;

function TMain.SaveChanges: Boolean;
begin
  Result := False;
end;

procedure TMain.SetModelValue(const Control: TControl);
var
  Binding: TPropertyBinding;
  Value: TValue;
begin
  if FControlBinding.ContainsKey(Control) then
  begin
    Binding := FControlBinding.Items[Control];
    Value := Binding.Value.GetValue(Binding.Key);
    Binding.Value.SetValue(Binding.Key, Value.Assign(Control.Value));
  end;
end;

end.

