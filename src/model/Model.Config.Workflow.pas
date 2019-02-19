unit Model.Config.Workflow;

interface

uses
  Attribute.Ini;

type
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    [TCheckBoxAttribute('Pode alterar o fluxo?')]
    [TIdent('PODEALTERARVERSAOATUALFLUXO')]
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

