unit Helper.FMX.FMXObject;

interface

uses
  FMX.ListBox,
  FMX.Memo,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  Helper.Rtti,
  System.Rtti,
  System.StrUtils,
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

{ TLabelHelper }

procedure TLabelHelper.SetStyle(const Style: TLabelStyle);
begin
  case Style of
    TLabelStyle.lsNone:
      begin
        FontColor := TAlphaColorRec.Black;
        Font.Style := Font.Style - [TFontStyle.fsUnderline];
        Cursor := crDefault;
      end;
    TLabelStyle.lsHyperLink:
      begin
        FontColor := TAlphaColorRec.Blue;
        Font.Style := Font.Style + [TFontStyle.fsUnderline];
        Cursor := crHandPoint;
      end;
  end;
end;

{ TTabControlHelper }

procedure TTabControlHelper.OrderTabs(const Values: TArray<string>);
const
  First = 0;
var
  Index: Integer;
begin
  for Index := First to Pred(TabCount) do
    Tabs[Index].Index := System.StrUtils.IndexStr(Tabs[Index].TagString, Values);

  TabIndex := First;
end;

end.

