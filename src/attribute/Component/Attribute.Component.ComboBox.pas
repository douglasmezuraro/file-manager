unit Attribute.Component.ComboBox;

interface

uses
  Attribute.Component.Control, System.SysUtils;

type
  ComboBoxAttribute = class sealed(ControlAttribute)
  private
    FItems: TArray<string>;
  public
    constructor Create(const Text, Items: string); overload;
    property Items: TArray<string> read FItems;
  end;

implementation

constructor ComboBoxAttribute.Create(const Text, Items: string);
const
  Separator = ',';
var
  LItems: string;
begin
  inherited Create(Text);

  LItems := Items;
  if not Items.StartsWith(Separator) then
    LItems := Separator + Items;

  FItems := LItems.Split([Separator]);
end;

end.
