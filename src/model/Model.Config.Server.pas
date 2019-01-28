unit Model.Config.Server;

interface

uses
  Attribute.Caption,
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
    [TCaption('Nome')]
    [TIdent('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [TCaption('GUID')]
    [TIdent('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [TCaption('Nome do computador')]
    [TIdent('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [TCaption('IP')]
    [TIdent('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [TCaption('Endereço de IP')]
    [TIdent('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TCaption('Tipo de conexão', ';Socket')]
    [TIdent('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TCaption('Pode balancear?')]
    [TIdent('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TCaption('Nome do executável')]
    [TIdent('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [TCaption('Timeout de execução')]
    [TIdent('TIMEOUTEXECUCAO')]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [TCaption('Habilitar gerenciador de integração?')]
    [TIdent('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

