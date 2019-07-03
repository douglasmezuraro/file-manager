unit Attribute.Control;

interface

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

  ComboBoxAttribute = class(ComponentAttribute)
  private
    FItems: string;
  public
    constructor Create(const Text, Items: string); overload;
    property Items: string read FItems;
  end;

implementation

{ CaptionAttribute }

constructor TextAttribute.Create(const Text: string);
begin
  FText := Text;
end;

{ ComboBoxAttribute }

constructor ComboBoxAttribute.Create(const Text, Items: string);
begin
  inherited Create(Text);
  FItems := ',' + Items;
end;

end.

