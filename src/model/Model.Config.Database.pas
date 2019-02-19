unit Model.Config.Database;

interface

uses
  Attribute.Control,
  Attribute.Ini;

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
    [Edit('Esquema')]
    [Ident('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [Edit('Número máximo de conexões')]
    [Ident('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [Edit('Número mínimo de conexões')]
    [Ident('NUMEROMINIMOCONEXOES')]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [Edit('Tempo de desconexçai de conexão inativa')]
    [Ident('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [Edit('Tempo de atualização de log de conexões')]
    [Ident('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [Edit('Número de linhas para fetch')]
    [Ident('NUMEROLINHASFETCH')]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [ComboBox('Tipo de acesso', ',SQLd,FireDAC')]
    [Ident('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [ComboBox('Tipo de banco', ',Oracle,SQLServer,DB2')]
    [Ident('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [Edit('Alias')]
    [Ident('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [Edit('Server')]
    [Ident('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

