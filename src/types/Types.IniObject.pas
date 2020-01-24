unit Types.IniObject;

interface

uses
  Helper.Ini, System.IniFiles, System.SysUtils, Types.ObjectFileAPI;

type
  TIniObject = class abstract(TInterfacedObject, IObjectFile)
  private
    FIniFile: TIniFile;
  public
    constructor Create(const FileName: TFileName); virtual;
    destructor Destroy; override;
    procedure Read;
    procedure Write; overload;
    procedure Write(const FileName: TFileName); overload;
  end;

implementation

constructor TIniObject.Create(const FileName: TFileName);
begin
  FIniFile := TIniFile.Create(FileName);
end;

destructor TIniObject.Destroy;
begin
  FIniFile.Free;
  inherited Destroy;
end;

procedure TIniObject.Read;
begin
  FIniFile.Read(Self);
end;

procedure TIniObject.Write(const FileName: TFileName);
begin
  if Assigned(FIniFile) and (not FIniFile.FileName.Equals(FileName)) then
  begin
    FIniFile.Free;
    FIniFile := TIniFile.Create(FileName);
  end;

  Write;
end;

procedure TIniObject.Write;
begin
  FIniFile.Write(Self);
end;

end.

