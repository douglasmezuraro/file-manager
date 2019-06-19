unit Template.ComboBox;

interface

uses
  Attribute.Control,
  FMX.Controls,
  FMX.ListBox,
  FMX.Types,
  Helper.FMX.FMXObject,
  Helper.Rtti,
  Template.AbstractClass,
  Types.DTO;

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
  Control.Items.CommaText := FDTO.Prop.GetAtribute<ComboBoxAttribute>().Items;
  Control.OnChange := FDTO.OnNotify;
  Control.Value := GetValue;

  FControl := Control;
end;

end.

