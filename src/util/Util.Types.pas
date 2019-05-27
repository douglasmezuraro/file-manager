unit Util.Types;

interface

uses
  System.IniFiles,
  System.SysUtils,
  System.Generics.Collections,
  Model.FileObject,
  Rtti;

type
  TFilePath<T: TIniObject> = class
  strict private
    FPath: TFileName;
    FName: string;
    FModel: T;
  public
    property Name: string read FName write FName;
    property Path: TFileName read FPath write FPath;
    property Model: T read FModel write FModel;
  end;

  TPaths<T: TIniObject> = class
  strict private
    FItems: TArray<TFilePath<T>> ;
    FCurr: TFilePath<T>;
  public
    destructor Destroy; override;
    procedure Foo;
    property Curr: TFilePath<T> read FCurr write FCurr;
    property Items: TArray<TFilePath<T>> read FItems write FItems;
  end;

implementation

{ TPaths }

destructor TPaths<T>.Destroy;
var
  Path: TFilePath<T>;
begin
  for Path in Items do
  begin
    if Assigned(Path.Model) then
      Path.Model.Free;
    Path.Free;
  end;
  inherited Destroy;
end;

procedure TPaths<T>.Foo;
var
  Path: TFilePath<T>;
  Context: TRttiContext;
  Typ: TRttiType;
  Method: TRttiMethod;
begin
  Context := TRttiContext.Create;
  Typ := Context.GetType(TypeInfo(T));

  for Path in Items do
  begin
    Method := Typ.GetMethod('Create');

    if not Assigned(Method) then
      Continue;


    Path.Model := Method.Invoke(T, [Path.Path]).AsType<T>;
    if Assigned(Path.Model) then
      Path.Model.Read;
  end;
end;

end.
