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

    function Equals(const Value: TValue): Boolean;
    function Assign(const Value: TValue): TValue;
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

function TValueHelper.Assign(const Value: TValue): TValue;
var
  sValue: string;
begin
  sValue := Value.ToString;

  if Self.IsBoolean then
    Self := sValue.ToBoolean
  else if Self.IsByte then
    Self := StrToIntDef(sValue, 0)
  else if Self.IsCardinal then
    Self := StrToUIntDef(sValue, 0)
  else if Self.IsCurrency then
    Self := StrToCurrDef(sValue, 0)
  else if Self.IsDate then
    Self := StrToDateDef(sValue, 0)
  else if Self.IsDateTime then
    Self := strToDateTimeDef(sValue, 0)
  else if Self.IsDouble then
    Self := StrToFloatDef(sValue, 0)
  else if Self.IsInt64 then
    Self := StrToInt64Def(sValue, 0)
  else if Self.IsInteger then
    Self := StrToIntDef(sValue, 0)
  else if Self.IsPointer then
    Self := &sValue
  else if Self.IsShortInt then
    Self := StrToIntDef(sValue, 0)
  else if Self.IsSingle then
    Self := StrToFloatDef(sValue, 0)
  else if Self.IsSmallInt then
    Self := StrToIntDef(sValue, 0)
  else if Self.IsString then
    Self := sValue
  else if Self.IsTime then
    Self := StrToTimeDef(sValue, 0)
  else if Self.IsUInt64 then
    Self := StrToUInt64Def(sValue, 0)
  else if Self.IsVariant then
    Self := sValue
  else if Self.IsWord then
    Self := StrToUIntDef(sValue, 0);

  Result := Self;
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

