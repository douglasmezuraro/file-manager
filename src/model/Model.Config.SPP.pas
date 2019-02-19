unit Model.Config.SPP;

interface

uses
  Attribute.Ini;

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
    [TCheckBoxAttribute('Usar SPP?')]
    [TIdent('USARSPP')]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [TEditAttribute('Nome do sistema')]
    [TIdent('NOMESISTEMA')]
    property SystemName: string read FSystemName write FSystemName;

    [TCheckBoxAttribute('Gravar log?')]
    [TIdent('GRAVARLOG')]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [TEditAttribute('Bloco de processamento')]
    [TIdent('BLOCOPROCESSAMENTO')]
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;

    [TEditAttribute('Bytes por bloco de processamento')]
    [TIdent('BYTESBLOCOPROCESSAMENTO')]
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;

    [TEditAttribute('Quantidade de execuções sem processamento')]
    [TIdent('QTDEXECUCOESSEMPROCESSAMENTO')]
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

