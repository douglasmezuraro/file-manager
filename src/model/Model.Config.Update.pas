unit Model.Config.Update;

interface

uses
  Attribute.Caption,
  Attribute.Ident;

type
  TUpdate = class
  private
    FCanUpdate: Boolean;
    FServidorType: string;
    FLocalUpdate: UInt32;
    FSystemCode: UInt32;
  public
    [TCaption('Tipo')]
    [TIdent('TIPOSERVIDOR')]
    property ServidorType: string read FServidorType write FServidorType;

    [TCaption('Código do sistema')]
    [TIdent('CDSISTEMA')]
    property SystemCode: UInt32 read FSystemCode write FSystemCode;

    [TCaption('Pode atualizar?')]
    [TIdent('PODEATUALIZAR')]
    property CanUpdate: Boolean read FCanUpdate write FCanUpdate;

    [TCaption('Update local')]
    [TIdent('LOCALUPDATE')]
    property LocalUpdate: UInt32 read FLocalUpdate write FLocalUpdate;
  end;

implementation

end.

