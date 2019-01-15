unit Model.Config.Server;

interface

uses
  Ini.Key,
  Ini.Section;

type
  [TSection('SERVIDOR')]
  TServer = class
  private
    FName: string;
    FConnectionType: string;
    FExeName: string;
    FComputerName: string;
    FCanBalance: Boolean;
    FIntegrationManager: Boolean;
    FTimeOut: UInt16;
    FGUID: string;
    FIPServer: string;
    FIPAddress: string;
  public
    [TKey('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [TKey('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [TKey('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [TKey('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [TKey('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TKey('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TKey('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TKey('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [TKey('TIMEOUTEXECUCAO')]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [TKey('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

