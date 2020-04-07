unit Attribute.Validation.Integer;

interface

uses
  Attribute.Validation,
  System.SysUtils;

type
  IntegerAttribute = class sealed(ValidationAttribute)
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

implementation

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

end.

