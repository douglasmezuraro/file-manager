unit Model.Config.Application;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
  TApplication = class
  private
    FName: string;
  public
    [TControl('Nome de aplicação para monitoramento')]
    [TIdent('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

