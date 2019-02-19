unit Attribute.Ini;

interface

type
  IniAttribute = class abstract(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const Name: string);
    property Name: string read FName;
  end;

  SectionAttribute = class(IniAttribute);
  IdentAttribute = class(IniAttribute);

implementation

{ TIniAttribute }

constructor IniAttribute.Create(const Name: string);
begin
  FName := Name;
end;

end.

