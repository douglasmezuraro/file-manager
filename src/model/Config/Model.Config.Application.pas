unit Model.Config.Application;

interface

uses
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute.Text;

type
  TApplication = class sealed
  private
    FName: string;
  public
    [TText]
    [TEdit('Nome de aplica��o para monitoramento')]
    [TKey('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

