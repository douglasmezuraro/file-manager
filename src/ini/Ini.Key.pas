unit Ini.Key;

interface

type
  TKey = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const Name: string);
    property Name: string read FName;
  end;

implementation

{ TKey }

constructor TKey.Create(const Name: string);
begin
  inherited Create;
  FName := Name;
end;

end.

