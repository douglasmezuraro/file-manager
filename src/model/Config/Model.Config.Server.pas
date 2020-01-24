unit Model.Config.Server;

interface

uses
  Attribute.Component.CheckBox, Attribute.Component.ComboBox, Attribute.Component.Edit, Attribute.Ini.Key,
  Attribute.Validation.Integer, Attribute.Validation.RegEx, Attribute.Validation.Text, Types.Utils;

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
    [TextAttribute(False)]
    [Edit('Nome')]
    [Key('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [RegExAttribute(False, TUtils.RegEx.GUID)]
    [Edit('GUID')]
    [Key('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [TextAttribute]
    [Edit('Nome do computador')]
    [Key('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [TextAttribute]
    [Edit('IP')]
    [Key('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [RegExAttribute(False, TUtils.RegEx.IP)]
    [Edit('Endereço de IP')]
    [Key('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TextAttribute(False)]
    [ComboBox('Tipo de conexão', 'Socket')]
    [Key('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [CheckBox('Pode balancear?')]
    [Key('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TextAttribute]
    [Edit('Nome do executável')]
    [Key('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [IntegerAttribute]
    [Edit('Timeout de execução')]
    [Key('TIMEOUTEXECUCAO')]
    property TimeOut: Integer read FTimeOut write FTimeOut;

    [CheckBox('Habilitar gerenciador de integração?')]
    [Key('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;

    [IntegerAttribute]
    [Edit('Porta')]
    [Key('PORTA')]
    property Port: Integer read FPort write FPort;
  end;

implementation

end.

