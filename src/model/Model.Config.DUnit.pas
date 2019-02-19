unit Model.Config.DUnit;

interface

uses
  Attribute.Control,
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
    [Edit('Usuário')]
    [Ident('USUARIO')]
    property User: string read FUser write FUser;

    [Edit('Senha')]
    [Ident('SENHA')]
    property Password: string read FPassword write FPassword;

    [Edit('Build')]
    [Ident('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [Edit('Método de teste')]
    [Ident('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [Edit('Suite')]
    [Ident('SUITE')]
    property Suit: string read FSuit write FSuit;

    [Edit('URL de gerenciador de teste')]
    [Ident('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [Edit('Registro de teste')]
    [Ident('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

