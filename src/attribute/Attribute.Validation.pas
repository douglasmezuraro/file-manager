unit Attribute.Validation;

interface

uses
  System.SysUtils;

type
  ValidationAttribute = class abstract(TCustomAttribute)
  private
    FNullable: Boolean;
  public
    constructor Create(const Nullable: Boolean);
    property Nullable: Boolean read FNullable;
  end;

  IntegerAttribute = class(ValidationAttribute)
  private
    FMinValue: Integer;
    FMaxValue: Integer;
  public
    constructor Create(const Nullable: Boolean = True; const MinValue: Integer = Integer.MinValue; const MaxValue: Integer = Integer.MaxValue);
    property MinValue: Integer read FMinValue;
    property MaxValue: Integer read FMaxValue;
  end;

  StringAttribute = class(ValidationAttribute)
  private
    FMaxLength: Byte;
    FMinLength: Byte;
  public
    constructor Create(const Nullable: Boolean = True; const MinLength: Byte = Byte.MinValue; const MaxLength: Byte = Byte.MaxValue);
    property MinLength: Byte read FMinLength;
    property MaxLength: Byte read FMaxLength;
  end;

  FloatAttribute = class(ValidationAttribute)
  private
    FMinValue: Double;
    FMaxValue: Double;
  public
    constructor Create(const Nullable: Boolean = True; const MinValue: Double = Integer.MinValue; const MaxValue: Double = Integer.MaxValue);
    property MinValue: Double read FMinValue;
    property MaxValue: Double read FMaxValue;
  end;

  DateAttribute = class(ValidationAttribute);
  TimeAttribute = class(ValidationAttribute);
  DateTimeAttribute = class(ValidationAttribute);

  RegExAttribute = class(ValidationAttribute)
  private
    FPattern: string;
  public
    constructor Create(const Nullable: Boolean = True; const Pattern: string = string.Empty);
    property Pattern: string read FPattern;
  end;

implementation

{ IntegerAttribute }

constructor IntegerAttribute.Create(const Nullable: Boolean; const MinValue, MaxValue: Integer);
begin
  inherited Create(Nullable);
  FMinValue := MinValue;
  FMaxValue := MaxValue;
end;

{ StringAttribute }

constructor StringAttribute.Create(const Nullable: Boolean; const MinLength, MaxLength: Byte);
begin
  inherited Create(Nullable);
  FMinLength := MinLength;
  FMaxLength := MaxLength;
end;

{ FloatAttribute }

constructor FloatAttribute.Create(const Nullable: Boolean; const MinValue, MaxValue: Double);
begin
  inherited Create(Nullable);
  FMinValue := MinValue;
  FMaxValue := MaxValue;
end;

{ RegExAttribute }

constructor RegExAttribute.Create(const Nullable: Boolean; const Pattern: string);
begin
  inherited Create(Nullable);
  FPattern := Pattern;
end;

{ ValidationAttribute }

constructor ValidationAttribute.Create(const Nullable: Boolean);
begin
  FNullable := Nullable;
end;

end.

