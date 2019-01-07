unit Util.Constants;

interface

uses
  System.SysUtils,
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
  ConnectionTypeMap: array[TConnectionType] of string = (string.Empty, 'Socket');
  AccessTypeMap: array[TAccessType] of string = (string.Empty, 'sqld', 'FireDAC');
  DatabaseTypeMap: array[TDatabaseType] of string = (string.Empty, 'Oracle', 'SQLServer', 'DB2');

implementation

end.

