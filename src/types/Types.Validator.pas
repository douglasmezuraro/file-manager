unit Types.Validator;

interface

uses
  Attribute.Validation, Attribute.Validation.Date, Attribute.Validation.DateTime, Attribute.Validation.Time,
  Attribute.Validation.Float, Attribute.Validation.Integer, Attribute.Validation.RegEx, Attribute.Validation.Text,
  Helper.Rtti.RttiProperty, Helper.Rtti.Value, System.SysUtils, System.Rtti, System.RegularExpressions,
  Types.ResourceStrings;

type
  TValidator = class sealed
  strict private
    FMessage: string;
    FAttribute: ValidationAttribute;
    FValue: TValue;
  private
    function ValidateNull: Boolean;
    function ValidateDate: Boolean;
    function ValidateDateTime: Boolean;
    function ValidateFloat: Boolean;
    function ValidateInteger: Boolean;
    function ValidateRegEx: Boolean;
    function ValidateString: Boolean;
    function ValidateTime: Boolean;
  public
    constructor Create(const Prop: TRttiProperty; const Value: TValue);
    function Validate: Boolean;
    property Message: string read FMessage;
  end;

implementation

constructor TValidator.Create(const Prop: TRttiProperty; const Value: TValue);
begin
  FMessage := string.Empty;
  FAttribute := Prop.GetAttribute<ValidationAttribute>();
  FValue := Value;
end;

function TValidator.Validate: Boolean;
begin
  Result := True;

  if not Assigned(FAttribute) then
    Exit;

  if not ValidateNull then
    Exit(False);

  if FAttribute is DateAttribute then
    Exit(ValidateDate);

  if FAttribute is DateTimeAttribute then
    Exit(ValidateDateTime);

  if FAttribute is FloatAttribute then
    Exit(ValidateFloat);

  if FAttribute is IntegerAttribute then
    Exit(ValidateInteger);

  if FAttribute is RegExAttribute then
    Exit(ValidateRegEx);

  if FAttribute is TextAttribute then
    Exit(ValidateString);

  if FAttribute is TimeAttribute then
    Exit(ValidateTime);
end;

function TValidator.ValidateDate: Boolean;
var
  LValue: TDateTime;
begin
  Result := True;
  if not FValue.IsValidDate(LValue) then
  begin
    FMessage := Format(SValueIsNotAValid, [FValue.ToString, 'TDate']);
    Result := False;
  end;
end;

function TValidator.ValidateDateTime: Boolean;
var
  LValue: TDateTime;
begin
  Result := True;
  if not FValue.IsValidDateTime(LValue) then
  begin
    FMessage := Format(SValueIsNotAValid, [FValue.ToString, 'TDateTime']);
    Result := False;
  end;
end;

function TValidator.ValidateFloat: Boolean;
var
  LValue: Double;
begin
  Result := False;

  if not FValue.IsValidFloat(LValue) then
  begin
    FMessage := Format(SValueIsNotAValid, [FValue.ToString, 'Double']);
    Exit;
  end;

  if LValue < (FAttribute as FloatAttribute).MinValue then
  begin
    FMessage := Format(SValueIsLessThenMinimumAllowedFloat, [LValue, (FAttribute as FloatAttribute).MinValue]);
    Exit;
  end;

  if LValue > (FAttribute as FloatAttribute).MaxValue then
  begin
    FMessage := Format(SValueIsGreaterLessThenMaximumAllowedFloat, [LValue, (FAttribute as FloatAttribute).MaxValue]);
    Exit;
  end;

  Result := True;
end;

function TValidator.ValidateInteger: Boolean;
var
  LValue: Integer;
begin
  Result := False;

  if not FValue.IsValidInteger(LValue) then
  begin
    FMessage := Format(SValueIsNotAValid, [FValue.ToString, 'Integer']);
    Exit;
  end;

  if LValue < (FAttribute as IntegerAttribute).MinValue then
  begin
    FMessage := Format(SValueIsLessThenMinimumAllowedInteger, [LValue, (FAttribute as IntegerAttribute).MinValue]);
    Exit;
  end;

  if LValue > (FAttribute as IntegerAttribute).MaxValue then
  begin
    FMessage := Format(SValueIsGreaterLessThenMaximumAllowedInteger, [LValue, (FAttribute as IntegerAttribute).MaxValue]);
    Exit;
  end;

  Result := True;
end;

function TValidator.ValidateNull: Boolean;
begin
  Result := True;
  if (not FAttribute.Nullable) and FValue.ToString.IsEmpty then
  begin
    FMessage := SValueCannotBeEmpty;
    Result := False;
  end;
end;

function TValidator.ValidateRegEx: Boolean;
var
  LValue: string;
begin
  Result := True;
  LValue := FValue.ToString;

  if not TRegEx.Create((FAttribute as RegExAttribute).Pattern, [roIgnoreCase, roNotEmpty]).IsMatch(LValue) then
  begin
    FMessage := SValueDoesNotMatchRegEx;
    Result := False;
  end;
end;

function TValidator.ValidateString: Boolean;
var
  LValue: string;
begin
  Result := False;
  LValue := FValue.ToString;

  if LValue.Length < (FAttribute as TextAttribute).MinLength then
  begin
    FMessage := Format(SLengthOfValueIsLessThanMinimumAllowed, [LValue.Length, (FAttribute as TextAttribute).MinLength]);
    Exit;
  end;

  if LValue.Length > (FAttribute as TextAttribute).MaxLength then
  begin
    FMessage := Format(SLengthOfValueIsGreaterThanMaximumAllowed, [LValue.Length, (FAttribute as TextAttribute).MaxLength]);
    Exit;
  end;

  Result := True;
end;

function TValidator.ValidateTime: Boolean;
var
  LValue: TDateTime;
begin
  Result := True;
  if not FValue.IsValidTime(LValue) then
  begin
    FMessage := Format(SValueIsNotAValid, [FValue.ToString, 'TTime']);
    Result := False;
  end;
end;

end.
