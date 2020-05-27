unit Helper.FMX.TreeViewItem;

interface

uses
  FMX.TreeView;

type
  /// <summary>
  ///  Class helper for class <c>TTreeViewItem<c>.
  /// </summary>
  TTreeViewItemHelper = class Helper for TTreeViewItem
  public
    /// <summary>
    ///  Has child.
    /// </summary>
    /// <returns>
    ///  Boolean - True when the node have children, false otherwise.
    /// </returns>
    function HasChild: Boolean;

    /// <summary>
    ///  Is child of.
    /// </summary>
    /// <param name="ANode">
    /// </param>
    /// <returns>
    ///  Boolean - True when self is child of <c>ANode<c>, false otherwise.
    /// </returns>
    function IsChildOf(const ANode: TTreeViewItem): Boolean;
  end;

implementation

function TTreeViewItemHelper.HasChild: Boolean;
begin
  Result := Count > 0;
end;

function TTreeViewItemHelper.IsChildOf(const ANode: TTreeViewItem): Boolean;
var
  Index: Integer;
begin
  Result := False;

  if not Assigned(ANode) then
    Exit;

  for Index := 0 to Pred(ANode.Count) do
  begin
    if Equals(ANode.Items[Index]) then
      Exit(True);

    if ANode.HasChild then
    begin
      if IsChildOf(ANode.Items[Index]) then
        Exit(True);
    end;
  end;
end;

end.

