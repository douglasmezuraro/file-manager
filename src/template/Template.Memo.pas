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

{ TMemoTemplate }

procedure TMemoTemplate.TemplateMethod;
var
  Control: TMemo;
begin
  Control := TMemo.Create(FDTO.Parent.GetObject);
  Control.Parent := FDTO.Parent.GetObject;
  Control.Align := TAlignLayout.Client;
  Control.TextSettings.Font.SetSettings('Courier New', 10, TFontStyleExt.Default);
  Control.CharCase := TEditCharCase.ecUpperCase;
  Control.Lines.CommaText := GetValue.AsType<TStringList>.CommaText;
  Control.OnChange := FDTO.OnNotify;

  FControl := Control;
end;

end.
