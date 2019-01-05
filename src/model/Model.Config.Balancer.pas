unit Model.Config.Balancer;

interface

uses
  Ini.Section;

type
  [TSection('SPBALANCEADOR')]
  TBalancer = class
  private
    FGUID: TGUID;
    FIP: string;
  public
    property GUID: TGUID read FGUID write FGUID;
    property IP: string read FIP write FIP;
  end;

implementation

end.

