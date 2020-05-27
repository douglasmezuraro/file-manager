unit Helper.FMX.FMXObject;

interface

uses
  FMX.ListBox, FMX.Memo, FMX.Types, Helper.Rtti.Value, System.Classes, System.Rtti;

type
  /// <summary>
  ///  Class helper for class <c>TFmxObject<c>.
  /// </summary>
  TFmxObjectHelper = class Helper for TFmxObject
  private
    function GetValue: TValue;
    procedure SetValue(const Value: TValue);
  public
    /// <summary>
    ///  Stores the value of FMXObjet.
    /// </summary>
    /// <returns>
    ///  TValue
    /// </returns>
    property Value: TValue read GetValue write SetValue;
  end;

implementation

function TFmxObjectHelper.GetValue: TValue;
begin
  if Self is TComboBox then
  begin
    Exit((Self as TComboBox).Selected.Text);
  end;

  if Self is TMemo then
  begin
    Exit((Self as TMemo).Lines);
  end;

  Result := Data;
end;

procedure TFMXObjectHelper.SetValue(const Value: TValue);
var
  LValue: TValue;
begin
  LValue := TValue.Empty;
  if Value.Assigned then
  begin
    LValue := Value;
  end;

  Data := LValue;
  if Self is TComboBox then
  begin
    (Self as TComboBox).ItemIndex := (Self as TComboBox).Items.IndexOf(LValue.AsString);
  end;

  if Self is TMemo then
  begin
    (Self as TMemo).Lines.Assign(LValue.AsObject as TStrings);
  end;
end;

end.

