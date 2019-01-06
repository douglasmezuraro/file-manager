unit Model.Config.Monitor;

interface

uses
  Ini.DataType,
  Ini.Key,
  Ini.Section;

type
  [TSection('SPMONITOR')]
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
    [TKey('TIMERLOG', dtInteger)]
    property LogTimer: UInt32 read FLogTimer write FLogTimer;

    [TKey('TIMERUSUARIOS', dtInteger)]
    property UserTimer: UInt32 read FUserTimer write FUserTimer;

    [TKey('RELEITURAAUTOMATICALOG', dtBool)]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [TKey('AVALIATRAVAMENTOAUTOMATICO', dtBool)]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [TKey('POSICIONAULTIMOLOGAUTOMATICO', dtBool)]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [TKey('ATUALIZACAOAUTOMATICAUSUARIOS', dtBool)]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [TKey('CARREGARLOGMAISRECENTE', dtBool)]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [TKey('DIRETORIOLOG', dtString)]
    property LogPath: string read FLogPath write FLogPath;

    [TKey('TIMERMETODOSPENDENTES', dtInteger)]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [TKey('ATUALIZACAOAUTOMATICAMETODOSPENDENTES', dtBool)]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [TKey('TIMERSECOESCRITICAS', dtInteger)]
    property CriticalSectionTimer: Integer read FCriticalSectionTimer write FCriticalSectionTimer;

    [TKey('ATUALIZACAOAUTOMATICASECOESCRITICAS', dtBool)]
    property AutoUpdateCriticalSections: Boolean read FAutoUpdateCriticalSections write FAutoUpdateCriticalSections;

    [TKey('TIMERPOOL', dtInteger)]
    property PoolTimer: Integer read FPoolTimer write FPoolTimer;

    [TKey('ATUALIZACAOAUTOMATICAPOOL', dtBool)]
    property AutoUpdatePool: Boolean read FAutoUpdatePool write FAutoUpdatePool;

    [TKey('JANELASEMPRENOTOPO', dtBool)]
    property WindowsAlwaysOnTop: Boolean read FWindowsAlwaysOnTop write FWindowsAlwaysOnTop;

    [TKey('POSICIONAULTIMOLOG', dtBool)]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [TKey('IGNORARLOGEXTRA', dtBool)]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [TKey('CARREGARSOMENTELINHASLOGNIVELZERO', dtBool)]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [TKey('UTILIZAREXPRESSOESREGULARESFILTROSQL', dtBool)]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [TKey('TEMPOMINIMOPARAANALISEDESEMPENHO', dtInteger)]
    property MinTimeForPerformanceAnalysis: UInt32 read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [TKey('TEMPOMINIMOPARAUSUARIOINATIVO', dtInteger)]
    property MinTimeForInactiveUser: UInt32 read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [TKey('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO', dtString)]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [TKey('TEMPOMINIMOPARAMETODOSPENDENTES', dtInteger)]
    property MinTimeForDependentMethods: UInt32 read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [TKey('REGISTRARMEMORIASERVIDORAPLICACAOPOOL', dtBool)]
    property RegisterServerPoolAplicationMemory: Boolean read FRegisterServerPoolAplicationMemory write FRegisterServerPoolAplicationMemory;

    [TKey('CORINICIALDESEMPENHO', dtInteger)]
    property InitialPerformanceColor: UInt32 read FInitialPerformanceColor write FInitialPerformanceColor;

    [TKey('CORFINALDESEMPENHO', dtInteger)]
    property FinalPerformanceColor: UInt32 read FFinalPerformanceColor write FFinalPerformanceColor;

    [TKey('UTILIZARCORESERROTRAVADO', dtBool)]
    property UseCrashErrorColor: Boolean read FUseCrashErrorColor write FUseCrashErrorColor;

    [TKey('CORERRO', dtInteger)]
    property ErrorColor: UInt32 read FErrorColor write FErrorColor;

    [TKey('CORTRANSACAOABERTA', dtInteger)]
    property OpenTransactionColor: UInt32 read FOpenTransactionColor write FOpenTransactionColor;

    [TKey('INDENTARAUTOMATICAMENTESQLS', dtBool)]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [TKey('COLUNASVISIVEISLOGMETODOS', dtString)]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

