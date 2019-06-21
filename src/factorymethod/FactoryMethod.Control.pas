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

  if Assigned(DTO.Prop.GetAtribute<CheckBoxAttribute>()) then
    Exit(TCheckBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAtribute<TabAttribute>()) then
    Exit(TTabItemTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAtribute<ComboBoxAttribute>()) then
    Exit(TComboBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAtribute<EditAttribute>()) then
    Exit(TEditTemplate.Create(DTO));
end;

end.

