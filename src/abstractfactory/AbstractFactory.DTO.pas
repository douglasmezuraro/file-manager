unit AbstractFactory.DTO;

interface

uses
  FMX.Types,
  System.Classes,
  System.Rtti;

type
  TDTO = record
  private
    FParent: TFmxObject;
    FOwner: TComponent;
    FText: string;
    FValues: TArray<string>;
    FX: Single;
    FY: Single;
    FValue: TValue;
  public
    property Owner: TComponent read FOwner write FOwner;
    property Parent: TFmxObject read FParent write FParent;
    property X: Single read FX write FX;
    property Y: Single read FY write FY;
    property Text: string read FText write FText;
    property Value: TValue read FValue write FValue;
    property Values: TArray<string> read FValues write FValues;
  end;

implementation

end.

