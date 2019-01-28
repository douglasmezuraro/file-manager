unit Model.Config.Database;

interface

uses
  Attribute.Caption,
  Attribute.Ident,
  Util.Constants;

type
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
    [TCaption('Esquema')]
    [TIdent('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [TCaption('Número máximo de conexões')]
    [TIdent('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [TCaption('Número mínimo de conexões')]
    [TIdent('NUMEROMINIMOCONEXOES')]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [TCaption('Tempo de desconexçai de conexão inativa')]
    [TIdent('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TCaption('Tempo de atualização de log de conexões')]
    [TIdent('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TCaption('Número de linhas para fetch')]
    [TIdent('NUMEROLINHASFETCH')]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [TCaption('Tipo de acesso')]
    [TIdent('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [TCaption('Tipo de banco')]
    [TIdent('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TCaption('Alias')]
    [TIdent('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [TCaption('Server')]
    [TIdent('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

