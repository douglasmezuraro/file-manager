unit Types.Validator;

interface

uses
  Attribute.Validation,
  Helper.Rtti,
  System.RegularExpressions,
  System.Rtti,
  System.SysUtils;

type
  TValidator = class
  private
    class function ValidateDate(const Attribute: DateAttribute; const Value: TValue): Boolean;
    class function ValidateDateTime(const Attribute: DateTimeAttribute; const Value: TValue): Boolean;
    class function ValidateFloat(const Attribute: FloatAttribute; const Value: TValue): Boolean;
    class function ValidateInteger(const Attribute: IntegerAttribute; const Value: TValue): Boolean;
    class function ValidateRegEx(const Attribute: RegExAttribute; const Value: TValue): Boolean;
    class function ValidateString(const Attribute: StringAttribute; const Value: TValue): Boolean;
    class function ValidateTime(const Attribute: TimeAttribute; const Value: TValue): Boolean;
  public
    class function Validate(const Prop: TRttiProperty; const Value: TValue): Boolean;
  end;

implementation

{ TValidator }

class function TValidator.Validate(const Prop: TRttiProperty; const Value: TValue): Boolean;
var
  Attribute: ValidationAttribute;
begin
  Result := True;

  Attribute := Prop.GetAttribute<ValidationAttribute>();

  if not Assigned(Attribute) then
    Exit;

  if Attribute is DateAttribute then
    Exit(ValidateDate((Attribute as DateAttribute), Value));

  if Attribute is DateTimeAttribute then
    Exit(ValidateDateTime((Attribute as DateTimeAttribute), Value));

  if Attribute is FloatAttribute then
    Exit(ValidateFloat((Attribute as FloatAttribute), Value));

  if Attribute is IntegerAttribute then
    Exit(ValidateInteger((Attribute as IntegerAttribute), Value));

  if Attribute is RegExAttribute then
    Exit(ValidateRegEx((Attribute as RegExAttribute), Value));

  if Attribute is StringAttribute then
    Exit(ValidateString((Attribute as StringAttribute), Value));

  if Attribute is TimeAttribute then
    Exit(ValidateTime((Attribute as TimeAttribute), Value));
end;

class function TValidator.ValidateDate(const Attribute: DateAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := Value.IsValidDate(LValue);
end;

class function TValidator.ValidateDateTime(const Attribute: DateTimeAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := Value.IsValidDateTime(LValue);
end;

class function TValidator.ValidateFloat(const Attribute: FloatAttribute; const Value: TValue): Boolean;
var
  LValue: Double;
begin
  Result := False;

  if not Value.IsValidFloat(LValue) then
    Exit;

  Result := (LValue >= Attribute.MinValue) and (LValue <= Attribute.MaxValue);
end;

class function TValidator.ValidateInteger(const Attribute: IntegerAttribute; const Value: TValue): Boolean;
var
  LValue: Integer;
begin
  Result := False;

  if not Value.IsValidInteger(LValue) then
    Exit;

  Result := (LValue >= Attribute.MinValue) and (LValue <= Attribute.MaxValue);
end;

class function TValidator.ValidateRegEx(const Attribute: RegExAttribute; const Value: TValue): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegEx.Create(Attribute.Pattern, [roIgnoreCase, roNotEmpty]);
  Result := RegEx.IsMatch(Value.ToString);
end;

class function TValidator.ValidateString(const Attribute: StringAttribute; const Value: TValue): Boolean;
var
  LValue: string;
begin
  Result := False;

  LValue := Value.ToString;
  if (not Attribute.Nullable) and LValue.IsEmpty then
    Exit;

  Result := (LValue.Length >= Attribute.MinLength) and (LValue.Length <= Attribute.MaxLength);
end;

class function TValidator.ValidateTime(const Attribute: TimeAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := Value.IsValidTime(LValue);
end;

end.

