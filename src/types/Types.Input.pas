unit Types.Input;

interface

uses
  Helper.Rtti,
  Model.Base,
  System.Rtti,
  System.SysUtils,
  Types.Path;

type
  TInput<T: TModel> = class
  private
    FItems: TArray<TPath<T>> ;
    FCurrent: TPath<T>;
  public
    destructor Destroy; override;
    procedure Read;
    property Current: TPath<T> read FCurrent write FCurrent;
    property Items: TArray<TPath<T>> read FItems write FItems;
    const FileName = 'input.json';
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
    Method := Context.GetType(TypeInfo(T)).GetConstructor;
    if Assigned(Method) then
    begin
      Path.Model := Method.Invoke(T, [Path.Source]).AsType<T>;
      if Assigned(Path.Model) then
        Path.Model.Read;
    end;
  end;
end;

end.

