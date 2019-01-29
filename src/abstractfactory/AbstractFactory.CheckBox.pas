unit AbstractFactory.CheckBox;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.Graphics,
  FMX.StdCtrls,
  FMX.Types,
  System.Rtti;

type
  TCheckBoxFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function New(var DTO: TDTO): TControl;
  end;

implementation

{ TCheckBoxFactory }

function TCheckBoxFactory.New(var DTO: TDTO): TControl;
var
  CheckBox: TCheckBox;
begin
  CheckBox            := TCheckBox.Create(DTO.Owner);
  CheckBox.Parent     := DTO.Parent;
  CheckBox.Position.X := DTO.X;
  CheckBox.Position.Y := DTO.Y;
  CheckBox.Data       := DTO.Value;
  CheckBox.Text       := DTO.Caption.Text;
  CheckBox.TagString  := DTO.Ident.Name;
  CheckBox.Width      := 400;
  
  DTO.Y := DTO.Y + CheckBox.Height + 10;
  
  Result := CheckBox;
end;

end.

