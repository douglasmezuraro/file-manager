unit Template.ComboBox;

interface

uses
  Attribute.Component.ComboBox, FMX.ListBox, Helper.FMX.FMXObject, Helper.Rtti.RttiProperty, Template.AbstractClass;

type
  TComboBoxTemplate = class(TLabeledTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

procedure TComboBoxTemplate.TemplateMethod;
var
  Control: TComboBox;
begin
  Control := TComboBox.Create(FDTO.Owner);
  Control.Items.AddStrings(FDTO.Prop.GetAttribute<ComboBoxAttribute>().Items);
  Control.OnChange := FDTO.OnNotify;
  Control.Value := GetValue;

  FControl := Control;
end;

end.

