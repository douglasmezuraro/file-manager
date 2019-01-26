unit Model.Config.Server;

interface

uses
  Ini.Ident,
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
    [TIdent('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [TIdent('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [TIdent('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [TIdent('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [TIdent('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TIdent('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TIdent('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TIdent('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [TIdent('TIMEOUTEXECUCAO')]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [TIdent('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

