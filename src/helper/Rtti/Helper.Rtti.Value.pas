unit Helper.Rtti.Value;

interface

uses
  System.Classes, System.Rtti, System.SysUtils, System.Variants;

type
  TValueHelper = record Helper for TValue
  public
    {$REGION 'Assign-Methods'}
    function Assign(const Value: TValue): TValue;
    function Assigned: Boolean;
    {$ENDREGION}

    {$REGION 'As-Methods'}
    function AsDate: TDate;
    function AsDateTime: TDateTime;
    function AsTime: TTime;
    {$ENDREGION}

    {$REGION 'Is-Methods'}
    function IsBoolean: Boolean;
    function IsByte: Boolean;
    function IsCardinal: Boolean;
    function IsCurrency: Boolean;
    function IsDate: Boolean;
    function IsDateTime: Boolean;
    function IsDouble: Boolean;
    function IsInt64: Boolean;
    function IsInteger: Boolean;
    function IsPointer: Boolean;
    function IsShortInt: Boolean;
    function IsSingle: Boolean;
    function IsSmallInt: Boolean;
    function IsTime: Boolean;
    function IsUInt64: Boolean;
    function IsVariant: Boolean;
    function IsWord: Boolean;
    function IsFloat: Boolean;
    function IsString: Boolean;
    function IsNumeric: Boolean;
    {$ENDREGION}

    {$REGION 'Validation-Methods'}
    function IsValidInteger(out Value: Integer): Boolean;
    function IsValidFloat(out Value: Double): Boolean;
    function IsValidDate(out Value: TDateTime): Boolean;
    function IsValidTime(out Value: TDateTime): Boolean;
    function IsValidDateTime(out Value: TDateTime): Boolean;
    {$ENDREGION}
  end;

implementation

function TValueHelper.AsDate: TDate;
begin
  Result := AsType<TDate>;
end;

function TValueHelper.AsDateTime: TDateTime;
begin
  Result := AsType<TDateTime>;
end;

function TValueHelper.AsTime: TTime;
begin
  Result := AsType<TTime>;
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
const
  NumericTypeKind = [tkChar, tkEnumeration, tkFloat, tkInt64, tkInteger, tkWChar];
begin
  Result := Kind in NumericTypeKind;
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
const
  StringTypeKind = [tkChar, tkLString, tkString, tkUString, tkWChar, tkWString];
begin
  Result := Kind in StringTypeKind;
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
begin
  if Self.IsBoolean then
  begin
    Self := StrToBoolDef(Value.ToString, False);
    Exit(Self);
  end;

  if Self.IsByte then
  begin
    Self := StrToIntDef(Value.ToString, Byte.MaxValue);
    Exit(Self);
  end;

  if Self.IsCardinal then
  begin
    Self := StrToUIntDef(Value.ToString, Cardinal.MaxValue);
    Exit(Self);
  end;

  if Self.IsCurrency then
  begin
    Self := StrToCurrDef(Value.ToString, Extended.MaxValue);
    Exit(Self);
  end;

  if Self.IsDate then
  begin
    Self := StrToDateDef(Value.ToString, MaxDateTime);
    Exit(Self);
  end;

  if Self.IsDateTime then
  begin
    Self := StrToDateTimeDef(Value.ToString, MaxDateTime);
    Exit(Self);
  end;

  if Self.IsDouble then
  begin
    Self := StrToFloatDef(Value.ToString, Double.MaxValue);
    Exit(Self);
  end;

  if Self.IsInt64 then
  begin
    Self := StrToInt64Def(Value.ToString, Int64.MaxValue);
    Exit(Self);
  end;

  if Self.IsInteger then
  begin
    Self := StrToIntDef(Value.ToString, Integer.MaxValue);
    Exit(Self);
  end;

  if Self.IsPointer then
  begin
    Self := &Value;
    Exit(Self);
  end;

  if Self.IsShortInt then
  begin
    Self := StrToIntDef(Value.ToString, ShortInt.MaxValue);
    Exit(Self);
  end;

  if Self.IsSingle then
  begin
    Self := StrToFloatDef(Value.ToString, Single.MaxValue);
    Exit(Self);
  end;

  if Self.IsSmallInt then
  begin
    Self := StrToIntDef(Value.ToString, SmallInt.MaxValue);
    Exit(Self);
  end;

  if Self.IsString then
  begin
    Self := Value.ToString;
    Exit(Self);
  end;

  if Self.IsTime then
  begin
    Self := StrToTimeDef(Value.ToString, MaxDateTime);
    Exit(Self);
  end;

  if Self.IsUInt64 then
  begin
    Self := StrToUInt64Def(Value.ToString, UInt64.MaxValue);
    Exit(Self);
  end;

  if Self.IsVariant then
  begin
    Self := Value.ToString;
    Exit(Self);
  end;

  if Self.IsWord then
  begin
    Self := StrToUIntDef(Value.ToString, Word.MaxValue);
    Exit(Self);
  end;

  if Self.IsObject then
  begin
    (Self.AsObject as TPersistent).Assign(Value.AsObject as TPersistent);
    Exit(Self);
  end;

  Result := Self;
