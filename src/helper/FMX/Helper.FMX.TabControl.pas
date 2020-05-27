unit Helper.FMX.TabControl;

interface

uses
  FMX.TabControl, System.SysUtils;

type
  /// <summary>
  ///  Class helper for class <c>TTabControl<c>.
  /// </summary>
  TTabControlHelper = class Helper for TTabControl
  private const
    FirstTab = 0;
  private
    function GetTab(const TagString: string): TTabItem;
  public
    /// <summary>
    ///  Remove all the tabs of the tab control.
    /// </summary>
    procedure Clear;

    /// <summary>
    ///  Order the tabs based on the names.
    /// </summary>
    /// <param name="AValues">
    /// </param>
    procedure OrderTabs(const AValues: TArray<string>);
  end;

implementation

procedure TTabControlHelper.Clear;
var
  Index: Integer;
begin
  for Index := Pred(TabCount) downto FirstTab do
  begin
    Delete(Index);
  end;
end;

procedure TTabControlHelper.OrderTabs(const AValues: TArray<string>);
var
  Index: Integer;
  Tab: TTabItem;
begin
  for Index := Low(AValues) to High(AValues) do
  begin
    Tab := GetTab(AValues[Index]);
    if Assigned(Tab) then
    begin
      Tab.Index := Index;
    end;
  end;

  TabIndex := FirstTab;
end;

function TTabControlHelper.GetTab(const TagString: string): TTabItem;
var
  Index: Integer;
begin
  for Index := FirstTab to Pred(TabCount) do
  begin
    if Tabs[Index].TagString.Equals(TagString) then
    begin
      Exit(Tabs[Index]);
    end;
  end;

  Result := nil;
end;

end.

