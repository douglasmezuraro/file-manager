unit Component.Factory.Caption;

interface

uses
  Component.Attribute.Base, Component.DTO, Component.Factory.API, FMX.StdCtrls, FMX.Types,
  Helper.Rtti.RttiProperty, System.SysUtils, Types.Consts;

type
  /// <summary>
  ///  Concrete class of the <c>TLabel<c> component factory.
  /// </summary>
  TCaptionFactory = class(TInterfacedObject, IComponentFactory)
  private
    FDTO: TComponentDTO;
    FCaption: TLabel;
    function GetText: string;
    procedure CreateCaption;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ADTO">
    /// </param>
    constructor Create(const ADTO: TComponentDTO);

    /// <summary>
    ///  Returns a instance of a <c>TLabel<c>.
    /// </summary>
    /// <returns>
    ///  IControl
    /// </returns>
    function New: IControl;
  end;

implementation

constructor TCaptionFactory.Create(const ADTO: TComponentDTO);
begin
  FDTO := ADTO;
  FCaption := TLabel.Create(FDTO.Owner.GetObject);
end;

procedure TCaptionFactory.CreateCaption;
begin
  FCaption.Parent := FDTO.Owner.GetObject;
  FCaption.Text := GetText;
  FCaption.Position.X := FDTO.Position.X;
  FCaption.Position.Y := FDTO.Position.Y;
  FCaption.Width := DEFAULT_COMPONENT_WIDTH;
end;

function TCaptionFactory.New: IControl;
begin
  CreateCaption;

  FDTO.Position.Y := FDTO.Position.Y + FCaption.Height;

  Result := FCaption;
end;

function TCaptionFactory.GetText: string;
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
