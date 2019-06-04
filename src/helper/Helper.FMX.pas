unit Helper.FMX;

interface

uses
  FMX.ListBox,
  FMX.TreeView,
  FMX.Types,
  System.Rtti,
  System.SysUtils;

type
  TFmxObjectHelper = class Helper for TFmxObject
  private
    function GetValue: TValue;
    procedure SetValue(const Value: TValue);
  public
    property Value: TValue read GetValue write SetValue;
  end;

  TTreeViewHelper = class Helper for TTreeView
  private
    const Separator = '\';
  private
    function GetNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
    function MakeNode(const Parent: TFmxObject; const Text: string; const Level: Integer): TTreeViewItem; overload;
  public
    function MakeNode(const Text: string): TTreeViewItem; overload;
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
begin
  Data := Value;
  if Self is TComboBox then
    (Self as TComboBox).ItemIndex := (Self as TComboBox).Items.IndexOf(Value.AsString);
end;

{ TTreeViewHelper }

function TTreeViewHelper.GetNode(const Owner: TFmxObject; const Text: string): TTreeViewItem;
var
  ItemIndex: Integer;
begin
  Result := nil;

  if Owner = Self then
  begin
    Result := Self.ItemByText(Text);
    Exit;
  end;

  if not (Owner is TTreeViewItem) then
    Exit;

  for ItemIndex := 0 to Pred(TTreeViewItem(Owner).Count) do
  begin
    if TTreeViewItem(Owner).Items[ItemIndex].Text = Text then
    begin
      Result := TTreeViewItem(Owner).Items[ItemIndex];
      Exit;
    end;
  end;
end;

function TTreeViewHelper.MakeNode(const Text: string): TTreeViewItem;
begin
  Result := MakeNode(Self, Text, 0);
end;

function TTreeViewHelper.MakeNode(const Parent: TFmxObject; const Text: string;
  const Level: Integer): TTreeViewItem;
var
  Item: string;
  Items: TArray<string>;
begin
  Result := nil;

  Items := Text.Split([Separator]);

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

