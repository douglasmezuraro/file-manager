unit Model.Config;

interface

uses
  Attribute.Control,
  Attribute.Ini,
  Model.Base,
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
  Model.Config.Workflow,
  System.SysUtils;

type
  TConfig = class(TModel)
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
  public
    [TabItem('Aplicação')]
    [Section('APLICACAO')]
    property Application: TApplication read FApplication write FApplication;

    [TabItem('Cliente')]
    [Section('CLIENTE')]
    property Client: TClient read FClient write FClient;

    [TabItem('Database')]
    [Section('DATABASE')]
    property Database: TDatabase read FDatabase write FDatabase;

    [TabItem('DUnit')]
    [Section('DUNIT')]
    property DUnit: TDUnit read FDUnit write FDUnit;

    [TabItem('LOG')]
    [Section('LOG')]
    property Log: TLog read FLog write FLog;

    [TabItem('Monitor')]
    [Section('SPMONITOR')]
    property Monitor: TMonitor read FMonitor write FMonitor;

    [TabItem('Scanner')]
    [Section('SCANNER')]
    property Scanner: TScanner read FScanner write FScanner;

    [TabItem('Servidor')]
    [Section('SERVIDOR')]
    property Server: TServer read FServer write FServer;

    [TabItem('SPP')]
    [Section('CLIENTESPP')]
    property SPP: TSPP read FSPP write FSPP;

    [TabItem('Update')]
    [Section('SPUPDATE')]
    property Update: TUpdate read FUpdate write FUpdate;

    [TabItem('Fluxo de trabalho')]
    [Section('FLUXOTRABALHO')]
    property Workflow: TWorkflow read FWorkflow write FWorkflow;
  end;

implementation

end.

