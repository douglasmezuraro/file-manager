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

  Control              := TComboBox.Create(FDTO.Owner);
  Control.Parent       := FDTO.Parent.GetObject;
  Control.Position.X   := FDTO.Position.X;
  Control.Position.Y   := FDTO.Position.Y;
  Control.Values       := FDTO.Prop.GetAtribute<TControlAttribute>().Values;
  Control.Value        := Self.GetValue;
  Control.OnExit       := FDTO.OnNotify;
  Control.Width        := Self.GetWidth;

  Self.IncHeight(Control.Height);

  Result := Control;
end;

end.

