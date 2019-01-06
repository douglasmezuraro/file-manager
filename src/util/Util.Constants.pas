unit Util.Constants;

interface

uses
  Util.Types;

const

{ Null-types}
  DateNull    = 0;
  NumericNull = -999;

{ Other }
  IniFileName = 'spCfg.ini';

{ Boolean-Flag }
  FlagTrue  = 'S';
  FlagFalse = 'N';

{ Enum-mapping }
  ConnectionTypeMap: array[TConnectionType] of string = ('', 'Socket');

implementation

end.

