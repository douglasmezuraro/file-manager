unit Model.Config.Log;

interface

uses
  Ini.Key,
  Ini.Section;

type
  [TSection('LOG')]
  TLog = class
  private
    FRegisterSQLLog: Boolean;
    FRegisterSignatureLog: Boolean;
    FRegisterMethodLog: Boolean;
  public
    [TKey('REGISTRALOGMETODO')]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [TKey('REGISTRALOGSQL')]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [TKey('GRAVARLOGASSINATURA')]
    property RegisterSignatureLog: Boolean read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

