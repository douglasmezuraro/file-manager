unit Component.Factory.ComboBox;

interface

uses
  Component.Attribute.ComboBox, Component.DTO, Component.Factory.API, Component.Factory.Caption,
  FMX.ListBox, FMX.StdCtrls, FMX.Types, Helper.Rtti.RttiProperty, Types.Consts;

type
  /// <summary>
  ///  Concrete class of the <c>TComboBox<c> component factory.
  /// </summary>
  TComboBoxFactory = class sealed(TInterfacedObject, IComponentFactory)
  private
    FDTO: TComponentDTO;
    FCaption: TLabel;
    FComboBox: TComboBox;
    procedure Offset;
    procedure CreateCaption;
    procedure CreateComboBox;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ADTO">
    /// </param>
    constructor Create(const ADTO: TComponentDTO);

    /// <summary>
    ///  Returns a instance of a <c>TComboBox<c>.
    /// </summary>
    /// <returns>
    ///  IControl
    /// </returns>
    function New: IControl;
  end;

implementation

constructor TComboBoxFactory.Create(const ADTO: TComponentDTO);
begin
  FDTO := ADTO;
  FComboBox := TComboBox.Create(FDTO.Owner.GetObject);
end;

procedure TComboBoxFactory.CreateCaption;
var
  Component: IComponentFactory;
begin
  Component := TCaptionFactory.Create(FDTO);
  FCaption := Component.New as TLabel;
  FCaption.FocusControl := FComboBox;
end;

procedure TComboBoxFactory.CreateComboBox;
begin
  FComboBox.Items.AddStrings(FDTO.Prop.GetAttribute<TComboBoxAttribute>().Items);
  FComboBox.OnChange := FDTO.OnNotify;
  FComboBox.Parent := FDTO.Owner.GetObject;
  FComboBox.ShowHint := True;
  FComboBox.Position := FDTO.Position;
  FComboBox.Width := DEFAULT_COMPONENT_WIDTH;
end;

function TComboBoxFactory.New: IControl;
begin
  CreateCaption;
  CreateComboBox;
  Offset;

  Result := FComboBox;
end;

procedure TComboBoxFactory.Offset;
begin
  FDTO.Position.Y := FDTO.Position.Y + FComboBox.Height + DEFAULT_COMPONENT_OFFSET;
end;

end.

