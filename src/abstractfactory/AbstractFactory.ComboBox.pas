unit AbstractFactory.ComboBox;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.Graphics,
  FMX.ListBox,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  Helper.Value,
  System.Rtti,
  System.Types;

type
  TComboBoxFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function New(var DTO: TDTO): TControl;
  end;

implementation

{ TComboBoxFactory }

function TComboBoxFactory.New(var DTO: TDTO): TControl;
var
  Caption: TLabel;
  ComboBox: TComboBox;
begin
  Caption            := TLabel.Create(DTO.Owner);
  Caption.Parent     := DTO.Parent;
  Caption.Text       := DTO.Text;
  Caption.Position.X := DTO.X;
  Caption.Position.Y := DTO.Y;

  DTO.Y := DTO.Y + Caption.Height + 5;

  { ComboBox }
  ComboBox            := TComboBox.Create(DTO.Owner);
  ComboBox.Parent     := DTO.Parent;
  ComboBox.Position.X := DTO.X;
  ComboBox.Position.Y := DTO.Y;
  ComboBox.Values     := DTO.Values;
  ComboBox.Text       := DTO.Value.AsString;
  ComboBox.Width      := ComboBox.Canvas.TextWidth(ComboBox.Text) + 25;

  DTO.Y := DTO.Y + ComboBox.Height + 10;

  Result := ComboBox;
end;

end.

