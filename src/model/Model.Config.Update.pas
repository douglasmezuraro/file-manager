unit Model.Config.Update;

interface

uses
  Ini.DataType,
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
    [TKey('TIPOSERVIDOR', dtString)]
    property ServidorType: string read FServidorType write FServidorType;

    [TKey('CDSISTEMA', dtInteger)]
    property SystemCode: UInt32 read FSystemCode write FSystemCode;

    [TKey('PODEATUALIZAR', dtBool)]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [TKey('LOCALUPDATE', dtInteger)]
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

