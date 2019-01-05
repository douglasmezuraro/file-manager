unit Model.Config.Database;

interface

uses
  Ini.DataType,
  Ini.Key,
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
    [TKey('ESQUEMA', dtString)]
    property Schema: string read FSchema write FSchema;

    [TKey('NUMEROMAXIMOCONEXOES', dtInteger)]
    property MaxConnections: UInt8 read FMaxConnections write FMaxConnections;

    [TKey('NUMEROMINIMOCONEXOES', dtInteger)]
    property MinConnections: UInt8 read FMinConnections write FMinConnections;

    [TKey('TEMPODESCONEXAOCONEXAOINATIVA', dtInteger)]
    property DisconnectionTimeIdleConnection: UInt8 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TKey('TEMPOATUALIZACAOLOGCONEXOES', dtInteger)]
    property LogUpdateTime: UInt8 read FLogUpdateTime write FLogUpdateTime;

    [TKey('NUMEROLINHASFETCH', dtString)]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [TKey('TIPOACESSOBD', dtString)]
    property AccessType: string read FAccessType write FAccessType;

    [TKey('TIPOBANCO', dtString)]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TKey('ALIAS', dtString)]
    property Alias: string read FAlias write FAlias;
  end;

implementation

end.

