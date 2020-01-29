unit Template.Memo;

interface

uses
  FMX.Graphics,
  FMX.Memo,
  FMX.Types,
  System.Classes,
  System.UITypes,
  Template.AbstractClass;

type
  TMemoTemplate = class(TLayoutTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

procedure TMemoTemplate.TemplateMethod;
var
  Control: TMemo;
begin
  Control := TMemo.Create(FDTO.Parent.GetObject);

  Control.Align := TAlignLayout.Client;
  Control.CharCase := TEditCharCase.ecUpperCase;
  Control.Lines.Assign(GetValue.AsType<TStringList>);
  Control.OnChange := FDTO.OnNotify;
  Control.Parent := FDTO.Parent.GetObject;
  Control.StyledSettings := Control.StyledSettings - [TStyledSetting.Family];
  Control.TextSettings.Font.Family := TFontName('Courier New');

  FControl := Control;
end;

end.
