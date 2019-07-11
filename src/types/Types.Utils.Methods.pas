unit Types.Utils.Methods;

interface

uses
  System.IOUtils,
  System.SysUtils,
  Winapi.UrlMon;

type
  TMethods = class abstract
  public
    class function FilePath(const FileName: TFileName): TFileName; static;
    class function IndexOf(const Value: string; const Values: TArray<string>): Integer; static;
    class procedure OpenURL(const URL: string); static;
  end;

implementation

{ TMethods }

class function TMethods.FilePath(const FileName: TFileName): TFileName;
const
  ExeDirParam = 0;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(ExeDirParam)), FileName);
end;

class function TMethods.IndexOf(const Value: string; const Values: TArray<string>): Integer;
const
  NotFoundIndex = -1;
var
  Index: Integer;
begin
  for Index := Low(Values) to High(Values) do
  begin
    if SameText(Values[Index], Value) then
      Exit(Index);
  end;
  Result := NotFoundIndex;
end;

class procedure TMethods.OpenURL(const URL: string);
begin
  if not URL.IsEmpty then
    HlinkNavigateString(nil, PWideChar(URL));
end;

end.

