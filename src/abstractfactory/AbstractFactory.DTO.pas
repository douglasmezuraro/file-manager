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
    FParent: TFmxObject;
    FOwner: TComponent;
    FX: Single;
    FY: Single;
    FValue: TValue;
    FControl: TControl;
    FIniAttribute: TIniAttribute;
    FOnChange: TNotifyEvent;
  public
    constructor Create(const X, Y: Single);
    property Owner: TComponent read FOwner write FOwner;
    property Parent: TFmxObject read FParent write FParent;
    property X: Single read FX write FX;
    property Y: Single read FY write FY;
    property Value: TValue read FValue write FValue;
    property Ident: TIniAttribute read FIniAttribute write FIniAttribute;
    property Control: TControl read FControl write FControl;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

{ TDTO }

constructor TDTO.Create(const X, Y: Single);
begin
  FX := X;
  FY := Y;
end;

end.

