unit Model.Config;

interface

uses
  Model.Config.AlternativeBalancer,
  Model.Config.Application,
  Model.Config.Balancer,
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

  Attribute.Ini;

type
  TConfig = class
  private
    FWorkflow: TWorkflow;
    FMonitor: TMonitor;
    FSPP: TSPP;
    FDUnit: TDUnit;
    FBalancer: TBalancer;
    FScanner: TScanner;
    FLog: TLog;
    FDatabase: TDatabase;
    FAlternativeBalancer: TAlternativeBalancer;
    FUpdate: TUpdate;
    FApplication: TApplication;
    FServer: TServer;
    FClient: TClient;
  public
    constructor Create;
    destructor Destroy; override;

    [TTabItemAttribute('Balanceador alternativo')]
    [TSection('BALANCEADORALTERNATIVO')]
    property AlternativeBalancer: TAlternativeBalancer read FAlternativeBalancer write FAlternativeBalancer;

    [TTabItemAttribute('Aplicação')]
    [TSection('APLICACAO')]
    property Application: TApplication read FApplication write FApplication;

    [TTabItemAttribute('Balanceador')]
    [TSection('SPBALANCEADOR')]
    property Balancer: TBalancer read FBalancer write FBalancer;

    [TTabItemAttribute('Cliente')]
    [TSection('CLIENTE')]
    property Client: TClient read FClient write FClient;

    [TTabItemAttribute('Database')]
    [TSection('DATABASE')]
    property Database: TDatabase read FDatabase write FDatabase;

    [TTabItemAttribute('DUnit')]
    [TSection('DUNIT')]
    property DUnit: TDUnit read FDUnit write FDUnit;

    [TTabItemAttribute('LOG')]
    [TSection('LOG')]
    property Log: TLog read FLog write FLog;

    [TTabItemAttribute('Monitor')]
    [TSection('SPMONITOR')]
    property Monitor: TMonitor read FMonitor write FMonitor;

    [TTabItemAttribute('Scanner')]
    [TSection('SCANNER')]
    property Scanner: TScanner read FScanner write FScanner;

    [TTabItemAttribute('Servidor')]
    [TSection('SERVIDOR')]
    property Server: TServer read FServer write FServer;

    [TTabItemAttribute('SPP')]
    [TSection('CLIENTESPP')]
    property SPP: TSPP read FSPP write FSPP;

    [TTabItemAttribute('Update')]
    [TSection('SPUPDATE')]
    property Update: TUpdate read FUpdate write FUpdate;

    [TTabItemAttribute('Fluxo de trabalho')]
    [TSection('FLUXOTRABALHO')]
    property Workflow: TWorkflow read FWorkflow write FWorkflow;
  end;

implementation

{ TConfig }

constructor TConfig.Create;
begin
  FWorkflow := TWorkflow.Create;
  FMonitor := TMonitor.Create;
  FSPP := TSPP.Create;
  FDUnit := TDUnit.Create;
  FBalancer := TBalancer.Create;
  FScanner := TScanner.Create;
  FLog := TLog.Create;
  FDatabase := TDatabase.Create;
  FAlternativeBalancer := TAlternativeBalancer.Create;
  FUpdate := TUpdate.Create;
  FApplication := TApplication.Create;
  FServer := TServer.Create;
  FClient := TClient.Create;
end;

destructor TConfig.Destroy;
begin
  FWorkflow.Free;
  FMonitor.Free;
  FSPP.Free;
  FDUnit.Free;
  FBalancer.Free;
  FScanner.Free;
  FLog.Free;
  FDatabase.Free;
  FAlternativeBalancer.Free;
  FUpdate.Free;
  FApplication.Free;
  FServer.Free;
  FClient.Free;
  inherited;
end;

end.

