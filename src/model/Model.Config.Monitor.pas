unit Model.Config.Monitor;

interface

uses
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
    [TEditAttribute('Timer do log')]
    [TIdent('TIMERLOG')]
    property LogTimer: UInt32 read FLogTimer write FLogTimer;

    [TEditAttribute('Timer dos usuários')]
    [TIdent('TIMERUSUARIOS')]
    property UserTimer: UInt32 read FUserTimer write FUserTimer;

    [TCheckBoxAttribute('Releitura automática?')]
    [TIdent('RELEITURAAUTOMATICALOG')]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [TCheckBoxAttribute('Avaliar travamento automático?')]
    [TIdent('AVALIATRAVAMENTOAUTOMATICO')]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [TCheckBoxAttribute('Posicionar automaticamente no último log?')]
    [TIdent('POSICIONAULTIMOLOGAUTOMATICO')]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [TCheckBoxAttribute('Atualização automática de usuários')]
    [TIdent('ATUALIZACAOAUTOMATICAUSUARIOS')]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [TCheckBoxAttribute('Carregar log mais recente?')]
    [TIdent('CARREGARLOGMAISRECENTE')]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [TEditAttribute('Diretório do log')]
    [TIdent('DIRETORIOLOG')]
    property LogPath: string read FLogPath write FLogPath;

    [TEditAttribute('Timer de métodos pendentes')]
    [TIdent('TIMERMETODOSPENDENTES')]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [TCheckBoxAttribute('Atualizar automaticamente log de métodos pendentes?')]
    [TIdent('ATUALIZACAOAUTOMATICAMETODOSPENDENTES')]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [TEditAttribute('Timet de seções críticas')]
    [TIdent('TIMERSECOESCRITICAS')]
    property CriticalSectionTimer: Integer read FCriticalSectionTimer write FCriticalSectionTimer;

    [TCheckBoxAttribute('Atualiza')]
    [TIdent('ATUALIZACAOAUTOMATICASECOESCRITICAS')]
    property AutoUpdateCriticalSections: Boolean read FAutoUpdateCriticalSections write FAutoUpdateCriticalSections;

    [TEditAttribute('Timer pool')]
    [TIdent('TIMERPOOL')]
    property PoolTimer: Integer read FPoolTimer write FPoolTimer;

    [TCheckBoxAttribute('Atualizar pool automaticamente?')]
    [TIdent('ATUALIZACAOAUTOMATICAPOOL')]
    property AutoUpdatePool: Boolean read FAutoUpdatePool write FAutoUpdatePool;

    [TCheckBoxAttribute('Janelas sempre no topo?')]
    [TIdent('JANELASEMPRENOTOPO')]
    property WindowsAlwaysOnTop: Boolean read FWindowsAlwaysOnTop write FWindowsAlwaysOnTop;

    [TCheckBoxAttribute('Posicionar no último log?')]
    [TIdent('POSICIONAULTIMOLOG')]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [TCheckBoxAttribute('Ignorar log extra?')]
    [TIdent('IGNORARLOGEXTRA')]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [TCheckBoxAttribute('Carregar somente linhas níveis zero?')]
    [TIdent('CARREGARSOMENTELINHASLOGNIVELZERO')]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [TCheckBoxAttribute('Utilizar RegEx nos filtros do SQL?')]
    [TIdent('UTILIZAREXPRESSOESREGULARESFILTROSQL')]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [TEditAttribute('Tempo mínimo para análise de desemprenho')]
    [TIdent('TEMPOMINIMOPARAANALISEDESEMPENHO')]
    property MinTimeForPerformanceAnalysis: UInt32 read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [TEditAttribute('Tempo mínimo para usuário inativo')]
    [TIdent('TEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeForInactiveUser: UInt32 read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [TEditAttribute('Unidade de tempo mínimo para usuário inativo')]
    [TIdent('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [TEditAttribute('Tempo mínimo para métodos pendentes')]
    [TIdent('TEMPOMINIMOPARAMETODOSPENDENTES')]
    property MinTimeForDependentMethods: UInt32 read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [TCheckBoxAttribute('Registrar memória do pool do servidor de aplicação?')]
    [TIdent('REGISTRARMEMORIASERVIDORAPLICACAOPOOL')]
    property RegisterServerPoolAplicationMemory: Boolean read FRegisterServerPoolAplicationMemory write FRegisterServerPoolAplicationMemory;

    [TEditAttribute('Cor inicial de desempenho')]
    [TIdent('CORINICIALDESEMPENHO')]
    property InitialPerformanceColor: UInt32 read FInitialPerformanceColor write FInitialPerformanceColor;

    [TEditAttribute('Cor final de desempenho')]
    [TIdent('CORFINALDESEMPENHO')]
    property FinalPerformanceColor: UInt32 read FFinalPerformanceColor write FFinalPerformanceColor;

    [TCheckBoxAttribute('Utilizar cores ao travar?')]
    [TIdent('UTILIZARCORESERROTRAVADO')]
    property UseCrashErrorColor: Boolean read FUseCrashErrorColor write FUseCrashErrorColor;

    [TEditAttribute('Cor de erro')]
    [TIdent('CORERRO')]
    property ErrorColor: UInt32 read FErrorColor write FErrorColor;

    [TEditAttribute('Cor de transação aberta')]
    [TIdent('CORTRANSACAOABERTA')]
    property OpenTransactionColor: UInt32 read FOpenTransactionColor write FOpenTransactionColor;

    [TCheckBoxAttribute('Identar automáticamente SQLs?')]
    [TIdent('INDENTARAUTOMATICAMENTESQLS')]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [TEditAttribute('Colunas vísiveis no log de métodos')]
    [TIdent('COLUNASVISIVEISLOGMETODOS')]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

