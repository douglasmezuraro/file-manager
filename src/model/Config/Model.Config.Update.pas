unit Model.Config.Update;

interface

uses
  Attribute.Component.CheckBox,
  Attribute.Component.Edit,
  Attribute.Ini.Key,
  Attribute.Validation.Integer,
  Attribute.Validation.Text;

type
  TUpdate = class sealed
  private
    FCanUpdate: Boolean;
    FServidorType: string;
    FLocalUpdate: Integer;
    FSystemCode: Integer;
  public
    [TextAttribute]
    [Edit('Tipo')]
    [Key('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [IntegerAttribute]
    [Edit('Código do sistema')]
    [Key('CDSISTEMA')]
    property SystemCode: Integer read FSystemCode write FSystemCode;

    [CheckBox('Pode atualizar?')]
    [Key('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [IntegerAttribute]
    [Edit('Update local')]
    [Key('LOCALUPDATE')]
    property LocalUpdate: Integer read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

