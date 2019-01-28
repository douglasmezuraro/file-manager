unit Util.Methods;

interface

uses
  System.SysUtils,
  Util.Constants,
  System.RegularExpressions;

type
  TMethods = class
  public
    class function BoolToStr(const Value: Boolean): string;
    class function StrToBool(const Value: string): Boolean;
    class function GetIniPath: string;
  end;

implementation

{ TMethods }

class function TMethods.BoolToStr(const Value: Boolean): string;
const
  Map: array[Boolean] of string = (FlagFalse, FlagTrue);
begin
  Result := Map[Value];
end;

class function TMethods.GetIniPath: string;
var
  Path: string;
begin
  Path := IncludeTrailingPathDelimiter(GetCurrentDir);
  Result := Path + IniFileName;
end;

class function TMethods.StrToBool(const Value: string): Boolean;
begin
  Result := False;
  if SameText(Value, FlagTrue) then
    Result := True;
end;

end.

