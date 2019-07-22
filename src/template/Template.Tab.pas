unit Template.Tab;

interface

uses
  FMX.Layouts,
  FMX.TabControl,
  FMX.Types,
  Template.AbstractClass;

type
  TTabTemplate = class(TLayoutTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

{ TTabTemplate }

procedure TTabTemplate.TemplateMethod;
var
  Tab: TTabItem;
  ScrollBox: TScrollBox;
begin
  Tab := (FDTO.Parent as TTabControl).Add;
  Tab.Text := GetText;
  Tab.TagString := Self.GetIni;

  ScrollBox := TScrollBox.Create(Tab);
  ScrollBox.Parent := Tab;
  ScrollBox.Align := TAlignLayout.Client;

  FControl := ScrollBox;
end;

end.

