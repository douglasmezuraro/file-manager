unit Attribute.Validation;

interface

uses
  System.SysUtils;

type
  ValidationAttribute = class abstract(TCustomAttribute)
  private
    FNullable: Boolean;
  public
    constructor Create(const Nullable: Boolean); overload;
    property Nullable: Boolean read FNullable;
  end;

  DateAttribute = class(ValidationAttribute);
  DateTimeAttribute = class(ValidationAttribute);
  TimeAttribute = class(ValidationAttribute);

  FloatAttribute = class(ValidationAttribute)
  private
    FMinValue: Double;
    FMaxValue: Double;
  public
    constructor Create; overload;
    constructor Create(const Nullable: Boolean); overload;
    constructor Create(const Nullable: Boolean; const MinValue: Double); overload;
    constructor Create(const Nullable: Boolean; const MinValue, MaxValue: Double); overload;
    property MinValue: Double read FMinValue;
    property MaxValue: Double read FMaxValue;
  end;

  IntegerAttribute = class(ValidationAttribute)
  private
    FMinValue: Integer;
    FMaxValue: Integer;
  public
    constructor Create; overload;
    constructor Create(const Nullable: Boolean); overload;
    constructor Create(const Nullable: Boolean; const MinValue: Integer); overload;
    constructor Create(const Nullable: Boolean; const MinValue, MaxValue: Integer); overload;
    property MinValue: Integer read FMinValue;
    property MaxValue: Integer read FMaxValue;
  end;

  RegExAttribute = class(ValidationAttribute)
  private
    FPattern: string;
  public
    constructor Create; overload;
    constructor Create(const Nullable: Boolean); overload;
    constructor Create(const Nullable: Boolean; const Pattern: string); overload;
    property Pattern: string read FPattern;
  end;

  StringAttribute = class(ValidationAttribute)
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

{ IntegerAttribute }

constructor IntegerAttribute.Create;
begin
  Create(True);
end;

constructor IntegerAttribute.Create(const Nullable: Boolean);
begin
  Create(Nullable, Integer.MinValue);
end;

constructor IntegerAttribute.Create(const Nullable: Boolean; const MinValue: Integer);
begin
  Create(Nullable, MinValue, Integer.MaxValue);
end;

constructor IntegerAttribute.Create(const Nullable: Boolean; const MinValue, MaxValue: Integer);
begin
  inherited Create(Nullable);
  FMinValue := MinValue;
  FMaxValue := MaxValue;
end;

{ RegExAttribute }

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

{ StringAttribute }

constructor StringAttribute.Create;
begin
  Create(True);
end;

constructor StringAttribute.Create(const Nullable: Boolean);
begin
  Create(Nullable, Byte.MinValue);
end;

constructor StringAttribute.Create(const Nullable: Boolean; const MinLength: Byte);
begin
  Create(Nullable, MinLength, Byte.MaxValue);
end;

constructor StringAttribute.Create(const Nullable: Boolean; const MinLength, MaxLength: Byte);
begin
  inherited Create(Nullable);
  FMinLength := MinLength;
  FMaxLength := MaxLength;
end;

{ FloatAttribute }

constructor FloatAttribute.Create;
begin
  Create(True);
end;

constructor FloatAttribute.Create(const Nullable: Boolean);
begin
  Create(Nullable, Double.MinValue);
end;

constructor FloatAttribute.Create(const Nullable: Boolean; const MinValue: Double);
begin
  Create(Nullable, MinValue, Double.MaxValue);
end;

constructor FloatAttribute.Create(const Nullable: Boolean; const MinValue, MaxValue: Double);
begin
  inherited Create(Nullable);
  FMinValue := MinValue;
  FMaxValue := MaxValue;
end;

{ ValidationAttribute }

constructor ValidationAttribute.Create(const Nullable: Boolean);
begin
  FNullable := Nullable;
end;

end.

