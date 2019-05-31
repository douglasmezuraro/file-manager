unit Model.FileObject;

interface

uses
  Helper.Ini,
  Model.FileObjectAPI,
  System.IniFiles,
  System.SysUtils;

type
  TIniObject = class(TInterfacedObject, IFileObject)
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
  FIniFile.ReadObject(Self);
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
  FIniFile.WriteObject(Self);
end;

end.
