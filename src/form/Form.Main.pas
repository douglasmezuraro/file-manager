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
  Util.Methods, FMX.Edit, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  Attribute.Section, Attribute.Ident, System.SysUtils,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Helper.Value;

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
    procedure FillComboBoxes;
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

procedure TMain.FillComboBoxes;
begin
  Exit;
end;

procedure TMain.Foo(Obj: TObject; Tab: TTabItem);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  X, Y: Single;
  Caption: TCaption;

  procedure AddCheckBox;
  var
    CheckBox: TCheckBox;
  begin
    CheckBox := TCheckBox.Create(Self);
    CheckBox.Parent := Tab;
    CheckBox.IsChecked := Value.AsBoolean;
    CheckBox.Position.X := X;
    CheckBox.Position.Y := Y;
    Caption := Prop.GetAtribute<TCaption>;
    if Assigned(Caption) then
        CheckBox.Text := (Caption as TCaption).Text;
    CheckBox.Width := CheckBox.Canvas.TextWidth(CheckBox.Text) + 25;
    Y := Y + CheckBox.Height + 10;
  end;
  
  procedure AddEdit;
  var
    Edit: TEdit;
    Lab: TLabel;
  begin
    Lab := TLabel.Create(Self);
    Lab.Parent := Tab;
    Caption := Prop.GetAtribute<TCaption>;
    if Assigned(Caption) then
        Lab.Text := Caption.Text;
    Lab.Position.X := X;
    Lab.Position.Y := Y;
    
    Y := Y + Lab.Height + 5;
    Edit := TEdit.Create(Self);
    Edit.Parent := Tab;
    if Value.IsString then
      Edit.Text := Value.AsString
    else
      Edit.Text := Value.AsInteger.ToString;
    Edit.Position.X := X;
    Edit.Position.Y := Y;
    Edit.Width := 400;
    Lab.FocusControl := Edit;
    Lab.Width := Edit.Width;
    Y := Y + Edit.Height + 10;
  end;

begin
  X := 10; Y := 10;
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

      if Value.IsBoolean then
        AddCheckBox
      else if Value.IsString or Value.IsNumeric then
        AddEdit;
    end;
  finally
    Context.Free;
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  FillComboBoxes;
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
