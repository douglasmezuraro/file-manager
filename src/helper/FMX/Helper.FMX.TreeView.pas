unit Helper.FMX.TreeView;

interface

uses
  FMX.TreeView, FMX.Types, Helper.FMX.TreeViewItem, System.RegularExpressions, System.SysUtils;

type
  /// <summary>
  ///  Class helper for class <c>TTreeView<c>.
  /// </summary>
  TTreeViewHelper = class Helper for TTreeView
  strict private const
    Root = 0;
  public const
    Separator = '>';
  private
    function GetCount(const AOwner: TFmxObject): Integer;
    function GetNode(const AOwner: TFmxObject; const AIndex: Integer): TTreeViewItem; overload;
    function GetNode(const AOwner: TFmxObject; const AText: string): TTreeViewItem; overload;
    function MakeNode(const AParent: TFmxObject; const AText: string; const ALevel: Integer): TTreeViewItem; overload;
    procedure Filter(const AOwner: TFmxObject; const AText: string; out AFoundNode: TTreeViewItem); overload;
  public
    /// <summary>
    ///  Filter the treeview based on parametter <c>AText<c>.
    /// </summary>
    /// <param name="AText">
    /// </param>
    procedure Filter(const AText: string); overload;

    /// <summary>
    ///  Make node on the treeview based on parametter <c>AText<C>
    /// </summary>
    /// <param name="AText">
    /// </param>
    /// <returns>
    ///  TTreeViewItem
    /// </returns>
    /// <remarks>
    ///  Use the ">" character to nest the node.
    /// </remarks>
    function MakeNode(const AText: string): TTreeViewItem; overload;
  end;

implementation

procedure TTreeViewHelper.Filter(const AText: string);
var
  Node: TTreeViewItem;
begin
  Node := nil;
  Filter(Self, AText, Node);
end;

procedure TTreeViewHelper.Filter(const AOwner: TFmxObject; const AText: string; out AFoundNode: TTreeViewItem);
var
  Index, Count: Integer;
  Node: TTreeViewItem;
begin
  Count := GetCount(AOwner);
  for Index := 0 to Pred(Count) do
  begin
    Node := GetNode(AOwner, Index);
    if Node.HasChild then
    begin
      Filter(Node, AText, AFoundNode);
      Node.Visible := Assigned(AFoundNode) and AFoundNode.Visible and AFoundNode.IsChildOf(Node);
    end
    else
    begin
      Node.Visible := AText.IsEmpty or TRegEx.Create(AText, [roIgnoreCase]).IsMatch(Node.Text);
      if Node.Visible then
        AFoundNode := Node;
    end;
  end;
end;

function TTreeViewHelper.GetCount(const AOwner: TFmxObject): Integer;
begin
  if Self.Equals(AOwner) then
    Exit(TTreeView(AOwner).Count);

  if AOwner is TTreeViewItem then
    Exit(TTreeViewItem(AOwner).Count);

  Result := 0;
end;

function TTreeViewHelper.GetNode(const AOwner: TFmxObject; const AIndex: Integer): TTreeViewItem;
begin
  if Self.Equals(AOwner) then
    Exit(ItemByIndex(AIndex));

  if AOwner is TTreeViewItem then
    Exit(TTreeViewItem(AOwner).Items[AIndex]);

  Result := nil;
end;

function TTreeViewHelper.GetNode(const AOwner: TFmxObject; const AText: string): TTreeViewItem;
var
  Index: Integer;
begin
  if Self.Equals(AOwner) then
    Exit(ItemByText(AText));

  if not (AOwner is TTreeViewItem) then
    Exit(nil);

  for Index := 0 to Pred(TTreeViewItem(AOwner).Count) do
  begin
    if TTreeViewItem(AOwner).Items[Index].Text.ToUpper.Equals(AText.ToUpper) then
      Exit(TTreeViewItem(AOwner).Items[Index]);
  end;

  Result := nil;
end;

function TTreeViewHelper.MakeNode(const AText: string): TTreeViewItem;
begin
  Result := MakeNode(Self, AText, Root);
  ExpandAll;
end;

function TTreeViewHelper.MakeNode(const AParent: TFmxObject; const AText: string;
  const ALevel: Integer): TTreeViewItem;
var
  Item: string;
  Items: TArray<string>;
  LastLevel: Integer;
begin
  Result := nil;
  Items := AText.Split([Separator]);
  LastLevel := Length(Items);

  if LastLevel = Root then
    Exit;

  Item := Items[ALevel];

  if Item.Trim.IsEmpty then
    Exit;

  Result := GetNode(AParent, Item);
  if not Assigned(Result) then
  begin
    Result := TTreeViewItem.Create(AParent);
    Result.Text := Item;
    Result.Parent := AParent;
  end;

  if ALevel < Pred(LastLevel) then
    Result := MakeNode(Result, AText, Succ(ALevel));
end;

end.

