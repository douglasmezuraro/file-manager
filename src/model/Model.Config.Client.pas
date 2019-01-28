unit Model.Config.Client;

interface

uses
  Attribute.Caption,
  Attribute.Ident;

type
  TClient = class
  private
    FAutoLogin: string;
    FDisableMenuBackground: Boolean;
    FTimeOut: UInt8;
  public
    [TCaption('Login automático')]
    [TIdent('LOGINAUTOMATICO')]
    property AutoLogin: string read FAutoLogin write FAutoLogin;

    [TCaption('Timeout de execução')]
    [TIdent('TIMEOUTEXECUCAO')]
    property TimeOut: UInt8 read FTimeOut write FTimeOut;

    [TCaption('Desabilita fundo menu')]
    [TIdent('DESABILITAFUNDOMENU')]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

