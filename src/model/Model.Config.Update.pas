unit Model.Config.Update;

interface

uses
  Ini.Key,
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
    [TKey('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [TKey('CDSISTEMA')]
    property SystemCode: UInt32 read FSystemCode write FSystemCode;

    [TKey('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [TKey('LOCALUPDATE')]
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

