unit Model.Config.Workflow;

interface

uses
  Attribute.Caption,
  Attribute.Ident;

type
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    [TCaption('Pode alterar o fluxo?')]
    [TIdent('PODEALTERARVERSAOATUALFLUXO')]
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

