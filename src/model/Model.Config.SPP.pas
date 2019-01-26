unit Model.Config.SPP;

interface

uses
  Ini.Ident,
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
    [TIdent('USARSPP')]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [TIdent('NOMESISTEMA')]
    property SystemName: string read FSystemName write FSystemName;

    [TIdent('GRAVARLOG')]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [TIdent('BLOCOPROCESSAMENTO')]
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;

    [TIdent('BYTESBLOCOPROCESSAMENTO')]
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;

    [TIdent('QTDEXECUCOESSEMPROCESSAMENTO')]
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

