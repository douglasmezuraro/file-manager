unit Validation.Validator;

interface

uses
  Helper.Rtti.RttiProperty, Helper.Rtti.Value, System.Generics.Collections, System.SysUtils,
  System.Rtti, System.RegularExpressions, Types.Consts, Validation.Attribute;

type
  /// <summary>
  ///  Validation result type.
  /// </summary>
  /// <remarks>
  ///  TPair<Result, Error message>
  /// </remarks>
  TValidationResult = TPair<Boolean, string>;

  /// <summary>
  ///  Validator class of values.
  /// </summary>
  TValidator = class sealed
  strict private
    FAttribute: TValidationBaseAttribute;
    FValue: TValue;
  private
    function ValidateNull: TValidationResult;
    function ValidateDate: TValidationResult;
    function ValidateDateTime: TValidationResult;
    function ValidateFloat: TValidationResult;
    function ValidateInteger: TValidationResult;
    function ValidateRegEx: TValidationResult;
    function ValidateText: TValidationResult;
    function ValidateTime: TValidationResult;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="AProp">
    /// </param>
    /// <param name="AValue">
    /// </param>
    constructor Create(const AProp: TRttiProperty; const AValue: TValue);

    /// <summary>
    ///  Validates the value based on the attributes of the property.
    /// </summary>
    /// <returns>
    ///  TValidationResult = TPair<Result, Error>
    /// </returns>
    function Validate: TValidationResult;
  end;

implementation

constructor TValidator.Create(const AProp: TRttiProperty; const AValue: TValue);
begin
  FAttribute := AProp.GetAttribute<TValidationBaseAttribute>;
  FValue := AValue;
end;

function TValidator.Validate: TValidationResult;
begin
  if not Assigned(FAttribute) then
    Exit(TValidationResult.Create(True, string.Empty));

  Result := ValidateNull;

  if not Result.Key then
    Exit;

  if FAttribute is TDateAttribute then
    Exit(ValidateDate);

  if FAttribute is TDateTimeAttribute then
    Exit(ValidateDateTime);

  if FAttribute is TFloatAttribute then
    Exit(ValidateFloat);

  if FAttribute is TIntegerAttribute then
    Exit(ValidateInteger);

  if FAttribute is TRegExAttribute then
    Exit(ValidateRegEx);

  if FAttribute is TTextAttribute then
    Exit(ValidateText);

  if FAttribute is TTimeAttribute then
    Exit(ValidateTime);
end;

function TValidator.ValidateDate: TValidationResult;
var
  LValue: TDateTime;
begin
  if not System.SysUtils.TryStrToDate(FValue.ToString, LValue) then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsNotAValidValue, [FValue.ToString, 'TDate'])));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

function TValidator.ValidateDateTime: TValidationResult;
var
  LValue: TDateTime;
begin
  if not System.SysUtils.TryStrToDateTime(FValue.ToString, LValue) then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsNotAValidValue, [FValue.ToString, 'TDateTime'])));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

function TValidator.ValidateFloat: TValidationResult;
var
  LValue: Double;
begin
  if not System.SysUtils.TryStrToFloat(FValue.ToString, LValue) then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsNotAValidValue, [FValue.ToString, 'Double'])));
  end;

  if LValue < (FAttribute as TFloatAttribute).MinValue then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsLessThenMinimumAllowedFloat, [LValue, (FAttribute as TFloatAttribute).MinValue])));
  end;

  if LValue > (FAttribute as TFloatAttribute).MaxValue then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsGreaterThenMaximumAllowedFloat, [LValue, (FAttribute as TFloatAttribute).MaxValue])));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

function TValidator.ValidateInteger: TValidationResult;
var
  LValue: Integer;
begin
  if not System.SysUtils.TryStrToInt(FValue.ToString, LValue) then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsNotAValidValue, [FValue.ToString, 'Integer'])));
  end;

  if LValue < (FAttribute as TIntegerAttribute).MinValue then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsLessThenMinimumAllowedInteger, [LValue, (FAttribute as TIntegerAttribute).MinValue])));
  end;

  if LValue > (FAttribute as TIntegerAttribute).MaxValue then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsGreaterLessThenMaximumAllowedInteger, [LValue, (FAttribute as TIntegerAttribute).MaxValue])));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

function TValidator.ValidateNull: TValidationResult;
begin
  if (not FAttribute.Nullable) and FValue.ToString.IsEmpty then
  begin
    Exit(TValidationResult.Create(False, SValueCannotBeEmpty));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

function TValidator.ValidateRegEx: TValidationResult;
var
  LValue: string;
begin
  LValue := FValue.ToString;

  if not TRegEx.Create((FAttribute as TRegExAttribute).Pattern, [roIgnoreCase, roNotEmpty]).IsMatch(LValue) then
  begin
    Exit(TValidationResult.Create(False, SValueDoesNotMatchRegEx));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

function TValidator.ValidateText: TValidationResult;
var
  LValue: string;
begin
  LValue := FValue.ToString;

  if LValue.Length < (FAttribute as TTextAttribute).MinLength then
  begin
    Exit(TValidationResult.Create(False, Format(SLengthOfValueIsLessThanMinimumAllowed, [LValue.Length, (FAttribute as TTextAttribute).MinLength])));
  end;

  if LValue.Length > (FAttribute as TTextAttribute).MaxLength then
  begin
    Exit(TValidationResult.Create(False, Format(SLengthOfValueIsGreaterThanMaximumAllowed, [LValue.Length, (FAttribute as TTextAttribute).MaxLength])));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

function TValidator.ValidateTime: TValidationResult;
var
  LValue: TDateTime;
begin
  if not System.SysUtils.TryStrToTime(FValue.ToString, LValue) then
  begin
    Exit(TValidationResult.Create(False, Format(SValueIsNotAValidValue, [FValue.ToString, 'TTime'])));
  end;

  Result := TValidationResult.Create(True, string.Empty);
end;

end.

