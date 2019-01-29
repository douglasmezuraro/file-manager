unit Form.Main;

interface

uses
  FMX.ActnList,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  Helper.Ini,
  Model.Config,
  System.Actions,
  System.Classes,
  System.IniFiles,
  System.UITypes,
  Attribute.Caption,
  FMX.Graphics,
  Helper.FMX,
  System.Variants,
  System.Types,
  AbstractFactory.TabItem,
  AbstractFactory.CheckBox,
  AbstractFactory.ComboBox,
  AbstractFactory.Edit,
  AbstractFactory.DTO,
  AbstractFactory.API,
  Util.Methods, FMX.Edit, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  Attribute.Section, Attribute.Ident, System.SysUtils,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Helper.Value,
  FMX.ListBox;

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
  private
    FModel: TConfig;
    FIniFile: TIniFile;
    procedure ViewToModel;
    procedure ModelToView;
    procedure Foo(Obj: TObject; Parent: TControl);
    procedure Doo(Obj: TObject);
    function GetValue(const Tag: string): TValue;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.fmx}

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  ViewToModel;
  ModalResult := mrOk;
  Close;
end;

constructor TMain.Create(AOwner: TComponent);
begin
  inherited;
  FModel := TConfig.Create;
  FIniFile := TIniFile.Create(Util.Methods.TMethods.GetIniPath);
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  inherited;
end;

procedure TMain.Doo(Obj: TObject);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Ident: string;
begin
  Context := TRttiContext.Create;
  try
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin 
      Value := Prop.GetValue(Obj);
      if Value.IsObject then
      begin
        Doo(Value.AsObject);
        Continue;
      end;

      Ident := Prop.GetAtribute<TIdent>().Name;
      Value.Assign(GetValue(Ident));
      Prop.SetValue(Obj, Value);
    end;
  finally
    Context.Free;
  end;
end;

procedure TMain.Foo(Obj: TObject; Parent: TControl);
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
      DTO.Owner   := Self;
      DTO.Parent  := Parent;
      DTO.Value   := Prop.GetValue(Obj);
      DTO.Caption := Prop.GetAtribute<TCaption>();
      DTO.Ident   := Prop.GetAtribute<TIdent>();

      if DTO.Value.IsObject then
        Factory := TTabItemFactory.Create
      else if DTO.Value.IsBoolean then
        Factory := TCheckBoxFactory.Create
      else if Length(DTO.Caption.Values) > 0 then
        Factory := TComboBoxFactory.Create
      else
        Factory := TEditFactory.Create;

      Control := Factory.New(DTO);

      if not DTO.Value.IsObject then
        Continue;

      Foo(DTO.Value.AsObject, Control);
    end;
  finally
    Context.Free;
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  ModelToView;
end;

function TMain.GetValue(const Tag: string): TValue;
var
  Index: Integer;
  FMXObject: TFmxObject;
begin
  Result.Empty;
  for Index := 0 to Pred(ComponentCount) do
  begin
    if not (Components[Index] is TFmxObject) then
      Continue;

    FMXObject := Components[Index] as TFmxObject;
    if FMXObject.TagString = Tag then
    begin
      Result := FMXObject.Data;
      Break;
    end;
  end;
end;

procedure TMain.ModelToView;
begin
  FIniFile.ReadObject(FModel);
  Foo(FModel, TabControlWizard);
end;

procedure TMain.ViewToModel;
begin
  try
    Doo(FModel);
  finally
    FIniFile.WriteObject(FModel);
  end;
end;

end.

