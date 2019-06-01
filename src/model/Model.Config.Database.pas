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
    [Key('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [Edit('N�mero m�ximo de conex�es')]
    [Key('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: Integer read FMaxConnections write FMaxConnections;

    [Edit('N�mero m�nimo de conex�es')]
    [Key('NUMEROMINIMOCONEXOES')]
    property MinConnections: Integer read FMinConnections write FMinConnections;

    [Edit('Tempo de desconex�o quando inativa')]
    [Key('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: Integer read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [Edit('Tempo de atualiza��o de log de conex�es')]
    [Key('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: Integer read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [Edit('N�mero de linhas para fetch')]
    [Key('NUMEROLINHASFETCH')]
    property FetchLines: Integer read FFetchLines write FFetchLines;

    [ComboBox('Tipo de acesso', ',SQLd,FireDAC')]
    [Key('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [ComboBox('Tipo de banco', ',Oracle,SQLServer,DB2')]
    [Key('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [Edit('Alias')]
    [Key('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [Edit('Server')]
    [Key('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

