unit AbstractFactory.DTO;

interface

uses
  Attribute.Caption,
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
    FCaption: TCaption;
    FIdent: TIdent;
  public
    constructor Create(const X, Y: Single);
    property Owner: TComponent read FOwner write FOwner;
    property Parent: TFmxObject read FParent write FParent;
    property X: Single read FX write FX;
    property Y: Single read FY write FY;
    property Value: TValue read FValue write FValue;
    property Ident: TIdent read FIdent write FIdent;
    property Caption: TCaption read FCaption write FCaption;
  end;

implementation

{ TDTO }

constructor TDTO.Create(const X, Y: Single);
begin
  FX := X;
  FY := Y;
end;

end.

