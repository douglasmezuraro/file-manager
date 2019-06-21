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
  Model.Config.Workflow;

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
    [Tab('Aplicação')]
    [Section('APLICACAO')]
    property Application: TApplication read FApplication write FApplication;

    [Tab('Cliente')]
    [Section('CLIENTE')]
    property Client: TClient read FClient write FClient;

    [Tab('Database')]
    [Section('DATABASE')]
    property Database: TDatabase read FDatabase write FDatabase;

    [Tab('DUnit')]
    [Section('DUNIT')]
    property DUnit: TDUnit read FDUnit write FDUnit;

    [Tab('LOG')]
    [Section('LOG')]
    property Log: TLog read FLog write FLog;

    [Tab('Monitor')]
    [Section('SPMONITOR')]
    property Monitor: TMonitor read FMonitor write FMonitor;

    [Tab('Scanner')]
    [Section('SCANNER')]
    property Scanner: TScanner read FScanner write FScanner;

    [Tab('Servidor')]
    [Section('SERVIDOR')]
    property Server: TServer read FServer write FServer;

    [Tab('SPP')]
    [Section('CLIENTESPP')]
    property SPP: TSPP read FSPP write FSPP;

    [Tab('Update')]
    [Section('SPUPDATE')]
    property Update: TUpdate read FUpdate write FUpdate;

    [Tab('Fluxo de trabalho')]
    [Section('FLUXOTRABALHO')]
    property Workflow: TWorkflow read FWorkflow write FWorkflow;
  end;

implementation

end.

