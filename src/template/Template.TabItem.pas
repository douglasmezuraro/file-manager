unit Template.TabItem;

interface

uses
  FMX.Layouts,
  FMX.TabControl,
  FMX.Types,
  Template.AbstractClass,
  Util.Types;

type
  TTabItemTemplate = class(TControlTemplate)
  public
    function Fabricate: IControl; override;
  end;

implementation

{ TTabItemTemplate }

function TTabItemTemplate.Fabricate: IControl;
var
  TabItem: TTabItem;
  ScrollBox: TScrollBox;
begin
  Result := nil;
  if FDTO.Parent is TTabControl then
  begin
    TabItem          := (FDTO.Parent as TTabControl).Add;
    TabItem.Text     := Self.GetCaption;

    ScrollBox        := TScrollBox.Create(TabItem);
    ScrollBox.Parent := TabItem;
    ScrollBox.Align  := TAlignLayout.Client;

    Result           := ScrollBox;
  end;
end;

end.

