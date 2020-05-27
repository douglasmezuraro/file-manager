unit Validation.Attribute.Integer;

interface

uses
  Validation.Attribute.Base, System.SysUtils;

type
  /// <summary>
  ///  Attribute that validates a integer property.
  /// </summary>
  TIntegerAttribute = class sealed(TValidationBaseAttribute)
  private
    FMinValue: Integer;
    FMaxValue: Integer;
  public
    /// <summary>
    ///  constructor of class.
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
    constructor Create(const ANullable: Boolean; const AMinValue: Integer); overload;

    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ANullable">
    /// </param>
    /// <param name="AMinValue">
    /// </param>
    /// <param name="AMaxValue">
    /// </param>
    constructor Create(const ANullable: Boolean; const AMinValue, AMaxValue: Integer); overload;

    /// <summary>
    ///  Defines the min value that property can have.
    /// </summary>
    /// <value>
    ///  Integer
    /// </value>
    property MinValue: Integer read FMinValue;

    /// <summary>
    ///  Defines the max value that property can have.
    /// </summary>
    /// <value>
    ///  Integer
    /// </value>
    property MaxValue: Integer read FMaxValue;
  end;

implementation

constructor TIntegerAttribute.Create;
begin
  Create(True);
end;

constructor TIntegerAttribute.Create(const ANullable: Boolean);
begin
  Create(ANullable, Integer.MinValue);
end;

constructor TIntegerAttribute.Create(const ANullable: Boolean; const AMinValue: Integer);
begin
  Create(ANullable, AMinValue, Integer.MaxValue);
end;

constructor TIntegerAttribute.Create(const ANullable: Boolean; const AMinValue, AMaxValue: Integer);
begin
  inherited Create(ANullable);
  FMinValue := AMinValue;
  FMaxValue := AMaxValue;
end;

end.

