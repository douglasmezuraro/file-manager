unit Helper.Rtti.Value;

interface

uses
  System.Classes, System.Rtti, System.SysUtils, System.Variants;

type
  /// <summary>
  ///  Class helper for class <c>TValue<c>.
  /// </summary>
  TValueHelper = record Helper for TValue
  public
    /// <summary>
    ///  Assign the value passed as parametter.
    /// </summary>
    /// <param name="Value">
    /// </param>
    /// <returns>
    ///  TValue - Returns itself.
    /// </returns>
    function Assign(const Value: TValue): TValue;

    /// <summary>
    ///  Returns whether the instance has an assigned value.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function Assigned: Boolean;

    /// <summary>
    ///  Returns the value as a <c>TDate<c>.
    /// </summary>
    /// <returns>
    ///  TDate
    /// </returns>
    function AsDate: TDate;

    /// <summary>
    ///  Returns the value as a <c>TDateTime<c>.
    /// </summary>
    /// <returns>
    ///  TDateTime
    /// </returns>
    function AsDateTime: TDateTime;

    /// <summary>
    ///  Returns the value as a <c>TTime<c>.
    /// </summary>
    /// <returns>
    ///  TTime
    /// </returns>
    function AsTime: TTime;

    /// <summary>
    ///  Returns whether the value is a <c>Boolean<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsBoolean: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Byte<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsByte: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Cardinal<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsCardinal: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Currency<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsCurrency: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>TDate<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsDate: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>TDateTime<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsDateTime: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Double<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsDouble: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Int64<c>
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsInt64: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Integer<c>
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsInteger: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Pointer<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsPointer: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>ShortInt<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsShortInt: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Single<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsSingle: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>SmallInt<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsSmallInt: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>TTime<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsTime: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>UInt64<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsUInt64: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Variant<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsVariant: Boolean;

    /// <summary>
    ///  Returns whether the value is a <c>Word<c>.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsWord: Boolean;

    /// <summary>
    ///  Returns whether the value is a float-pointer.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsFloat: Boolean;

    /// <summary>
    ///  Returns whether the value is a string.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsString: Boolean;

    /// <summary>
    ///  Returns whether the value is a numeric.
    /// </summary>
    /// <returns>
    ///  Boolean
    /// </returns>
    function IsNumeric: Boolean;
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
  if IsBoolean then
  begin
    Self := StrToBoolDef(Value.ToString, False);
    Exit(Self);
  end;

  if IsByte then
  begin
    Self := StrToIntDef(Value.ToString, Byte.MaxValue);
    Exit(Self);
  end;

  if IsCardinal then
  begin
    Self := StrToUIntDef(Value.ToString, Cardinal.MaxValue);
    Exit(Self);
  end;

  if IsCurrency then
  begin
    Self := StrToCurrDef(Value.ToString, Extended.MaxValue);
    Exit(Self);
  end;

  if IsDate then
  begin
    Self := StrToDateDef(Value.ToString, MaxDateTime);
    Exit(Self);
  end;

  if IsDateTime then
  begin
    Self := StrToDateTimeDef(Value.ToString, MaxDateTime);
    Exit(Self);
  end;

  if IsDouble then
  begin
    Self := StrToFloatDef(Value.ToString, Double.MaxValue);
    Exit(Self);
  end;

  if IsInt64 then
  begin
    Self := StrToInt64Def(Value.ToString, Int64.MaxValue);
    Exit(Self);
  end;

  if IsInteger then
  begin
    Self := StrToIntDef(Value.ToString, Integer.MaxValue);
    Exit(Self);
  end;

  if IsPointer then
  begin
    Self := &Value;
    Exit(Self);
  end;

  if IsShortInt then
  begin
    Self := StrToIntDef(Value.ToString, ShortInt.MaxValue);
    Exit(Self);
  end;

  if IsSingle then
  begin
    Self := StrToFloatDef(Value.ToString, Single.MaxValue);
    Exit(Self);
  end;

  if IsSmallInt then
  begin
    Self := StrToIntDef(Value.ToString, SmallInt.MaxValue);
    Exit(Self);
  end;

  if IsString then
  begin
    Self := Value.ToString;
    Exit(Self);
  end;

  if IsTime then
  begin
    Self := StrToTimeDef(Value.ToString, MaxDateTime);
    Exit(Self);
  end;

  if IsUInt64 then
  begin
    Self := StrToUInt64Def(Value.ToString, UInt64.MaxValue);
    Exit(Self);
  end;

  if IsVariant then
  begin
    Self := Value.ToString;
    Exit(Self);
  end;

  if IsWord then
  begin
    Self := StrToUIntDef(Value.ToString, Word.MaxValue);
    Exit(Self);
  end;

  if IsObject then
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

end.

