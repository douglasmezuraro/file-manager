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
  private
    FModel: TConfig;
    FIniFile: TIniFile;
    FInvoker: TCommandInvoker;

    { ViewToModel }
    procedure ViewToModel; overload;
    procedure ViewToModel(Obj: TObject); overload;

    { ModelToView }
    procedure ModelToView; overload;
    procedure ModelToView(Obj: TObject; Parent: TControl); overload;

    { Read/Write }
    procedure ReadObject;
    procedure WriteObject;

    { Utils }
    function GetValue(const Tag: TObject): TValue;
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
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  FInvoker.Free;
  inherited;
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  if SaveChanges then ActionSave.Execute;
  Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  ViewToModel;
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

function TMain.GetValue(const Tag: TObject): TValue;
var
  Index: Integer;
  Control: TControl;
begin
  Result.Empty;
  for Index := 0 to Pred(ComponentCount) do
  begin
    if Components[Index] is TControl then
    begin
      Control := Components[Index] as TControl;
      if Tag.Equals(Control.TagObject)  then
      begin
        Result := Control.Value;
        Break;
      end;
    end;
  end;
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
begin
  Control := Sender as TControl;

  if not Control.HasChanges then
    Exit;

  FInvoker.Add(TUndoableCommand.Create(Control));
  Control.OldValue := Control.Value.ToString;
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

procedure TMain.ViewToModel;
begin
  ViewToModel(FModel);
end;

procedure TMain.ViewToModel(Obj: TObject);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Ident: TIdent;
begin
  Context := TRttiContext.Create;
  try
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
      Value := Prop.GetValue(Obj);
      if Value.IsObject then
        ViewToModel(Value.AsObject)
      else
      begin
        Ident := Prop.GetAtribute<TIdent>();
        Value.Assign(GetValue(Ident));
        Prop.SetValue(Obj, Value);
      end;
    end;
  finally
    Context.Free;
  end;
end;

procedure TMain.WriteObject;
begin
  FIniFile.WriteObject(FModel);
end;

end.

