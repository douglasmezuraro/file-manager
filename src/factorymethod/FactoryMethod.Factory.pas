unit FactoryMethod.Factory;

interface

uses
  Attribute.Control,
  Template.AbstractClass,
  Template.CheckBox,
  Template.ComboBox,
  Template.Edit,
  Template.TabItem,
  Helper.Rtti,
  Util.Types;

type
  TFactoryMethod = class
  public
    class function Fabricate(var DTO: TDTO): TControlTemplate;
  end;

implementation

{ TFactory }

class function TFactoryMethod.Fabricate(var DTO: TDTO): TControlTemplate;
begin
  if DTO.Prop.GetValue(DTO.Model).IsBoolean then
  begin
    Result := TCheckBoxTemplate.Create(DTO);
    Exit;
  end;

  if DTO.Prop.GetValue(DTO.Model).IsObject then
  begin
    Result := TTabItemTemplate.Create(DTO);
    Exit;
  end;

  if Length(DTO.Prop.GetAtribute<TControlAttribute>.Values) > 0 then
  begin
    Result := TComboBoxTemplate.Create(DTO);
    Exit;
  end;

  Result := TEditTemplate.Create(DTO);
end;

end.
