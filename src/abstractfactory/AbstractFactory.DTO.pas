unit AbstractFactory.DTO;

interface

uses
  Attribute.Control,
  Attribute.Ident,
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
    FIdent: TIdent;
    FOnExit: TNotifyEvent;
  public
    constructor Create(const X, Y: Single);
    property Owner: TComponent read FOwner write FOwner;
    property Parent: TFmxObject read FParent write FParent;
    property X: Single read FX write FX;
    property Y: Single read FY write FY;
    property Value: TValue read FValue write FValue;
    property Ident: TIdent read FIdent write FIdent;
    property Control: TControl read FControl write FControl;
    property OnExit: TNotifyEvent read FOnExit write FOnExit;
  end;

implementation

{ TDTO }

constructor TDTO.Create(const X, Y: Single);
begin
  FX := X;
  FY := Y;
end;

end.
