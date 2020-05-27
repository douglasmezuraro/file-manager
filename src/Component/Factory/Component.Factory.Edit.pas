unit Component.Factory.Edit;

interface

uses
  Component.DTO, Component.Factory.API, Component.Factory.Caption, FMX.Edit, FMX.StdCtrls, FMX.Types,
  System.UITypes, Types.Consts;

type
  /// <summary>
  ///  Concrete class of the <c>TEdit<c> component factory.
  /// </summary>
  TEditFactory = class sealed(TInterfacedObject, IComponentFactory)
  private
    FDTO: TComponentDTO;
    FCaption: TLabel;
    FEdit: TEdit;
    procedure Offset;
    procedure CreateCaption;
    procedure CreateEdit;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ADTO">
    /// </param>
    constructor Create(const ADTO: TComponentDTO);

    /// <summary>
    ///  Returns a instance of a <c>TEdit<c>.
    /// </summary>
    /// <returns>
    ///  IControl
    /// </returns>
    function New: IControl;
  end;

implementation

constructor TEditFactory.Create(const ADTO: TComponentDTO);
begin
  FDTO := ADTO;
  FEdit := TEdit.Create(FDTO.Owner.GetObject);
end;

procedure TEditFactory.CreateCaption;
var
  Component: IComponentFactory;
begin
  Component := TCaptionFactory.Create(FDTO);
  FCaption := Component.New as TLabel;
  FCaption.FocusControl := FEdit;
end;

procedure TEditFactory.CreateEdit;
begin
  FEdit.CharCase := TEditCharCase.ecUpperCase;
  FEdit.OnChange := FDTO.OnNotify;
  FEdit.Parent := FDTO.Owner.GetObject;
  FEdit.ShowHint := True;
  FEdit.Position := FDTO.Position;
  FEdit.Width := DEFAULT_COMPONENT_WIDTH;
end;

function TEditFactory.New: IControl;
begin
  CreateCaption;
  CreateEdit;
  Offset;

  Result := FEdit;
end;

procedure TEditFactory.Offset;
begin
  FDTO.Position.Y := FDTO.Position.Y + FEdit.Height + DEFAULT_COMPONENT_OFFSET;
end;

end.

