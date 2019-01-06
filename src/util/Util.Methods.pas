unit Util.Methods;

interface

uses
  System.SysUtils,
  Util.Constants;

type
  TMethods = class
  public
    class function BoolToStr(const Value: Boolean): string;
    class function StrToBool(const Value: string): Boolean;
  end;

implementation

{ TMethods }

class function TMethods.BoolToStr(const Value: Boolean): string;
const
  Map: array[Boolean] of string = (FlagFalse, FlagTrue);
begin
  Result := Map[Value];
end;

class function TMethods.StrToBool(const Value: string): Boolean;
begin
  Result := False;
  if SameText(Value, FlagTrue) then
    Result := True;
end;

end.
