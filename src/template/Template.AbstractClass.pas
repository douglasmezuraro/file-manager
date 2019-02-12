unit Template.AbstractClass;

interface

uses
  Attribute.Control,
  FMX.StdCtrls,
  FMX.Types,
  Helper.Rtti,
  Util.Types,
  System.Rtti,
  System.SysUtils;

type
  TControlTemplate = class abstract
  protected
    FDTO: TDTO;
    function GetCaption: string;
    function GetValue: TValue;
    function GetWidth: Single;
    procedure Caption;
    procedure IncHeight(const Height: Single);
  public
    function Fabricate: IControl; virtual; abstract;
    property DTO: TDTO read FDTO write FDTO;
  end;

implementation

{ TControlTemplate }

procedure TControlTemplate.Caption;
var
  Caption: TLabel;
begin
  Caption            := TLabel.Create(FDTO.Owner);
  Caption.Parent     := FDTO.Parent.GetObject;
  Caption.Text       := Self.GetCaption;
  Caption.Position.X := FDTO.Position.X;
  Caption.Position.Y := FDTO.Position.Y;
  Caption.Width      := Self.GetWidth;

  Self.IncHeight(Caption.Height);
end;

function TControlTemplate.GetCaption: string;
var
  Attribute: TControlAttribute;
begin
  Attribute := FDTO.Prop.GetAtribute<TControlAttribute>();

  Result := string.Empty;
  if Assigned(Attribute) then
    Result := Attribute.Text;
end;

function TControlTemplate.GetValue: TValue;
begin
  Result := FDTO.Prop.GetValue(FDTO.Model);
end;

function TControlTemplate.GetWidth: Single;
begin
  Result := 400;
end;

procedure TControlTemplate.IncHeight(const Height: Single);
begin
  FDTO.Position.Y := FDTO.Position.Y + Height + 5;
end;

end.
