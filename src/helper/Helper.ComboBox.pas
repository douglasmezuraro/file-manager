unit Helper.ComboBox;

interface

uses
  Vcl.StdCtrls;

type
  TComboBoxHelper = class Helper for TComboBox
  public
    procedure Add(const Items: array of string); overload;
  end;

implementation

{ TComboBoxHelper }

procedure TComboBoxHelper.Add(const Items: array of string);
var
  Item: string;
begin
  Self.Items.Clear;
  for Item in Items do
    Self.Items.Add(Item);
  ItemIndex := Low(Items);
end;

end.
