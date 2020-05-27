unit Model.Config.AlternativeBalancer;

interface

uses
  Component.Attribute.Memo,
  Ini.Attribute.Key,
  Component.Attribute.Managed,
  System.Classes;

type
  TAlternativeBalancer = class sealed
  private
    FValues: TStringList;
  public
    [TManaged][TKey('')][TMemo]
    property Values: TStringList read FValues write FValues;
  end;

implementation

end.

