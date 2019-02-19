unit Model.Config.Application;

interface

uses
  Attribute.Ini;

type
  TApplication = class
  private
    FName: string;
  public
    [TEditAttribute('Nome de aplica��o para monitoramento')]
    [TIdent('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

