unit Model.Config.SPP;

interface

uses
  Ini.DataType,
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
    [TKey('USARSPP', dtBool)]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [TKey('NOMESISTEMA', dtString)]
    property SystemName: string read FSystemName write FSystemName;

    [TKey('GRAVARLOG', dtBool)]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [TKey('BLOCOPROCESSAMENTO', dtInteger)]
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;

    [TKey('BYTESBLOCOPROCESSAMENTO', dtInteger)]
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;

    [TKey('QTDEXECUCOESSEMPROCESSAMENTO', dtInteger)]
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

