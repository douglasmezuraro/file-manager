unit Component.Attribute.ComboBox;

interface

uses
  Component.Attribute.Base, System.SysUtils;

type
  /// <summary>
  ///  Attribute to map that the property will create a <c>TComboBox<c>.
  /// </summary>
  TComboBoxAttribute = class sealed(TComponentBaseAttribute)
  private
    FItems: TArray<string>;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="AText">
    /// </param>
    /// <param name="AItems">
    /// </param>
    constructor Create(const AText, AItems: string); reintroduce;

    /// <summary>
    ///  Items that will appear in the combobox.
    /// </summary>
    /// <value>
    ///  TArray<string>
    /// </value>
    property Items: TArray<string> read FItems;
  end;

implementation

constructor TComboBoxAttribute.Create(const AText, AItems: string);
begin
  inherited Create(AText);
  FItems := AItems.Split([',']);
end;

end.

