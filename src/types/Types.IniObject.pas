unit Types.IniObject;

interface

uses
  Attribute.Ini.Key, Attribute.Ini.Section, Helper.Ini, Helper.Rtti.RttiProperty, Helper.Rtti.Value,
  System.Classes, System.IniFiles, System.Rtti, System.SysUtils, System.TypInfo, Types.ObjectFileAPI,
  Types.Utils;

type
  TFileMode = (Read, Write);

  TIniObject = class abstract(TInterfacedObject, IObjectFile)
  strict private
    FFile: TIniFile;
    FMode: TFileMode;
  private
    procedure Execute(const Obj: TObject; Section: SectionAttribute);
    function ReadValue(var Value: TValue; const Section, Key: string): TValue;
    procedure WriteValue(var Value: TValue; const Section, Key: string);
  public
    constructor Create(const FileName: TFileName); virtual;
    destructor Destroy; override;
  public
    procedure Read;
    procedure Overwrite;
    procedure Write(const FileName: TFileName);
  end;

implementation

constructor TIniObject.Create(const FileName: TFileName);
begin
  FFile := TIniFile.Create(FileName);
end;

destructor TIniObject.Destroy;
begin
  FFile.Free;
  inherited Destroy;
end;

procedure TIniObject.Read;
begin
  FMode := TFileMode.Read;
  Execute(Self, nil);
end;

procedure TIniObject.Write(const FileName: TFileName);
begin
  FMode := TFileMode.Write;

  if Assigned(FFile) and (not FFile.FileName.Equals(FileName)) then
  begin
    FFile.Free;
    FFile := TIniFile.Create(FileName);
  end;

  Overwrite;
end;

procedure TIniObject.Overwrite;
begin
  Execute(Self, nil);
end;

procedure TIniObject.Execute(const Obj: TObject; Section: SectionAttribute);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Key: KeyAttribute;
begin
  Context := TRttiContext.Create;
  for Prop in Context.GetType(Obj.ClassType).GetProperties do
  begin
    if Prop.Visibility <> mvPublic then
    begin
      Continue;
    end;

    Value := Prop.GetValue(Obj);
    if Value.IsObject and (Prop.PropertyType.AsInstance.MetaclassType <> TSTringList) then
    begin
      Section := Prop.GetAttribute<SectionAttribute>();
      Execute(Value.AsObject, Section);
      Continue;
    end;

    if not Assigned(Section) then
    begin
      Continue;
    end;

    Key := Prop.GetAttribute<KeyAttribute>();
    if not Assigned(Key) then
    begin
      Continue;
    end;

    case FMode of
      TFileMode.Read: Prop.SetValue(Obj, ReadValue(Value, Section.Text, Key.Text));
      TFileMode.Write: WriteValue(Value, Section.Text, Key.Text);
    end;
  end;
end;

function TIniObject.ReadValue(var Value: TValue; const Section, Key: string): TValue;
begin
  Result := Value;

  if Value.IsBoolean then
  begin
    Value := TUtils.Conversions.StrToBool(FFile.ReadString(Section, Key, TUtils.Conversions.BoolToStr(False)));
    Exit(Value);
  end;

  if Value.IsDate then
  begin
    Value := FFile.ReadDate(Section, Key, MaxDateTime);
    Exit(Value);
  end;

  if Value.IsDateTime then
  begin
    Value := FFile.ReadDateTime(Section, Key, MaxDateTime);
    Exit(Value);
  end;

  if Value.IsTime then
  begin
    Value := FFile.ReadTime(Section, Key, MaxDateTime);
    Exit(Value);
  end;

  if Value.IsFloat then
  begin
    Value := FFile.ReadFloat(Section, Key, Double.MaxValue);
    Exit(Value);
  end;

  if Value.IsNumeric then
  begin
    Value := FFile.ReadInteger(Section, Key, Integer.MaxValue);
    Exit(Value);
  end;

  if Value.IsString then
  begin
    Value := FFile.ReadString(Section, Key, string.Empty).Trim;
    Exit(Value);
  end;

  if Value.IsObject then
  begin
    FFile.ReadSectionValues(Section, Value.AsType<TStringList>);
    Exit(Value);
  end;
end;

procedure TIniObject.WriteValue(var Value: TValue; const Section, Key: string);
begin
  if not Value.Assigned then
  begin
    FFile.WriteString(Section, Key, string.Empty);
    Exit;
  end;

  if Value.IsBoolean then
  begin
    FFile.WriteString(Section, Key, TUtils.Conversions.BoolToStr(Value.AsBoolean));
    Exit;
  end;

  if Value.IsDate then
  begin
    FFile.WriteDate(Section, Key, Value.AsDate);
    Exit;
  end;

  if Value.IsDateTime then
  begin
    FFile.WriteDateTime(Section, Key, Value.AsDateTime);
    Exit;
  end;

  if Value.IsTime then
  begin
    FFile.WriteTime(Section, Key, Value.AsTime);
    Exit;
  end;

  if Value.IsFloat then
  begin
    FFile.WriteFloat(Section, Key, Value.AsExtended);
    Exit;
  end;

  if Value.IsNumeric then
  begin
    FFile.WriteInteger(Section, Key, Value.AsInteger);
    Exit;
  end;

  if Value.IsString then
  begin
    FFile.WriteString(Section, Key, Value.AsString);
    Exit;
  end;

  if Value.IsObject then
  begin
    FFile.WriteSectionValues(Section, Value.AsType<TStringList>);
    Exit;
  end;
end;

end.

