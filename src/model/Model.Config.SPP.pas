unit Model.Config.SPP;

interface

uses
  Ini.Key,
  Ini.Section;

type
  [TSection('CLIENTESPP')]
  TSPP = class
  private
    FRegisterLog: Boolean;
    FExecutionsWithoutProcess: UInt8;
    FProcessBlockSize: UInt32;
    FUseSPP: Boolean;
    FProcessBlock: UInt32;
    FSystemName: string;
  public
    [TKey('USARSPP')]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [TKey('NOMESISTEMA')]
    property SystemName: string read FSystemName write FSystemName;

    [TKey('GRAVARLOG')]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [TKey('BLOCOPROCESSAMENTO')]
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;

    [TKey('BYTESBLOCOPROCESSAMENTO')]
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;

    [TKey('QTDEXECUCOESSEMPROCESSAMENTO')]
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

