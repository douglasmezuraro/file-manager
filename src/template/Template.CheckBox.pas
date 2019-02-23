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
    function CreateControl: IControl; override;
  end;

implementation

{ TCheckBoxTemplate }

function TCheckBoxTemplate.CreateControl: IControl;
var
  CheckBox: TCheckBox;
begin
  CheckBox            := TCheckBox.Create(FDTO.Owner);
  CheckBox.OnExit     := FDTO.OnNotify;
  CheckBox.Parent     := FDTO.Parent.GetObject;
  CheckBox.Position.X := FDTO.Position.X;
  CheckBox.Position.Y := FDTO.Position.Y;
  CheckBox.Text       := GetCaption;
  CheckBox.Value      := GetValue;
  CheckBox.Width      := GetWidth;

  Offset(CheckBox);

  Result := CheckBox;
end;

end.

