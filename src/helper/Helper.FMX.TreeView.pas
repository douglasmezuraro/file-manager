unit Helper.FMX.TreeView;

interface

uses
  FMX.TreeView,
  FMX.Types,
  System.SysUtils;

type
  TTreeViewHelper = class Helper for TTreeView
  private
    function GetNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
    function MakeNode(const Parent: TFmxObject; const Text: string; const Level: Integer): TTreeViewItem; overload;
    const Root = 0;
  public
    function MakeNode(const Text: string): TTreeViewItem; overload;
    procedure Filter(const Text: string);
    const Separator = '>';
  end;

  TTreeViewItemHelper = class Helper for TTreeViewItem
  public
    function HasChildren: Boolean;
  end;

implementation

{ TTreeViewHelper }

procedure TTreeViewHelper.Filter(const Text: string);

  function _GetCount(const Owner: TFmxObject): Integer;
  begin
    Result := 0;

    if Owner = Self then
      Exit((Owner as TTreeView).Count);

    if Owner is TTreeViewItem then
      Exit((Owner as TTreeViewItem).Count);
  end;

  function _ItemByIndex(const Owner: TFmxObject; const Index: Integer): TTreeViewItem;
  begin
    Result := nil;

    if Owner = Self then
      Exit(ItemByIndex(Index));

    if Owner is TTreeViewItem then
      Exit(TTreeViewItem(Owner).Items[Index]);
  end;

  procedure _Filter(const Owner: TFmxObject; const Text: string; out Found: Boolean);
  var
    Index: Integer;
    Item: TTreeViewItem;
  begin
    for Index := 0 to Pred(_GetCount(Owner)) do
    begin
      Item := _ItemByIndex(Owner, Index);
      if Item.HasChildren then
      begin
        _Filter(Item, Text, Found);
        Item.Visible := Found;
      end
      else
      begin
        Found := Item.Text.Contains(Text);
        Item.Visible := Found;
      end;
    end;
  end;

var
  Found: Boolean;
begin
  _Filter(Self, Text, Found);
end;

function TTreeViewHelper.GetNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
var
  Index: Integer;
begin
  Result := nil;

  if Owner = Self then
    Exit(ItemByText(Text));

  if not (Owner is TTreeViewItem) then
    Exit;

  for Index := 0 to Pred(TTreeViewItem(Owner).Count) do
  begin
    if TTreeViewItem(Owner).Items[Index].Text = Text then
      Exit(TTreeViewItem(Owner).Items[Index]);
  end;
end;

function TTreeViewHelper.MakeNode(const Text: string): TTreeViewItem;
begin
  Result := MakeNode(Self, Text, Root);
end;

function TTreeViewHelper.MakeNode(const Parent: TFmxObject; const Text: string;
  const Level: Integer): TTreeViewItem;
var
  Item: string;
  Items: TArray<string>;
  LastLevel: Integer;
begin
  Result := nil;
  Items := Text.Split([Separator]);
  LastLevel := Length(Items);

  if LastLevel = Root then
    Exit;

  Item := Items[Level];

  if Item.Trim.IsEmpty then
    Exit;

  Result := GetNode(Parent, Item);
  if not Assigned(Result) then
  begin
    Result := TTreeViewItem.Create(Parent);
    Result.Text := Item;
    Result.Parent := Parent;
  end;

  if Level < Pred(LastLevel) then
  begin
    Result := MakeNode(Result, Text, Succ(Level));
    ExpandAll;
  end;
end;

{ TTreeViewItemHelper }

function TTreeViewItemHelper.HasChildren: Boolean;
begin
  Result := Self.Count > 0;
end;

end.

