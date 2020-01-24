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

    [Edit('Timer dos usu�rios')]
    [Key('TIMERUSUARIOS')]
    property UserTimer: Integer read FUserTimer write FUserTimer;

    [CheckBox('Releitura autom�tica?')]
    [Key('RELEITURAAUTOMATICALOG')]
    property AutoRereadLog: Boolean read FAutoRereadLog write FAutoRereadLog;

    [CheckBox('Avaliar travamento autom�tico?')]
    [Key('AVALIATRAVAMENTOAUTOMATICO')]
    property AutoEvalueCrash: Boolean read FAutoEvalueCrash write FAutoEvalueCrash;

    [CheckBox('Posicionar automaticamente no �ltimo log?')]
    [Key('POSICIONAULTIMOLOGAUTOMATICO')]
    property AutoGotoLastLog: Boolean read FAutoGotoLastLog write FAutoGotoLastLog;

    [CheckBox('Atualiza��o autom�tica de usu�rios')]
    [Key('ATUALIZACAOAUTOMATICAUSUARIOS')]
    property AutoUpdateUsers: Boolean read FAutoUpdateUsers write FAutoUpdateUsers;

    [CheckBox('Carregar log mais recente?')]
    [Key('CARREGARLOGMAISRECENTE')]
    property LoadLatestLog: Boolean read FLoadLatestLog write FLoadLatestLog;

    [Edit('Diret�rio do log')]
    [Key('DIRETORIOLOG')]
    property LogPath: string read FLogPath write FLogPath;

    [Edit('Timer de m�todos pendentes')]
    [Key('TIMERMETODOSPENDENTES')]
    property DependentMethodTimer: Integer read FDependentMethodTimer write FDependentMethodTimer;

    [CheckBox('Atualizar automaticamente log de m�todos pendentes?')]
    [Key('ATUALIZACAOAUTOMATICAMETODOSPENDENTES')]
    property AutoUpdateDependentMethods: Boolean read FAutoUpdateDependentMethods write FAutoUpdateDependentMethods;

    [Edit('Timet de se��es cr�ticas')]
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

    [CheckBox('Posicionar no �ltimo log?')]
    [Key('POSICIONAULTIMOLOG')]
    property GotoLastLog: Boolean read FGotoLastLog write FGotoLastLog;

    [CheckBox('Ignorar log extra?')]
    [Key('IGNORARLOGEXTRA')]
    property IgnoreExtraLog: Boolean read FIgnoreExtraLog write FIgnoreExtraLog;

    [CheckBox('Carregar somente linhas n�veis zero?')]
    [Key('CARREGARSOMENTELINHASLOGNIVELZERO')]
    property LoadOnlyLevelZeroLogs: Boolean read FLoadOnlyLevelZeroLogs write FLoadOnlyLevelZeroLogs;

    [CheckBox('Utilizar RegEx nos filtros do SQL?')]
    [Key('UTILIZAREXPRESSOESREGULARESFILTROSQL')]
    property UseRegExFilters: Boolean read FUseRegExFilters write FUseRegExFilters;

    [Edit('Tempo m�nimo para an�lise de desemprenho')]
    [Key('TEMPOMINIMOPARAANALISEDESEMPENHO')]
    property MinTimeForPerformanceAnalysis: Integer read FMinTimeForPerformanceAnalysis write FMinTimeForPerformanceAnalysis;

    [Edit('Tempo m�nimo para usu�rio inativo')]
    [Key('TEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeForInactiveUser: Integer read FMinTimeForInactiveUser write FMinTimeForInactiveUser;

    [Edit('Unidade de tempo m�nimo para usu�rio inativo')]
    [Key('UNIDADETEMPOMINIMOPARAUSUARIOINATIVO')]
    property MinTimeUnitForInactiveUser: string read FMinTimeUnitForInactiveUser write FMinTimeUnitForInactiveUser;

    [Edit('Tempo m�nimo para m�todos pendentes')]
    [Key('TEMPOMINIMOPARAMETODOSPENDENTES')]
    property MinTimeForDependentMethods: Integer read FMinTimeForDependentMethods write FMinTimeForDependentMethods;

    [CheckBox('Registrar mem�ria do pool do servidor de aplica��o?')]
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

    [Edit('Cor de transa��o aberta')]
    [Key('CORTRANSACAOABERTA')]
    property OpenTransactionColor: Integer read FOpenTransactionColor write FOpenTransactionColor;

    [CheckBox('Identar autom�ticamente SQLs?')]
    [Key('INDENTARAUTOMATICAMENTESQLS')]
    property AutoIndentSQL: Boolean read FAutoIndentSQL write FAutoIndentSQL;

    [Edit('Colunas v�siveis no log de m�todos')]
    [Key('COLUNASVISIVEISLOGMETODOS')]
    property VisibleColumns: string read FVisibleColumns write FVisibleColumns;
  end;

implementation

end.

