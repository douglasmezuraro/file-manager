unit Model.Config.Monitor;

interface

uses
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
    [TKey('TIMERLOG')]
    property LogTimer: UInt32 read FLogTimer write FLogTimer;

    [TKey('TIMERUSUARIOS')]
    property UserTimer: UInt32 read FUserTimer write FUserTimer;

    [TKey('RELEITURAAUTOMATICALOG')]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [TKey('AVALIATRAVAMENTOAUTOMATICO')]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [TKey('POSICIONAULTIMOLOGAUTOMATICO')]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [TKey('ATUALIZACAOAUTOMATICAUSUARIOS')]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [TKey('CARREGARLOGMAISRECENTE')]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [TKey('DIRETORIOLOG')]
    property LogPath: string read FLogPath write FLogPath;

    [TKey('TIMERMETODOSPENDENTES')]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [TKey('ATUALIZACAOAUTOMATICAMETODOSPENDENTES')]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [TKey('TIMERSECOESCRITICAS')]
    property CriticalSectionTimer: Integer read FCriticalSectionTimer write FCriticalSectionTimer;

    [TKey('ATUALIZACAOAUTOMATICASECOESCRITICAS')]
    property AutoUpdateCriticalSections: Boolean read FAutoUpdateCriticalSections write FAutoUpdateCriticalSections;

    [TKey('TIMERPOOL')]
    property PoolTimer: Integer read FPoolTimer write FPoolTimer;

    [TKey('ATUALIZACAOAUTOMATICAPOOL')]
    property AutoUpdatePool: Boolean read FAutoUpdatePool write FAutoUpdatePool;

    [TKey('JANELASEMPRENOTOPO')]
    property WindowsAlwaysOnTop: Boolean read FWindowsAlwaysOnTop write FWindowsAlwaysOnTop;

    [TKey('POSICIONAULTIMOLOG')]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [TKey('IGNORARLOGEXTRA')]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [TKey('CARREGARSOMENTELINHASLOGNIVELZERO')]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [TKey('UTILIZAREXPRESSOESREGULARESFILTROSQL')]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [TKey('TEMPOMINIMOPARAANALISEDESEMPENHO')]
    property MinTimeForPerformanceAnalysis: UInt32 read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [TKey('TEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeForInactiveUser: UInt32 read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [TKey('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [TKey('TEMPOMINIMOPARAMETODOSPENDENTES')]
    property MinTimeForDependentMethods: UInt32 read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [TKey('REGISTRARMEMORIASERVIDORAPLICACAOPOOL')]
    property RegisterServerPoolAplicationMemory: Boolean read FRegisterServerPoolAplicationMemory write FRegisterServerPoolAplicationMemory;

    [TKey('CORINICIALDESEMPENHO')]
    property InitialPerformanceColor: UInt32 read FInitialPerformanceColor write FInitialPerformanceColor;

    [TKey('CORFINALDESEMPENHO')]
    property FinalPerformanceColor: UInt32 read FFinalPerformanceColor write FFinalPerformanceColor;

    [TKey('UTILIZARCORESERROTRAVADO')]
    property UseCrashErrorColor: Boolean read FUseCrashErrorColor write FUseCrashErrorColor;

    [TKey('CORERRO')]
    property ErrorColor: UInt32 read FErrorColor write FErrorColor;

    [TKey('CORTRANSACAOABERTA')]
    property OpenTransactionColor: UInt32 read FOpenTransactionColor write FOpenTransactionColor;

    [TKey('INDENTARAUTOMATICAMENTESQLS')]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [TKey('COLUNASVISIVEISLOGMETODOS')]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

