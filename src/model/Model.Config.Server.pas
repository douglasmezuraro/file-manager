unit Model.Config.Server;

interface

uses
  Attribute.Control,
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
    [Edit('Nome')]
    [Ident('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [Edit('GUID')]
    [Ident('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [Edit('Nome do computador')]
    [Ident('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [Edit('IP')]
    [Ident('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [Edit('Endereço de IP')]
    [Ident('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [ComboBox('Tipo de conexão', ',Socket')]
    [Ident('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [CheckBox('Pode balancear?')]
    [Ident('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [Edit('Nome do executável')]
    [Ident('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [Edit('Timeout de execução')]
    [Ident('TIMEOUTEXECUCAO')]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [CheckBox('Habilitar gerenciador de integração?')]
    [Ident('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

