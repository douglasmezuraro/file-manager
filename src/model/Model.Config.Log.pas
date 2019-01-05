unit Model.Config.Log;

interface

uses
  Ini.Section;

type
  [TSection('LOG')]
  TLog = class
  private
    FRegisterLog: Boolean;
    FAutoLogin: string;
    FRegisterSignatureLog: Boolean;
  public
    property AutoLogin: string read FAutoLogin write FAutoLogin;
    property RegisterLog: Boolean read FRegisterLog write FRegisterLog;
    property RegisterSignatureLog: Boolean read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

