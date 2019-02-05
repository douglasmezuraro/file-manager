unit AbstractFactory.API;

interface

uses
  FMX.Types,
  Util.Types;

type
  IAbstractFactory = interface
  ['{DEF0228E-2159-4CD9-A3DC-5DEEA735CDE3}']
    function Fabricate(var DTO: TDTO): IControl;
  end;

implementation

end.

