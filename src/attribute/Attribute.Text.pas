unit Attribute.Text;

interface

uses
  System.SysUtils;

type
  TextAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create; overload;
    constructor Create(const Text: string); overload;
    property Text: string read FText;
  end;

implementation

constructor TextAttribute.Create;
begin
  Create(string.Empty);
end;

constructor TextAttribute.Create(const Text: string);
begin
  FText := Text;
end;

end.
