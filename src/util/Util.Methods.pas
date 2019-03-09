unit Util.Methods;

interface

uses
  System.SysUtils;

type
  TUtils = class abstract
  strict private type

    TConstants = class
    public
      const Zero           = 0;
      const DateNull       = Zero;
      const NumericNull    = -999;
      const DefaultSpacing = 10;
      const DefaultWidth   = 400;
    end;

    TConversions = class
    private type
      TBooleanValues = array[Boolean] of string;
    strict private
      class var FBooleanValues: TBooleanValues;
    public
      class procedure DefineBoolean(const False, True: string); static;
      class function BoolToStr(const Value: Boolean): string; static;
      class function StrToBool(const Value: string): Boolean; static;
    end;

    TMethods = class
    public
      class function IniPath(const FileName: string): string; static;
    end;

  strict private
    class var FConstants: TConstants;
    class var FConversions: TConversions;
    class var FMethods: TMethods;
  public
    class property Constants: TConstants read FConstants;
    class property Conversions: TConversions read FConversions;
    class property Methods: TMethods read FMethods;
  end;

implementation

{ TUtils.TConversions }

class function TUtils.TConversions.BoolToStr(const Value: Boolean): string;
begin
  Result := FBooleanValues[Value];
end;

class procedure TUtils.TConversions.DefineBoolean(const False, True: string);
begin
  FBooleanValues[System.False] := False;
  FBooleanValues[System.True] := True;
end;

class function TUtils.TConversions.StrToBool(const Value: string): Boolean;
begin
  Result := SameText(Value, FBooleanValues[True]);
end;

{ TUtils.TMethods }

class function TUtils.TMethods.IniPath(const FileName: string): string;
begin
  Result := IncludeTrailingPathDelimiter(GetCurrentDir) + FileName;
end;

end.

