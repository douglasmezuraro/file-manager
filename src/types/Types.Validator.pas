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
    class var FMessage: string;
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
    class property Message: string read FMessage;
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
    Exit(False);

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
  Result := True;
  if not Value.IsValidDate(LValue) then
  begin
    FMessage := Format('O valor "%s" não é um "TDate" válido.', [Value.ToString]);
    Result := False;
  end;
end;

class function TValidator.ValidateDateTime(const Attribute: DateTimeAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := True;
  if not Value.IsValidDateTime(LValue) then
  begin
    FMessage := Format('O valor "%s" não é um "TDateTime" válido.', [Value.ToString]);
    Result := False;
  end;
end;

class function TValidator.ValidateFloat(const Attribute: FloatAttribute; const Value: TValue): Boolean;
var
  LValue: Double;
begin
  Result := False;

  if not Value.IsValidFloat(LValue) then
  begin
    FMessage := Format('O valor "%s" não é um ponto-flutuante válido.', [Value.ToString]);
    Exit;
  end;

  if LValue < Attribute.MinValue then
  begin
    FMessage := Format('O valor atual "%f" é menor que o valor mínimo permitido "%f".', [LValue, Attribute.MinValue]);
    Exit;
  end;

  if LValue > Attribute.MaxValue then
  begin
    FMessage := Format('O valor atual "%f" é maior que o valor máximo permitido "%f".', [LValue, Attribute.MaxValue]);
    Exit;
  end;

  Result := True;
end;

class function TValidator.ValidateInteger(const Attribute: IntegerAttribute; const Value: TValue): Boolean;
var
  LValue: Integer;
begin
  Result := False;

  if not Value.IsValidInteger(LValue) then
  begin
    FMessage := Format('O valor "%s" não é um inteiro válido.', [Value.ToString]);
    Exit;
  end;

  if LValue < Attribute.MinValue then
  begin
    FMessage := Format('O valor atual "%d" é menor que o valor mínimo permitido "%d".', [LValue, Attribute.MinValue]);
    Exit;
  end;

  if LValue > Attribute.MaxValue then
  begin
    FMessage := Format('O valor atual "%d" é maior que o valor máximo permitido "%d".', [LValue, Attribute.MaxValue]);
    Exit;
  end;

  Result := True;
end;

class function TValidator.ValidateNull(const Attribute: ValidationAttribute; const Value: TValue): Boolean;
begin
  Result := True;
  if (not Attribute.Nullable) and Value.ToString.IsEmpty then
  begin
    FMessage := 'O valor não pode ser vazio.';
    Result := False;
  end;
end;

class function TValidator.ValidateRegEx(const Attribute: RegExAttribute; const Value: TValue): Boolean;
var
  LValue: string;
begin
  Result := True;
  LValue := Value.ToString;

  if not TRegEx.Create(Attribute.Pattern, [roIgnoreCase, roNotEmpty]).IsMatch(LValue) then
  begin
    FMessage := Format('O valor atual "%s" não atende a expressão regular "%s".', [LValue, Attribute.Pattern]);
    Result := False;
  end;
end;

class function TValidator.ValidateString(const Attribute: StringAttribute; const Value: TValue): Boolean;
var
  LValue: string;
begin
  Result := False;
  LValue := Value.ToString;

  if LValue.Length < Attribute.MinLength then
  begin
    FMessage := Format('O tamanho do valor atual "%d" é menor que o tamanho mínimo permitido "%d".', [LValue.Length, Attribute.MinLength]);
    Exit;
  end;

  if LValue.Length > Attribute.MaxLength then
  begin
    FMessage := Format('O tamanho do valor atual "%d" é maior que o tamanho máximo permitido "%d".', [LValue.Length, Attribute.MaxLength]);
    Exit;
  end;

  Result := True;
end;

class function TValidator.ValidateTime(const Attribute: TimeAttribute; const Value: TValue): Boolean;
var
  LValue: TDateTime;
begin
  Result := True;
  if not Value.IsValidTime(LValue) then
  begin
    FMessage := Format('O valor "%s" não é um "TTime" válido.', [Value.ToString]);
    Result := False;
  end;
end;

end.

