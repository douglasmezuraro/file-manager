unit Model.Config.Update;

interface

uses
  Attribute.Control,
  Attribute.Ini;

type
  TUpdate = class
  private
    FCanUpdate: Boolean;
    FServidorType: string;
    FLocalUpdate: Integer;
    FSystemCode: Integer;
  public
    [Edit('Tipo')]
    [Key('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [Edit('Código do sistema')]
    [Key('CDSISTEMA')]
    property SystemCode: Integer read FSystemCode write FSystemCode;

    [CheckBox('Pode atualizar?')]
    [Key('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [Edit('Update local')]
    [Key('LOCALUPDATE')]
    property LocalUpdate: Integer read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

