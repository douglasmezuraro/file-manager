unit Model.Config.Database;

interface

uses
  Component.Attribute.ComboBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute;

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
    [TTextAttribute(False)]
    [TComboBox('Tipo de acesso', 'SQLd,FireDAC')]
    [TKey('TIPOACESSOBD')]
    property AccessType: string read FAccessType write FAccessType;

    [TTextAttribute(False)]
    [TComboBox('Tipo de banco', 'Oracle,SQLServer,DB2')]
    [TKey('TIPOBANCO')]
    property DatabaseType: string read FDatabaseType write FDatabaseType;

    [TTextAttribute(False)]
    [TEdit('Alias')]
    [TKey('ALIAS')]
    property Alias: string read FAlias write FAlias;

    [TTextAttribute]
    [TEdit('Server')]
    [TKey('SERVER')]
    property Server: string read FServer write FServer;

    [TTextAttribute(False)]
    [TEdit('Esquema')]
    [TKey('ESQUEMA')]
    property Schema: string read FSchema write FSchema;

    [TIntegerAttribute(False)]
    [TEdit('N�mero m�ximo de conex�es')]
    [TKey('NUMEROMAXIMOCONEXOES')]
    property MaxConnections: Integer read FMaxConnections write FMaxConnections;

    [TIntegerAttribute(False)]
    [TEdit('N�mero m�nimo de conex�es')]
    [TKey('NUMEROMINIMOCONEXOES')]
    property MinConnections: Integer read FMinConnections write FMinConnections;

    [TIntegerAttribute(False)]
    [TEdit('Tempo de desconex�o quando inativa')]
    [TKey('TEMPODESCONEXAOCONEXAOINATIVA')]
    property DisconnectionTimeIdleConnection: Integer read FDisconnectionTimeIdleConnection write FDisconnectionTimeIdleConnection;

    [TIntegerAttribute(False)]
    [TEdit('Tempo de atualiza��o de log de conex�es')]
    [TKey('TEMPOATUALIZACAOLOGCONEXOES')]
    property ConnectionLogUpdateTime: Integer read FConnectionLogUpdateTime write FConnectionLogUpdateTime;

    [TIntegerAttribute(False)]
    [TEdit('N�mero de linhas para fetch')]
    [TKey('NUMEROLINHASFETCH')]
    property FetchLines: Integer read FFetchLines write FFetchLines;
  end;

implementation

end.

