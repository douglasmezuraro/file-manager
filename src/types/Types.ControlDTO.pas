unit Types.ControlDTO;

interface

uses
  FMX.Types, System.Classes, System.Rtti, System.Types;

type
  TControlDTO = class sealed
  private
    FModel: TObject;
    FOnNotify: TNotifyEvent;
    FOwner: TComponent;
    FParent: IControl;
    FPosition: TPointF;
    FProp: TRttiProperty;
  public
    constructor Create(const X, Y: Single);
    property Model: TObject read FModel write FModel;
    property OnNotify: TNotifyEvent read FOnNotify write FOnNotify;
    property Owner: TComponent read FOwner write FOwner;
    property Parent: IControl read FParent write FParent;
    property Position: TPointF read FPosition write FPosition;
    property Prop: TRttiProperty read FProp write FProp;
  end;

implementation

constructor TControlDTO.Create(const X, Y: Single);
begin
  FPosition.X := X;
  FPosition.Y := Y;
end;

end.

