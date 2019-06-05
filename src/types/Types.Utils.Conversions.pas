unit Types.Utils.Conversions;

interface

uses
  System.SysUtils;

type
  TConversions = class abstract
  private type
    TBooleanString = array[Boolean] of string;
  strict private
    class var FBooleanString: TBooleanString;
  public
    class procedure DefineBoolean(const False, True: string); static;
    class function BoolToStr(const Value: Boolean): string; static;
    class function StrToBool(const Value: string): Boolean; static;
  end;

implementation

{ TConversions }

class function TConversions.BoolToStr(const Value: Boolean): string;
begin
  Result := FBooleanString[Value];
end;

class procedure TConversions.DefineBoolean(const False, True: string);
begin
  FBooleanString[System.False] := False;
  FBooleanString[System.True] := True;
end;

class function TConversions.StrToBool(const Value: string): Boolean;
begin
  Result := SameText(Value, FBooleanString[True]);
end;

end.

