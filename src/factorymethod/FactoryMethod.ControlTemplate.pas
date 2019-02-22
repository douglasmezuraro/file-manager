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
  begin
    Result := TCheckBoxTemplate.Create;
    Exit;
  end;

  if Assigned(Prop.GetAtribute<TabItemAttribute>()) then
  begin
    Result := TTabItemTemplate.Create;
    Exit;
  end;

  if Assigned(Prop.GetAtribute<ComboBoxAttribute>()) then
  begin
    Result := TComboBoxTemplate.Create;
    Exit;
  end;

  if Assigned(Prop.GetAtribute<EditAttribute>()) then
  begin
    Result := TEditTemplate.Create;
    Exit;
  end;
end;

end.

