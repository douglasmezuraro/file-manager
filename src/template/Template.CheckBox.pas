unit Template.CheckBox;

interface

uses
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX.FMXObject,
  Template.AbstractClass,
  Types.DTO,
  Types.Utils;

type
  TCheckBoxTemplate = class(TControlTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

{ TCheckBoxTemplate }

procedure TCheckBoxTemplate.TemplateMethod;
var
  Control: TCheckBox;
begin
  Control          := TCheckBox.Create(FDTO.Owner);
  Control.OnChange := FDTO.OnNotify;
  Control.Text     := Text;
  Control.Value    := Value;

  FControl := Control;
end;

end.

