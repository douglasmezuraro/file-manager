unit Model.Config.Application;

interface

uses
  Attribute.Component.Edit, Attribute.Ini.Key, Attribute.Validation.Text;

type
  TApplication = class sealed
  private
    FName: string;
  public
    [Text]
    [Edit('Nome de aplicação para monitoramento')]
    [Key('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

