unit Model.Config.Update;

interface

uses
  Attribute.Ini;

type
  TUpdate = class
  private
    FCanUpdate: Boolean;
    FServidorType: string;
    FLocalUpdate: UInt32;
    FSystemCode: UInt32;
  public
    [TEditAttribute('Tipo')]
    [TIdent('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [TEditAttribute('Código do sistema')]
    [TIdent('CDSISTEMA')]
    property SystemCode: UInt32 read FSystemCode write FSystemCode;

    [TCheckBoxAttribute('Pode atualizar?')]
    [TIdent('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [TEditAttribute('Update local')]
    [TIdent('LOCALUPDATE')]
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

