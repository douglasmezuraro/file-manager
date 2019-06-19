unit Types.Utils.Methods;

interface

uses
  System.IOUtils,
  System.SysUtils,
  Winapi.UrlMon;

type
  TMethods = class abstract
  public
    class function ExtractFileName(const Exception: EFileNotFoundException): TFileName; static;
    class function FilePath(const FileName: TFileName): TFileName; static;
    class procedure OpenURL(const URL: string); static;
  end;

implementation

{ TMethods }

class function TMethods.ExtractFileName(const Exception: EFileNotFoundException): TFileName;
var
  Start: Integer;
begin
  Start := Succ(Exception.Message.IndexOf(':'));
  Result := Exception.Message.Substring(Start, Pred(Exception.Message.Length) - Start).Trim;
end;

class function TMethods.FilePath(const FileName: TFileName): TFileName;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), FileName);
end;

class procedure TMethods.OpenURL(const URL: string);
begin
  if not URL.IsEmpty then
    HlinkNavigateString(nil, PWideChar(URL));
end;

end.

