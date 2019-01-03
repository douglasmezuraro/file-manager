unit Builder.API;

interface

type
  IBuilder = interface
  ['{A1147BA6-DA88-45F3-BB0E-D6C5914B3647}']
    function BuildAlternativeBalancer: IBuilder;
    function BuildApplication: IBuilder;
    function BuildBalancer: IBuilder;
    function BuildClient: IBuilder;
    function BuildDatabase: IBuilder;
    function BuildDUnit: IBuilder;
    function BuildLog: IBuilder;
    function BuildMonitor: IBuilder;
    function BuildScanner: IBuilder;
    function BuildServer: IBuilder;
    function BuildSPP: IBuilder;
    function BuildUpdate: IBuilder;
    function BuildWorkflow: IBuilder;
  end;

implementation

end.
