unit AbstractFactory.CheckBox;

interface

uses
  AbstractFactory.API,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.SysUtils,
  Util.Types;

type
  TCheckBoxFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function Fabricate(var DTO: TDTO): IControl;
  end;

implementation

{ TCheckBoxFactory }

function TCheckBoxFactory.Fabricate(var DTO: TDTO): IControl;
var
  Control: TCheckBox;
begin
  Control            := TCheckBox.Create(DTO.Owner);
  Control.Parent     := DTO.Parent.GetObject;
  Control.Position.X := DTO.Position.X;
  Control.Position.Y := DTO.Position.Y;
  Control.Value      := DTO.Value;
  Control.Text       := DTO.ControlAttribute.Text;
  Control.Width      := 400;
  Control.OnExit     := DTO.OnNotify;

  DTO.Position.Y := DTO.Position.Y + Control.Height + 10;

  Result := Control;
end;

end.

