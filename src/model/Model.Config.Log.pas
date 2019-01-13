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
    FRegisterSignatureLog: UInt32;
    FRegisterMethodLog: Boolean;
  public
    [TKey('REGISTRALOGMETODO')]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [TKey('REGISTRALOGSQL')]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [TKey('GRAVARLOGASSINATURA')]
    property RegisterSignatureLog: UInt32 read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

