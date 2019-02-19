unit FactoryMethod.Factory;

interface

uses
  Attribute.Ini,
  Helper.Rtti,
  System.Rtti,
  Template.AbstractClass,
  Template.CheckBox,
  Template.ComboBox,
  Template.Edit,
  Template.TabItem;

type
  TFactoryMethod = class
  public
    class function Fabricate(const Prop: TRttiProperty): TControlTemplate;
  end;

implementation

{ TFactory }

class function TFactoryMethod.Fabricate(const Prop: TRttiProperty): TControlTemplate;
begin
  Result := nil;

  if Prop.GetAtribute<TCheckBoxAttribute>() <> nil then
  begin
    Result := TCheckBoxTemplate.Create;
    Exit;
  end;

  if Prop.GetAtribute<TTabItemAttribute>() <> nil then
  begin
    Result := TTabItemTemplate.Create;
    Exit;
  end;

  if Prop.GetAtribute<TComboBoxAttribute>() <> nil then
  begin
    Result := TComboBoxTemplate.Create;
    Exit;
  end;

  if Prop.GetAtribute<TEditAttribute>() <> nil then
  begin
    Result := TEditTemplate.Create;
    Exit;
  end;
end;

end.

