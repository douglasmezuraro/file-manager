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
    FServerExeName: string;
    FComputerName: string;
    FCanBalance: Boolean;
    FIntegrationManager: Boolean;
    FTimeOut: UInt16;
    FGUID: string;
    FIP: string;
  public
    [TKey('NOMESERVIDOR', dtString)]
    property Name: string read FName write FName;

    [TKey('GUIDSERVIDOR', dtString)]
    property GUID: string read FGUID write FGUID;

    [TKey('NOMECOMPUTADOR', dtString)]
    property ComputerName: string read FComputerName write FComputerName;

    [TKey('IPSERVIDOR', dtString)]
    property IP: string read FIP write FIP;

    [TKey('TIPOCONEXAO', dtString)]
    property ConnectionType: string read FConnectionType write FConnectionType;

    [TKey('PODEBALANCEAR', dtBool)]
    property CanBalance: Boolean read FCanBalance write FCanBalance;

    [TKey('NOMEEXECUTAVELSERVIDOR', dtString)]
    property ServerExeName: string read FServerExeName write FServerExeName;

    [TKey('TIMEOUTEXECUCAO', dtInteger)]
    property TimeOut: UInt16 read FTimeOut write FTimeOut;

    [TKey('HABILITAGERENCIADORINTEGRACAO', dtBool)]
    property IntegrationManager: Boolean read FIntegrationManager write FIntegrationManager;
  end;

implementation

end.

