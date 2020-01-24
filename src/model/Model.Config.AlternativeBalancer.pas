unit Model.Config.AlternativeBalancer;

interface

uses
  Attribute.Component.Memo,
  Attribute.Managed,
  Attribute.Ini,
  System.Classes;

type
  TAlternativeBalancer = class
  private
    FValues: TStringList;
  public
    [Managed][Key][Memo]
    property Values: TStringList read FValues write FValues;
  end;

implementation

end.

