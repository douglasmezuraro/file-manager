unit Helper.FMX.TreeView;

interface

uses
  FMX.TreeView,
  FMX.Types,
  System.SysUtils;

type
  TTreeViewHelper = class Helper for TTreeView
  private
    function GetCount(const Owner: TFmxObject): Integer;
    function GetNode(const Owner: TFmxObject; const Index: Integer): TTreeViewItem; overload;
    function GetNode(const Owner: TFmxObject; const Text: string): TTreeViewItem; overload;
    function MakeNode(const Parent: TFmxObject; const Text: string; const Level: Integer): TTreeViewItem; overload;
    procedure Filter(const Owner: TFmxObject; const Text: string; out FoundNode: TTreeViewItem); overload;
    const Root = 0;
  public
    function MakeNode(const Text: string): TTreeViewItem; overload;
    procedure Filter(const Text: string); overload;
    const Separator = '>';
  end;

  TTreeViewItemHelper = class Helper for TTreeViewItem
  public
    function HasChildren: Boolean;
    function IsChildrenOf(const Node: TTreeViewItem): Boolean;
  end;

implementation

{ TTreeViewHelper }

procedure TTreeViewHelper.Filter(const Text: string);
var
  Node: TTreeViewItem;
begin
  Filter(Self, Text, Node);
end;

procedure TTreeViewHelper.Filter(const Owner: TFmxObject; const Text: string; out FoundNode: TTreeViewItem);
var
  Index: Integer;
  Node: TTreeViewItem;
begin
  for Index := 0 to Pred(GetCount(Owner)) do
  begin
    Node := GetNode(Owner, Index);
    if Node.HasChildren then
    begin
      Filter(Node, Text, FoundNode);
      Node.Visible := Assigned(FoundNode) and FoundNode.Visible and FoundNode.IsChildrenOf(Node);
    end
    else
    begin
      Node.Visible := Node.Text.ToUpper.Contains(Text.ToUpper) or Text.IsEmpty;
      if Node.Visible then
        FoundNode := Node;
    end;
  end;
end;

function TTreeViewHelper.GetCount(const Owner: TFmxObject): Integer;
begin
  Result := 0;

  if Owner = Self then
    Exit((Owner as TTreeView).Count);

  if Owner is TTreeViewItem then
    Exit((Owner as TTreeViewItem).Count);
end;

function TTreeViewHelper.GetNode(const Owner: TFmxObject; const Index: Integer): TTreeViewItem;
begin
  Result := nil;

  if Owner = Self then
    Exit(ItemByIndex(Index));

  if Owner is TTreeViewItem then
    Exit((Owner as TTreeViewItem).Items[Index]);
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

function TTreeViewItemHelper.IsChildrenOf(const Node: TTreeViewItem): Boolean;
var
  Index: Integer;
begin
  Result := False;

  if not Assigned(Node) then
    Exit;

  for Index := 0 to Pred(Node.Count) do
  begin
    if Self.Equals(Node.Items[Index]) then
      Exit(True);

    if Node.HasChildren then
    begin
      if IsChildrenOf(Node.Items[Index]) then
        Exit(True);
    end;
  end;
end;

end.

