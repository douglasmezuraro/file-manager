unit Attribute.Validation.RegEx;

interface

uses
  Attribute.Validation, System.SysUtils;

type
  RegExAttribute = class(ValidationAttribute)
  private
    FPattern: string;
  public
    constructor Create; overload;
    constructor Create(const Nullable: Boolean); overload;
    constructor Create(const Nullable: Boolean; const Pattern: string); overload;
    property Pattern: string read FPattern;
  end;

implementation

constructor RegExAttribute.Create;
begin
  Create(True);
end;

constructor RegExAttribute.Create(const Nullable: Boolean);
begin
  Create(Nullable, string.Empty);
end;

constructor RegExAttribute.Create(const Nullable: Boolean; const Pattern: string);
begin
  inherited Create(Nullable);
  FPattern := Pattern;
end;

end.
