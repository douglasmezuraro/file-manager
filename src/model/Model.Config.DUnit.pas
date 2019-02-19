unit Model.Config.DUnit;

interface

uses
  Attribute.Ini;

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
    [TEditAttribute('Usuário')]
    [TIdent('USUARIO')]
    property User: string read FUser write FUser;

    [TEditAttribute('Senha')]
    [TIdent('SENHA')]
    property Password: string read FPassword write FPassword;

    [TEditAttribute('Build')]
    [TIdent('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [TEditAttribute('Método de teste')]
    [TIdent('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TEditAttribute('Suite')]
    [TIdent('SUITE')]
    property Suit: string read FSuit write FSuit;

    [TEditAttribute('URL de gerenciador de teste')]
    [TIdent('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TEditAttribute('Registro de teste')]
    [TIdent('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

