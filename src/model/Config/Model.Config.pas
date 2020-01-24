unit Model.Config;

interface

uses
  Attribute.Component.Tab, Attribute.Ini.Section, Attribute.Managed, Model.Base, Model.Config.AlternativeBalancer,
  Model.Config.Application, Model.Config.Client, Model.Config.Database, Model.Config.DUnit, Model.Config.Log,
  Model.Config.Monitor, Model.Config.Scanner, Model.Config.Server, Model.Config.SPP, Model.Config.Update,
  Model.Config.Workflow;

type
  TConfig = class sealed(TModel)
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
    [Managed][Tab('Balanceador Alternativo')][Section('BALANCEADORALTERNATIVO')]
    property AlternativeBalancer: TAlternativeBalancer read FAlternativeBalancer write FAlternativeBalancer;

    [Managed][Tab('Aplicação')][Section('APLICACAO')]
    property Application: TApplication read FApplication write FApplication;

    [Managed][Tab('Cliente')][Section('CLIENTE')]
    property Client: TClient read FClient write FClient;

    [Managed][Tab('Database')][Section('DATABASE')]
    property Database: TDatabase read FDatabase write FDatabase;

    [Managed][Tab('DUnit')][Section('DUNIT')]
    property DUnit: TDUnit read FDUnit write FDUnit;

    [Managed][Tab('LOG')][Section('LOG')]
    property Log: TLog read FLog write FLog;

    [Managed][Tab('Monitor')][Section('SPMONITOR')]
    property Monitor: TMonitor read FMonitor write FMonitor;

    [Managed][Tab('Scanner')][Section('SCANNER')]
    property Scanner: TScanner read FScanner write FScanner;

    [Managed][Tab('Servidor')][Section('SERVIDOR')]
    property Server: TServer read FServer write FServer;

    [Managed][Tab('SPP')][Section('CLIENTESPP')]
    property SPP: TSPP read FSPP write FSPP;

    [Managed][Tab('Update')][Section('SPUPDATE')]
    property Update: TUpdate read FUpdate write FUpdate;

    [Managed][Tab('Fluxo de trabalho')][Section('FLUXOTRABALHO')]
    property Workflow: TWorkflow read FWorkflow write FWorkflow;
  end;

implementation

end.

