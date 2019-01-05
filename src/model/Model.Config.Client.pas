unit Model.Config.Client;

interface

uses
  Ini.DataType,
  Ini.Key,
  Ini.Section;

type
  [TSection('CLIENTE')]
  TClient = class
  private
    FAutoLogin: Boolean;
    FDisableMenuBackground: Boolean;
    FTimeOut: UInt8;
  public
    [TKey('LOGINAUTOMATICO', dtString)]
    property AutoLogin: Boolean read FAutoLogin write FAutoLogin;

    [TKey('TIMEOUTEXECUCAO', dtInteger)]
    property TimeOut: UInt8 read FTimeOut write FTimeOut;

    [TKey('DESABILITAFUNDOMENU', dtBool)]
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

