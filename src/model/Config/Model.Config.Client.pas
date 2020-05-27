unit Model.Config.Client;

interface

uses
  Component.Attribute.CheckBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute;

type
  TClient = class sealed
  private
    FAutoLogin: string;
    FDisableMenuBackground: Boolean;
    FTimeOut: Integer;
  public
    [TTextAttribute]
    [TEdit('Login automático')]
    [TKey('LOGINAUTOMATICO')]
    property AutoLogin: string read FAutoLogin write FAutoLogin;

    [TIntegerAttribute]
    [TEdit('Timeout de execução')]
    [TKey('TIMEOUTEXECUCAO')]
    property TimeOut: Integer read FTimeOut write FTimeOut;

    [TCheckBox('Desabilita fundo menu')]
    [TKey('DESABILITAFUNDOMENU')]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

