unit Attribute.Validation.Float;

interface

uses
  Attribute.Validation, System.SysUtils;

type
  FloatAttribute = class sealed(ValidationAttribute)
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

implementation

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

end.
