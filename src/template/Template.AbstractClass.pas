unit Template.AbstractClass;

interface

uses
  Attribute.Ini,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.Rtti,
  System.Rtti,
  System.SysUtils,
  System.Types,
  Util.Types;

type
  TControlTemplate = class abstract
  protected
    FDTO: TControlDTO;
    function GetCaption: string;
    function GetValue: TValue;
    function GetWidth: Single;
    procedure Caption;
    procedure OffSet(const Control: TControl);
  public
    function Fabricate: IControl; virtual; abstract;
    property DTO: TControlDTO read FDTO write FDTO;
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
begin
  Result := FDTO.Prop.GetAtribute<TCaptionAttribute>().Text;
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

