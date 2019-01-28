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
  ConnectionTypeMap: TArray<string> = [string.Empty, 'Socket'];
  AccessTypeMap: TArray<string> = [string.Empty, 'sqld', 'FireDAC'];
  const DatabaseTypeMap: array[TDataBaseType] of string = (string.Empty, 'Oracle', 'SQLServer', 'DB2');

implementation

end.

