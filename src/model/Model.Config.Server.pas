unit Model.Config.Server;

interface

uses
  Attribute.Ini;

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
    [TEditAttribute('Nome')]
    [TIdent('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [TEditAttribute('GUID')]
    [TIdent('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [TEditAttribute('Nome do computador')]
    [TIdent('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [TEditAttribute('IP')]
    [TIdent('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [TEditAttribute('Endereço de IP')]
    [TIdent('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TComboBoxAttribute('Tipo de conexão', ',Socket')]
    [TIdent('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TCheckBoxAttribute('Pode balancear?')]
    [TIdent('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TEditAttribute('Nome do executável')]
    [TIdent('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [TEditAttribute('Timeout de execução')]
    [TIdent('TIMEOUTEXECUCAO')]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [TCheckBoxAttribute('Habilitar gerenciador de integração?')]
    [TIdent('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

