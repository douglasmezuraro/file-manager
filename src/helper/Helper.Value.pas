unit Helper.Value;

interface

uses
  System.Rtti;

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
  end;

implementation

{ TValueHelper }

function TValueHelper.AsByte: Byte;
begin
  Result := AsType<Byte>;
end;

function TValueHelper.AsCardinal: Cardinal;
begin
  Result := AsType<Cardinal>;
end;

function TValueHelper.AsDate: TDate;
begin
  Result := AsType<TDate>;
end;

function TValueHelper.AsDateTime: TDateTime;
begin
  Result := AsType<TDateTime>;
end;

function TValueHelper.AsDouble: Double;
begin
  Result := AsType<Double>;
end;

function TValueHelper.AsPointer: Pointer;
begin
  Result := AsType<Pointer>;
end;

function TValueHelper.AsShortInt: ShortInt;
begin
  Result := AsType<ShortInt>;
end;

function TValueHelper.AsSingle: Single;
begin
  Result := AsType<Single>;
end;

function TValueHelper.AsSmallInt: SmallInt;
begin
  Result := AsType<SmallInt>;
end;

function TValueHelper.AsTime: TTime;
begin
  Result := AsType<TTime>;
end;

function TValueHelper.AsWord: Word;
begin
  Result := AsType<Word>;
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

end.

