unit Model.Config.Database;

interface

uses
  Model.Config.Types;

type
  TDatabase = class
  private
    FLogUpdateTime: UInt8;
    FMaxConnections: UInt8;
    FDatabaseType: TDatabaseType;
    FAccessType: TBDAccessType;
    FFetchLines: UInt32;
    FMinConnections: UInt8;
    FAlias: string;
    FDisconnectionTimeIdleConnection: UInt8;
    FSchema: string;
  public
    property Schema: string read FSchema write FSchema;
    property MaxConnections: UInt8 read FMaxConnections write FMaxConnections;
    property MinConnections: UInt8 read FMinConnections write FMinConnections;
    property DisconnectionTimeIdleConnection: UInt8 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;
    property LogUpdateTime: UInt8 read FLogUpdateTime write FLogUpdateTime;
    property FetchLines: UInt32 read FFetchLines write FFetchLines;
    property AccessType: TBDAccessType read FAccessType write FAccessType default atSQLD;
    property DatabaseType: TDatabaseType read FDatabaseType write FDatabaseType;
    property Alias: string read FAlias write FAlias;
  end;

implementation

end.
