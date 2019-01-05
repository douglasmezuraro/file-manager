unit Model.Config.Workflow;

interface

uses
  Ini.Section;

type
  [TSection('FLUXOTRABALHO')]
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

