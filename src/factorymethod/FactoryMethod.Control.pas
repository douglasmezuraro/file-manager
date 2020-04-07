unit FactoryMethod.Control;

interface

uses
  Attribute.Component.CheckBox,
  Attribute.Component.ComboBox,
  Attribute.Component.Edit,
  Attribute.Component.Memo,
  Attribute.Component.Tab,
  Helper.Rtti.RttiProperty,
  System.Rtti,
  Template.AbstractClass,
  Template.CheckBox,
  Template.ComboBox,
  Template.Edit,
  Template.Memo,
  Template.Tab,
  Types.ControlDTO;

type
  TControlFactory = class sealed
  public
    class function Fabricate(const DTO: TControlDTO): TControlTemplate;
  end;

implementation

class function TControlFactory.Fabricate(const DTO: TControlDTO): TControlTemplate;
begin
  if Assigned(DTO.Prop.GetAttribute<CheckBoxAttribute>()) then
  begin
    Exit(TCheckBoxTemplate.Create(DTO));
  end;

  if Assigned(DTO.Prop.GetAttribute<TabAttribute>()) then
  begin
    Exit(TTabTemplate.Create(DTO));
  end;

  if Assigned(DTO.Prop.GetAttribute<ComboBoxAttribute>()) then
  begin
    Exit(TComboBoxTemplate.Create(DTO));
  end;

  if Assigned(DTO.Prop.GetAttribute<EditAttribute>()) then
  begin
    Exit(TEditTemplate.Create(DTO));
  end;

  if Assigned(DTO.Prop.GetAttribute<MemoAttribute>()) then
  begin
    Exit(TMemoTemplate.Create(DTO));
  end;

  Result := nil;
end;

end.

