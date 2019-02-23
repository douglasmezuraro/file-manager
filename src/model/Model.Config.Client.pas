unit Model.Config.Client;

interface

uses
  Attribute.Control,
  Attribute.Ini;

type
  TClient = class
  private
    FAutoLogin: string;
    FDisableMenuBackground: Boolean;
    FTimeOut: Integer;
  public
    [Edit('Login automático')]
    [Key('LOGINAUTOMATICO')]
    property AutoLogin: string read FAutoLogin write FAutoLogin;

    [Edit('Timeout de execução')]
    [Key('TIMEOUTEXECUCAO')]
    property TimeOut: Integer read FTimeOut write FTimeOut;

    [CheckBox('Desabilita fundo menu')]
    [Key('DESABILITAFUNDOMENU')]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

