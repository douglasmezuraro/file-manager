unit Model.Config.Monitor;

interface

uses
  Attribute.Component.CheckBox, Attribute.Component.Edit, Attribute.Ini.Key;

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
    [Edit('Timer do log')]
    [Key('TIMERLOG')]
    property LogTimer: Integer read FLogTimer write FLogTimer;

    [Edit('Timer dos usuários')]
    [Key('TIMERUSUARIOS')]
    property UserTimer: Integer read FUserTimer write FUserTimer;

    [CheckBox('Releitura automática?')]
    [Key('RELEITURAAUTOMATICALOG')]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [CheckBox('Avaliar travamento automático?')]
    [Key('AVALIATRAVAMENTOAUTOMATICO')]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [CheckBox('Posicionar automaticamente no último log?')]
    [Key('POSICIONAULTIMOLOGAUTOMATICO')]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [CheckBox('Atualização automática de usuários')]
    [Key('ATUALIZACAOAUTOMATICAUSUARIOS')]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [CheckBox('Carregar log mais recente?')]
    [Key('CARREGARLOGMAISRECENTE')]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [Edit('Diretório do log')]
    [Key('DIRETORIOLOG')]
    property LogPath: string read FLogPath write FLogPath;

    [Edit('Timer de métodos pendentes')]
    [Key('TIMERMETODOSPENDENTES')]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [CheckBox('Atualizar automaticamente log de métodos pendentes?')]
    [Key('ATUALIZACAOAUTOMATICAMETODOSPENDENTES')]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [Edit('Timet de seções críticas')]
    [Key('TIMERSECOESCRITICAS')]
    property CriticalSectionTimer: Integer read FCriticalSectionTimer write FCriticalSectionTimer;

    [CheckBox('Atualiza')]
    [Key('ATUALIZACAOAUTOMATICASECOESCRITICAS')]
    property AutoUpdateCriticalSections: Boolean read FAutoUpdateCriticalSections write FAutoUpdateCriticalSections;

    [Edit('Timer pool')]
    [Key('TIMERPOOL')]
    property PoolTimer: Integer read FPoolTimer write FPoolTimer;

    [CheckBox('Atualizar pool automaticamente?')]
    [Key('ATUALIZACAOAUTOMATICAPOOL')]
    property AutoUpdatePool: Boolean read FAutoUpdatePool write FAutoUpdatePool;

    [CheckBox('Janelas sempre no topo?')]
    [Key('JANELASEMPRENOTOPO')]
    property WindowsAlwaysOnTop: Boolean read FWindowsAlwaysOnTop write FWindowsAlwaysOnTop;

    [CheckBox('Posicionar no último log?')]
    [Key('POSICIONAULTIMOLOG')]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [CheckBox('Ignorar log extra?')]
    [Key('IGNORARLOGEXTRA')]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [CheckBox('Carregar somente linhas níveis zero?')]
    [Key('CARREGARSOMENTELINHASLOGNIVELZERO')]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [CheckBox('Utilizar RegEx nos filtros do SQL?')]
    [Key('UTILIZAREXPRESSOESREGULARESFILTROSQL')]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [Edit('Tempo mínimo para análise de desemprenho')]
    [Key('TEMPOMINIMOPARAANALISEDESEMPENHO')]
    property MinTimeForPerformanceAnalysis: Integer read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [Edit('Tempo mínimo para usuário inativo')]
    [Key('TEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeForInactiveUser: Integer read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [Edit('Unidade de tempo mínimo para usuário inativo')]
    [Key('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [Edit('Tempo mínimo para métodos pendentes')]
    [Key('TEMPOMINIMOPARAMETODOSPENDENTES')]
    property MinTimeForDependentMethods: Integer read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [CheckBox('Registrar memória do pool do servidor de aplicação?')]
    [Key('REGISTRARMEMORIASERVIDORAPLICACAOPOOL')]
    property RegisterServerPoolAplicationMemory: Boolean read FRegisterServerPoolAplicationMemory write FRegisterServerPoolAplicationMemory;

    [Edit('Cor inicial de desempenho')]
    [Key('CORINICIALDESEMPENHO')]
    property InitialPerformanceColor: Integer read FInitialPerformanceColor write FInitialPerformanceColor;

    [Edit('Cor final de desempenho')]
    [Key('CORFINALDESEMPENHO')]
    property FinalPerformanceColor: Integer read FFinalPerformanceColor write FFinalPerformanceColor;

    [CheckBox('Utilizar cores ao travar?')]
    [Key('UTILIZARCORESERROTRAVADO')]
    property UseCrashErrorColor: Boolean read FUseCrashErrorColor write FUseCrashErrorColor;

    [Edit('Cor de erro')]
    [Key('CORERRO')]
    property ErrorColor: Integer read FErrorColor write FErrorColor;

    [Edit('Cor de transação aberta')]
    [Key('CORTRANSACAOABERTA')]
    property OpenTransactionColor: Integer read FOpenTransactionColor write FOpenTransactionColor;

    [CheckBox('Identar automáticamente SQLs?')]
    [Key('INDENTARAUTOMATICAMENTESQLS')]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [Edit('Colunas vísiveis no log de métodos')]
    [Key('COLUNASVISIVEISLOGMETODOS')]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

