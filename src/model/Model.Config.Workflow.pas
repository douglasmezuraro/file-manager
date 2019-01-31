unit Model.Config.Workflow;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    [TControl('Pode alterar o fluxo?')]
    [TIdent('PODEALTERARVERSAOATUALFLUXO')]
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

