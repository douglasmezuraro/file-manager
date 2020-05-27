unit Component.Factory.CheckBox;

interface

uses
  Component.Attribute.Base, Component.DTO, Component.Factory.API, FMX.StdCtrls, FMX.Types,
  Helper.Rtti.RttiProperty, System.SysUtils, Types.Consts;

type
  /// <summary>
  ///  Concrete class of the <c>TCheckBox<c> component factory.
  /// </summary>
  TCheckBoxFactory = class sealed(TInterfacedObject, IComponentFactory)
  private
    FDTO: TComponentDTO;
    FCheckBox: TCheckBox;
    procedure CreateCheckBox;
    function GetText: string;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ADTO">
    /// </param>
    constructor Create(const ADTO: TComponentDTO);

    /// <summary>
    ///  Returns a instance of a <c>TCheckBox<c>.
    /// </summary>
    /// <returns>
    ///  IControl
    /// </returns>
    function New: IControl;
  end;

implementation

constructor TCheckBoxFactory.Create(const ADTO: TComponentDTO);
begin
  FDTO := ADTO;
  FCheckBox := TCheckBox.Create(FDTO.Owner.GetObject);
end;

procedure TCheckBoxFactory.CreateCheckBox;
begin
  FCheckBox.OnChange := FDTO.OnNotify;
  FCheckBox.Text := GetText;
  FCheckBox.Parent := FDTO.Owner.GetObject;
  FCheckBox.ShowHint := True;
  FCheckBox.Position := FDTO.Position;
  FCheckBox.Width := DEFAULT_COMPONENT_WIDTH;
end;

function TCheckBoxFactory.New: IControl;
begin
  CreateCheckBox;

  FDTO.Position.Y := FDTO.Position.Y + FCheckBox.Height + DEFAULT_COMPONENT_OFFSET;

  Result := FCheckBox;
end;

function TCheckBoxFactory.GetText: string;
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

