unit Model.Config.DUnit;

interface

uses
  Ini.Key,
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
    [TKey('USUARIO')]
    property User: string read FUser write FUser;

    [TKey('SENHA')]
    property Password: string read FPassword write FPassword;

    [TKey('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [TKey('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TKey('SUITE')]
    property Suit: string read FSuit write FSuit;

    [TKey('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TKey('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

