unit Attribute.Ini;

interface

type
  IniAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create(const Text: string);
    property Text: string read FText;
  end;

  SectionAttribute = class(IniAttribute);
  KeyAttribute = class(IniAttribute);

implementation

{ TIniAttribute }

constructor IniAttribute.Create(const Text: string);
begin
  FText := Text;
end;

end.

