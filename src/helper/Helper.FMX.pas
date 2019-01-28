unit Helper.FMX;

interface

uses
  FMX.ListBox;

type
  TComboBoxHelper = class Helper for TComboBox
  private
    function GetText: string;
    procedure SetSext(const Value: string);
    function GetValues: TArray<string>;
    procedure SetValues(const Values: TArray<string>);
  public
    property Values: TArray<string> read GetValues write SetValues;
    property Text: string read GetText write SetSext;
  end;

implementation

{ TComboBoxHelper }

function TComboBoxHelper.GetText: string;
begin
  Result := Items.Strings[ItemIndex];
end;

function TComboBoxHelper.GetValues: TArray<string>;
begin
  Result := Items.ToStringArray;
end;

procedure TComboBoxHelper.SetSext(const Value: string);
begin
  ItemIndex := Items.IndexOf(Value);
end;

procedure TComboBoxHelper.SetValues(const Values: TArray<string>);
var
  Value: string;
begin
  Items.Clear;
  for Value in Values do
    Items.Add(Value);
end;

end.

