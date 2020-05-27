unit Model.Meza;

interface

uses
  Types.RegisterClass,
  Ini.Attribute.Section,
  Component.Attribute,
  Ini.Base,
  Model.Meza.Foo,
  Model.Meza.Doo;

type
  TMeza = class sealed(TIniMappedObject)
  private
    FFoo: TFoo;
    FDoo: TDoo;
  public
    [TManaged][TTabItem('Foo')][TSection('FOO')]
    property Foo: TFoo read FFoo write FFoo;

    [TManaged][TTabItem('Doo')][TSection('DOO')]
    property Doo: TDoo read FDoo write FDoo;
  end;

implementation

initialization
  RegisteredClasses.RegisterClass(TMeza);

finalization
  RegisteredClasses.UnRegisterClass(TMeza)

end.
