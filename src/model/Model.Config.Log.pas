unit Model.Config.Log;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
  TLog = class
  private
    FRegisterSQLLog: Boolean;
    FRegisterSignatureLog: Boolean;
    FRegisterMethodLog: Boolean;
  public
    [TControl('Registar log de métodos?')]
    [TIdent('REGISTRALOGMETODO')]
    property RegisterMethodLog: Boolean read FRegisterMethodLog write FRegisterMethodLog;

    [TControl('Registrar log de SQLs?')]
    [TIdent('REGISTRALOGSQL')]
    property RegisterSQLLog: Boolean read FRegisterSQLLog write FRegisterSQLLog;

    [TControl('Registrar log de assinaturas?')]
    [TIdent('GRAVARLOGASSINATURA')]
    property RegisterSignatureLog: Boolean read FRegisterSignatureLog write FRegisterSignatureLog;
  end;

implementation

end.

