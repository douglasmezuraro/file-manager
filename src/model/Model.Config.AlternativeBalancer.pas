unit Model.Config.AlternativeBalancer;

interface

uses
  Ini.Section;

type
  [TSection('BALANCEADORALTERNATIVO')]
  TAlternativeBalancer = class
  private
    FKey: string;
  public
    property Key: string read FKey write FKey;
  end;

implementation

end.

