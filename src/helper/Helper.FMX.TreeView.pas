unit Helper.FMX.TreeView;

interface

uses
  FMX.ListBox,
  FMX.TreeView,
  FMX.Types,
  System.Rtti,
  System.SysUtils;

type
  TTreeViewHelper = class Helper for TTreeView
  private const
    Root = 0;
    Separators: array of string = ['/', '\'];
  private
    function GetNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
    function MakeNode(const Parent: TFmxObject; const Text: string; const Level: Integer): TTreeViewItem; overload;
  public
    function MakeNode(const Text: string): TTreeViewItem; overload;
  end;

implementation

{ TTreeViewHelper }

function TTreeViewHelper.GetNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
var
  Index: Integer;
begin
  Result := nil;

  if Owner = Self then
  begin
    Result := Self.ItemByText(Text);
    Exit;
  end;

  if not (Owner is TTreeViewItem) then
    Exit;

  for Index := 0 to Pred(TTreeViewItem(Owner).Count) do
  begin
    if TTreeViewItem(Owner).Items[Index].Text = Text then
    begin
      Result := TTreeViewItem(Owner).Items[Index];
      Exit;
    end;
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
begin
  Result := nil;

  Items := Text.Split(Separators);

  if Length(Items) = 0 then
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

  if Level < Pred(Length(Items)) then
    Result := MakeNode(Result, Text, Succ(Level));
end;

end.

