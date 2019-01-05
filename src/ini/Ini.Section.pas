unit Ini.Section;

interface

type
  TSection = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const Name: string);
    property Name: string read FName;
  end;

implementation

{ TSection }

constructor TSection.Create(const Name: string);
begin
  Inherited Create;
  FName := Name;
end;

end.
