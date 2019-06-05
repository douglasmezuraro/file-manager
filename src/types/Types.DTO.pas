unit Types.DTO;

interface

uses
  FMX.Types,
  Helper.Rtti,
  System.Classes,
  System.Rtti,
  System.Types,
  Types.Utils;

type
  TControlDTO = class
  private
    FModel: TObject;
    FOnNotify: TNotifyEvent;
    FOwner: TComponent;
    FParent: IControl;
    FPosition: TPointF;
    FProp: TRttiProperty;
  public
    constructor Create;
    property Model: TObject read FModel write FModel;
    property OnNotify: TNotifyEvent read FOnNotify write FOnNotify;
    property Owner: TComponent read FOwner write FOwner;
    property Parent: IControl read FParent write FParent;
    property Position: TPointF read FPosition write FPosition;
    property Prop: TRttiProperty read FProp write FProp;
  end;

implementation

{ TDTO }

constructor TControlDTO.Create;
begin
  FPosition.X := TUtils.Constants.DefaultSpacing;
  FPosition.Y := TUtils.Constants.DefaultSpacing;
end;

end.

