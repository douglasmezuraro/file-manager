unit Util.Types;

interface

uses
  FMX.Types,
  Helper.FMX,
  Helper.Rtti,
  System.Classes,
  System.Generics.Collections,
  System.Rtti;

type
  TBinding = class
  private type
    TBindingPair = TPair<TObject, TRttiProperty>;
    TBindingDictionary = TDictionary<IControl, TBindingPair>;
  private
    FDic: TBindingDictionary;
    function GetValue(const Control: IControl): TValue;
    procedure SetValue(const Control: IControl; const Value: TValue);
    function GetKeys: TArray<IControl>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Obj: TObject; const Prop: TRttiProperty; const Control: IControl);
    property Keys: TArray<IControl> read GetKeys;
    property Values[const Control: IControl]: TValue read GetValue write SetValue;
  end;

  TPosition = record
    X: Single;
    Y: Single;
  end;

  TDTO = record
    OnNotify: TNotifyEvent;
    Owner: TComponent;
    Parent: IControl;
    Position: TPosition;
    Prop: TRttiProperty;
    Model: TObject;
    constructor Create(const X, Y: Single);
  end;

implementation

{ TDTO }

constructor TDTO.Create(const X, Y: Single);
begin
  Position.X := X;
  Position.Y := Y;
end;

{ TBinding }

procedure TBinding.Add(const Obj: TObject; const Prop: TRttiProperty;
  const Control: IControl);
begin
  FDic.Add(Control, TBindingPair.Create(Obj, Prop));
end;

constructor TBinding.Create;
begin
  FDic := TBindingDictionary.Create;
end;

destructor TBinding.Destroy;
begin
  FDic.Free;
  inherited Destroy;
end;

function TBinding.GetKeys: TArray<IControl>;
begin
  Result := FDic.Keys.ToArray;
end;

function TBinding.GetValue(const Control: IControl): TValue;
var
  Prop: TRttiProperty;
  Obj: TObject;
begin
  Result.Empty;
  if FDic.ContainsKey(Control) then
  begin
    Obj := FDic.Items[Control].Key;
    Prop := FDic.Items[Control].Value;
    Result := Prop.GetValue(Obj);
  end;
end;

procedure TBinding.SetValue(const Control: IControl; const Value: TValue);
var
  Prop: TRttiProperty;
  Obj: TObject;
  NewValue: TValue;
begin
  if FDic.ContainsKey(Control) then
  begin
    Obj := FDic.Items[Control].Key;
    Prop := FDic.Items[Control].Value;

    NewValue := Prop.GetValue(Obj);

    Prop.SetValue(Obj, NewValue.Assign(Control.GetObject.Value));
  end;
end;

end.

