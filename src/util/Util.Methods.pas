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
    class function ValidateIP(const IP: string): Boolean;
    class procedure Assign<T>(var A: array of T; const B: TArray<T>);
  end;

implementation

{ TMethods }

class procedure TMethods.Assign<T>(var A: array of T; const B: TArray<T>);
var
  Index: Integer;
begin
  for Index := Low(B) to High(B) do
    A[Index] := B[Index];
end;

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

