unit Model.Config.Database;

interface

uses
  Ini.Key,
  Ini.Section;

type
  [TSection('DATABASE')]
  TDatabase = class
  private
    FConnectionLogUpdateTime: UInt32;
    FMaxConnections: UInt32;
    FDatabaseType: string;
    FAccessType: string;
    FFetchLines: UInt32;
    FMinConnections: UInt32;
    FAlias: string;
    FDisconnectionTimeIdleConnection: UInt32;
    FSchema: string;
    FServer: string;
  public
    [TKey('ESQUEMA', dtString)]
    property Schema: string read FSchema write FSchema;

    [TKey('NUMEROMAXIMOCONEXOES', dtInteger)]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [TKey('NUMEROMINIMOCONEXOES', dtInteger)]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [TKey('TEMPODESCONEXAOCONEXAOINATIVA', dtInteger)]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TKey('TEMPOATUALIZACAOLOGCONEXOES', dtInteger)]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TKey('NUMEROLINHASFETCH', dtInteger)]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [TKey('TIPOACESSOBD', dtString)]
    property AccessType: string read FAccessType write FAccessType;

    [TKey('TIPOBANCO', dtString)]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TKey('ALIAS', dtString)]
    property Alias: string read FAlias write FAlias;

    [TKey('SERVER', dtString)]
    property Server: string read FServer write FServer;
  end;

implementation

end.

