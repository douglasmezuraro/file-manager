unit Template.AbstractClass;

interface

uses
  Attribute.Control,
  Attribute.Ini,
  FMX.Controls,
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
  protected
    procedure DoBefore; override;
  end;

implementation

{ TControlTemplate }

constructor TControlTemplate.Create(const DTO: TControlDTO);
begin
  FControl := nil;
  FDTO := DTO;
end;

procedure TControlTemplate.DoAfter;
begin
  Exit;
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

  Result := string.Empty;

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
  inherited;

  ControlLabel            := TLabel.Create(FDTO.Owner);
  ControlLabel.Parent     := FDTO.Parent.GetObject;
  ControlLabel.Text       := GetText;
  ControlLabel.Position.X := FDTO.Position.X;
  ControlLabel.Position.Y := FDTO.Position.Y;
  ControlLabel.Width      := TUtils.Constants.DefaultWidth;

  Offset(ControlLabel.Height);
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
  FControl.Width      := TUtils.Constants.DefaultWidth;

  Offset(FControl.Height + TUtils.Constants.DefaultOffset);
end;

end.

