unit Template.ComboBox;

interface

uses
  FMX.Controls,
  FMX.ListBox,
  FMX.Types,
  Helper.FMX,
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
  Control.Items.CommaText := Self.GetItems;
  Control.OnExit          := FDTO.OnNotify;
  Control.Parent          := FDTO.Parent.GetObject;
  Control.Position.X      := FDTO.Position.X;
  Control.Position.Y      := FDTO.Position.Y;
  Control.Value           := Self.GetValue;
  Control.Width           := Self.GetWidth;

  Self.Offset(Control);

  Result := Control;
end;

end.

