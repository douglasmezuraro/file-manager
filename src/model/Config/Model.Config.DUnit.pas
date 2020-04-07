unit Model.Config.DUnit;

interface

uses
  Attribute.Component.Edit,
  Attribute.Ini.Key,
  Attribute.Validation.Text;

type
  TDUnit = class sealed
  private
    FTestMethod: string;
    FTestManagerURL: string;
    FBuildType: string;
    FTestRecord: string;
    FSuit: string;
    FPassword: string;
    FUser: string;
  public
    [TextAttribute]
    [Edit('Usuário')]
    [Key('USUARIO')]
    property User: string read FUser write FUser;

    [TextAttribute]
    [Edit('Senha')]
    [Key('SENHA')]
    property Password: string read FPassword write FPassword;

    [TextAttribute(False)]
    [Edit('Build')]
    [Key('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [TextAttribute]
    [Edit('Método de teste')]
    [Key('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TextAttribute]
    [Edit('Suite')]
    [Key('SUITE')]
    property Suit: string read FSuit write FSuit;

    [TextAttribute]
    [Edit('URL de gerenciador de teste')]
    [Key('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TextAttribute]
    [Edit('Registro de teste')]
    [Key('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

