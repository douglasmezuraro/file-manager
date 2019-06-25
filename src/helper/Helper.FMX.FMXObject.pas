unit Helper.FMX.FMXObject;

interface

uses
  FMX.ListBox,
  FMX.Types,
  Helper.Rtti,
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

{ TFmxObjectHelper }

function TFmxObjectHelper.GetValue: TValue;
begin
  Result := Data;
  if Self is TComboBox then
    Result := (Self as TComboBox).Selected.Text;
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

