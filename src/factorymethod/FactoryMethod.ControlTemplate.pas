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
  Template.TabItem,
  Types.DTO;

type
  TControlTemplateFactory = class
  public
    class function Fabricate(const DTO: TControlDTO): TControlTemplate;
  end;

implementation

{ TControlTemplateFactory }

class function TControlTemplateFactory.Fabricate(const DTO: TControlDTO): TControlTemplate;
begin
  Result := nil;

  if Assigned(DTO.Prop.GetAtribute<CheckBoxAttribute>()) then
    Exit(TCheckBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAtribute<TabItemAttribute>()) then
    Exit(TTabItemTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAtribute<ComboBoxAttribute>()) then
    Exit(TComboBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAtribute<EditAttribute>()) then
    Exit(TEditTemplate.Create(DTO));
end;

end.

