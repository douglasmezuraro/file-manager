unit Helper.FMX;

interface

uses
  FMX.ListBox,
  FMX.Types,
  System.Rtti;

type
  TFmxObjectHelper = class Helper for TFmxObject
  private
    function GetValue: TValue;
    procedure SetValue(const Value: TValue);
  public
    property Value: TValue read GetValue write SetValue;
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

{ TFmxObjectHelper }

function TFmxObjectHelper.GetValue: TValue;
begin
  if Self is TComboBox then
  begin
    Result := (Self as TComboBox).Items.Strings[(Self as TComboBox).ItemIndex];
    Exit;
  end;
  Result := Data;
end;

procedure TFmxObjectHelper.SetValue(const Value: TValue);
begin
  if Self is TComboBox then
    (Self as TComboBox).ItemIndex := (Self as TComboBox).Items.IndexOf(Value.AsString);

  Data := Value;
end;

end.

