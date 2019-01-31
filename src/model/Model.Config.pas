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

  Attribute.Section,
  Attribute.Control;

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

    [TControl('Balanceador alternativo')]
    [TSection('BALANCEADORALTERNATIVO')]
    property AlternativeBalancer: TAlternativeBalancer read FAlternativeBalancer write FAlternativeBalancer;

    [TControl('Aplicação')]
    [TSection('APLICACAO')]
    property Application: TApplication read FApplication write FApplication;

    [TControl('Balanceador')]
    [TSection('SPBALANCEADOR')]
    property Balancer: TBalancer read FBalancer write FBalancer;

    [TControl('Cliente')]
    [TSection('CLIENTE')]
    property Client: TClient read FClient write FClient;

    [TControl('Database')]
    [TSection('DATABASE')]
    property Database: TDatabase read FDatabase write FDatabase;

    [TControl('DUnit')]
    [TSection('DUNIT')]
    property DUnit: TDUnit read FDUnit write FDUnit;

    [TControl('LOG')]
    [TSection('LOG')]
    property Log: TLog read FLog write FLog;

    [TControl('Monitor')]
    [TSection('SPMONITOR')]
    property Monitor: TMonitor read FMonitor write FMonitor;

    [TControl('Scanner')]
    [TSection('SCANNER')]
    property Scanner: TScanner read FScanner write FScanner;

    [TControl('Servidor')]
    [TSection('SERVIDOR')]
    property Server: TServer read FServer write FServer;

    [TControl('SPP')]
    [TSection('CLIENTESPP')]
    property SPP: TSPP read FSPP write FSPP;

    [TControl('Update')]
    [TSection('SPUPDATE')]
    property Update: TUpdate read FUpdate write FUpdate;

    [TControl('Fluxo de trabalho')]
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

