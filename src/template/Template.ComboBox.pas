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
  TComboBoxTemplate = class(TControlTemplate)
  public
    function Fabricate: IControl; override;
  end;

implementation

{ TComboBoxTemplate }

function TComboBoxTemplate.Fabricate: IControl;
var
  ComboBox: TComboBox;
begin
  Self.Caption;

  ComboBox                 := TComboBox.Create(FDTO.Owner);
  ComboBox.Items.CommaText := FDTO.Prop.GetAtribute<ComboBoxAttribute>().Items;
  ComboBox.OnExit          := FDTO.OnNotify;
  ComboBox.Parent          := FDTO.Parent.GetObject;
  ComboBox.Position.X      := FDTO.Position.X;
  ComboBox.Position.Y      := FDTO.Position.Y;
  ComboBox.Value           := Self.GetValue;
  ComboBox.Width           := Self.GetWidth;

  Self.Offset(ComboBox);

  Result := ComboBox;
end;

end.

