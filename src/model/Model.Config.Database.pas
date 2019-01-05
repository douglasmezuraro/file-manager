unit Model.Config.Database;

interface

uses
  Ini.Section;

type
  [TSection('DATABASE')]
  TDatabase = class
  private
    FLogUpdateTime: UInt8;
    FMaxConnections: UInt8;
    FDatabaseType: string;
    FAccessType: string;
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
    property AccessType: string read FAccessType write FAccessType;
    property DatabaseType: string read FDatabaseType write FDatabaseType;
    property Alias: string read FAlias write FAlias;
  end;

implementation

end.

