unit Template.AbstractClass;

interface

uses
  Attribute.Component.Control,
  Attribute.Component.Hint,
  Attribute.Ini,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.Rtti.RttiProperty,
  System.Rtti,
  System.StrUtils,
  System.SysUtils,
  System.Types,
  Types.ControlDTO,
  Types.Utils;

type
  TControlTemplate = class abstract
  protected
    FControl: TControl;
    FDTO: TControlDTO;
    function GetHint: string;
    function GetIni: string;
    function GetText: string;
    function GetValue: TValue;
    procedure DoBefore; virtual;
    procedure DoAfter; virtual;
    procedure Offset(const Y: Single);
    procedure TemplateMethod; virtual; abstract;
  public
    constructor Create(const DTO: TControlDTO);
    function New: IControl;
  end;

  TLayoutTemplate = class abstract(TControlTemplate);

  TStylizedTemplate = class abstract(TControlTemplate)
  protected
    procedure DoAfter; override;
  end;

  TLabeledTemplate = class abstract(TStylizedTemplate)
  private
    FLabel: TLabel;
  protected
    procedure DoBefore; override;
    procedure DoAfter; override;
  end;

implementation

{ TControlTemplate }

constructor TControlTemplate.Create(const DTO: TControlDTO);
begin
  FDTO := DTO;
end;

procedure TControlTemplate.DoAfter;
begin
end;

procedure TControlTemplate.DoBefore;
begin
end;

function TControlTemplate.GetHint: string;
var
  Attribute: HintAttribute;
  Hint, Ini: string;
begin
  Ini := GetIni;

  Attribute := FDTO.Prop.GetAttribute<HintAttribute>();
  if Assigned(Attribute) then
    Hint := Attribute.Text;

  Result := IfThen(Hint.IsEmpty, Ini, Ini + ' - ' + Hint);
end;

function TControlTemplate.GetIni: string;
var
  Attribute: IniAttribute;
begin
  Attribute := FDTO.Prop.GetAttribute<IniAttribute>();

  Result := string.Empty;
  if Assigned(Attribute) then
    Result := Attribute.Text;
end;

function TControlTemplate.GetText: string;
var
  Attribute: ControlAttribute;
begin
  Attribute := FDTO.Prop.GetAttribute<ControlAttribute>();

  Result := string.Empty;
  if Assigned(Attribute) then
    Result := Attribute.Text;
end;

function TControlTemplate.GetValue: TValue;
begin
  Result := FDTO.Prop.GetValue(FDTO.Model);
end;

function TControlTemplate.New: IControl;
begin
  DoBefore;
  TemplateMethod;
  DoAfter;

  Result := FControl;
end;

procedure TControlTemplate.Offset(const Y: Single);
begin
  FDTO.Position.Offset(TUtils.Constants.Zero, Y);
end;

{ TStylizedTemplate }

procedure TStylizedTemplate.DoAfter;
begin
  inherited;

  FControl.Parent     := FDTO.Parent.GetObject;
  FControl.Hint       := GetHint;
  FControl.ShowHint   := True;
  FControl.Position.X := FDTO.Position.X;
  FControl.Position.Y := FDTO.Position.Y;
  FControl.Width      := TUtils.Constants.Width;

  Offset(FControl.Height + TUtils.Constants.Offset);
end;

{ TLabeledTemplate }

procedure TLabeledTemplate.DoBefore;
begin
  inherited;

  FLabel            := TLabel.Create(FDTO.Owner);
  FLabel.Parent     := FDTO.Parent.GetObject;
  FLabel.Text       := GetText;
  FLabel.Position.X := FDTO.Position.X;
  FLabel.Position.Y := FDTO.Position.Y;
  FLabel.Width      := TUtils.Constants.Width;

  Offset(FLabel.Height);
end;

procedure TLabeledTemplate.DoAfter;
begin
  inherited;
  FLabel.FocusControl := FControl;
end;

end.

