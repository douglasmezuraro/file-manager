unit Validation.Attribute.Base;

interface

type
  /// <summary>
  ///  Base attribute for validation.
  /// </summary>
  TValidationBaseAttribute = class abstract(TCustomAttribute)
  private
    FNullable: Boolean;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ANullable">
    /// </param>
    constructor Create(const ANullable: Boolean); reintroduce;

    /// <summary>
    ///  Define if the value of the property can be null.
    /// </summary>
    /// <value>
    ///  Boolean
    /// </value>
    property Nullable: Boolean read FNullable;
  end;

implementation

constructor TValidationBaseAttribute.Create(const ANullable: Boolean);
begin
  FNullable := ANullable;
end;

end.

