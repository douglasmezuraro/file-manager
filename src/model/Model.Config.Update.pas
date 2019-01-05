unit Model.Config.Update;

interface

uses
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
    property ServidorType: string read FServidorType write FServidorType;
    property SystemCode: UInt32 read FSystemCode write FSystemCode;
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

