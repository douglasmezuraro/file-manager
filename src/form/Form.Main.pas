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
  System.Types,
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
    procedure Foo(Obj: TObject; Tab: TTabItem);
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

procedure TMain.Foo(Obj: TObject; Tab: TTabItem);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Caption: TCaption;
  Factory: IAbstractFactory;
  DTO: TDTO;
begin
  DTO.X := 10;
  DTO.Y := 10;
  Context := TRttiContext.Create;
  try
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
      Value := Prop.GetValue(Obj);

      if Value.IsObject then
      begin
        Caption := Prop.GetAtribute<TCaption>;

        if not Assigned(Caption) then
          Continue;

        Tab := TabControlWizard.Add;
        Tab.Text := Caption.Text;

        Foo(Value.AsObject, Tab);
        Continue;
      end;

      Caption := Prop.GetAtribute<TCaption>();

      if not Assigned(Caption) then
        Continue;

      DTO.Owner    := Self;
      DTO.Parent   := Tab;
      DTO.Value    := Value;
      DTO.Text     := Caption.Text;
      DTO.Values   := Caption.Values;

      if Value.IsBoolean then
        Factory := TCheckBoxFactory.Create
      else if Length(DTO.Values) > 0 then
        Factory := TComboBoxFactory.Create
      else
        Factory := TEditFactory.Create;

      Factory.New(DTO);
    end;
  finally
    Context.Free;
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  ModelToView;
  Foo(FModel, nil);
end;

procedure TMain.ModelToView;
begin
  FIniFile.ReadObject(FModel);
end;

procedure TMain.ViewToModel;
begin
  try

  finally
    FIniFile.WriteObject(FModel);
  end;
end;

end.
