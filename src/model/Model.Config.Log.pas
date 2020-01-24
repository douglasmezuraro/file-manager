unit Model.Config.Log;

interface

uses
  Attribute.Component.CheckBox,
  Attribute.Ini.Key;

type
  TLog = class
  private
    FRegisterSQLLog: Boolean;
    FRegisterSignatureLog: Boolean;
    FRegisterMethodLog: Boolean;
  public
    [CheckBox('Registar log de métodos?')]
    [Key('REGISTRALOGMETODO')]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [CheckBox('Registrar log de SQLs?')]
    [Key('REGISTRALOGSQL')]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [CheckBox('Registrar log de assinaturas?')]
    [Key('GRAVARLOGASSINATURA')]
    property RegisterSignatureLog: Boolean read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

