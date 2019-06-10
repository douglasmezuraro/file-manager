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
  private
    function GetText: string;
    function GetHint: string;
    function GetValue: TValue;
    function GetWidth: Single;
  protected
    FDTO: TControlDTO;
    procedure Offset(const Y: Single);
  public
    constructor Create(const DTO: TControlDTO);
    property Hint: string read GetHint;
    property Text: string read GetText;
    property Value: TValue read GetValue;
    property Width: Single read GetWidth;
    function CreateControl: IControl; virtual; abstract;
  end;

  TLabeledTemplate = class abstract(TControlTemplate)
  protected
    procedure CreateLabel;
  public
    function CreateControl: IControl; override;
  end;

implementation

{ TControlTemplate }

constructor TControlTemplate.Create(const DTO: TControlDTO);
begin
  FDTO := DTO;
end;

function TControlTemplate.GetText: string;
begin
  Result := FDTO.Prop.GetAtribute<CaptionAttribute>().Text;
end;

function TControlTemplate.GetHint: string;
var
  Hint: HintAttribute;
  Attribute: KeyAttribute;
begin
  Result := string.Empty;

  Attribute := FDTO.Prop.GetAtribute<KeyAttribute>();
  if Assigned(Attribute) then
    Result := Attribute.Name;

  Hint := FDTO.Prop.GetAtribute<HintAttribute>();
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
  ControlLabel.Text       := Text;
  ControlLabel.Position.X := FDTO.Position.X;
  ControlLabel.Position.Y := FDTO.Position.Y;
  ControlLabel.Width      := Width;

  Offset(ControlLabel.Height);
end;

end.

