unit Util.Binding;

interface

uses
  FMX.Types,
  Helper.Rtti,
  System.Generics.Collections,
  System.Rtti,
  System.Types;

type
  TBinding = class
  private type
    TBindingPair = TPair<TObject, TRttiProperty>;
    TBindingDictionary = TDictionary<IControl, TBindingPair>;
  private
    FDictionary: TBindingDictionary;
    function GetValue(const Control: IControl): TValue;
    procedure SetValue(const Control: IControl; const Value: TValue);
    function GetKeys: TArray<IControl>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Add(const Obj: TObject; const Prop: TRttiProperty; const Control: IControl);
    property Keys: TArray<IControl> read GetKeys;
    property Values[const Control: IControl]: TValue read GetValue write SetValue;
  end;

implementation

{ TBinding }

procedure TBinding.Add(const Obj: TObject; const Prop: TRttiProperty;
  const Control: IControl);
begin
  FDictionary.Add(Control, TBindingPair.Create(Obj, Prop));
end;

constructor TBinding.Create;
begin
  FDictionary := TBindingDictionary.Create;
end;

destructor TBinding.Destroy;
begin
  FDictionary.Free;
  inherited Destroy;
end;

procedure TBinding.Clear;
begin
  FDictionary.Clear;
end;

function TBinding.GetKeys: TArray<IControl>;
begin
  Result := FDictionary.Keys.ToArray;
end;

function TBinding.GetValue(const Control: IControl): TValue;
var
  Prop: TRttiProperty;
  Obj: TObject;
begin
  Result.Empty;
  if FDictionary.ContainsKey(Control) then
  begin
    Obj := FDictionary.Items[Control].Key;
    Prop := FDictionary.Items[Control].Value;
    Result := Prop.GetValue(Obj);
  end;
end;

procedure TBinding.SetValue(const Control: IControl; const Value: TValue);
var
  Prop: TRttiProperty;
  Obj: TObject;
  PropValue: TValue;
begin
  if not FDictionary.ContainsKey(Control) then
    Exit;

  Obj := FDictionary.Items[Control].Key;
  Prop := FDictionary.Items[Control].Value;

  PropValue := Prop.GetValue(Obj);
  Prop.SetValue(Obj, PropValue.Assign(Value));
end;

end.

