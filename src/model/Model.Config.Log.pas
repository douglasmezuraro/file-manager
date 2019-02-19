unit Model.Config.Log;

interface

uses
  Attribute.Control,
  Attribute.Ini;

type
  TLog = class
  private
    FRegisterSQLLog: Boolean;
    FRegisterSignatureLog: Boolean;
    FRegisterMethodLog: Boolean;
  public
    [CheckBox('Registar log de métodos?')]
    [Ident('REGISTRALOGMETODO')]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [CheckBox('Registrar log de SQLs?')]
    [Ident('REGISTRALOGSQL')]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [CheckBox('Registrar log de assinaturas?')]
    [Ident('GRAVARLOGASSINATURA')]
    property RegisterSignatureLog: Boolean read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

