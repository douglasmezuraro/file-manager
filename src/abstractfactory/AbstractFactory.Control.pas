unit AbstractFactory.Control;

interface

uses
  AbstractFactory.API,
  AbstractFactory.CheckBox,
  AbstractFactory.ComboBox,
  AbstractFactory.Edit,
  AbstractFactory.TabItem,
  FMX.Types,
  Helper.Rtti,
  Util.Types;

type
  TControlFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function Fabricate(var DTO: TDTO): IControl;
  end;

implementation

{ TControlFactory }

function TControlFactory.Fabricate(var DTO: TDTO): IControl;
var
  Factory: IAbstractFactory;
begin
  if DTO.Value.IsObject then
    Factory := TTabItemFactory.Create
  else if DTO.Value.IsBoolean then
    Factory := TCheckBoxFactory.Create
  else if Length(DTO.ControlAttribute.Values) > 0 then
    Factory := TComboBoxFactory.Create
  else
    Factory := TEditFactory.Create;

  Result := Factory.Fabricate(DTO);
end;

end.
