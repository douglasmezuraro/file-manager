unit Model.Config;

interface

uses
  Types.RegisterClass,
  Ini.Attribute.Section,
  Component.Attribute,
  Ini.Base,
  Model.Config.AlternativeBalancer,
  Model.Config.Application,
  Model.Config.Client,
  Model.Config.Database,
  Model.Config.DUnit,
  Model.Config.Log,
  Model.Config.Monitor,
  Model.Config.Scanner,
  Model.Config.Server,
  Model.Config.SPP,
  Model.Config.Update,
  Model.Config.Workflow;

type
  TConfig = class sealed(TIniMappedObject)
  private
    FWorkflow: TWorkflow;
    FMonitor: TMonitor;
    FSPP: TSPP;
    FDUnit: TDUnit;
    FScanner: TScanner;
    FLog: TLog;
    FDatabase: TDatabase;
    FUpdate: TUpdate;
    FApplication: TApplication;
    FServer: TServer;
    FClient: TClient;
    FAlternativeBalancer: TAlternativeBalancer;
  public
    [TManaged][TTabItem('Balanceador Alternativo')][TSection('BALANCEADORALTERNATIVO')]
    property AlternativeBalancer: TAlternativeBalancer read FAlternativeBalancer write FAlternativeBalancer;

    [TManaged][TTabItem('Aplicação')][TSection('APLICACAO')]
    property Application: TApplication read FApplication write FApplication;

    [TManaged][TTabItem('Cliente')][TSection('CLIENTE')]
    property Client: TClient read FClient write FClient;

    [TManaged][TTabItem('Database')][TSection('DATABASE')]
    property Database: TDatabase read FDatabase write FDatabase;

    [TManaged][TTabItem('DUnit')][TSection('DUNIT')]
    property DUnit: TDUnit read FDUnit write FDUnit;

    [TManaged][TTabItem('LOG')][TSection('LOG')]
    property Log: TLog read FLog write FLog;

    [TManaged][TTabItem('Monitor')][TSection('SPMONITOR')]
    property Monitor: TMonitor read FMonitor write FMonitor;

    [TManaged][TTabItem('Scanner')][TSection('SCANNER')]
    property Scanner: TScanner read FScanner write FScanner;

    [TManaged][TTabItem('Servidor')][TSection('SERVIDOR')]
    property Server: TServer read FServer write FServer;

    [TManaged][TTabItem('SPP')][TSection('CLIENTESPP')]
    property SPP: TSPP read FSPP write FSPP;

    [TManaged][TTabItem('Update')][TSection('SPUPDATE')]
    property Update: TUpdate read FUpdate write FUpdate;

    [TManaged][TTabItem('Fluxo de trabalho')][TSection('FLUXOTRABALHO')]
    property Workflow: TWorkflow read FWorkflow write FWorkflow;
  end;

implementation

initialization
  RegisteredClasses.RegisterClass(TConfig);

finalization
  RegisteredClasses.UnRegisterClass(TConfig);

end.

