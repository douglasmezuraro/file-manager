unit Model.Config.Database;

interface

uses
  Attribute.Control,
  Attribute.Ini,
  Attribute.Validation;

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
    [StringAttribute(False)]
    [Edit('Esquema')]
    [Key('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [IntegerAttribute(False)]
    [Edit('Número máximo de conexões')]
    [Key('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: Integer read FMaxConnections write FMaxConnections;

    [IntegerAttribute(False)]
    [Edit('Número mínimo de conexões')]
    [Key('NUMEROMINIMOCONEXOES')]
    property MinConnections: Integer read FMinConnections write FMinConnections;

    [IntegerAttribute(False)]
    [Edit('Tempo de desconexão quando inativa')]
    [Key('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: Integer read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [IntegerAttribute(False)]
    [Edit('Tempo de atualização de log de conexões')]
    [Key('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: Integer read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [IntegerAttribute(False)]
    [Edit('Número de linhas para fetch')]
    [Key('NUMEROLINHASFETCH')]
    property FetchLines: Integer read FFetchLines write FFetchLines;

    [StringAttribute(False)]
    [ComboBox('Tipo de acesso', 'SQLd,FireDAC')]
    [Key('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [StringAttribute(False)]
    [ComboBox('Tipo de banco', 'Oracle,SQLServer,DB2')]
    [Key('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [StringAttribute(False)]
    [Edit('Alias')]
    [Key('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [StringAttribute]
    [Edit('Server')]
    [Key('SERVER')]
    property Server: string read FServer write FServer;
  end;

implementation

end.

