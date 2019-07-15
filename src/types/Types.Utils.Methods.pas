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

class procedure TMethods.OpenURL(const URL: string);
begin
  if not URL.IsEmpty then
    HlinkNavigateString(nil, PWideChar(URL));
end;

end.

