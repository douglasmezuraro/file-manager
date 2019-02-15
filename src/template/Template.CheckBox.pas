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
  Control.OnExit     := FDTO.OnNotify;
  Control.Parent     := FDTO.Parent.GetObject;
  Control.Position.X := FDTO.Position.X;
  Control.Position.Y := FDTO.Position.Y;
  Control.Text       := Self.GetCaption;
  Control.Value      := Self.GetValue;
  Control.Width      := Self.GetWidth;

  Self.Offset(Control);

  Result := Control;
end;

end.

