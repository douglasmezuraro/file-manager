unit Helper.FMX.TabControl;

interface

uses
  FMX.TabControl, System.StrUtils;

type
  TTabControlHelper = class Helper for TTabControl
  private const
    FirstTab = 0;
  public
    procedure Clear;
    procedure OrderTabs(const Values: TArray<string>);
  end;

implementation

procedure TTabControlHelper.Clear;
var
  Index: Integer;
begin
  for Index := Pred(TabCount) downto FirstTab do
    Delete(Index);
end;

procedure TTabControlHelper.OrderTabs(const Values: TArray<string>);
var
  Index: Integer;
begin
  for Index := FirstTab to Pred(TabCount) do
    Tabs[Index].Index := System.StrUtils.IndexStr(Tabs[Index].TagString, Values);

  TabIndex := FirstTab;
end;

end.
