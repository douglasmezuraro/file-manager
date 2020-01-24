unit Model.Config.Client;

interface

uses
  Attribute.Component.CheckBox, Attribute.Component.Edit, Attribute.Ini.Key, Attribute.Validation.Integer,
  Attribute.Validation.Text;

type
  TClient = class sealed
  private
    FAutoLogin: string;
    FDisableMenuBackground: Boolean;
    FTimeOut: Integer;
  public
    [TextAttribute]
    [Edit('Login automático')]
    [Key('LOGINAUTOMATICO')]
    property AutoLogin: string read FAutoLogin write FAutoLogin;

    [IntegerAttribute]
    [Edit('Timeout de execução')]
    [Key('TIMEOUTEXECUCAO')]
    property TimeOut: Integer read FTimeOut write FTimeOut;

    [CheckBox('Desabilita fundo menu')]
    [Key('DESABILITAFUNDOMENU')]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

