unit Model.Config.Application;

interface

uses
  Ini.Key,
  Ini.Section;

type
  [TSection('APLICACAO')]
  TApplication = class
  private
    FName: string;
  public
    [TKey('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

