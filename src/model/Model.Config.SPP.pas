unit Model.Config.SPP;

interface

uses
  Attribute.Control,
  Attribute.Ident;

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
    [TControl('Usar SPP?')]
    [TIdent('USARSPP')]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [TControl('Nome do sistema')]
    [TIdent('NOMESISTEMA')]
    property SystemName: string read FSystemName write FSystemName;

    [TControl('Gravar log?')]
    [TIdent('GRAVARLOG')]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [TControl('Bloco de processamento')]
    [TIdent('BLOCOPROCESSAMENTO')]
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;

    [TControl('Bytes por bloco de processamento')]
    [TIdent('BYTESBLOCOPROCESSAMENTO')]
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;

    [TControl('Quantidade de execuções sem processamento')]
    [TIdent('QTDEXECUCOESSEMPROCESSAMENTO')]
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

