unit AbstractFactory.API;

interface

uses
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.Types,
  System.Classes,
  System.Rtti;

type
  IAbstractFactory = interface
  ['{DEF0228E-2159-4CD9-A3DC-5DEEA735CDE3}']
    function New(var DTO: TDTO): TControl;
  end;

implementation

end.

