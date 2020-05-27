unit Model.Config.Server;

interface

uses
  Component.Attribute.CheckBox,
  Component.Attribute.ComboBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute;

type
  TServer = class sealed
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
    [TTextAttribute(False)]
    [TEdit('Nome')]
    [TKey('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [TRegExAttribute(False, '\{([0-9A-z]){8}(\-([0-9A-z]){4}){3}\-([0-9A-z]){12}\}')]
    [TEdit('GUID')]
    [TKey('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [TTextAttribute]
    [TEdit('Nome do computador')]
    [TKey('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [TTextAttribute]
    [TEdit('IP')]
    [TKey('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [TRegExAttribute(False, '(([0-9]{1,3}.){3}[0-9]{1,3})|localhost\b')]
    [TEdit('Endereço de IP')]
    [TKey('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TTextAttribute(False)]
    [TComboBox('Tipo de conexão', 'Socket')]
    [TKey('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TCheckBox('Pode balancear?')]
    [TKey('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TTextAttribute]
    [TEdit('Nome do executável')]
    [TKey('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [TIntegerAttribute]
    [TEdit('Timeout de execução')]
    [TKey('TIMEOUTEXECUCAO')]
    property TimeOut: Integer read FTimeOut write FTimeOut;

    [TCheckBox('Habilitar gerenciador de integração?')]
    [TKey('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;

    [TIntegerAttribute]
    [TEdit('Porta')]
    [TKey('PORTA')]
    property Port: Integer read FPort write FPort;
  end;

implementation

end.

