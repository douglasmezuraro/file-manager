unit Model.Config.Client;

interface

uses
  Ini.Section;

type
  [TSection('CLIENTE')]
  TClient = class
  private
    FAutoLogin: Boolean;
    FDisableMenuBackground: Boolean;
    FTimeOut: UInt8;
  public
    property AutoLogin: Boolean read FAutoLogin write FAutoLogin;
    property TimeOut: UInt8 read FTimeOut write FTimeOut;
    property DisableMenuBackground: Boolean read FDisableMenuBackground write FDisableMenuBackground;
  end;

implementation

end.

