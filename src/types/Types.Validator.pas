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
    class function ValidateDate(const Att: DateAttribute; const Value: TValue): Boolean;
    class function ValidateDateTime(const Att: DateTimeAttribute; const Value: TValue): Boolean;
    class function ValidateFloat(const Att: FloatAttribute; const Value: TValue): Boolean;
    class function ValidateInteger(const Att: IntegerAttribute; const Value: TValue): Boolean;
    class function ValidateRegEx(const Att: RegExAttribute; const Value: TValue): Boolean;
    class function ValidateString(const Att: StringAttribute; const Value: TValue): Boolean;
    class function ValidateTime(const Att: TimeAttribute; const Value: TValue): Boolean;
  public
    class function Validate(const Prop: TRttiProperty; const Value: TValue): Boolean;
  end;

implementation

{ TValidator }

class function TValidator.Validate(const Prop: TRttiProperty; const Value: TValue): Boolean;
var
  Att: ValidationAttribute;
begin
  Result := True;

  Att := Prop.GetAttribute<ValidationAttribute>();

  if not Assigned(Att) then
    Exit;

  if Att is DateAttribute then
    Exit(ValidateDate((Att as DateAttribute), Value));

  if Att is DateTimeAttribute then
    Exit(ValidateDateTime((Att as DateTimeAttribute), Value));

  if Att is FloatAttribute then
    Exit(ValidateFloat((Att as FloatAttribute), Value));

  if Att is IntegerAttribute then
    Exit(ValidateInteger((Att as IntegerAttribute), Value));

  if Att is RegExAttribute then
    Exit(ValidateRegEx((Att as RegExAttribute), Value));

  if Att is StringAttribute then
    Exit(ValidateString((Att as StringAttribute), Value));

  if Att is TimeAttribute then
    Exit(ValidateTime((Att as TimeAttribute), Value));
end;

class function TValidator.ValidateDate(const Att: DateAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := Value.IsValidDate(LValue);
end;

class function TValidator.ValidateDateTime(const Att: DateTimeAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := Value.IsValidDateTime(LValue);
end;

class function TValidator.ValidateFloat(const Att: FloatAttribute; const Value: TValue): Boolean;
var
  LValue: Double;
begin
  Result := False;

  if not Value.IsValidFloat(LValue) then
    Exit;

  Result := (LValue >= Att.MinValue) and (LValue <= Att.MaxValue);
end;

class function TValidator.ValidateInteger(const Att: IntegerAttribute; const Value: TValue): Boolean;
var
  LValue: Integer;
begin
  Result := False;

  if not Value.IsValidInteger(LValue) then
    Exit;

  Result := (LValue >= Att.MinValue) and (LValue <= Att.MaxValue);
end;

class function TValidator.ValidateRegEx(const Att: RegExAttribute; const Value: TValue): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegEx.Create(Att.Pattern, [roIgnoreCase, roNotEmpty]);
  Result := RegEx.IsMatch(Value.ToString);
end;

class function TValidator.ValidateString(const Att: StringAttribute; const Value: TValue): Boolean;
var
  LValue: string;
begin
  Result := False;

  LValue := Value.ToString;
  if (not Att.Nullable) and LValue.IsEmpty then
    Exit;

  Result := (LValue.Length >= Att.MinLength) and (LValue.Length <= Att.MaxLength);
end;

class function TValidator.ValidateTime(const Att: TimeAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := Value.IsValidTime(LValue);
end;

end.
