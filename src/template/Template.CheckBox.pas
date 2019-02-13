unit Template.CheckBox;

interface

uses
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  Template.AbstractClass,
  Util.Types;

type
  TCheckBoxTemplate = class(TControlTemplate)
  public
    function Fabricate: IControl; override;
  end;

implementation

{ TCheckBoxTemplate }

function TCheckBoxTemplate.Fabricate: IControl;
var
  Control: TCheckBox;
begin
  Control            := TCheckBox.Create(FDTO.Owner);
  Control.Parent     := FDTO.Parent.GetObject;
  Control.Position.X := FDTO.Position.X;
  Control.Position.Y := FDTO.Position.Y;
  Control.Value      := Self.GetValue;
  Control.Text       := Self.GetCaption;
  Control.Width      := Self.GetWidth;
  Control.OnExit     := FDTO.OnNotify;

  Self.Offset(Control);

  Result := Control;
end;

end.

