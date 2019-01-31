unit Model.Config.Database;

interface

uses
  Attribute.Control,
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
    [TControl('Esquema')]
    [TIdent('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [TControl('N�mero m�ximo de conex�es')]
    [TIdent('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [TControl('N�mero m�nimo de conex�es')]
    [TIdent('NUMEROMINIMOCONEXOES')]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [TControl('Tempo de desconex�ai de conex�o inativa')]
    [TIdent('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TControl('Tempo de atualiza��o de log de conex�es')]
    [TIdent('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TControl('N�mero de linhas para fetch')]
    [TIdent('NUMEROLINHASFETCH')]
    property FetchLines: UInt32 read FFetchLines write FFetchLines;

    [TControl('Tipo de acesso', ';SQLd;FireDAC')]
    [TIdent('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [TControl('Tipo de banco', ';Oracle;SQLServer;DB2')]
    [TIdent('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TControl('Alias')]
    [TIdent('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [TControl('Server')]
    [TIdent('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

