unit Model.Config.Workflow;

interface

type
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.
