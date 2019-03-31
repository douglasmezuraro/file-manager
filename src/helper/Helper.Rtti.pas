unit Helper.Rtti;

interface

uses
  System.Rtti,
  System.SysUtils,
  Util.Methods;

type
  TRttiPropertyHelper = class Helper for TRttiProperty
  public
    function GetAtribute<T: class>: T;
  end;

  TValueHelper = record Helper for TValue
  public
    function Assign(const Value: TValue): TValue;

    { As-Functions }
    function AsDate: TDate;
    function AsDateTime: TDateTime;
    function AsTime: TTime;

    { Is-Functions }
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
  end;

implementation

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

{ TValueHelper }

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
var
  Text: string;
begin
  Text := Value.ToString;

  if Self.IsBoolean then
  begin
    Self := Text.ToBoolean;
    Exit(Self);
  end;

  if Self.IsByte then
  begin
    Self := StrToIntDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsCardinal then
  begin
    Self := StrToUIntDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsCurrency then
  begin
    Self := StrToCurrDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsDate then
  begin
    Self := StrToDateDef(Text, TUtils.Constants.DateNull);
    Exit(Self);
  end;

  if Self.IsDateTime then
  begin
    Self := StrToDateTimeDef(Text, TUtils.Constants.DateNull);
    Exit(Self);
  end;

  if Self.IsDouble then
  begin
    Self := StrToFloatDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsInt64 then
  begin
    Self := StrToInt64Def(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsInteger then
  begin
    Self := StrToIntDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsPointer then
  begin
    Self := &Text;
    Exit(Self);
  end;

  if Self.IsShortInt then
  begin
    Self := StrToIntDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsSingle then
  begin
    Self := StrToFloatDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsSmallInt then
  begin
    Self := StrToIntDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsString then
  begin
    Self := Text;
    Exit(Self);
  end;

  if Self.IsTime then
  begin
    Self := StrToTimeDef(Text, TUtils.Constants.DateNull);
    Exit(Self);
  end;

  if Self.IsUInt64 then
  begin
    Self := StrToUInt64Def(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  if Self.IsVariant then
  begin
    Self := Text;
    Exit(Self);
  end;

  if Self.IsWord then
  begin
    Self := StrToUIntDef(Text, TUtils.Constants.Zero);
    Exit(Self);
  end;

  Result := Self;
end;

end.

