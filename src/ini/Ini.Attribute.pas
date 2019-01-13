unit Ini.Attribute;

interface

type
  TIniAttribute = class abstract(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const Name: string);
    property Name: string read FName;
  end;

implementation

{ TIniAttribute }

constructor TIniAttribute.Create(const Name: string);
begin
  FName := Name;
end;

end.
