unit Model.Config.Workflow;

interface

uses
  Ini.Key,
  Ini.Section;

type
  [TSection('FLUXOTRABALHO')]
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    [TKey('PODEALTERARVERSAOATUALFLUXO')]
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

