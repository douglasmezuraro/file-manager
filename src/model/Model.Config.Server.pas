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
    FTimeOut: Integer;
    FGUID: string;
    FIPServer: string;
    FIPAddress: string;
    FPort: Integer;
  public
    [Edit('Nome')]
    [Key('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [Edit('GUID')]
    [Key('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [Edit('Nome do computador')]
    [Key('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [Edit('IP')]
    [Key('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [Edit('Endereço de IP')]
    [Key('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [ComboBox('Tipo de conexão', 'Socket')]
    [Key('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [CheckBox('Pode balancear?')]
    [Key('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [Edit('Nome do executável')]
    [Key('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [Edit('Timeout de execução')]
    [Key('TIMEOUTEXECUCAO')]
    property TimeOut: Integer read FTimeOut write FTimeOut;

    [CheckBox('Habilitar gerenciador de integração?')]
    [Key('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;

    [Edit('Porta')]
    [Key('PORTA')]
    property Port: Integer read FPort write FPort;
  end;

implementation

end.

