unit Model.Config.Log;

interface

uses
  Ini.DataType,
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
    [TKey('REGISTRALOGMETODO', dtBool)]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [TKey('REGISTRALOGSQL', dtBool)]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [TKey('GRAVARLOGASSINATURA', dtInteger)]
    property RegisterSignatureLog: UInt32 read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

