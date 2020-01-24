unit Attribute.Ini;

interface

uses
  System.SysUtils;

type
  IniAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create; overload;
    constructor Create(const Text: string); overload;
    property Text: string read FText;
  end;

  SectionAttribute = class(IniAttribute);
  KeyAttribute = class(IniAttribute);

implementation

constructor IniAttribute.Create(const Text: string);
begin
  FText := Text;
end;

constructor IniAttribute.Create;
begin
  Create(string.Empty);
end;

end.

