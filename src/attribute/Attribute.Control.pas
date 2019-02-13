unit Attribute.Control;

interface

uses
  System.SysUtils;

type
  TControlAttribute = class(TCustomAttribute)
  private
    FText: string;
    FValues: string;
  public
    constructor Create(const Text: string; const Items: string = string.Empty);
    property Text: string read FText;
    property Items: string read FValues;
  end;

implementation

{ TControl }

constructor TControlAttribute.Create(const Text, Items: string);
begin
  FText := Text;
  FValues := Items;
end;

end.

