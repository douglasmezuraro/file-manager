unit Helper.FMX;

interface

uses
  FMX.Controls,
  FMX.ListBox,
  Helper.Rtti,
  System.Rtti;

type
  TControlHelper = class Helper for TControl
  private
    function GetValue: TValue;
    procedure SetValue(const Value: TValue);
    function GetOldValue: TValue;
    procedure SetOldValue(const Value: TValue);
    function GetHasChanges: Boolean;
  public
    property Value: TValue read GetValue write SetValue;
    property OldValue: TValue read GetOldValue write SetOldValue;
    property HasChanges: Boolean read GetHasChanges;
  end;

  TComboBoxHelper = class Helper for TComboBox
  private
    function GetValues: TArray<string>;
    procedure SetValues(const Values: TArray<string>);
  public
    property Values: TArray<string> read GetValues write SetValues;
  end;

implementation

{ TComboBoxHelper }

function TComboBoxHelper.GetValues: TArray<string>;
begin
  Result := Items.ToStringArray;
end;

procedure TComboBoxHelper.SetValues(const Values: TArray<string>);
var
  Value: string;
begin
  Items.Clear;
  for Value in Values do
    Items.Add(Value);
end;

{ TControlHelper }

function TControlHelper.GetHasChanges: Boolean;
begin
  Result := not Value.Equals(OldValue);
end;

function TControlHelper.GetOldValue: TValue;
begin
  Result := TagString;
end;

function TControlHelper.GetValue: TValue;
begin
  if Self is TComboBox then
  begin
    Result := (Self as TComboBox).Items.Strings[(Self as TComboBox).ItemIndex];
    Exit;
  end;
  Result := Data;
end;

procedure TControlHelper.SetOldValue(const Value: TValue);
begin
  TagString := Value.ToString;
end;

procedure TControlHelper.SetValue(const Value: TValue);
begin
  if Self is TComboBox then
    (Self as TComboBox).ItemIndex := (Self as TComboBox).Items.IndexOf(Value.AsString);

  Data := Value;
end;

end.

