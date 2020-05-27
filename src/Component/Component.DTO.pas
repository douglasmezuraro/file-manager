unit Component.DTO;

interface

uses
  FMX.Types, System.Classes, System.Rtti, System.Types;

type
  /// <summary>
  ///  Data transfer object used for component creation.
  /// </summary>
  TComponentDTO = class sealed
  private
    FOnNotify: TNotifyEvent;
    FParent: IControl;
    FPosition: TPosition;
    FProp: TRttiProperty;
  public
    /// <summary>
    ///  Constructor of class
    /// </summary>
    /// <param name="AOffset">
    /// </param>
    constructor Create(const AOffset: Single);

    /// <summary>
    ///  Destructor of class
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    ///  Event that will be executed when the component changes its value.
    /// </summary>
    /// <value>
    ///  TNotifyEvent
    /// </value>
    property OnNotify: TNotifyEvent read FOnNotify write FOnNotify;

    /// <summary>
    ///  Owner of the component that will be created.
    /// </summary>
    /// <value>
    ///  IControl
    /// </value>
    property Owner: IControl read FParent write FParent;

    /// <summary>
    ///  Controls the placement of the components that will be created.
    /// </summary>
    /// <value>
    ///  TPosition
    /// </value>
    property Position: TPosition read FPosition write FPosition;

    /// <summary>
    ///  Property of the object being read and will be linked to a new component.
    /// </summary>
    /// <value>
    ///  TRttiProperty
    /// </value>
    property Prop: TRttiProperty read FProp write FProp;
  end;

implementation

constructor TComponentDTO.Create(const AOffset: Single);
begin
  FPosition := TPosition.Create(TPointF.Create(AOffset, AOffset));
end;

destructor TComponentDTO.Destroy;
begin
  FPosition.Free;
  inherited;
end;

end.

