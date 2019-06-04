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
    function CreateControl: IControl; override;
  end;

implementation

{ TEditTemplate }

function TEditTemplate.CreateControl: IControl;
var
  Edit: TEdit;
begin
  inherited;

  Edit            := TEdit.Create(FDTO.Owner);
  Edit.CharCase   := TEditCharCase.ecUpperCase;
  Edit.Hint       := GetHint;
  Edit.OnChange   := FDTO.OnNotify;
  Edit.Parent     := FDTO.Parent.GetObject;
  Edit.Position.X := FDTO.Position.X;
  Edit.Position.Y := FDTO.Position.Y;
  Edit.ShowHint   := True;
  Edit.Value      := GetValue;
  Edit.Width      := GetWidth;

  Offset(Edit.Height + TUtils.Constants.DefaultSpacing);

  Result := Edit;
end;

end.

