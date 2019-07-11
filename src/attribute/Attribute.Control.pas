unit Attribute.Control;

interface

uses
  System.SysUtils;

type
  TextAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create(const Text: string); overload;
    property Text: string read FText;
  end;

  HintAttribute = class(TextAttribute);
  ComponentAttribute = class(TextAttribute);

  TabAttribute = class(ComponentAttribute);
  CheckBoxAttribute = class(ComponentAttribute);
  EditAttribute = class(ComponentAttribute);
  MemoAttribute = class(ComponentAttribute);

  ComboBoxAttribute = class(ComponentAttribute)
  private
    FItems: TArray<string>;
  public
    constructor Create(const Text, Items: string); overload;
    property Items: TArray<string> read FItems;
  end;

implementation

{ CaptionAttribute }

constructor TextAttribute.Create(const Text: string);
begin
  FText := Text;
end;

{ ComboBoxAttribute }

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

