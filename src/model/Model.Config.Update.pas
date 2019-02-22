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
    [Ident('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [Edit('Código do sistema')]
    [Ident('CDSISTEMA')]
    property SystemCode: Integer read FSystemCode write FSystemCode;

    [CheckBox('Pode atualizar?')]
    [Ident('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [Edit('Update local')]
    [Ident('LOCALUPDATE')]
    property LocalUpdate: Integer read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

