unit Model.Config.Log;

interface

uses
  Attribute.Ini;

type
  TLog = class
  private
    FRegisterSQLLog: Boolean;
    FRegisterSignatureLog: Boolean;
    FRegisterMethodLog: Boolean;
  public
    [TCheckBoxAttribute('Registar log de métodos?')]
    [TIdent('REGISTRALOGMETODO')]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [TCheckBoxAttribute('Registrar log de SQLs?')]
    [TIdent('REGISTRALOGSQL')]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [TCheckBoxAttribute('Registrar log de assinaturas?')]
    [TIdent('GRAVARLOGASSINATURA')]
    property RegisterSignatureLog: Boolean read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

