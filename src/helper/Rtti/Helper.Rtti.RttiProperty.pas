unit Helper.Rtti.RttiProperty;

interface

uses
  System.Rtti;

type
  TRttiPropertyHelper = class Helper for TRttiProperty
  public
    function GetAttribute<T: class>(): T;
  end;

implementation

function TRttiPropertyHelper.GetAttribute<T>(): T;
var
  Attribute: TCustomAttribute;
begin
  for Attribute in Self.GetAttributes do
  begin
    if Attribute is T then
      Exit(Attribute as T);
  end;

  Result := nil;
end;

end.
