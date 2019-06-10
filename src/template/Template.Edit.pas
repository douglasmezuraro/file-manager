unit Template.Edit;

interface

uses
  FMX.Controls,
  FMX.Edit,
  FMX.Types,
  Helper.FMX.FMXObject,
  System.UITypes,
  Template.AbstractClass,
  Types.DTO,
  Types.Utils;

type
  TEditTemplate = class(TLabeledTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

{ TEditTemplate }

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

