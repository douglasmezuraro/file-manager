unit Model.Config.Update;

interface

uses
  Component.Attribute.CheckBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute;

type
  TUpdate = class sealed
  private
    FCanUpdate: Boolean;
    FServidorType: string;
    FLocalUpdate: Integer;
    FSystemCode: Integer;
  public
    [TTextAttribute]
    [TEdit('Tipo')]
    [TKey('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [TIntegerAttribute]
    [TEdit('Código do sistema')]
    [TKey('CDSISTEMA')]
    property SystemCode: Integer read FSystemCode write FSystemCode;

    [TCheckBox('Pode atualizar?')]
    [TKey('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [TIntegerAttribute]
    [TEdit('Update local')]
    [TKey('LOCALUPDATE')]
    property LocalUpdate: Integer read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

