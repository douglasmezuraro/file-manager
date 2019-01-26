unit Model.Config.DUnit;

interface

uses
  Ini.Ident,
  Ini.Section;

type
  [TSection('DUNIT')]
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
    [TIdent('USUARIO')]
    property User: string read FUser write FUser;

    [TIdent('SENHA')]
    property Password: string read FPassword write FPassword;

    [TIdent('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [TIdent('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TIdent('SUITE')]
    property Suit: string read FSuit write FSuit;

    [TIdent('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TIdent('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

