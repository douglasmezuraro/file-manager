unit Component.Attribute.Base;

interface

uses
  System.SysUtils;

type
  /// <summary>
  ///  Base attribute to map which component a property will create.
  /// </summary>
  TComponentBaseAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    /// <summary>
    ///  Constructor of class
    /// </summary>
    /// <param name="AText">
    /// </param>
    constructor Create(const AText: string = string.Empty); overload;

    /// <summary>
    ///  Defines the text who appears on application
    /// </summary>
    /// <param name="Text">
    /// </param>
    property Text: string read FText;
  end;

implementation

constructor TComponentBaseAttribute.Create(const AText: string);
begin
  FText := AText;
end;

end.

