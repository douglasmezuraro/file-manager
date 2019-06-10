unit Template.TabItem;

interface

uses
  FMX.Layouts,
  FMX.TabControl,
  FMX.Types,
  Template.AbstractClass,
  Types.DTO;

type
  TTabItemTemplate = class(TControlTemplate)
  public
    procedure TemplateMethod; override;
  end;

implementation

{ TTabItemTemplate }

procedure TTabItemTemplate.TemplateMethod;
var
  TabItem: TTabItem;
  ScrollBox: TScrollBox;
begin
  if not (FDTO.Parent is TTabControl) then
    Exit;

  TabItem          := (FDTO.Parent as TTabControl).Add;
  TabItem.Text     := Text;

  ScrollBox        := TScrollBox.Create(TabItem);
  ScrollBox.Parent := TabItem;
  ScrollBox.Align  := TAlignLayout.Client;

  FControl         := ScrollBox;
end;

end.