end;

function TValueHelper.Assigned: Boolean;
begin
  if Self.IsBoolean then
    Exit(True);

  if Self.IsByte then
    Exit(Self.AsType<Byte>() <> Byte.MaxValue);

  if Self.IsCardinal then
    Exit(Self.AsType<Cardinal>() <> Cardinal.MaxValue);

  if Self.IsCurrency then
    Exit(Self.AsType<Currency>() <> Extended.MaxValue);

  if Self.IsDate then
    Exit(Self.AsType<TDate>() <> MaxDateTime);

  if Self.IsDateTime then
    Exit(Self.AsType<TDateTime>() <> MaxDateTime);

  if Self.IsDouble then
    Exit(Self.AsType<Double>() <> Double.MaxValue);

  if Self.IsInt64 then
    Exit(Self.AsType<Int64>() <> Int64.MaxValue);

  if Self.IsInteger then
    Exit(Self.AsType<Integer>() <> Integer.MaxValue);

  if Self.IsPointer then
    Exit(Self.AsType<Pointer>() <> nil);

  if Self.IsShortInt then
    Exit(Self.AsType<ShortInt>() <> ShortInt.MaxValue);

  if Self.IsSingle then
    Exit(Self.AsType<Single>() <> Single.MaxValue);

  if Self.IsSmallInt then
    Exit(Self.AsType<SmallInt>() <> SmallInt.MaxValue);

  if Self.IsString then
    Exit(not Self.AsType<string>().IsEmpty);

  if Self.IsTime then
    Exit(Self.AsType<TTime>() <> System.SysUtils.MaxDateTime);

  if Self.IsUInt64 then
    Exit(Self.AsType<UInt64>() <> Single.MaxValue);

  if Self.IsVariant then
    Exit(not VarIsNull(Self.AsType<Variant>()));

  if Self.IsWord then
    Exit(Self.AsType<Word>() <> Word.MaxValue);

  if Self.IsObject then
    Exit(Self.AsObject <> nil);

  Result := not ToString.IsEmpty;
end;

function TValueHelper.IsValidDate(out Value: TDateTime): Boolean;
begin
  Result := System.SysUtils.TryStrToDate(ToString, Value);
end;

function TValueHelper.IsValidDateTime(out Value: TDateTime): Boolean;
begin
  Result := System.SysUtils.TryStrToDateTime(ToString, Value);
end;

function TValueHelper.IsValidFloat(out Value: Double): Boolean;
begin
  Result := System.SysUtils.TryStrToFloat(ToString, Value);
end;

function TValueHelper.IsValidInteger(out Value: Integer): Boolean;
begin
  Result := System.SysUtils.TryStrToInt(ToString, Value);
end;

function TValueHelper.IsValidTime(out Value: TDateTime): Boolean;
begin
  Result := System.SysUtils.TryStrToTime(ToString, Value);
end;

end.
