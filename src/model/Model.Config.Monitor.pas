unit Model.Config.Monitor;

interface

uses
  Attribute.Control,
  Attribute.Ini;

type
  TMonitor = class
  private
    FAutoIndentSQL: Boolean;
    FUseRegExFilters: Boolean;
    FVisibleColumns: string;
    FErrorColor: UInt32;
    FLoadOnlyLevelZeroLogs: Boolean;
    FLoadLatestLog: Boolean;
    FAutoUpdateCriticalSections: Boolean;
    FUserTimer: UInt32;
    FWindowsAlwaysOnTop: Boolean;
    FAutoUpdatePool: Boolean;
    FUseCrashErrorColor: Boolean;
    FGotoLastLog: Boolean;
    FOpenTransactionColor: UInt32;
    FIgnoreExtraLog: Boolean;
    FDependentMethodTimer: Integer;
    FInitialPerformanceColor: UInt32;
    FAutoEvalueCrash: Boolean;
    FPoolTimer: Integer;
    FMinTimeForPerformanceAnalysis: UInt32;
    FAutoGotoLastLog: Boolean;
    FCriticalSectionTimer: Integer;
    FAutoUpdateUsers: Boolean;
    FLogPath: string;
    FFinalPerformanceColor: UInt32;
    FRegisterServerPoolAplicationMemory: Boolean;
    FAutoUpdateDependentMethods: Boolean;
    FMinTimeUnitForInactiveUser: string;
    FMinTimeForInactiveUser: UInt32;
    FMinTimeForDependentMethods: UInt32;
    FAutoRereadLog: Boolean;
    FLogTimer: UInt32;
  public
    [Edit('Timer do log')]
    [Ident('TIMERLOG')]
    property LogTimer: UInt32 read FLogTimer write FLogTimer;

    [Edit('Timer dos usuários')]
    [Ident('TIMERUSUARIOS')]
    property UserTimer: UInt32 read FUserTimer write FUserTimer;

    [CheckBox('Releitura automática?')]
    [Ident('RELEITURAAUTOMATICALOG')]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [CheckBox('Avaliar travamento automático?')]
    [Ident('AVALIATRAVAMENTOAUTOMATICO')]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [CheckBox('Posicionar automaticamente no último log?')]
    [Ident('POSICIONAULTIMOLOGAUTOMATICO')]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [CheckBox('Atualização automática de usuários')]
    [Ident('ATUALIZACAOAUTOMATICAUSUARIOS')]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [CheckBox('Carregar log mais recente?')]
    [Ident('CARREGARLOGMAISRECENTE')]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [Edit('Diretório do log')]
    [Ident('DIRETORIOLOG')]
    property LogPath: string read FLogPath write FLogPath;

    [Edit('Timer de métodos pendentes')]
    [Ident('TIMERMETODOSPENDENTES')]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [CheckBox('Atualizar automaticamente log de métodos pendentes?')]
    [Ident('ATUALIZACAOAUTOMATICAMETODOSPENDENTES')]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [Edit('Timet de seções críticas')]
    [Ident('TIMERSECOESCRITICAS')]
    property CriticalSectionTimer: Integer read FCriticalSectionTimer write FCriticalSectionTimer;

    [CheckBox('Atualiza')]
    [Ident('ATUALIZACAOAUTOMATICASECOESCRITICAS')]
    property AutoUpdateCriticalSections: Boolean read FAutoUpdateCriticalSections write FAutoUpdateCriticalSections;

    [Edit('Timer pool')]
    [Ident('TIMERPOOL')]
    property PoolTimer: Integer read FPoolTimer write FPoolTimer;

    [CheckBox('Atualizar pool automaticamente?')]
    [Ident('ATUALIZACAOAUTOMATICAPOOL')]
    property AutoUpdatePool: Boolean read FAutoUpdatePool write FAutoUpdatePool;

    [CheckBox('Janelas sempre no topo?')]
    [Ident('JANELASEMPRENOTOPO')]
    property WindowsAlwaysOnTop: Boolean read FWindowsAlwaysOnTop write FWindowsAlwaysOnTop;

    [CheckBox('Posicionar no último log?')]
    [Ident('POSICIONAULTIMOLOG')]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [CheckBox('Ignorar log extra?')]
    [Ident('IGNORARLOGEXTRA')]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [CheckBox('Carregar somente linhas níveis zero?')]
    [Ident('CARREGARSOMENTELINHASLOGNIVELZERO')]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [CheckBox('Utilizar RegEx nos filtros do SQL?')]
    [Ident('UTILIZAREXPRESSOESREGULARESFILTROSQL')]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [Edit('Tempo mínimo para análise de desemprenho')]
    [Ident('TEMPOMINIMOPARAANALISEDESEMPENHO')]
    property MinTimeForPerformanceAnalysis: UInt32 read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [Edit('Tempo mínimo para usuário inativo')]
    [Ident('TEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeForInactiveUser: UInt32 read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [Edit('Unidade de tempo mínimo para usuário inativo')]
    [Ident('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [Edit('Tempo mínimo para métodos pendentes')]
    [Ident('TEMPOMINIMOPARAMETODOSPENDENTES')]
    property MinTimeForDependentMethods: UInt32 read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [CheckBox('Registrar memória do pool do servidor de aplicação?')]
    [Ident('REGISTRARMEMORIASERVIDORAPLICACAOPOOL')]
    property RegisterServerPoolAplicationMemory: Boolean read FRegisterServerPoolAplicationMemory write FRegisterServerPoolAplicationMemory;

    [Edit('Cor inicial de desempenho')]
    [Ident('CORINICIALDESEMPENHO')]
    property InitialPerformanceColor: UInt32 read FInitialPerformanceColor write FInitialPerformanceColor;

    [Edit('Cor final de desempenho')]
    [Ident('CORFINALDESEMPENHO')]
    property FinalPerformanceColor: UInt32 read FFinalPerformanceColor write FFinalPerformanceColor;

    [CheckBox('Utilizar cores ao travar?')]
    [Ident('UTILIZARCORESERROTRAVADO')]
    property UseCrashErrorColor: Boolean read FUseCrashErrorColor write FUseCrashErrorColor;

    [Edit('Cor de erro')]
    [Ident('CORERRO')]
    property ErrorColor: UInt32 read FErrorColor write FErrorColor;

    [Edit('Cor de transação aberta')]
    [Ident('CORTRANSACAOABERTA')]
    property OpenTransactionColor: UInt32 read FOpenTransactionColor write FOpenTransactionColor;

    [CheckBox('Identar automáticamente SQLs?')]
    [Ident('INDENTARAUTOMATICAMENTESQLS')]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [Edit('Colunas vísiveis no log de métodos')]
    [Ident('COLUNASVISIVEISLOGMETODOS')]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

