unit Template.Edit;

interface

uses
  FMX.Controls,
  FMX.Edit,
  FMX.Types,
  Helper.FMX,
  Template.AbstractClass,
  Util.Types;

type
  TEditTemplate = class(TControlTemplate)
  public
    function Fabricate: IControl; override;
  end;

implementation

{ TEditTemplate }

function TEditTemplate.Fabricate: IControl;
var
  Control: TEdit;
begin
  Self.Caption;

  Control            := TEdit.Create(FDTO.Owner);
  Control.Parent     := FDTO.Parent.GetObject;
  Control.Position.X := FDTO.Position.X;
  Control.Position.Y := FDTO.Position.Y;
  Control.Value      := Self.GetValue;
  Control.Width      := Self.GetWidth;
  Control.OnExit     := FDTO.OnNotify;

  Self.Offset(Control);

  Result := Control;
end;

end.

