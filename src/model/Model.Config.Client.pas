unit Model.Config.Client;

interface

uses
  Ini.Key,
  Ini.Section;

type
  [TSection('CLIENTE')]
  TClient = class
  private
    FAutoLogin: string;
    FDisableMenuBackground: Boolean;
    FTimeOut: UInt8;
  public
    [TKey('LOGINAUTOMATICO')]
    property AutoLogin: string read FAutoLogin write FAutoLogin;

    [TKey('TIMEOUTEXECUCAO')]
    property TimeOut: UInt8 read FTimeOut write FTimeOut;

    [TKey('DESABILITAFUNDOMENU')]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

