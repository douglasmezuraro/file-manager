unit AbstractFactory.TabItem;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.TabControl,
  FMX.Types,
  System.SysUtils;

type
  TTabItemFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function Fabricate(var DTO: TDTO): IControl;
  end;

implementation

{ TTabItemFactory }

function TTabItemFactory.Fabricate(var DTO: TDTO): IControl;
var
  Control: TTabItem;
begin
  Result := nil;
  if DTO.Parent is TTabControl then
  begin
    Control      := (DTO.Parent as TTabControl).Add;
    Control.Text := DTO.ControlAttribute.Text;
    Result       := Control;
  end;
end;

end.

