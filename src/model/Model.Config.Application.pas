unit Model.Config.Application;

interface

uses
  Ini.Ident,
  Ini.Section;

type
  [TSection('APLICACAO')]
  TApplication = class
  private
    FName: string;
  public
    [TIdent('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

