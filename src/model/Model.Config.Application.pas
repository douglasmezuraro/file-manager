unit Model.Config.Application;

interface

uses
  Ini.Section;

type
  [TSection('APLICACAO')]
  TApplication = class
  private
    FName: string;
  public
    property Name: string read FName write FName;
  end;

implementation

end.

