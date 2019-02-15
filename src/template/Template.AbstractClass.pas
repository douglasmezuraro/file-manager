unit Template.AbstractClass;

interface

uses
  Attribute.Control,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.Rtti,
  Util.Types,
  System.Rtti,
  System.SysUtils,
  System.Types;

type
  TControlTemplate = class abstract
  protected
    FDTO: TDTO;
    function GetCaption: string;
    function GetValue: TValue;
    function GetWidth: Single;
    function GetItems: string;
    procedure Caption;
    procedure OffSet(const Control: TControl);
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

  Self.OffSet(Caption);
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

function TControlTemplate.GetItems: string;
var
  Attribute: TControlAttribute;
begin
  Attribute := FDTO.Prop.GetAtribute<TControlAttribute>();

  Result := string.Empty;
  if Assigned(Attribute) then
    Result := Attribute.Items;
end;

function TControlTemplate.GetValue: TValue;
begin
  Result := FDTO.Prop.GetValue(FDTO.Model);
end;

function TControlTemplate.GetWidth: Single;
begin
  Result := 400;
end;

procedure TControlTemplate.OffSet(const Control: TControl);
begin
  FDTO.Position.Offset(0, Control.Height + 5);
end;

end.

