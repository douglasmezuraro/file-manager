unit Ini.Attribute.Base;

interface

type
  /// <summary>
  ///  Base attribute for ini attributes.
  /// </summary>
  TIniBaseAttribute = class abstract(TCustomAttribute)
  private
    FValue: string;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="AValue">
    /// </param>
    constructor Create(const AValue: string);

    /// <summary>
    ///  Value of the attribute.
    /// </summary>
    /// <value>
    ///  string
    /// </value>
    property Value: string read FValue write FValue;
  end;

implementation

constructor TIniBaseAttribute.Create(const AValue: string);
begin
  FValue := AValue;
end;

end.

