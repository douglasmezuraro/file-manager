unit AbstractFactory.ComboBox;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.ListBox,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.SysUtils;

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
  Caption.Position.X := DTO.X;
  Caption.Position.Y := DTO.Y;
  Caption.Width      := 400;

  DTO.Y := DTO.Y + Caption.Height + 5;

  { ComboBox }
  Control              := TComboBox.Create(DTO.Owner);
  Control.Parent       := DTO.Parent.GetObject;
  Control.Position.X   := DTO.X;
  Control.Position.Y   := DTO.Y;
  Control.Values       := DTO.ControlAttribute.Values;
  Control.Value        := DTO.Value;
  Control.OnExit       := DTO.OnNotify;
  Control.Width        := 400;

  DTO.Y := DTO.Y + Control.Height + 10;

  Result := Control;
end;

end.

