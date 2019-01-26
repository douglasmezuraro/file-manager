unit Model.Config.Database;

interface

uses
  Ini.Ident,
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
    [TIdent('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [TIdent('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [TIdent('NUMEROMINIMOCONEXOES')]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [TIdent('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TIdent('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TIdent('NUMEROLINHASFETCH')]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [TIdent('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [TIdent('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TIdent('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [TIdent('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

