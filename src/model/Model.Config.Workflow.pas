unit Model.Config.Workflow;

interface

uses
  Ini.Ident,
  Ini.Section;

type
  [TSection('FLUXOTRABALHO')]
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    [TIdent('PODEALTERARVERSAOATUALFLUXO')]
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

