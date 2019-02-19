unit Model.Config.Client;

interface

uses
  Attribute.Ini;

type
  TClient = class
  private
    FAutoLogin: string;
    FDisableMenuBackground: Boolean;
    FTimeOut: UInt8;
  public
    [TEditAttribute('Login automático')]
    [TIdent('LOGINAUTOMATICO')]
    property AutoLogin: string read FAutoLogin write FAutoLogin;

    [TEditAttribute('Timeout de execução')]
    [TIdent('TIMEOUTEXECUCAO')]
    property TimeOut: UInt8 read FTimeOut write FTimeOut;

    [TCheckBoxAttribute('Desabilita fundo menu')]
    [TIdent('DESABILITAFUNDOMENU')]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

