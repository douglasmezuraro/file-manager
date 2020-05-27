unit Component.Factory.Memo;

interface

uses
  Component.Factory.API, FMX.Controls, Component.DTO, FMX.Graphics, FMX.Memo, FMX.Types, System.UITypes;

type
  /// <summary>
  ///  Concrete class of the <c>TMemo<c> component factory.
  /// </summary>
  TMemoFactory = class sealed(TInterfacedObject, IComponentFactory)
  private
    FDTO: TComponentDTO;
    FMemo: TMemo;
    procedure CreateMemo;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="ADTO">
    /// </param>
    constructor Create(const ADTO: TComponentDTO);

    /// <summary>
    ///  Returns a instance of a <c>TMemo<c>.
    /// </summary>
    /// <returns>
    ///  IControl
    /// </returns>
    function New: IControl;
  end;

implementation

constructor TMemoFactory.Create(const ADTO: TComponentDTO);
begin
  FDTO := ADTO;
  FMemo := TMemo.Create(FDTO.Owner.GetObject);
end;

procedure TMemoFactory.CreateMemo;
begin
  FMemo.Align := TAlignLayout.Client;
  FMemo.CharCase := TEditCharCase.ecUpperCase;
  FMemo.OnChange := FDTO.OnNotify;
  FMemo.Parent := FDTO.Owner.GetObject;
  FMemo.StyledSettings := FMemo.StyledSettings - [TStyledSetting.Family];
  FMemo.TextSettings.Font.Family := TFontName('Courier New');
end;

function TMemoFactory.New: IControl;
begin
  CreateMemo;

  Result := FMemo;
end;

end.
