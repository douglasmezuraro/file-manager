unit Helper.FMX.FMXObject;

interface

uses
  FMX.ListBox,
  FMX.Memo,
  FMX.Types,
  Helper.Rtti.Value,
  System.Rtti;

type
  TFmxObjectHelper = class Helper for TFmxObject
  private
    function GetValue: TValue;
    procedure SetValue(const Value: TValue);
  public
    property Value: TValue read GetValue write SetValue;
  end;

implementation

function TFmxObjectHelper.GetValue: TValue;
begin
  if Self is TComboBox then
    Exit((Self as TComboBox).Selected.Text);

  if Self is TMemo then
    Exit((Self as TMemo).Lines);

  Result := Data;
end;

procedure TFMXObjectHelper.SetValue(const Value: TValue);
var
  LValue: TValue;
begin
  LValue := TValue.Empty;
  if Value.Assigned then
    LValue := Value;

  Data := LValue;
  if Self is TComboBox then
    (Self as TComboBox).ItemIndex := (Self as TComboBox).Items.IndexOf(LValue.AsString);
end;

end.

