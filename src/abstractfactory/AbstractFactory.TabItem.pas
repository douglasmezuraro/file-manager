unit AbstractFactory.TabItem;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.Graphics,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  System.Rtti;

type
  TTabItemFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function New(var DTO: TDTO): TControl;
  end;

implementation

{ TTabItemFactory }

function TTabItemFactory.New(var DTO: TDTO): TControl;
var
  TabItem: TTabItem;
begin
  Result := nil;
  if DTO.Parent is TTabControl then
  begin
    TabItem := (DTO.Parent as TTabControl).Add;
    TabItem.Text := DTO.Control.Text;
    Result := TabItem;
  end;
end;

end.
