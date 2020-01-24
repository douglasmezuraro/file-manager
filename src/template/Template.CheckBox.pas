unit Template.CheckBox;

interface

uses
  FMX.StdCtrls,
  Helper.FMX.FMXObject,
  Template.AbstractClass;

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

