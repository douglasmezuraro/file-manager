unit Model.Config.Database;

interface

uses
  Attribute.Component.ComboBox, Attribute.Component.Edit, Attribute.Ini.Key, Attribute.Validation.Integer,
  Attribute.Validation.Text;

type
  TDatabase = class sealed
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
    [TextAttribute(False)]
    [ComboBox('Tipo de acesso', 'SQLd,FireDAC')]
    [Key('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [TextAttribute(False)]
    [ComboBox('Tipo de banco', 'Oracle,SQLServer,DB2')]
    [Key('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TextAttribute(False)]
    [Edit('Alias')]
    [Key('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [TextAttribute]
    [Edit('Server')]
    [Key('SERVER')]
    property Server: string read FServer write FServer;

    [TextAttribute(False)]
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
  end;

implementation

end.

