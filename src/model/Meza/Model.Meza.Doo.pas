unit Model.Meza.Doo;

interface

uses
  Component.Attribute.ComboBox,
  Component.Attribute.CheckBox,
  Component.Attribute.Edit,
  Ini.Attribute.Key,
  Validation.Attribute.Integer,
  Validation.Attribute.Text;

type
  TDoo = class sealed
  private
    FB: string;
    FC: Boolean;
    FA: Integer;
    FD: string;
  public
    [TTextAttribute]
    [TEdit('Teste A')]
    [TKey('A')]
    property A: Integer read FA write FA;

    [TIntegerAttribute]
    [TEdit('Teste B')]
    [TKey('B')]
    property B: string read FB write FB;

    [TCheckBox('Teste C')]
    [TKey('C')]
    property C: Boolean read FC write FC;

    [TComboBox('Teste D', 'A,B,C,D')]
    [TKey('D')]
    property D: string read FD write FD;
  end;

implementation

end.
