unit Model.Config.Update;

interface

uses
  Model.Config.Types;

type
  TUpdate = class
  private
    FCanUpdate: Boolean;
    FServidorType: TServidorType;
    FLocalUpdate: UInt32;
    FSystemCode: UInt32;
  public
    property ServidorType: TServidorType read FServidorType write FServidorType;
    property SystemCode: UInt32 read FSystemCode write FSystemCode;
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.
