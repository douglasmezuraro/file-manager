unit Model.Config.Application;

interface

uses
  Ini.DataType,
  Ini.Key,
  Ini.Section;

type
  [TSection('APLICACAO')]
  TApplication = class
  private
    FName: string;
  public
    [TKey('NOMEAPLICACAOPARAMONITORAMENTO', dtString)]
    property Name: string read FName write FName;
  end;

implementation

end.

