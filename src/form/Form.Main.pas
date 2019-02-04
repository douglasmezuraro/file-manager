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
    procedure ModelToView; overload;
    procedure ModelToView(Obj: TObject; Parent: TControl); overload;

    { Read/Write }
    procedure ReadObject;
    procedure WriteObject;

    { Utils }
    function GetModelValue(const Control: TControl): TValue;
    procedure UpdateModel(const Control: TControl);
    function SaveChanges: Boolean;
    procedure Notify(Sender: TObject);
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
  FDic := TDic.Create();
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  FInvoker.Free;
  FDic.Free;
  inherited;
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  if SaveChanges then ActionSave.Execute;
  Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  WriteObject;
  Close;
end;

procedure TMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key in [vkZ, vkU]) then
  begin
    FInvoker.Execute;
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  ReadObject;
  ModelToView;
end;

function TMain.GetModelValue(const Control: TControl): TValue;
begin
  Result.Empty;
  if FDic.ContainsKey(Control) then
    Result := FDIc.Items[Control].Value.GetValue(FDic.Items[Control].Key);
end;

procedure TMain.ModelToView;
begin
  ModelToView(FModel, TabControlWizard);
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
      DTO.Ident    := Prop.GetAtribute<Attribute.Ident.TIdent>();
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
  UpdateModel(Control);
end;

procedure TMain.ReadObject;
begin
  FIniFile.ReadObject(FModel);
end;

function TMain.SaveChanges: Boolean;
var
  ModalResult: TModalResult;
begin
  Result := False;
  if not FInvoker.IsEmpty then
  begin
    TDialogService.MessageDialog(
      'Deseja salvar as alterações?',
      TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
      TMsgDlgBtn.mbYes, 0,
      procedure(const AResult: TModalResult)
      begin
        ModalResult := AResult;
      end);
    Result := ModalResult = mrYes;
  end;
end;

procedure TMain.UpdateModel(const Control: TControl);
var
  Binding: TBinding;
  V1, V2: TValue;
begin
  if not FDic.ContainsKey(Control) then
    Exit;

  Binding := FDic.Items[Control];
  V1 := Binding.Value.GetValue(Binding.Key);
  V2 := Control.Data;

  Binding.Value.SetValue(Binding.Key, V1.Assign(V2));
end;

procedure TMain.WriteObject;
begin
  FIniFile.WriteObject(FModel);
end;

end.

