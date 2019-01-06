unit Model.Config.Server;

interface

uses
  Ini.DataType,
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
    [TKey('NOMESERVIDOR', dtString)]
    property Name: string read FName write FName;

    [TKey('GUIDSERVIDOR', dtString)]
    property GUID: string read FGUID write FGUID;

    [TKey('NOMECOMPUTADOR', dtString)]
    property ComputerName: string read FComputerName write FComputerName;

    [TKey('IPSERVIDOR', dtString)]
    property IPServer: string read FIPServer write FIPServer;

    [TKey('ENDERECOIP', dtString)]
    property IPAddress: string read FIPAddress write FIPAddress;

    [TKey('TIPOCONEXAO', dtString)]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TKey('PODEBALANCEAR', dtBool)]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TKey('NOMEEXECUTAVELSERVIDOR', dtString)]
    property ExeName: string read FExeName write FExeName;

    [TKey('TIMEOUTEXECUCAO', dtInteger)]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [TKey('HABILITAGERENCIADORINTEGRACAO', dtBool)]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

