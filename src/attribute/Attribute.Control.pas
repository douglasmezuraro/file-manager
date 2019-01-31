unit Attribute.Control;

interface

uses
  System.SysUtils;

type
  TControl = class(TCustomAttribute)
  private
    FText: string;
    FValues: TArray<string>;
  public
    constructor Create(const Text: string; const Values: string = string.Empty);
    property Text: string read FText;
    property Values: TArray<string> read FValues;
  end;

implementation

{ TControl }

constructor TControl.Create(const Text, Values: string);
begin
  FText := Text;
  FValues := Values.Split([';']);
end;

end.

