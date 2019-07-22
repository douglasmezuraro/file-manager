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
  Template.Memo,
  Template.Tab,
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
  if Assigned(DTO.Prop.GetAttribute<CheckBoxAttribute>()) then
    Exit(TCheckBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAttribute<TabAttribute>()) then
    Exit(TTabTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAttribute<ComboBoxAttribute>()) then
    Exit(TComboBoxTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAttribute<EditAttribute>()) then
    Exit(TEditTemplate.Create(DTO));

  if Assigned(DTO.Prop.GetAttribute<MemoAttribute>()) then
    Exit(TMemoTemplate.Create(DTO));

  Result := nil;
end;

end.

