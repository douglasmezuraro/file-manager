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
  Edit: TEdit;
begin
  Self.Caption;

  Edit            := TEdit.Create(FDTO.Owner);
  Edit.OnExit     := FDTO.OnNotify;
  Edit.Parent     := FDTO.Parent.GetObject;
  Edit.Position.X := FDTO.Position.X;
  Edit.Position.Y := FDTO.Position.Y;
  Edit.Value      := Self.GetValue;
  Edit.Width      := Self.GetWidth;

  Self.Offset(Edit);

  Result := Edit;
end;

end.

