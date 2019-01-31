unit Helper.Rtti;

interface

uses
  System.Rtti,
  System.SysUtils;

type
  TValueHelper = record Helper for TValue
  public
    function AsByte: Byte;
    function AsCardinal: Cardinal;
    function AsDate: TDate;
    function AsDateTime: TDateTime;
    function AsDouble: Double;
    function AsPointer: Pointer;
    function AsShortInt: ShortInt;
    function AsSingle: Single;
    function AsSmallInt: SmallInt;
    function AsTime: TTime;
    function AsWord: Word;

    function IsBoolean: Boolean;
    function IsByte: Boolean;
    function IsCardinal: Boolean;
    function IsCurrency: Boolean;
    function IsDate: Boolean;
    function IsDateTime: Boolean;
    function IsDouble: Boolean;
    function IsFloat: Boolean;
    function IsInt64: Boolean;
    function IsInteger: Boolean;
    function IsNumeric: Boolean;
    function IsPointer: Boolean;
    function IsShortInt: Boolean;
    function IsSingle: Boolean;
    function IsSmallInt: Boolean;
    function IsString: Boolean;
    function IsTime: Boolean;
    function IsUInt64: Boolean;
    function IsVariant: Boolean;
    function IsWord: Boolean;

    procedure Assign(Value: TValue);
    function ForceAsType<T>: T;
    function Equals(const Value: TValue): Boolean;
  end;

  TRttiPropertyHelper = class Helper for TRttiProperty
  public
    function GetAtribute<T: class>: T;
  end;

implementation

{ TValueHelper }

function TValueHelper.AsByte: Byte;
begin
  TryAsType<Byte>(Result);
end;

function TValueHelper.AsCardinal: Cardinal;
begin
  TryAsType<Cardinal>(Result);
end;

function TValueHelper.AsDate: TDate;
begin
  TryAsType<TDate>(Result);
end;

function TValueHelper.AsDateTime: TDateTime;
begin
  TryAsType<TDateTime>(Result);
end;

function TValueHelper.AsDouble: Double;
begin
  TryAsType<Double>(Result);
end;

function TValueHelper.AsPointer: Pointer;
begin
  TryAsType<Pointer>(Result);
end;

function TValueHelper.AsShortInt: ShortInt;
begin
  TryAsType<ShortInt>(Result);
end;

procedure TValueHelper.Assign(Value: TValue);
begin
  if TypeInfo = nil then
  begin
    Self := Value;
    Exit;
  end;

  if IsBoolean then
  begin
    Self := Value.ForceAsType<Boolean>();
    Exit;
  end;

  if IsByte then
  begin
    Self := Value.ForceAsType<Byte>();
    Exit;
  end;

  if IsCardinal then
  begin
    Self := Value.ForceAsType<Cardinal>();
    Exit;
  end;

  if IsCurrency then
  begin
    Self := Value.ForceAsType<Currency>();
    Exit;
  end;

  if IsDate then
  begin
    Self := Value.ForceAsType<TDate>();
    Exit;
  end;

  if IsDateTime then
  begin
    Self := Value.ForceAsType<TDateTime>();
    Exit;
  end;

  if IsDouble then
  begin
    Self := Value.ForceAsType<Double>();
    Exit;
  end;

  if IsInt64 then
  begin
    Self := Value.ForceAsType<Int64>();
    Exit;
  end;

  if IsInteger then
  begin
    Self := Value.ForceAsType<Integer>();
    Exit;
  end;

  if IsPointer then
  begin
    Self := Value.ForceAsType<Pointer>();
    Exit;
  end;

  if IsShortInt then
  begin
    Self := Value.ForceAsType<ShortInt>();
    Exit;
  end;

  if IsSingle then
  begin
    Self := Value.ForceAsType<Single>();
    Exit;
  end;

  if IsSmallInt then
  begin
    Self := Value.ForceAsType<SmallInt>();
    Exit;
  end;

  if IsString then
  begin
    Self := Value.ForceAsType<String>();
    Exit;
  end;

  if IsTime then
  begin
    Self := Value.ForceAsType<TTime>();
    Exit;
  end;

  if IsUInt64 then
  begin
    Self := Value.ForceAsType<UInt64>();
    Exit;
  end;

//  if IsVariant then
//  begin
//    Self := Value.ForceAsType<Variant>();
//    Exit;
//  end;

  if IsWord then
  begin
    Self := Value.ForceAsType<Word>();
    Exit;
  end;

  raise Exception.Create('Unknown type.');
end;

function TValueHelper.AsSingle: Single;
begin
  TryAsType<Single>(Result);
end;

function TValueHelper.AsSmallInt: SmallInt;
begin
  TryAsType<SmallInt>(Result);
end;

function TValueHelper.AsTime: TTime;
begin
  TryAsType<TTime>(Result);
end;

function TValueHelper.AsWord: Word;
begin
  TryAsType<Word>(Result);
end;

function TValueHelper.Equals(const Value: TValue): Boolean;
begin
  Result := SameText(Self.ToString, Value.ToString);
end;

function TValueHelper.ForceAsType<T>: T;
begin
  TryAsType<T>(Result);
end;

function TValueHelper.IsBoolean: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Boolean);
end;

function TValueHelper.IsByte: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Byte);
end;

function TValueHelper.IsCardinal: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Cardinal);
end;

function TValueHelper.IsCurrency: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Currency);
end;

function TValueHelper.IsDate: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(TDate);
end;

function TValueHelper.IsDateTime: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(TDateTime);
end;

function TValueHelper.IsDouble: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Double);
end;

function TValueHelper.IsFloat: Boolean;
begin
  Result := Kind = tkFloat;
end;

function TValueHelper.IsInt64: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Int64);
end;

function TValueHelper.IsInteger: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Integer);
end;

function TValueHelper.IsNumeric: Boolean;
begin
  Result := Kind in [tkChar, tkEnumeration, tkFloat, tkInt64, tkInteger, tkWChar];
end;

function TValueHelper.IsPointer: Boolean;
begin
  Result := Kind = tkPointer;
end;

function TValueHelper.IsShortInt: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(ShortInt);
end;

function TValueHelper.IsSingle: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Single);
end;

function TValueHelper.IsSmallInt: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(SmallInt);
end;

function TValueHelper.IsString: Boolean;
begin
  Result := Kind in [tkChar, tkLString, tkString, tkUString, tkWChar, tkWString];
end;

function TValueHelper.IsTime: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(TTime);
end;

function TValueHelper.IsUInt64: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(UInt64);
end;

function TValueHelper.IsVariant: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Variant);
end;

function TValueHelper.IsWord: Boolean;
begin
  Result := TypeInfo = System.TypeInfo(Word);
end;

{ TRttiPropertyHelper }

function TRttiPropertyHelper.GetAtribute<T>: T;
var
  Attribute: TCustomAttribute;
begin
  Result := nil;
  for Attribute in Self.GetAttributes do
  begin
    if Attribute is T then
    begin
      Result := Attribute as T;
      Break;
    end;
  end;
end;

end.

