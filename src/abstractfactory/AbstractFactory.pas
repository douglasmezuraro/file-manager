unit AbstractFactory;

interface

uses
  AbstractFactory.API,
  AbstractFactory.CheckBox,
  AbstractFactory.DTO,
  Helper.Value,
  FMX.Controls,
  FMX.Types,
  System.Classes,
  System.Rtti,
  System.Types;

type
  TAbstractFactory = class(TInterfacedObject, IAbstractFactory)
  private
    FOwner: TComponent;
    FPosition: TPoint;
  public
    function New(Parent: TFmxObject; Prop: TRttiProperty): TControl;
    constructor Create(Owner: TComponent);
  end;

implementation

{ TAbstractFactory }

constructor TAbstractFactory.Create(Owner: TComponent);
begin
  FOwner := Owner;
  FPosition := TPoint.Create(10, 10);
end;

function TAbstractFactory.New(Parent: TFmxObject;
  Prop: TRttiProperty): TControl;
var
  Value: TValue;
begin
  if Value.IsBoolean then

end;

end.
