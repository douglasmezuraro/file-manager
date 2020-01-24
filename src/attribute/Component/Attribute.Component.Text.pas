unit Attribute.Component.Text;

interface

type
  TextAttribute = class abstract(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create(const Text: string); overload;
    property Text: string read FText;
  end;

implementation

constructor TextAttribute.Create(const Text: string);
begin
  FText := Text;
end;

end.
