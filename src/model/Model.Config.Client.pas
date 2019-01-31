unit Model.Config.Client;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
  TClient = class
  private
    FAutoLogin: string;
    FDisableMenuBackground: Boolean;
    FTimeOut: UInt8;
  public
    [TControl('Login automático')]
    [TIdent('LOGINAUTOMATICO')]
    property AutoLogin: string read FAutoLogin write FAutoLogin;

    [TControl('Timeout de execução')]
    [TIdent('TIMEOUTEXECUCAO')]
    property TimeOut: UInt8 read FTimeOut write FTimeOut;

    [TControl('Desabilita fundo menu')]
    [TIdent('DESABILITAFUNDOMENU')]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

