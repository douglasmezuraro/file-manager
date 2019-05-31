unit Attribute.Control;

interface

type
  CaptionAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create(const Text: string); overload;
    property Text: string read FText;
  end;

  HintAttribute = class(CaptionAttribute);

  TabItemAttribute = class(CaptionAttribute);
  CheckBoxAttribute = class(CaptionAttribute);
  EditAttribute = class(CaptionAttribute);

  ComboBoxAttribute = class(CaptionAttribute)
  private
    FItems: string;
  public
    constructor Create(const Text, Items: string); overload;
    property Items: string read FItems;
  end;

implementation

{ CaptionAttribute }

constructor CaptionAttribute.Create(const Text: string);
begin
  FText := Text;
end;

{ ComboBoxAttribute }

constructor ComboBoxAttribute.Create(const Text, Items: string);
begin
  inherited Create(Text);
  FItems := Items;
end;

end.

