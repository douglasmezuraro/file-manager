unit Model.Config.DUnit;

interface

uses
  Model.Config.Types;

type
  TDUnit = class
  private
    FTestMethod: string;
    FTestManagerURL: string;
    FBuildType: TBuildType;
    FTestRecord: string;
    FSuit: string;
    FPassword: string;
    FUser: string;
  public
    property User: string read FUser write FUser;
    property Password: string read FPassword write FPassword;
    property BuildType: TBuildType read FBuildType write FBuildType;
    property TestMethod: string read FTestMethod write FTestMethod;
    property Suit: string read FSuit write FSuit;
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.
