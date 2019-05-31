unit Util.Types.Path;

interface

uses
  Model.FileObject,
  System.Rtti,
  System.SysUtils;

type
  TFilePath<T: TIniObject> = class
  strict private
    FId: UInt8;
    FCanOverride: Boolean;
    FName: string;
    FSource: TFileName;
    FTarget: TFileName;
    FModel: T;
  public
    property Id: UInt8 read FId write FId;
    property Name: string read FName write FName;
    property CanOverride: Boolean read FCanOverride write FCanOverride;
    property Source: TFileName read FSource write FSource;
    property Target: TFileName read FTarget write FTarget;
    property Model: T read FModel write FModel;
  end;

  TPaths<T: TIniObject> = class
  strict private
    FItems: TArray<TFilePath<T>> ;
    FCurrent: TFilePath<T>;
  public
    destructor Destroy; override;
    procedure Populate;
    property Current: TFilePath<T> read FCurrent write FCurrent;
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

procedure TPaths<T>.Populate;
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

    Path.Model := Method.Invoke(T, [Path.Source]).AsType<T>;
    if Assigned(Path.Model) then
      Path.Model.Read;
  end;
end;

end.
