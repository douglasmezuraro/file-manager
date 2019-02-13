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
  Control: TComboBox;
begin
  Self.Caption;

  Control                 := TComboBox.Create(FDTO.Owner);
  Control.Parent          := FDTO.Parent.GetObject;
  Control.Position.X      := FDTO.Position.X;
  Control.Position.Y      := FDTO.Position.Y;
  Control.Items.CommaText := FDTO.Prop.GetAtribute<TControlAttribute>.Items;
  Control.Value           := Self.GetValue;
  Control.OnExit          := FDTO.OnNotify;
  Control.Width           := Self.GetWidth;

  Self.Offset(Control);

  Result := Control;
end;

end.

