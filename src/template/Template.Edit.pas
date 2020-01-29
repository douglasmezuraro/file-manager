unit Template.Edit;

interface

uses
  FMX.Edit, Helper.FMX.FMXObject, System.UITypes, Template.AbstractClass;

type
  TEditTemplate = class(TLabeledTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

procedure TEditTemplate.TemplateMethod;
var
  Control: TEdit;
begin
  Control := TEdit.Create(FDTO.Owner);
  Control.CharCase := TEditCharCase.ecUpperCase;
  Control.OnChange := FDTO.OnNotify;
  Control.Value := GetValue;

  FControl := Control;
end;

end.

