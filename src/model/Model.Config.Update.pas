unit Model.Config.Update;

interface

uses
  Ini.Ident,
  Ini.Section;

type
  [TSection('SPUPDATE')]
  TUpdate = class
  private
    FCanUpdate: Boolean;
    FServidorType: string;
    FLocalUpdate: UInt32;
    FSystemCode: UInt32;
  public
    [TIdent('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [TIdent('CDSISTEMA')]
    property SystemCode: UInt32 read FSystemCode write FSystemCode;

    [TIdent('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [TIdent('LOCALUPDATE')]
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

