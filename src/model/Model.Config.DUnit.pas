unit Model.Config.DUnit;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
  TDUnit = class
  private
    FTestMethod: string;
    FTestManagerURL: string;
    FBuildType: string;
    FTestRecord: string;
    FSuit: string;
    FPassword: string;
    FUser: string;
  public
    [TControl('Usuário')]
    [TIdent('USUARIO')]
    property User: string read FUser write FUser;

    [TControl('Senha')]
    [TIdent('SENHA')]
    property Password: string read FPassword write FPassword;

    [TControl('Build')]
    [TIdent('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [TControl('Método de teste')]
    [TIdent('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TControl('Suite')]
    [TIdent('SUITE')]
    property Suit: string read FSuit write FSuit;

    [TControl('URL de gerenciador de teste')]
    [TIdent('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TControl('Registro de teste')]
    [TIdent('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

