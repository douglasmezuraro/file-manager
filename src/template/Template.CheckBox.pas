unit Template.CheckBox;

interface

uses
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX.FMXObject,
  Template.AbstractClass,
  Types.DTO;

type
  TCheckBoxTemplate = class(TStylizedTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

{ TCheckBoxTemplate }

procedure TCheckBoxTemplate.TemplateMethod;
var
  Control: TCheckBox;
begin
  Control := TCheckBox.Create(FDTO.Owner);
  Control.OnChange := FDTO.OnNotify;
  Control.Text := GetText;
  Control.Value := GetValue;

  FControl := Control;
end;

end.

