unit Model.Config.SPP;

interface

type
  TSPP = class
  private
    FRegisterLog: Boolean;
    FExecutionsWithoutProcess: UInt8;
    FProcessBlockSize: UInt32;
    FUseSPP: Boolean;
    FProcessBlock: UInt32;
    FSystemName: string;
  public
    property UseSPP: Boolean read FUseSPP write FUseSPP;
    property SystemName: string read FSystemName write FSystemName;
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.
