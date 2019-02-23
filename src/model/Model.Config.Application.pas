unit Model.Config.Application;

interface

uses
  Attribute.Control,
  Attribute.Ini;

type
  TApplication = class
  private
    FName: string;
  public
    [Edit('Nome de aplicação para monitoramento')]
    [Key('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

