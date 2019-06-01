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
    function CreateControl: IControl; override;
  end;

implementation

{ TTabItemTemplate }

function TTabItemTemplate.CreateControl: IControl;
var
  TabItem: TTabItem;
  ScrollBox: TScrollBox;
begin
  Result := nil;

  if not (FDTO.Parent is TTabControl) then
    Exit;

  TabItem          := (FDTO.Parent as TTabControl).Add;
  TabItem.Text     := GetCaption;

  ScrollBox        := TScrollBox.Create(TabItem);
  ScrollBox.Parent := TabItem;
  ScrollBox.Align  := TAlignLayout.Client;

  Result           := ScrollBox;
end;

end.

