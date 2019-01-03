unit Model.Config.Server;

interface

uses
  Model.Config.Types;

type
  TServer = class
  private
    FName: string;
    FConnectionType: TConnectionType;
    FServerExeName: string;
    FComputerName: string;
    FCanBalance: Boolean;
    FIntegrationManager: Boolean;
    FTimeOut: UInt16;
    FGUID: TGUID;
    FIP: string;
  public
    property Name: string read FName write FName;
    property GUID: TGUID read FGUID write FGUID;
    property ComputerName: string read FComputerName write FComputerName;
    property IP: string read FIP write FIP;
    property ConnectionType: TConnectionType read FConnectionType write FConnectionType default ctSocket;
    property CanBalance: Boolean read FCanBalance write FCanBalance;
    property ServerExeName: string read FServerExeName write FServerExeName;
    property TimeOut: UInt16 read FTimeOut write FTimeOut;
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.
