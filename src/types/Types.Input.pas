unit Types.Input;

interface

uses
  Helper.Rtti,
  Model.Base,
  System.IOUtils,
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
  Item: TInputItem<T>;
begin
  for Item in Items do
  begin
    if Assigned(Item.Model) then
      Item.Model.Free;
    Item.Free;
  end;
  inherited Destroy;
end;

procedure TInput<T>.Read;
var
  Item: TInputItem<T>;
  Context: TRttiContext;
  Method: TRttiMethod;
begin
  Context := TRttiContext.Create;
  for Item in Items do
  begin
    if not TFile.Exists(Item.Source) then
      raise EFileNotFoundException.Create(Item.Source);

    Method := Context.GetType(TypeInfo(T)).GetConstructor;
    if Assigned(Method) then
    begin
      Item.Model := Method.Invoke(T, [Item.Source]).AsType<T>;
      if Assigned(Item.Model) then
        Item.Model.Read;
    end;
  end;
end;

end.

