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

    [TEditAttribute('N�mero m�ximo de conex�es')]
    [TIdent('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: UInt32 read FMaxConnections write FMaxConnections;

    [TEditAttribute('N�mero m�nimo de conex�es')]
    [TIdent('NUMEROMINIMOCONEXOES')]
    property MinConnections: UInt32 read FMinConnections write FMinConnections;

    [TEditAttribute('Tempo de desconex�ai de conex�o inativa')]
    [TIdent('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: UInt32 read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TEditAttribute('Tempo de atualiza��o de log de conex�es')]
    [TIdent('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: UInt32 read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TEditAttribute('N�mero de linhas para fetch')]
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

