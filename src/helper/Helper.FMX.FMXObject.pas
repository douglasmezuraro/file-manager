unit Helper.FMX.FMXObject;

interface

uses
  FMX.ListBox,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  Helper.Rtti,
  System.Rtti,
  System.UITypes,
  Types.Utils;

type
  TFmxObjectHelper = class Helper for TFmxObject
  private
    function GetValue: TValue;
    procedure SetValue(const Value: TValue);
  public
    property Value: TValue read GetValue write SetValue;
  end;

  TLabelHelper = class Helper for TLabel
  public type
    TLabelStyle = (lsNone, lsHyperLink);
  public
    procedure SetStyle(const Style: TLabelStyle);
  end;

  TTabControlHelper = class Helper for TTabControl
  public
    procedure OrderTabs(const Values: TArray<string>);
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

{ TLabelHelper }

procedure TLabelHelper.SetStyle(const Style: TLabelStyle);
begin
  case Style of
    TLabelStyle.lsNone:
      begin
        FontColor := TAlphaColorRec.Black;
        Font.Style := [];
        Cursor := crDefault;
      end;
    TLabelStyle.lsHyperLink:
      begin
        FontColor := TAlphaColorRec.Blue;
        Font.Style := [TFontStyle.fsUnderline];
        Cursor := crHandPoint;
      end;
  end;
end;

{ TTabControlHelper }

procedure TTabControlHelper.OrderTabs(const Values: TArray<string>);
var
  Index: Integer;
begin
  for Index := 0 to Pred(TabCount) do
  begin
    Tabs[Index].Index := TUtils.Methods.IndexOf(Tabs[Index].TagString, Values);
  end;
end;

end.

