unit Attribute.Ini;

interface

type
  TIniAttribute = class abstract(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const Name: string); overload;
    property Name: string read FName;
  end;

  TSection = class(TIniAttribute);
  TIdent = class(TIniAttribute);
  TCaptionAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create(const Text: string);
    property Text: string read FText;
  end;

  TTabItemAttribute = class(TCaptionAttribute);
  TCheckBoxAttribute = class(TCaptionAttribute);
  TEditAttribute = class(TCaptionAttribute);
  TComboBoxAttribute = class(TCaptionAttribute)
  private
    FItems: string;
  public
    constructor Create(const Text, Items: string); reintroduce;
    property Items: string read FItems;
  end;

implementation

{ TIniAttribute }

constructor TIniAttribute.Create(const Name: string);
begin
  FName := Name;
end;

{ TCaptionAttribute }

constructor TCaptionAttribute.Create(const Text: string);
begin
  FText := Text;
end;

{ TComboBoxAttribute }

constructor TComboBoxAttribute.Create(const Text, Items: string);
begin
  inherited Create(Text);
  FItems := Items;
end;

end.

