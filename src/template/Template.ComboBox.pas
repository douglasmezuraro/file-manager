unit Template.ComboBox;

interface

uses
  Attribute.Control,
  FMX.ListBox,
  Helper.FMX,
  Helper.Rtti,
  Template.AbstractClass;

type
  TComboBoxTemplate = class(TLabeledTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

{ TComboBoxTemplate }

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

