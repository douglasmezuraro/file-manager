unit Types.Paths;

interface

uses
  System.Generics.Collections,
  System.Rtti,
  System.SysUtils,
  Types.ObjectFile,
  Types.Path;

type
  TPaths<T: TIniObject> = class
  strict private
    FItems: TArray<TPath<T>> ;
    FCurrent: TPath<T>;
  private
    function GetItem(const Name: string): TPath<T>;
  public
    destructor Destroy; override;
    procedure Populate;
    property Current: TPath<T> read FCurrent write FCurrent;
    property Item[const Name: string]: TPath<T> read GetItem;
    property Items: TArray<TPath<T>> read FItems write FItems;
  end;

implementation

{ TPaths }

destructor TPaths<T>.Destroy;
var
  Path: TPath<T>;
begin
  for Path in Items do
  begin
    if Assigned(Path.Model) then
      Path.Model.Free;
    Path.Free;
  end;
  inherited Destroy;
end;

function TPaths<T>.GetItem(const Name: string): TPath<T>;
var
  Path: TPath<T>;
begin
  Result := nil;
  for Path in FItems do
  begin
    if Path.Name.Equals(Name) then
      Exit(Path);
  end;
end;

procedure TPaths<T>.Populate;
var
  Path: TPath<T>;
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

    if not Method.IsConstructor then
      Continue;

    Path.Model := Method.Invoke(T, [Path.Source]).AsType<T>;

    if Assigned(Path.Model) then
      Path.Model.Read;
  end;
end;

end.

