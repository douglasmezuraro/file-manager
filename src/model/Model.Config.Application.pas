unit Model.Config.Application;

interface

uses
  Attribute.Component.Edit,
  Attribute.Ini.Key,
  Attribute.Validation;

type
  TApplication = class
  private
    FName: string;
  public
    [StringAttribute]
    [Edit('Nome de aplicação para monitoramento')]
    [Key('NOMEAPLICACAOPARAMONITORAMENTO')]
    property Name: string read FName write FName;
  end;

implementation

end.

