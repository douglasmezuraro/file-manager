unit Model.Config.Application;

interface

uses
  Attribute.Caption,
  Attribute.Ident;

type
  TApplication = class
  private
    FName: string;
  public
    [TCaption('Nome de aplicação para monitoramento')]
    [TIdent('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

