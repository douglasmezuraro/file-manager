unit Model.Config.SPP;

interface

uses
  Attribute.Control,
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
    [CheckBox('Usar SPP?')]
    [Ident('USARSPP')]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [Edit('Nome do sistema')]
    [Ident('NOMESISTEMA')]
    property SystemName: string read FSystemName write FSystemName;

    [CheckBox('Gravar log?')]
    [Ident('GRAVARLOG')]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [Edit('Bloco de processamento')]
    [Ident('BLOCOPROCESSAMENTO')]
    property ProcessBlock: UInt32 read FProcessBlock write FProcessBlock;

    [Edit('Bytes por bloco de processamento')]
    [Ident('BYTESBLOCOPROCESSAMENTO')]
    property ProcessBlockSize: UInt32 read FProcessBlockSize write FProcessBlockSize;

    [Edit('Quantidade de execuções sem processamento')]
    [Ident('QTDEXECUCOESSEMPROCESSAMENTO')]
    property ExecutionsWithoutProcess: UInt8 read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

