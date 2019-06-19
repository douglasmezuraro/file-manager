unit Types.Input;

interface

uses
  Helper.Rtti,
  Model.Base,
  System.Rtti,
  System.SysUtils,
  Types.Input.Item;

type
  TInput<T: TModel> = class
  private type
    TInputItems = TArray<TInputItem<T>>;
  private
    FItems: TInputItems;
    FCurrent: TInputItem<T>;
  public
    destructor Destroy; override;
    procedure Read;
    property Current: TInputItem<T> read FCurrent write FCurrent;
    property Items: TInputItems read FItems write FItems;
    const FileName = 'input.json';
  end;

implementation

{ TInput }

destructor TInput<T>.Destroy;
var
  Path: TInputItem<T>;
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
  Path: TInputItem<T>;
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

