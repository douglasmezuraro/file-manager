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
  Model.Config.Workflow;

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
    property AlternativeBalancer: TAlternativeBalancer read FAlternativeBalancer write FAlternativeBalancer;
    property Application: TApplication read FApplication write FApplication;
    property Balancer: TBalancer read FBalancer write FBalancer;
    property Client: TClient read FClient write FClient;
    property Database: TDatabase read FDatabase write FDatabase;
    property DUnit: TDUnit read FDUnit write FDUnit;
    property Log: TLog read FLog write FLog;
    property Monitor: TMonitor read FMonitor write FMonitor;
    property Scanner: TScanner read FScanner write FScanner;
    property Server: TServer read FServer write FServer;
    property SPP: TSPP read FSPP write FSPP;
    property Update: TUpdate read FUpdate write FUpdate;
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

