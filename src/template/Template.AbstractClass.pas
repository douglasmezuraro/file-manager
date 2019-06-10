unit Template.AbstractClass;

interface

uses
  Attribute.Control,
  Attribute.Ini,
  FMX.Controls,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Types,
  Helper.Rtti,
  System.Rtti,
  System.SysUtils,
  System.Types,
  Types.DTO,
  Types.Utils;

type
  TControlTemplate = class abstract
  private
    function GetText: string;
    function GetHint: string;
    function GetValue: TValue;
    function GetIni: string;
    procedure Offset(const Y: Single);
  protected
    FControl: TControl;
    FDTO: TControlDTO;
    procedure DoBefore; virtual;
    procedure DoAfter; virtual;
    procedure TemplateMethod; virtual; abstract;
  public
    constructor Create(const DTO: TControlDTO);
    function New: IControl;
    property Text: string read GetText;
    property Value: TValue read GetValue;
  end;

  TLabeledTemplate = class abstract(TControlTemplate)
  protected
    procedure DoBefore; override;
  end;

implementation

{ TControlTemplate }

constructor TControlTemplate.Create(const DTO: TControlDTO);
begin
  FDTO := DTO;
end;

procedure TControlTemplate.DoAfter;
begin
  if not (FControl is TScrollBox) then
    FControl.Parent := FDTO.Parent.GetObject;

  FControl.Hint := GetHint;
  FControl.ShowHint := True;
  FControl.Position.X := FDTO.Position.X;
  FControl.Position.Y := FDTO.Position.Y;
  FControl.Width := TUtils.Constants.DefaultWidth;

  Offset(FControl.Height + TUtils.Constants.DefaultOffset);
end;

procedure TControlTemplate.DoBefore;
begin
  Exit;
end;

function TControlTemplate.GetHint: string;
var
  Attribute: HintAttribute;
begin
  Result := GetIni;

  Attribute := FDTO.Prop.GetAtribute<HintAttribute>();

  if not Assigned(Attribute) then
    Exit;

  Result := Result + ' - ' + Attribute.Text;
end;

function TControlTemplate.GetIni: string;
var
  Attribute: IniAttribute;
begin
  Attribute := FDTO.Prop.GetAtribute<IniAttribute>();

  Result := string.Empty;
  if Assigned(Attribute) then
    Result := Attribute.Text;
end;

function TControlTemplate.GetText: string;
begin
  Result := FDTO.Prop.GetAtribute<CaptionAttribute>().Text;
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

{ TLabeledTemplate }

procedure TLabeledTemplate.DoBefore;
var
  ControlLabel: TLabel;
begin
  ControlLabel            := TLabel.Create(FDTO.Owner);
  ControlLabel.Parent     := FDTO.Parent.GetObject;
  ControlLabel.Text       := Text;
  ControlLabel.Position.X := FDTO.Position.X;
  ControlLabel.Position.Y := FDTO.Position.Y;
  ControlLabel.Width      := TUtils.Constants.DefaultWidth;

  Offset(ControlLabel.Height);
end;

end.

