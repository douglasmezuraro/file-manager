unit Model.Config.DUnit;

interface

uses
  Ini.DataType,
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
    [TKey('USUARIO', dtString)]
    property User: string read FUser write FUser;

    [TKey('SENHA', dtString)]
    property Password: string read FPassword write FPassword;

    [TKey('BUILD', dtString)]
    property BuildType: string read FBuildType write FBuildType;

    [TKey('METODOTEST', dtString)]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TKey('SUITE', dtString)]
    property Suit: string read FSuit write FSuit;

    [TKey('TEST_MANAGER_URL', dtString)]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TKey('TEST_RECORD', dtString)]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

