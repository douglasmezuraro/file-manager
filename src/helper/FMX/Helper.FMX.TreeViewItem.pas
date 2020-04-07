unit Helper.FMX.TreeViewItem;

interface

uses
  FMX.TreeView;

type
  TTreeViewItemHelper = class Helper for TTreeViewItem
  public
    function HasChildren: Boolean;
    function IsChildrenOf(const Node: TTreeViewItem): Boolean;
  end;

implementation

function TTreeViewItemHelper.HasChildren: Boolean;
begin
  Result := Count > 0;
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
    if Equals(Node.Items[Index]) then
      Exit(True);

    if Node.HasChildren then
    begin
      if IsChildrenOf(Node.Items[Index]) then
        Exit(True);
    end;
  end;
end;

end.

