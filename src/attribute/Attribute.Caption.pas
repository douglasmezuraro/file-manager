unit Attribute.Caption;

interface

type
  TCaption = class(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create(const Text: string);
    property Text: string read FText;
  end;

implementation

{ TCaption }

constructor TCaption.Create(const Text: string);
begin
  FText := Text;
end;

end.
