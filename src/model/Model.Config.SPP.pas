unit Model.Config.SPP;

interface

uses
  Attribute.Caption,
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
    [TCaption('Usar SPP?')]
    [TIdent('USARSPP')]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [TCaption('Nome do sistema')]
    [TIdent('NOMESISTEMA')]
    property SystemName: string read FSystemName write FSystemName;

    [TCaption('Gravar log?')]
    [TIdent('GRAVARLOG')]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [TCaption('Bloco de processamento')]
    [TIdent('BLOCOPROCESSAMENTO')]
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;

    [TCaption('Bytes por bloco de processamento')]
    [TIdent('BYTESBLOCOPROCESSAMENTO')]
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;

    [TCaption('Quantidade de execuções sem processamento')]
    [TIdent('QTDEXECUCOESSEMPROCESSAMENTO')]
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

