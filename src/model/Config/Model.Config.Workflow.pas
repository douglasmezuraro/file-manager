unit Model.Config.Workflow;

interface

uses
  Component.Attribute.CheckBox,
  Ini.Attribute.Key;

type
  TWorkflow = class sealed
  private
    FCanChangeCurrentVersion: Boolean;
  public
    [TCheckBox('Pode alterar o fluxo?')]
    [TKey('PODEALTERARVERSAOATUALFLUXO')]
    property CanChangeCurrentVersion: Boolean read FCanChangeCurrentVersion write FCanChangeCurrentVersion;
  end;

implementation

end.

