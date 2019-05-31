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

implementation

{ TFmxObjectHelper }

function TFmxObjectHelper.GetValue: TValue;
begin
  Result := Data;
  if Self is TComboBox then
    Result := (Self as TComboBox).Selected.Text;
end;

procedure TFMXObjectHelper.SetValue(const Value: TValue);
begin
  Data := Value;
  if Self is TComboBox then
    (Self as TComboBox).ItemIndex := (Self as TComboBox).Items.IndexOf(Value.AsString);
end;

end.

