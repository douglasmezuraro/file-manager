unit Helper.Rtti.RttiProperty;

interface

uses
  System.Rtti;

type
  /// <summary>
  ///  Class helper for class <c>TRttiProperty<c>.
  /// </summary>
  TRttiPropertyHelper = class Helper for TRttiProperty
  public
    /// <summary>
    ///  Return the attribute of the property.
    /// </summary>
    /// <returns>
    ///  T if property has the attribute, nil otherwise.
    /// </returns>
    function GetAttribute<T: class>: T;
  end;

implementation

function TRttiPropertyHelper.GetAttribute<T>: T;
var
  Attribute: TCustomAttribute;
begin
  for Attribute in GetAttributes do
  begin
    if Attribute is T then
    begin
      Exit(Attribute as T);
    end;
  end;

  Result := nil;
end;

end.

