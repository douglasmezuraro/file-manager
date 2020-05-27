unit Validation.Attribute.Text;

interface

uses
  Validation.Attribute.Base, System.SysUtils;

type
  /// <summary>
  ///  Attribute that validates a text property.
  /// </summary>
  TTextAttribute = class sealed(TValidationBaseAttribute)
  private
    FMaxLength: Byte;
    FMinLength: Byte;
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
    /// <param name="AMinLength">
    /// </param>
    constructor Create(const ANullable: Boolean; const AMinLength: Byte); overload;

    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ANullable">
    /// </param>
    /// <param name="AMinLength">
    /// </param>
    /// <param name="AMaxLength">
    /// </param>
    constructor Create(const ANullable: Boolean; const AMinLength, AMaxLength: Byte); overload;

    /// <summary>
    ///  Defines the min length that the property can have.
    /// </summary>
    /// <value>
    ///  string
    /// </Byte>
    property MinLength: Byte read FMinLength;

    /// <summary>
    ///  Defines the max length that the property can have.
    /// </summary>
    /// <value>
    ///  Byte
    /// </value>
    property MaxLength: Byte read FMaxLength;
  end;

implementation

constructor TTextAttribute.Create;
begin
  Create(True);
end;

constructor TTextAttribute.Create(const ANullable: Boolean);
begin
  Create(ANullable, Byte.MinValue);
end;

constructor TTextAttribute.Create(const ANullable: Boolean; const AMinLength: Byte);
begin
  Create(ANullable, AMinLength, Byte.MaxValue);
end;

constructor TTextAttribute.Create(const ANullable: Boolean; const AMinLength, AMaxLength: Byte);
begin
  inherited Create(ANullable);
  FMinLength := AMinLength;
  FMaxLength := AMaxLength;
end;

end.

