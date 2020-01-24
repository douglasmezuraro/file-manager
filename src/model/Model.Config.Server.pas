unit Model.Config.Server;

interface

uses
  Attribute.Ini,
  Attribute.Validation,
  Types.Utils;

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
    [StringAttribute(False)]
    [Edit('Nome')]
    [Key('NOMESERVIDOR')]
    property Name: string read FName write FName;

    [RegExAttribute(False, TUtils.RegEx.GUID)]
    [Edit('GUID')]
    [Key('GUIDSERVIDOR')]
    property GUID: string read FGUID write FGUID;

    [StringAttribute]
    [Edit('Nome do computador')]
    [Key('NOMECOMPUTADOR')]
    property ComputerName: string read FComputerName write FComputerName;

    [StringAttribute]
    [Edit('IP')]
    [Key('IPSERVIDOR')]
    property IPServer: string read FIPServer write FIPServer;

    [RegExAttribute(False, TUtils.RegEx.IP)]
    [Edit('Endere�o de IP')]
    [Key('ENDERECOIP')]
    property IPAddress: string read FIPAddress write FIPAddress;

    [StringAttribute(False)]
    [ComboBox('Tipo de conex�o', 'Socket')]
    [Key('TIPOCONEXAO')]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [CheckBox('Pode balancear?')]
    [Key('PODEBALANCEAR')]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [StringAttribute]
    [Edit('Nome do execut�vel')]
    [Key('NOMEEXECUTAVELSERVIDOR')]
    property ExeName: string read FExeName write FExeName;

    [IntegerAttribute]
    [Edit('Timeout de execu��o')]
    [Key('TIMEOUTEXECUCAO')]
    property TimeOut: Integer read FTimeOut write FTimeOut;

    [CheckBox('Habilitar gerenciador de integra��o?')]
    [Key('HABILITAGERENCIADORINTEGRACAO')]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;

    [IntegerAttribute]
    [Edit('Porta')]
    [Key('PORTA')]
    property Port: Integer read FPort write FPort;
  end;

implementation

end.

