unit Template.ComboBox;

interface

uses
  Attribute.Control,
  FMX.Controls,
  FMX.ListBox,
  FMX.Types,
  Helper.FMX,
  Helper.Rtti,
  Template.AbstractClass,
  Util.Types;

type
  TComboBoxTemplate = class(TLabeledTemplate)
  public
    function CreateControl: IControl; override;
  end;

implementation

{ TComboBoxTemplate }

function TComboBoxTemplate.CreateControl: IControl;
var
  ComboBox: TComboBox;
begin
  CreateLabel;

  ComboBox                 := TComboBox.Create(FDTO.Owner);
  ComboBox.Items.CommaText := FDTO.Prop.GetAtribute<ComboBoxAttribute>().Items;
  ComboBox.OnExit          := FDTO.OnNotify;
  ComboBox.Parent          := FDTO.Parent.GetObject;
  ComboBox.Position.X      := FDTO.Position.X;
  ComboBox.Position.Y      := FDTO.Position.Y;
  ComboBox.Value           := GetValue;
  ComboBox.Width           := GetWidth;

  Offset(ComboBox);

  Result := ComboBox;
end;

end.

