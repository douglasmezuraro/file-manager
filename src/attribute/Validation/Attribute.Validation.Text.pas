unit Attribute.Validation.Text;

interface

uses
  Attribute.Validation, System.SysUtils;

type
  TextAttribute = class(ValidationAttribute)
  private
    FMaxLength: Byte;
    FMinLength: Byte;
  public
    constructor Create; overload;
    constructor Create(const Nullable: Boolean); overload;
    constructor Create(const Nullable: Boolean; const MinLength: Byte); overload;
    constructor Create(const Nullable: Boolean; const MinLength, MaxLength: Byte); overload;
    property MinLength: Byte read FMinLength;
    property MaxLength: Byte read FMaxLength;
  end;

implementation

constructor TextAttribute.Create;
begin
  Create(True);
end;

constructor TextAttribute.Create(const Nullable: Boolean);
begin
  Create(Nullable, Byte.MinValue);
end;

constructor TextAttribute.Create(const Nullable: Boolean; const MinLength: Byte);
begin
  Create(Nullable, MinLength, Byte.MaxValue);
end;

constructor TextAttribute.Create(const Nullable: Boolean; const MinLength, MaxLength: Byte);
begin
  inherited Create(Nullable);
  FMinLength := MinLength;
  FMaxLength := MaxLength;
end;

end.
