unit Util.Methods;

interface

uses
  System.SysUtils;

type
  TUtils = class
  strict private type

    TConstants = class
    public
      const DateNull    = 0; // 30/12/1899
      const NumericNull = -999;
      const IniFileName = 'spCfg.ini';
      const True        = 'S';
      const False       = 'N';
    end;

    TConversions = class
    public
      class function BoolToStr(const Value: Boolean): string; static;
      class function StrToBool(const Value: string): Boolean; static;
    end;

    TMethods = class
    public
      class function IniPath: string; static;
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
const
  Mapping: array[Boolean] of string = (Constants.False, Constants.True);
begin
  Result := Mapping[Value];
end;

class function TUtils.TConversions.StrToBool(const Value: string): Boolean;
begin
  Result := SameText(Value, Constants.True);
end;

{ TUtils.TMethods }

class function TUtils.TMethods.IniPath: string;
var
  Path: string;
begin
  Path := IncludeTrailingPathDelimiter(GetCurrentDir);
  Result := Path + Constants.IniFileName;
end;

end.

