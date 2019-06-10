unit Types.Input;

interface

uses
  System.Rtti,
  System.SysUtils,
  Types.ObjectFile,
  Types.Path;

type
  TInput<T: TIniObject> = class
  strict private
    FItems: TArray<TPath<T>> ;
    FCurrent: TPath<T>;
  public
    const FileName = 'input.json';
  public
    destructor Destroy; override;
    procedure Read;
    property Current: TPath<T> read FCurrent write FCurrent;
    property Items: TArray<TPath<T>> read FItems write FItems;
  end;

implementation

{ TInput }

destructor TInput<T>.Destroy;
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

procedure TInput<T>.Read;
var
  Path: TPath<T>;
  Context: TRttiContext;
  Method: TRttiMethod;
begin
  Context := TRttiContext.Create;
  for Path in Items do
  begin
    Method := Context.GetType(TypeInfo(T)).GetMethod('Create');

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

