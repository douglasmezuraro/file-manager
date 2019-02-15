unit Template.TabItem;

interface

uses
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
  Control: TTabItem;
begin
  Result := nil;
  if FDTO.Parent is TTabControl then
  begin
    Control      := (FDTO.Parent as TTabControl).Add;
    (FDTO.Parent as TTabControl).Align := TAlignLayout.Client;
    Control.Text := Self.GetCaption;
    Result       := Control;
  end;
end;

end.

