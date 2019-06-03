unit Types.DTO;

interface

uses
  FMX.Types,
  Helper.Rtti,
  System.Classes,
  System.Rtti,
  System.Types;

type
  TControlDTO = record
    Model: TObject;
    OnNotify: TNotifyEvent;
    Owner: TComponent;
    Parent: IControl;
    Position: TPointF;
    Prop: TRttiProperty;
    constructor Create(const X, Y: Single);
  end;

implementation

{ TDTO }

constructor TControlDTO.Create(const X, Y: Single);
begin
  Position.X := X;
  Position.Y := Y;
end;

end.

