unit FactoryMethod.ControlTemplate;

interface

uses
  Attribute.Control,
  Helper.Rtti,
  System.Rtti,
  Template.AbstractClass,
  Template.CheckBox,
  Template.ComboBox,
  Template.Edit,
  Template.TabItem;

type
  TControlTemplateFactory = class
  public
    class function Fabricate(const Prop: TRttiProperty): TControlTemplate;
  end;

implementation

{ TControlTemplateFactory }

class function TControlTemplateFactory.Fabricate(const Prop: TRttiProperty): TControlTemplate;
begin
  Result := nil;

  if Assigned(Prop.GetAtribute<CheckBoxAttribute>()) then
    Exit(TCheckBoxTemplate.Create);

  if Assigned(Prop.GetAtribute<TabItemAttribute>()) then
    Exit(TTabItemTemplate.Create);

  if Assigned(Prop.GetAtribute<ComboBoxAttribute>()) then
    Exit(TComboBoxTemplate.Create);

  if Assigned(Prop.GetAtribute<EditAttribute>()) then
    Exit(TEditTemplate.Create);
end;

end.

