unit Model.Config.Database;

interface

uses
  Attribute.Control,
  Attribute.Ini;

type
  TDatabase = class
  private
    FConnectionLogUpdateTime: Integer;
    FMaxConnections: Integer;
    FDatabaseType: string;
    FAccessType: string;
    FFetchLines: Integer;
    FMinConnections: Integer;
    FAlias: string;
    FDisconnectionTimeIdleConnection: Integer;
    FSchema: string;
    FServer: string;
  public
    [Edit('Esquema')]
    [Ident('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [Edit('N�mero m�ximo de conex�es')]
    [Ident('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: Integer read FMaxConnections write FMaxConnections;

    [Edit('N�mero m�nimo de conex�es')]
    [Ident('NUMEROMINIMOCONEXOES')]
    property MinConnections: Integer read FMinConnections write FMinConnections;

    [Edit('Tempo de desconex�ai de conex�o inativa')]
    [Ident('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: Integer read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [Edit('Tempo de atualiza��o de log de conex�es')]
    [Ident('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: Integer read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [Edit('N�mero de linhas para fetch')]
    [Ident('NUMEROLINHASFETCH')]
    property FetchLines: Integer read FFetchLines write FFetchLines;

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

