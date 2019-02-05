unit AbstractFactory.ComboBox;

interface

uses
  AbstractFactory.API,
  FMX.Controls,
  FMX.ListBox,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.SysUtils,
  Util.Types;

type
  TComboBoxFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function Fabricate(var DTO: TDTO): IControl;
  end;

implementation

{ TComboBoxFactory }

function TComboBoxFactory.Fabricate(var DTO: TDTO): IControl;
var
  Caption: TLabel;
  Control: TComboBox;
begin
  Caption            := TLabel.Create(DTO.Owner);
  Caption.Parent     := DTO.Parent.GetObject;
  Caption.Text       := DTO.ControlAttribute.Text;
  Caption.Position.X := DTO.Position.X;
  Caption.Position.Y := DTO.Position.Y;
  Caption.Width      := 400;

  DTO.Position.Y := DTO.Position.Y + Caption.Height + 5;

  { ComboBox }
  Control              := TComboBox.Create(DTO.Owner);
  Control.Parent       := DTO.Parent.GetObject;
  Control.Position.X   := DTO.Position.X;
  Control.Position.Y   := DTO.Position.Y;
  Control.Values       := DTO.ControlAttribute.Values;
  Control.Value        := DTO.Value;
  Control.OnExit       := DTO.OnNotify;
  Control.Width        := 400;

  DTO.Position.Y := DTO.Position.Y + Control.Height + 10;

  Result := Control;
end;

end.

