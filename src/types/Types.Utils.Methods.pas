unit Types.Utils.Methods;

interface

uses
  System.IOUtils,
  System.SysUtils;

type
  TMethods = class
  public
    class function FilePath(const FileName: TFileName): string; static;
  end;

implementation

{ TMethods }

class function TMethods.FilePath(const FileName: TFileName): string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), FileName);
end;

end.
