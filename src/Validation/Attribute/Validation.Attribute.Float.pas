unit Validation.Attribute.Float;

interface

uses
  Validation.Attribute.Base, System.SysUtils;

type
  /// <summary>
  ///  Attribute that validates a float-point property.
  /// </summary>
  TFloatAttribute = class sealed(TValidationBaseAttribute)
  private
    FMinValue: Double;
    FMaxValue: Double;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    constructor Create; overload;

    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ANullable">
    /// </param>
    constructor Create(const ANullable: Boolean); overload;

    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ANullable">
    /// </param>
    /// <param name="AMinValue">
    /// </param>
    constructor Create(const ANullable: Boolean; const AMinValue: Double); overload;

    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ANullable">
    /// </param>
    /// <param name="AMinValue">
    /// </param>
    /// <param name="AMaxValue">
    /// </param>
    constructor Create(const ANullable: Boolean; const AMinValue, AMaxValue: Double); overload;

    /// <summary>
    ///  Defines the min value that property can have.
    /// </summary>
    /// <value>
    ///  Double
    /// </value>
    property MinValue: Double read FMinValue;

    /// <summary>
    ///  Defined the max value that property can have.
    /// </summary>
    /// <value>
    ///  Double
    /// </value>
    property MaxValue: Double read FMaxValue;
  end;

implementation

constructor TFloatAttribute.Create;
begin
  Create(True);
end;

constructor TFloatAttribute.Create(const ANullable: Boolean);
begin
  Create(ANullable, Double.MinValue);
end;

constructor TFloatAttribute.Create(const ANullable: Boolean; const AMinValue: Double);
begin
  Create(ANullable, AMinValue, Double.MaxValue);
end;

constructor TFloatAttribute.Create(const ANullable: Boolean; const AMinValue, AMaxValue: Double);
begin
  inherited Create(ANullable);
  FMinValue := AMinValue;
  FMaxValue := AMaxValue;
end;

end.

