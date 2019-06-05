unit Types.ObjectFile;

interface

uses
  Helper.Ini,
  System.IniFiles,
  System.SysUtils,
  Types.ObjectFileAPI;

type
  TIniObject = class(TInterfacedObject, IObjectFile)
  private
    FIniFile: TIniFile;
  public
    constructor Create(const FileName: TFileName);
    destructor Destroy; override;
    procedure Read;
    procedure Write; overload;
    procedure Write(const FileName: TFileName); overload;
  end;

implementation

{ TIniObject }

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
  if Assigned(FIniFile) then
    FIniFile.Free;

  FIniFile := TIniFile.Create(FileName);

  Write;
end;

procedure TIniObject.Write;
begin
  FIniFile.Write(Self);
end;

end.

