unit Model.Config.Update;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
  TUpdate = class
  private
    FCanUpdate: Boolean;
    FServidorType: string;
    FLocalUpdate: UInt32;
    FSystemCode: UInt32;
  public
    [TControl('Tipo')]
    [TIdent('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [TControl('Código do sistema')]
    [TIdent('CDSISTEMA')]
    property SystemCode: UInt32 read FSystemCode write FSystemCode;

    [TControl('Pode atualizar?')]
    [TIdent('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [TControl('Update local')]
    [TIdent('LOCALUPDATE')]
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

