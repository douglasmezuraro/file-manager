unit Model.Config.DUnit;

interface

uses
  Component.Attribute.ComboBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute;

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
    [TTextAttribute]
    [TEdit('Usuário')]
    [TKey('USUARIO')]
    property User: string read FUser write FUser;

    [TTextAttribute]
    [TEdit('Senha')]
    [TKey('SENHA')]
    property Password: string read FPassword write FPassword;

    [TComboBox('Build', 'Continuo,Delphi,Noturno')]
    [TKey('BUILD')]
    property BuildType: string read FBuildType write FBuildType;

    [TTextAttribute]
    [TEdit('Método de teste')]
    [TKey('METODOTEST')]
    property TestMethod: string read FTestMethod write FTestMethod;

    [TTextAttribute]
    [TEdit('Suite')]
    [TKey('SUITE')]
    property Suit: string read FSuit write FSuit;

    [TTextAttribute]
    [TEdit('URL de gerenciador de teste')]
    [TKey('TEST_MANAGER_URL')]
    property TestManagerURL: string read FTestManagerURL write FTestManagerURL;

    [TTextAttribute]
    [TEdit('Registro de teste')]
    [TKey('TEST_RECORD')]
    property TestRecord: string read FTestRecord write FTestRecord;
  end;

implementation

end.

