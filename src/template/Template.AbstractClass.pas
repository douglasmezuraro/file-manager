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
    FDTO: TControlDTO;
    function GetCaption: string;
    function GetHint: string;
    function GetValue: TValue;
    function GetWidth: Single;
    procedure Offset(const Y: Single);
  public
    function CreateControl: IControl; virtual; abstract;
    property DTO: TControlDTO read FDTO write FDTO;
  end;

  TLabeledTemplate = class abstract(TControlTemplate)
  protected
    procedure CreateLabel;
  public
    function CreateControl: IControl; override;
  end;

implementation

{ TControlTemplate }

function TControlTemplate.GetCaption: string;
begin
  Result := FDTO.Prop.GetAtribute<CaptionAttribute>().Text;
end;

function TControlTemplate.GetHint: string;
var
  Hint: HintAttribute;
  Attribute: KeyAttribute;
begin
  Result := string.Empty;

  Attribute := DTO.Prop.GetAtribute<KeyAttribute>();
  if Assigned(Attribute) then
    Result := Attribute.Name;

  Hint := DTO.Prop.GetAtribute<HintAttribute>();
  if Assigned(Hint) then
  begin
    if Result.IsEmpty then
      Result := Hint.Text
    else
      Result := Result + ' - ' + Hint.Text;
  end;
end;

function TControlTemplate.GetValue: TValue;
begin
  Result := FDTO.Prop.GetValue(FDTO.Model);
end;

function TControlTemplate.GetWidth: Single;
begin
  Result := TUtils.Constants.DefaultWidth;
end;

procedure TControlTemplate.Offset(const Y: Single);
begin
  FDTO.Position.Offset(TUtils.Constants.Zero, Y);
end;

{ TLabeledTemplate }

function TLabeledTemplate.CreateControl: IControl;
begin
  CreateLabel;
end;

procedure TLabeledTemplate.CreateLabel;
var
  ControlLabel: TLabel;
begin
  ControlLabel            := TLabel.Create(FDTO.Owner);
  ControlLabel.Parent     := FDTO.Parent.GetObject;
  ControlLabel.Text       := GetCaption;
  ControlLabel.Position.X := FDTO.Position.X;
  ControlLabel.Position.Y := FDTO.Position.Y;
  ControlLabel.Width      := GetWidth;

  Offset(ControlLabel.Height);
end;

end.

