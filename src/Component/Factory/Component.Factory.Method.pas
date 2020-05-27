unit Component.Factory.Method;

interface

uses
  Component.Attribute, Component.Factory.API, Component.DTO, Component.Factory.Classes,
  Helper.Rtti.RttiProperty, System.Rtti, System.SysUtils;

type
  /// <summary>
  ///  Abstract component factory.
  /// </summary>
  TComponentFactoryMethod = class sealed
  public
    /// <summary>
    ///  Fabricates a component factory based on the DTO passed as parametter.
    /// </summary>
    /// <param name="ADTO">
    /// </param>
    /// <returns>
    ///  IComponentFactory
    /// </returns>
    class function Fabricate(const ADTO: TComponentDTO): IComponentFactory;
  end;

implementation

class function TComponentFactoryMethod.Fabricate(const ADTO: TComponentDTO): IComponentFactory;
var
  Attribute: TComponentBaseAttribute;
begin
  Attribute := ADTO.Prop.GetAttribute<TComponentBaseAttribute>();

  if not Assigned(Attribute) then
  begin
    Exit(nil);
  end;

  if Attribute is TCheckBoxAttribute then
  begin
    Exit(TCheckBoxFactory.Create(ADTO));
  end;

  if Attribute is TTabItemAttribute then
  begin
    Exit(TTabItemFactory.Create(ADTO));
  end;

  if Attribute is TComboBoxAttribute then
  begin
    Exit(TComboBoxFactory.Create(ADTO));
  end;

  if Attribute is TEditAttribute then
  begin
    Exit(TEditFactory.Create(ADTO));
  end;

  if Attribute is TMemoAttribute then
  begin
    Exit(TMemoFactory.Create(ADTO));
  end;

  raise ENotImplemented.Create('Error Message');
end;

end.

