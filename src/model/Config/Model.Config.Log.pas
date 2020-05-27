unit Model.Config.Log;

interface

uses
  Component.Attribute.CheckBox,
  Ini.Attribute.Key;

type
  TLog = class sealed
  private
    FRegisterSQLLog: Boolean;
    FRegisterSignatureLog: Boolean;
    FRegisterMethodLog: Boolean;
  public
    [TCheckBox('Registar log de métodos?')]
    [TKey('REGISTRALOGMETODO')]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [TCheckBox('Registrar log de SQLs?')]
    [TKey('REGISTRALOGSQL')]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [TCheckBox('Registrar log de assinaturas?')]
    [TKey('GRAVARLOGASSINATURA')]
    property RegisterSignatureLog: Boolean read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

