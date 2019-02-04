unit AbstractFactory.DTO;

interface

uses
  Attribute.Control,
  Attribute.Ini,
  FMX.Types,
  System.Classes,
  System.Rtti;

type
  TDTO = record
  private
    FParent: IControl;
    FOwner: TComponent;
    FX: Single;
    FY: Single;
    FValue: TValue;
    FControl: TControlAttribute;
    FOnNotify: TNotifyEvent;
    FIniAttribute: TIniAttribute;
  public
    constructor Create(const X, Y: Single);
    property Owner: TComponent read FOwner write FOwner;
    property Parent: IControl read FParent write FParent;
    property X: Single read FX write FX;
    property Y: Single read FY write FY;
    property Value: TValue read FValue write FValue;
    property ControlAttribute: TControlAttribute read FControl write FControl;
    property OnNotify: TNotifyEvent read FOnNotify write FOnNotify;
    property IniAttribute: TIniAttribute read FIniAttribute write FIniAttribute;
  end;

implementation

{ TDTO }

constructor TDTO.Create(const X, Y: Single);
begin
  FX := X;
  FY := Y;
end;

end.

