unit Model.Config.Monitor;

interface

uses
  Attribute.Caption,
  Attribute.Ident;

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
    [TCaption('Timer do log')]
    [TIdent('TIMERLOG')]
    property LogTimer: UInt32 read FLogTimer write FLogTimer;

    [TCaption('Timer dos usuários')]
    [TIdent('TIMERUSUARIOS')]
    property UserTimer: UInt32 read FUserTimer write FUserTimer;

    [TCaption('Releitura automática?')]
    [TIdent('RELEITURAAUTOMATICALOG')]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [TCaption('Avaliar travamento automático?')]
    [TIdent('AVALIATRAVAMENTOAUTOMATICO')]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [TCaption('Posicionar automaticamente no último log?')]
    [TIdent('POSICIONAULTIMOLOGAUTOMATICO')]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [TCaption('Atualização automática de usuários')]
    [TIdent('ATUALIZACAOAUTOMATICAUSUARIOS')]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [TCaption('Carregar log mais recente?')]
    [TIdent('CARREGARLOGMAISRECENTE')]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [TCaption('Diretório do log')]
    [TIdent('DIRETORIOLOG')]
    property LogPath: string read FLogPath write FLogPath;

    [TCaption('Timer de métodos pendentes')]
    [TIdent('TIMERMETODOSPENDENTES')]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [TCaption('Atualizar automaticamente log de métodos pendentes?')]
    [TIdent('ATUALIZACAOAUTOMATICAMETODOSPENDENTES')]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [TCaption('Timet de seções críticas')]
    [TIdent('TIMERSECOESCRITICAS')]
    property CriticalSectionTimer: Integer read FCriticalSectionTimer write FCriticalSectionTimer;

    [TCaption('Atualiza')]
    [TIdent('ATUALIZACAOAUTOMATICASECOESCRITICAS')]
    property AutoUpdateCriticalSections: Boolean read FAutoUpdateCriticalSections write FAutoUpdateCriticalSections;

    [TCaption('Timer pool')]
    [TIdent('TIMERPOOL')]
    property PoolTimer: Integer read FPoolTimer write FPoolTimer;

    [TCaption('Atualizar pool automaticamente?')]
    [TIdent('ATUALIZACAOAUTOMATICAPOOL')]
    property AutoUpdatePool: Boolean read FAutoUpdatePool write FAutoUpdatePool;

    [TCaption('Janelas sempre no topo?')]
    [TIdent('JANELASEMPRENOTOPO')]
    property WindowsAlwaysOnTop: Boolean read FWindowsAlwaysOnTop write FWindowsAlwaysOnTop;

    [TCaption('Posicionar no último log?')]
    [TIdent('POSICIONAULTIMOLOG')]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [TCaption('Ignorar log extra?')]
    [TIdent('IGNORARLOGEXTRA')]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [TCaption('Carregar somente linhas níveis zero?')]
    [TIdent('CARREGARSOMENTELINHASLOGNIVELZERO')]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [TCaption('Utilizar RegEx nos filtros do SQL?')]
    [TIdent('UTILIZAREXPRESSOESREGULARESFILTROSQL')]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [TCaption('Tempo mínimo para análise de desemprenho')]
    [TIdent('TEMPOMINIMOPARAANALISEDESEMPENHO')]
    property MinTimeForPerformanceAnalysis: UInt32 read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [TCaption('Tempo mínimo para usuário inativo')]
    [TIdent('TEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeForInactiveUser: UInt32 read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [TCaption('Unidade de tempo mínimo para usuário inativo')]
    [TIdent('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [TCaption('Tempo mínimo para métodos pendentes')]
    [TIdent('TEMPOMINIMOPARAMETODOSPENDENTES')]
    property MinTimeForDependentMethods: UInt32 read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [TCaption('Registrar memória do pool do servidor de aplicação?')]
    [TIdent('REGISTRARMEMORIASERVIDORAPLICACAOPOOL')]
    property RegisterServerPoolAplicationMemory: Boolean read FRegisterServerPoolAplicationMemory write FRegisterServerPoolAplicationMemory;

    [TCaption('Cor inicial de desempenho')]
    [TIdent('CORINICIALDESEMPENHO')]
    property InitialPerformanceColor: UInt32 read FInitialPerformanceColor write FInitialPerformanceColor;

    [TCaption('Cor final de desempenho')]
    [TIdent('CORFINALDESEMPENHO')]
    property FinalPerformanceColor: UInt32 read FFinalPerformanceColor write FFinalPerformanceColor;

    [TCaption('Utilizar cores ao travar?')]
    [TIdent('UTILIZARCORESERROTRAVADO')]
    property UseCrashErrorColor: Boolean read FUseCrashErrorColor write FUseCrashErrorColor;

    [TCaption('Cor de erro')]
    [TIdent('CORERRO')]
    property ErrorColor: UInt32 read FErrorColor write FErrorColor;

    [TCaption('Cor de transação aberta')]
    [TIdent('CORTRANSACAOABERTA')]
    property OpenTransactionColor: UInt32 read FOpenTransactionColor write FOpenTransactionColor;

    [TCaption('Identar automáticamente SQLs?')]
    [TIdent('INDENTARAUTOMATICAMENTESQLS')]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [TCaption('Colunas vísiveis no log de métodos')]
    [TIdent('COLUNASVISIVEISLOGMETODOS')]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

