unit Attribute.Validation;

interface

type
  ValidationAttribute = class abstract(TCustomAttribute)
  private
    FNullable: Boolean;
  public
    constructor Create(const Nullable: Boolean); overload;
    property Nullable: Boolean read FNullable;
  end;

implementation

constructor ValidationAttribute.Create(const Nullable: Boolean);
begin
  FNullable := Nullable;
end;

end.

