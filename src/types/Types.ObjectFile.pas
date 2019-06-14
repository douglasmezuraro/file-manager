unit Types.ObjectFile;

interface

uses
  Helper.Ini,
  Helper.Rtti,
  System.IniFiles,
  System.Rtti,
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
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
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

procedure TIniObject.AfterConstruction;
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Method: TRttiMethod;
  Instance: TObject;
begin
  inherited;
  Context := TRttiContext.Create;
  for Prop in Context.GetType(ClassType).GetProperties do
  begin
    Method := Prop.PropertyType.GetConstructor;
    if Assigned(Method) then
    begin
      Instance := Method.Invoke(Prop.PropertyType.AsInstance.MetaclassType, []).AsObject;
      Prop.SetValue(Self, Instance);
    end;
  end;
end;

procedure TIniObject.BeforeDestruction;
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Method: TRttiMethod;
begin
  inherited;
  Context := TRttiContext.Create;
  for Prop in Context.GetType(ClassType).GetProperties do
  begin
    Method := Prop.PropertyType.GetDestructor;
    if Assigned(Method) then
    begin
      Method.Invoke(Prop.GetValue(Self), []);
      Prop.SetValue(Self, nil);
    end;
  end;
end;

procedure TIniObject.Read;
begin
  FIniFile.Read(Self);
end;

procedure TIniObject.Write(const FileName: TFileName);
begin
  if Assigned(FIniFile) and (FIniFile.FileName <> FileName) then
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

