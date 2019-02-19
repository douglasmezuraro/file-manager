unit Model.Config.Database;

interface

uses
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
    [TEditAttribute('Esquema')]
    [TIdent('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [TEditAttribute('Número máximo de conexões')]
    [TIdent('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [TEditAttribute('Número mínimo de conexões')]
    [TIdent('NUMEROMINIMOCONEXOES')]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [TEditAttribute('Tempo de desconexçai de conexão inativa')]
    [TIdent('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TEditAttribute('Tempo de atualização de log de conexões')]
    [TIdent('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TEditAttribute('Número de linhas para fetch')]
    [TIdent('NUMEROLINHASFETCH')]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [TComboBoxAttribute('Tipo de acesso', ',SQLd,FireDAC')]
    [TIdent('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [TComboBoxAttribute('Tipo de banco', ',Oracle,SQLServer,DB2')]
    [TIdent('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TEditAttribute('Alias')]
    [TIdent('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [TEditAttribute('Server')]
    [TIdent('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

