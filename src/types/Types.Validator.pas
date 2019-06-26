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
    class var FError: string;
    class function ValidateNull(const Attribute: ValidationAttribute; const Value: TValue): Boolean;
    class function ValidateDate(const Attribute: DateAttribute; const Value: TValue): Boolean;
    class function ValidateDateTime(const Attribute: DateTimeAttribute; const Value: TValue): Boolean;
    class function ValidateFloat(const Attribute: FloatAttribute; const Value: TValue): Boolean;
    class function ValidateInteger(const Attribute: IntegerAttribute; const Value: TValue): Boolean;
    class function ValidateRegEx(const Attribute: RegExAttribute; const Value: TValue): Boolean;
    class function ValidateString(const Attribute: StringAttribute; const Value: TValue): Boolean;
    class function ValidateTime(const Attribute: TimeAttribute; const Value: TValue): Boolean;
  public
    class function Validate(const Prop: TRttiProperty; const Value: TValue): Boolean;
    class property Error: string read FError;
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

  if not ValidateNull(Attribute, Value) then
  begin
    FError := 'O valor não pode ser vazio.';
    Exit(False);
  end;

  if Attribute is DateAttribute then
  begin
    FError := 'A data não é válida.';
    Exit(ValidateDate((Attribute as DateAttribute), Value));
  end;

  if Attribute is DateTimeAttribute then
  begin
    FError := 'A data e o horário não é válida.';
    Exit(ValidateDateTime((Attribute as DateTimeAttribute), Value));
  end;

  if Attribute is FloatAttribute then
  begin
    FError := 'O valor não é um ponto flutuante válido.';
    Exit(ValidateFloat((Attribute as FloatAttribute), Value));
  end;

  if Attribute is IntegerAttribute then
  begin
    FError := 'O valor não é um inteiro válido.';
    Exit(ValidateInteger((Attribute as IntegerAttribute), Value));
  end;

  if Attribute is RegExAttribute then
  begin
    FError := 'O valor não atende a expressão regular.';
    Exit(ValidateRegEx((Attribute as RegExAttribute), Value));
  end;

  if Attribute is StringAttribute then
  begin
    FError := 'O valor não atende os requisitos.';
    Exit(ValidateString((Attribute as StringAttribute), Value));
  end;

  if Attribute is TimeAttribute then
  begin
    FError := 'O horário não é válido.';
    Exit(ValidateTime((Attribute as TimeAttribute), Value));
  end;
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

class function TValidator.ValidateNull(const Attribute: ValidationAttribute; const Value: TValue): Boolean;
begin
  Result := True;
  if not Attribute.Nullable then
    Result := not Value.ToString.IsEmpty;
end;

class function TValidator.ValidateRegEx(const Attribute: RegExAttribute; const Value: TValue): Boolean;
begin
  Result := TRegEx.Create(Attribute.Pattern, [roIgnoreCase, roNotEmpty]).IsMatch(Value.ToString);
end;

class function TValidator.ValidateString(const Attribute: StringAttribute; const Value: TValue): Boolean;
var
  LValue: string;
begin
  LValue := Value.ToString;
  Result := (LValue.Length >= Attribute.MinLength) and (LValue.Length <= Attribute.MaxLength);
end;

class function TValidator.ValidateTime(const Attribute: TimeAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := Value.IsValidTime(LValue);
end;

end.

