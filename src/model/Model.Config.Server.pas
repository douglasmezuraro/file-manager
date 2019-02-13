unit Model.Config.Server;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
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
    [TControl('Nome')]
    [TIdent('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [TControl('GUID')]
    [TIdent('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [TControl('Nome do computador')]
    [TIdent('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [TControl('IP')]
    [TIdent('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [TControl('Endereço de IP')]
    [TIdent('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TControl('Tipo de conexão', ',Socket')]
    [TIdent('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TControl('Pode balancear?')]
    [TIdent('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TControl('Nome do executável')]
    [TIdent('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [TControl('Timeout de execução')]
    [TIdent('TIMEOUTEXECUCAO')]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [TControl('Habilitar gerenciador de integração?')]
    [TIdent('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

