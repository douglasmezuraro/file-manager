unit Model.Config.DUnit;

interface

uses
  Attribute.Ini,
  Attribute.Validation;

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
    [StringAttribute]
    [Edit('Usuário')]
    [Key('USUARIO')]
    property User: string read FUser write FUser;

    [StringAttribute]
    [Edit('Senha')]
    [Key('SENHA')]
    property Password: string read FPassword write FPassword;

    [StringAttribute(False)]
    [Edit('Build')]
    [Key('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [StringAttribute]
    [Edit('Método de teste')]
    [Key('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [StringAttribute]
    [Edit('Suite')]
    [Key('SUITE')]
    property Suit: string read FSuit write FSuit;

    [StringAttribute]
    [Edit('URL de gerenciador de teste')]
    [Key('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [StringAttribute]
    [Edit('Registro de teste')]
    [Key('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

