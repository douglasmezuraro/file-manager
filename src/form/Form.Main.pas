unit Form.Main;

interface

uses
  AbstractFactory.API,
  AbstractFactory.CheckBox,
  AbstractFactory.ComboBox,
  AbstractFactory.DTO,
  AbstractFactory.Edit,
  AbstractFactory.TabItem,
  Attribute.Control,
  Attribute.Ident,
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
  FMX.DialogService,
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
  Util.Methods, FMX.Edit;

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
  private type
    TBinding = TPair<TObject, TRttiProperty>;
    TDic = TDictionary<TControl, TBinding>;
  private
    FDic: TDic;
    FModel: TConfig;
    FIniFile: TIniFile;
    FInvoker: TCommandInvoker;

    { ModelToView }
    procedure ModelToView(Obj: TObject; Parent: TControl);

    { Utils }
    function GetModelValue(const Control: TControl): TValue;
    procedure SetModelValue(const Control: TControl);

    function SaveChanges: Boolean;
    procedure Notify(Sender: TObject);
    procedure ExecuteWithDisabledContols(Proc: TProc);
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
  FDic := TDic.Create;
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  FInvoker.Free;
  FDic.Free;
  inherited;
end;

procedure TMain.ExecuteWithDisabledContols(Proc: TProc);
var
  Control: TControl;
begin
  for Control in FDic.Keys do
    Control.OnExit := nil;

  Proc;

  for Control in FDic.Keys do
    Control.OnExit := Notify;
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  if SaveChanges then ActionSave.Execute;
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
  if (Shift = [ssCtrl]) and (Key in [vkZ, vkU]) then
  begin
    ExecuteWithDisabledContols(
      procedure
      begin
        FInvoker.Execute;
      end);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  FIniFile.ReadObject(FModel);
  ModelToView(FModel, TabControlWizard);
end;

function TMain.GetModelValue(const Control: TControl): TValue;
var
  Binding: TBinding;
begin
  Result.Empty;
  if FDic.ContainsKey(Control) then
  begin
    Binding := FDic.Items[Control];
    Result := Binding.Value.GetValue(Binding.Key);
  end;
end;

procedure TMain.ModelToView(Obj: TObject; Parent: TControl);

  function CreateFactory(DTO: TDTO): IAbstractFactory;
  begin
    if DTO.Value.IsObject then
      Result := TTabItemFactory.Create
    else if DTO.Value.IsBoolean then
      Result := TCheckBoxFactory.Create
    else if Length(DTO.Control.Values) > 0 then
      Result := TComboBoxFactory.Create
    else
      Result := TEditFactory.Create;
  end;

var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Factory: IAbstractFactory;
  DTO: TDTO;
  Control: TControl;
begin
  Context := TRttiContext.Create;
  try
    DTO := TDTO.Create(10, 10);
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
      DTO.Owner    := Self;
      DTO.Parent   := Parent;
      DTO.Value    := Prop.GetValue(Obj);
      DTO.Control  := Prop.GetAtribute<Attribute.Control.TControl>();
      DTO.Ident    := Prop.GetAtribute<Attribute.Ini.TIniAttribute>();
      DTO.OnChange := Notify;

      Factory := CreateFactory(DTO);

      Control := Factory.New(DTO);
      FDic.Add(Control, TBinding.Create(Obj, Prop));

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
  Binding: TBinding;
  Value: TValue;
begin
  if FDic.ContainsKey(Control) then
  begin
    Binding := FDic.Items[Control];
    Value := Binding.Value.GetValue(Binding.Key);
    Binding.Value.SetValue(Binding.Key, Value.Assign(Control.Value));
  end;
end;

end.

