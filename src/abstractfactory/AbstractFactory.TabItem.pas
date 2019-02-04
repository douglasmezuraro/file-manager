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
  System.Rtti,
  System.SysUtils;

type
  TTabItemFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function New(var DTO: TDTO): TControl;
  end;

implementation

{ TTabItemFactory }

function TTabItemFactory.New(var DTO: TDTO): TControl;
var
  Control: TTabItem;
begin
  Result := nil;
  if DTO.Parent is TTabControl then
  begin
    Control      := (DTO.Parent as TTabControl).Add;
    Control.Name := Format('%s_%s', [DTO.Parent.Name, DTO.Ident.Name]).ToUpper;
    Control.Text := DTO.Control.Text;
    Result       := Control;
  end;
end;

end.
