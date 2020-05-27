unit Validation.Attribute;

interface

uses
  Validation.Attribute.Base, Validation.Attribute.Date, Validation.Attribute.DateTime,
  Validation.Attribute.Time, Validation.Attribute.Float, Validation.Attribute.Integer,
  Validation.Attribute.RegEx, Validation.Attribute.Text;

type
  /// <summary>
  ///  Base attribute for validation.
  /// </summary>
  TValidationBaseAttribute = Validation.Attribute.Base.TValidationBaseAttribute;

  /// <summary>
  ///  Attribute that validates a property of type <c>TDate<c>.
  /// </summary>
  TDateAttribute = Validation.Attribute.Date.TDateAttribute;

  /// <summary>
  ///  Attribute that validates a property of type <c>TDateTime<c>.
  /// </summary>
  TDateTimeAttribute = Validation.Attribute.DateTime.TDateTimeAttribute;

  /// <summary>
  ///  Attribute that validates a property of type <c>TTime<c>.
  /// </summary>
  TTimeAttribute = Validation.Attribute.Time.TTimeAttribute;

  /// <summary>
  ///  Attribute that validates a float-point property.
  /// </summary>
  TFloatAttribute = Validation.Attribute.Float.TFloatAttribute;

  /// <summary>
  ///  Attribute that validates a integer property.
  /// </summary>
  TIntegerAttribute = Validation.Attribute.Integer.TIntegerAttribute;

  /// <summary>
  ///  Attribute that validates a regular expression pattern.
  /// </summary>
  TRegExAttribute = Validation.Attribute.RegEx.TRegExAttribute;

  /// <summary>
  ///  Attribute that validates a text property.
  /// </summary>
  TTextAttribute = Validation.Attribute.Text.TTextAttribute;

implementation

end.
