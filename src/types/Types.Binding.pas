unit Types.Binding;

interface

uses
  FMX.Types, Helper.Rtti.Value, System.Generics.Collections, System.Rtti, System.Types;

type
  TBinding = class sealed
  private type
    TBindingPair = TPair<TObject, TRttiProperty>;
    TBindingDictionary = TDictionary<IControl, TBindingPair>;
  private
    FDictionary: TBindingDictionary;
    function GetValue(const Control: IControl): TValue;
    procedure SetValue(const Control: IControl; const Value: TValue);
    function GetProp(const Control: IControl): TRttiProperty;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Control: IControl; const Obj: TObject; const Prop: TRttiProperty);
    procedure Clear;
  public
    property Value[const Control: IControl]: TValue read GetValue write SetValue;
    property Prop[const Control: IControl]: TRttiProperty read GetProp;
  end;

implementation

procedure TBinding.Add(const Control: IControl; const Obj: TObject; const Prop: TRttiProperty);
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

function TBinding.GetProp(const Control: IControl): TRttiProperty;
begin
  if FDictionary.ContainsKey(Control) then
    Exit(FDictionary.Items[Control].Value);

  Result := nil;
end;

function TBinding.GetValue(const Control: IControl): TValue;
var
  Obj: TObject;
  Prop: TRttiProperty;
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
  Obj: TObject;
  Prop: TRttiProperty;
begin
  if FDictionary.ContainsKey(Control) then
  begin
    Obj := FDictionary.Items[Control].Key;
    Prop := FDictionary.Items[Control].Value;
    Prop.SetValue(Obj, Prop.GetValue(Obj).Assign(Value));
  end;
end;

end.

