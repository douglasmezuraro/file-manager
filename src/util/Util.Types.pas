unit Util.Types;

interface

uses
  FMX.Controls,
  FMX.Types,
  Helper.FMX,
  Helper.Rtti,
  System.Classes,
  System.Generics.Collections,
  System.Rtti,
  System.Types;

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

  TDTO = record
    OnNotify: TNotifyEvent;
    Owner: TComponent;
    Parent: IControl;
    Position: TPointF;
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
  PropValue: TValue;
begin
  if not FDic.ContainsKey(Control) then
    Exit;

  Obj := FDic.Items[Control].Key;
  Prop := FDic.Items[Control].Value;

  PropValue := Prop.GetValue(Obj);
  Prop.SetValue(Obj, PropValue.Assign(Value));
end;

end.

