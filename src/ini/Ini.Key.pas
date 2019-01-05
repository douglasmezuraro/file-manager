unit Ini.Key;

interface

uses
  Ini.DataType;

type
  TKey = class(TCustomAttribute)
  private
    FName: string;
    FDataType: TDataType;
  public
    constructor Create(const Name: string; const DataType: TDataType);
  end;

implementation

{ TKey }

constructor TKey.Create(const Name: string; const DataType: TDataType);
begin
  inherited Create;
  FName := Name;
  FDataType := DataType;
end;

end.
