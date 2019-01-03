unit Model.Config.Application;

interface

type
  TApplication = class
  private
    FName: string;
  public
    property Name: string read FName write FName;
  end;

implementation

end.
