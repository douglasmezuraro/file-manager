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
    class function GetIniPath(const AppExeName: string): string;
    class function ValidateIP(const IP: string): Boolean;
  end;

implementation

{ TMethods }

class function TMethods.BoolToStr(const Value: Boolean): string;
const
  Map: array[Boolean] of string = (FlagFalse, FlagTrue);
begin
  Result := Map[Value];
end;

class function TMethods.GetIniPath(const AppExeName: string): string;
var
  Path: string;
begin
  Path := ExtractFilePath(AppExeName);
  Result := Path + IniFileName;
end;

class function TMethods.StrToBool(const Value: string): Boolean;
begin
  Result := False;
  if SameText(Value, FlagTrue) then
    Result := True;
end;

class function TMethods.ValidateIP(const IP: string): Boolean;
const
  Pattern = '(\d{1,3}\.){3}\d{1,3}';
  LocalHost = 'localhost';
var
  RegEx: TRegEx;
begin
  Result := True;

  if IP.IsEmpty or SameText(IP, LocalHost) then
    Exit;

  RegEx := TRegEx.Create(Pattern, [roNotEmpty, roIgnoreCase]);
  Result := RegEx.IsMatch(IP);
end;

end.

