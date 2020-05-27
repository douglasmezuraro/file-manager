unit Validation.Attribute.RegEx;

interface

uses
  Validation.Attribute.Base, System.SysUtils;

type
  /// <summary>
  ///  Attribute that validates a regular expression pattern.
  /// </summary>
  TRegExAttribute = class sealed(TValidationBaseAttribute)
  private
    FPattern: string;
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
    /// <param name="APattern">
    /// </param>
    constructor Create(const ANullable: Boolean; const APattern: string); overload;

    /// <summary>
    ///  Defines the pattern of the value thet property can have.
    /// </summary>
    /// <value>
    ///  string
    /// </value>
    property Pattern: string read FPattern;
  end;

implementation

constructor TRegExAttribute.Create;
begin
  Create(True);
end;

constructor TRegExAttribute.Create(const ANullable: Boolean);
begin
  Create(ANullable, string.Empty);
end;

constructor TRegExAttribute.Create(const ANullable: Boolean; const APattern: string);
begin
  inherited Create(ANullable);
  FPattern := APattern;
end;

end.

