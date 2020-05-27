unit Model.Config.SPP;

interface

uses
  Component.Attribute.CheckBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute;

type
  TSPP = class sealed
  private
    FRegisterLog: Boolean;
    FExecutionsWithoutProcess: Integer;
    FProcessBlockSize: Integer;
    FUseSPP: Boolean;
    FProcessBlock: Integer;
    FSystemName: string;
  public
    [TCheckBox('Usar SPP?')]
    [TKey('USARSPP')]
    property UseSPP: Boolean read FUseSPP write FUseSPP;

    [TTextAttribute]
    [TEdit('Nome do sistema')]
    [TKey('NOMESISTEMA')]
    property SystemName: string read FSystemName write FSystemName;

    [TCheckBox('Gravar log?')]
    [TKey('GRAVARLOG')]
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;

    [TIntegerAttribute]
    [TEdit('Bloco de processamento')]
    [TKey('BLOCOPROCESSAMENTO')]
    property ProcessBlock: Integer read FProcessBlock write FProcessBlock;

    [TIntegerAttribute]
    [TEdit('Bytes por bloco de processamento')]
    [TKey('BYTESBLOCOPROCESSAMENTO')]
    property ProcessBlockSize: Integer read FProcessBlockSize write FProcessBlockSize;

    [TIntegerAttribute]
    [TEdit('Quantidade de execuções sem processamento')]
    [TKey('QTDEXECUCOESSEMPROCESSAMENTO')]
    property ExecutionsWithoutProcess: Integer read FExecutionsWithoutProcess write FExecutionsWithoutProcess;
  end;

implementation

end.

