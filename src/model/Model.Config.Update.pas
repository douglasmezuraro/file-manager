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
    FLocalUpdate: UInt32;
    FSystemCode: UInt32;
  public
    [Edit('Tipo')]
    [Ident('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [Edit('Código do sistema')]
    [Ident('CDSISTEMA')]
    property SystemCode: UInt32 read FSystemCode write FSystemCode;

    [CheckBox('Pode atualizar?')]
    [Ident('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [Edit('Update local')]
    [Ident('LOCALUPDATE')]
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

