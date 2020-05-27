unit Model.Config.Monitor;

interface

uses
  Component.Attribute.CheckBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key;

type
  TMonitor = class sealed
  private
    FAutoIndentSQL: Boolean;
    FUseRegExFilters: Boolean;
    FVisibleColumns: string;
    FErrorColor: Integer;
    FLoadOnlyLevelZeroLogs: Boolean;
    FLoadLatestLog: Boolean;
    FAutoUpdateCriticalSections: Boolean;
    FUserTimer: Integer;
    FWindowsAlwaysOnTop: Boolean;
    FAutoUpdatePool: Boolean;
    FUseCrashErrorColor: Boolean;
    FGotoLastLog: Boolean;
    FOpenTransactionColor: Integer;
    FIgnoreExtraLog: Boolean;
    FDependentMethodTimer: Integer;
    FInitialPerformanceColor: Integer;
    FAutoEvalueCrash: Boolean;
    FPoolTimer: Integer;
    FMinTimeForPerformanceAnalysis: Integer;
    FAutoGotoLastLog: Boolean;
    FCriticalSectionTimer: Integer;
    FAutoUpdateUsers: Boolean;
    FLogPath: string;
    FFinalPerformanceColor: Integer;
    FRegisterServerPoolAplicationMemory: Boolean;
    FAutoUpdateDependentMethods: Boolean;
    FMinTimeUnitForInactiveUser: string;
    FMinTimeForInactiveUser: Integer;
    FMinTimeForDependentMethods: Integer;
    FAutoRereadLog: Boolean;
    FLogTimer: Integer;
  public
    [TEdit('Timer do log')]
    [TKey('TIMERLOG')]
    property LogTimer: Integer read FLogTimer write FLogTimer;

    [TEdit('Timer dos usu�rios')]
    [TKey('TIMERUSUARIOS')]
    property UserTimer: Integer read FUserTimer write FUserTimer;

    [TCheckBox('Releitura autom�tica?')]
    [TKey('RELEITURAAUTOMATICALOG')]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [TCheckBox('Avaliar travamento autom�tico?')]
    [TKey('AVALIATRAVAMENTOAUTOMATICO')]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [TCheckBox('Posicionar automaticamente no �ltimo log?')]
    [TKey('POSICIONAULTIMOLOGAUTOMATICO')]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [TCheckBox('Atualiza��o autom�tica de usu�rios')]
    [TKey('ATUALIZACAOAUTOMATICAUSUARIOS')]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [TCheckBox('Carregar log mais recente?')]
    [TKey('CARREGARLOGMAISRECENTE')]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [TEdit('Diret�rio do log')]
    [TKey('DIRETORIOLOG')]
    property LogPath: string read FLogPath write FLogPath;

    [TEdit('Timer de m�todos pendentes')]
    [TKey('TIMERMETODOSPENDENTES')]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [TCheckBox('Atualizar automaticamente log de m�todos pendentes?')]
    [TKey('ATUALIZACAOAUTOMATICAMETODOSPENDENTES')]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [TEdit('Timet de se��es cr�ticas')]
    [TKey('TIMERSECOESCRITICAS')]
    property CriticalSectionTimer: Integer read FCriticalSectionTimer write FCriticalSectionTimer;

    [TCheckBox('Atualiza')]
    [TKey('ATUALIZACAOAUTOMATICASECOESCRITICAS')]
    property AutoUpdateCriticalSections: Boolean read FAutoUpdateCriticalSections write FAutoUpdateCriticalSections;

    [TEdit('Timer pool')]
    [TKey('TIMERPOOL')]
    property PoolTimer: Integer read FPoolTimer write FPoolTimer;

    [TCheckBox('Atualizar pool automaticamente?')]
    [TKey('ATUALIZACAOAUTOMATICAPOOL')]
    property AutoUpdatePool: Boolean read FAutoUpdatePool write FAutoUpdatePool;

    [TCheckBox('Janelas sempre no topo?')]
    [TKey('JANELASEMPRENOTOPO')]
    property WindowsAlwaysOnTop: Boolean read FWindowsAlwaysOnTop write FWindowsAlwaysOnTop;

    [TCheckBox('Posicionar no �ltimo log?')]
    [TKey('POSICIONAULTIMOLOG')]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [TCheckBox('Ignorar log extra?')]
    [TKey('IGNORARLOGEXTRA')]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [TCheckBox('Carregar somente linhas n�veis zero?')]
    [TKey('CARREGARSOMENTELINHASLOGNIVELZERO')]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [TCheckBox('Utilizar RegEx nos filtros do SQL?')]
    [TKey('UTILIZAREXPRESSOESREGULARESFILTROSQL')]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [TEdit('Tempo m�nimo para an�lise de desemprenho')]
    [TKey('TEMPOMINIMOPARAANALISEDESEMPENHO')]
    property MinTimeForPerformanceAnalysis: Integer read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [TEdit('Tempo m�nimo para usu�rio inativo')]
    [TKey('TEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeForInactiveUser: Integer read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [TEdit('Unidade de tempo m�nimo para usu�rio inativo')]
    [TKey('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [TEdit('Tempo m�nimo para m�todos pendentes')]
    [TKey('TEMPOMINIMOPARAMETODOSPENDENTES')]
    property MinTimeForDependentMethods: Integer read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [TCheckBox('Registrar mem�ria do pool do servidor de aplica��o?')]
    [TKey('REGISTRARMEMORIASERVIDORAPLICACAOPOOL')]
    property RegisterServerPoolAplicationMemory: Boolean read FRegisterServerPoolAplicationMemory write FRegisterServerPoolAplicationMemory;

    [TEdit('Cor inicial de desempenho')]
    [TKey('CORINICIALDESEMPENHO')]
    property InitialPerformanceColor: Integer read FInitialPerformanceColor write FInitialPerformanceColor;

    [TEdit('Cor final de desempenho')]
    [TKey('CORFINALDESEMPENHO')]
    property FinalPerformanceColor: Integer read FFinalPerformanceColor write FFinalPerformanceColor;

    [TCheckBox('Utilizar cores ao travar?')]
    [TKey('UTILIZARCORESERROTRAVADO')]
    property UseCrashErrorColor: Boolean read FUseCrashErrorColor write FUseCrashErrorColor;

    [TEdit('Cor de erro')]
    [TKey('CORERRO')]
    property ErrorColor: Integer read FErrorColor write FErrorColor;

    [TEdit('Cor de transa��o aberta')]
    [TKey('CORTRANSACAOABERTA')]
    property OpenTransactionColor: Integer read FOpenTransactionColor write FOpenTransactionColor;

    [TCheckBox('Identar autom�ticamente SQLs?')]
    [TKey('INDENTARAUTOMATICAMENTESQLS')]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [TEdit('Colunas v�siveis no log de m�todos')]
    [TKey('COLUNASVISIVEISLOGMETODOS')]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

