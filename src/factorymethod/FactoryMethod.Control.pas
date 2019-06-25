unit FactoryMethod.Control;

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
  TControlFactory = class
  public
    class function Fabricate(const DTO: TControlDTO): TControlTemplate;
  end;

implementation

{ TControlFactory }

class function TControlFactory.Fabricate(const DTO: TControlDTO): TControlTemplate;
begin
  Result := nil;

  if Assigned(DTO.Prop.GetAttribute<CheckBoxAttribute>()) then
    Exit(TCheckBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAttribute<TabAttribute>()) then
    Exit(TTabItemTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAttribute<ComboBoxAttribute>()) then
    Exit(TComboBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAttribute<EditAttribute>()) then
    Exit(TEditTemplate.Create(DTO));
end;

end.

