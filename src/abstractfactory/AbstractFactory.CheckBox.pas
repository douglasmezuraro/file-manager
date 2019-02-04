unit AbstractFactory.CheckBox;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.SysUtils;

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
  Control.Name       := Format('%s_%s', [DTO.Parent.GetObject.Name, DTO.IniAttribute.Name]).ToUpper;
  Control.Parent     := DTO.Parent.GetObject;
  Control.Position.X := DTO.X;
  Control.Position.Y := DTO.Y;
  Control.Value      := DTO.Value;
  Control.Text       := DTO.ControlAttribute.Text;
  Control.Width      := 400;
  Control.OnExit     := DTO.OnNotify;

  DTO.Y := DTO.Y + Control.Height + 10;

  Result := Control;
end;

end.

