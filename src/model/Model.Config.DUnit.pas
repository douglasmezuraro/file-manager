unit Model.Config.DUnit;

interface

uses
  Attribute.Caption,
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
    [TCaption('Usuário')]
    [TIdent('USUARIO')]
    property User: string read FUser write FUser;

    [TCaption('Senha')]
    [TIdent('SENHA')]
    property Password: string read FPassword write FPassword;

    [TCaption('Build')]
    [TIdent('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [TCaption('Método de teste')]
    [TIdent('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TCaption('Suite')]
    [TIdent('SUITE')]
    property Suit: string read FSuit write FSuit;

    [TCaption('URL de gerenciador de teste')]
    [TIdent('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TCaption('Registro de teste')]
    [TIdent('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

