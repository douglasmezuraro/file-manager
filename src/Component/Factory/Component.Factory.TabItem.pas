unit Component.Factory.TabItem;

interface

uses
  Component.Attribute.Base, Component.DTO, Component.Factory.API, FMX.Controls, FMX.Layouts,
  FMX.TabControl, FMX.Types, Helper.Rtti.RttiProperty, Ini.Attribute.Section, System.SysUtils;

type
  /// <summary>
  ///  Concrete class of the <c>TTabItem<c> component factory.
  /// </summary>
  TTabItemFactory = class sealed(TInterfacedObject, IComponentFactory)
  private
    FDTO: TComponentDTO;
    FTab: TTabItem;
    FScrollBox: TScrollBox;
    function GetText: string;
    function GetSection: string;
    procedure CreateTab;
    procedure CreateScrollBox;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ADTO">
    /// </param>
    constructor Create(const ADTO: TComponentDTO);

    /// <summary>
    ///  Returns a instance of a <c>TTabItem<c>.
    /// </summary>
    /// <returns>
    ///  IControl
    /// </returns>
    function New: IControl;
  end;

implementation

constructor TTabItemFactory.Create(const ADTO: TComponentDTO);
begin
  FDTO := ADTO;
  FTab := (FDTO.Owner as TTabControl).Add;
  FScrollBox := TScrollBox.Create(FTab);
end;

procedure TTabItemFactory.CreateScrollBox;
begin
  FScrollBox.Parent := FTab;
  FScrollBox.Align := TAlignLayout.Client;
end;

procedure TTabItemFactory.CreateTab;
begin
  FTab.Text := GetText;
  FTab.TagString := GetSection;
end;

function TTabItemFactory.New: IControl;
begin
  CreateTab;
  CreateScrollBox;

  Result := FScrollBox;
end;

function TTabItemFactory.GetSection: string;
var
  Attribute: TSectionAttribute;
begin
  Attribute := FDTO.Prop.GetAttribute<TSectionAttribute>();

  if not Assigned(Attribute) then
  begin
    Exit(string.Empty);
  end;

  Result := Attribute.Value;
end;

function TTabItemFactory.GetText: string;
var
  Attribute: TComponentBaseAttribute;
begin
  Attribute := FDTO.Prop.GetAttribute<TComponentBaseAttribute>();

  if not Assigned(Attribute) then
  begin
    Exit(string.Empty);
  end;

  Result := Attribute.Text;
end;

end.

