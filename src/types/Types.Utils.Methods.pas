unit Types.Utils.Methods;

interface

uses
  System.IOUtils, System.SysUtils, Winapi.UrlMon;

type
  TMethods = class abstract
  public
    class function FilePath(const FileName: TFileName): TFileName; static;
    class procedure OpenURL(const URL: string); static;
  end;

implementation

class function TMethods.FilePath(const FileName: TFileName): TFileName;
const
  EXE_DIR_PARAM = 0;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(EXE_DIR_PARAM)), FileName);
end;

class procedure TMethods.OpenURL(const URL: string);
begin
  if not URL.Trim.IsEmpty then
    HlinkNavigateString(nil, PWideChar(URL));
end;

end.

