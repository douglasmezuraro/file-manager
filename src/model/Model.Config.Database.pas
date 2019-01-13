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
    [TKey('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [TKey('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [TKey('NUMEROMINIMOCONEXOES')]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [TKey('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TKey('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TKey('NUMEROLINHASFETCH')]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [TKey('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [TKey('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TKey('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [TKey('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

