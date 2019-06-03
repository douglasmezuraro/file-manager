unit Types.Utils.Conversions;

interface

uses
  System.SysUtils;

type
  TConversions = class abstract
  private type
    TBooleanValues = array[Boolean] of string;
  strict private
    class var FBooleanValues: TBooleanValues;
  public
    class procedure DefineBoolean(const False, True: string); static;
    class function BoolToStr(const Value: Boolean): string; static;
    class function StrToBool(const Value: string): Boolean; static;
  end;

implementation

{ TConversions }

class function TConversions.BoolToStr(const Value: Boolean): string;
begin
  Result := FBooleanValues[Value];
end;

class procedure TConversions.DefineBoolean(const False, True: string);
begin
  FBooleanValues[System.False] := False;
  FBooleanValues[System.True] := True;
end;

class function TConversions.StrToBool(const Value: string): Boolean;
begin
  Result := SameText(Value, FBooleanValues[True]);
end;

end.

