unit Types.Utils.Methods;

interface

uses
  System.IOUtils,
  System.SysUtils;

type
  TMethods = class abstract
  public
    class function FilePath(const FileName: TFileName): TFileName; static;
  end;

implementation

{ TMethods }

class function TMethods.FilePath(const FileName: TFileName): TFileName;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), FileName);
end;

end.

