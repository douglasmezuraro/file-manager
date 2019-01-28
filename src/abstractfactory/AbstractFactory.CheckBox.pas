unit AbstractFactory.CheckBox;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.Value,
  System.Rtti;

type
  TCheckBoxFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function New(DTO: TDTO): TControl;
  end;

implementation

{ TCheckBoxFactory }

function TCheckBoxFactory.New(DTO: TDTO): TControl;
var
  CheckBox: TCheckBox;
begin
  CheckBox            := TCheckBox.Create(DTO.Owner);
  CheckBox.Parent     := DTO.Parent;
  CheckBox.Position.X := DTO.X;
  CheckBox.Position.Y := DTO.Y;
  CheckBox.IsChecked  := DTO.Value.AsBoolean;
  CheckBox.Text       := DTO.Text;
  CheckBox.Width      := CheckBox.Canvas.TextWidth(CheckBox.Text) + 25;
  
  DTO.Y := DTO.Y + 10;
  
  Result := CheckBox;
end;

end.
