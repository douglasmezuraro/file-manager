unit Model.Config.Workflow;

interface

uses
  Attribute.Component.CheckBox,
  Attribute.Ini;

type
  TWorkflow = class
  private
    FCanChangeCurrentVersion: Boolean;
  public
    [CheckBox('Pode alterar o fluxo?')]
    [Key('PODEALTERARVERSAOATUALFLUXO')]
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

