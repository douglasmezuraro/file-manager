unit Helper.Ini;

interface

uses
  Attribute.Ini,
  Helper.Rtti,
  System.Classes,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.TypInfo,
  Types.Utils;

type
  TIniFileHelper = class Helper for TIniFile
  private type
    TExecuteMode = (emRead, emWrite);
  private
    procedure WriteSectionValues(const Section: string; const Values: TStringList);
    procedure Execute(Obj: TObject; const Mode: TExecuteMode; Section: SectionAttribute);
    function InternalRead(var Value: TValue; const Section, Key: string): TValue;
    procedure InternalWrite(var Value: TValue; const Section, Key: string);
  public
    procedure Read(Obj: TObject);
    procedure Write(Obj: TObject);
  end;

implementation

{ TIniFileHelper }

function TIniFileHelper.InternalRead(var Value: TValue; const Section, Key: string): TValue;
begin
  Result := Value;

  if Value.IsBoolean then
  begin
    Value := TUtils.Conversions.StrToBool(ReadString(Section, Key, TUtils.Conversions.BoolToStr(False)));
    Exit(Value);
  end;

  if Value.IsDate then
  begin
    Value := ReadDate(Section, Key, MaxDateTime);
    Exit(Value);
  end;

  if Value.IsDateTime then
  begin
    Value := ReadDateTime(Section, Key, MaxDateTime);
    Exit(Value);
  end;

  if Value.IsTime then
  begin
    Value := ReadTime(Section, Key, MaxDateTime);
    Exit(Value);
  end;

  if Value.IsFloat then
  begin
    Value := ReadFloat(Section, Key, Double.MaxValue);
    Exit(Value);
  end;

  if Value.IsNumeric then
  begin
    Value := ReadInteger(Section, Key, Integer.MaxValue);
    Exit(Value);
  end;

  if Value.IsString then
  begin
    Value := ReadString(Section, Key, string.Empty).Trim;
    Exit(Value);
  end;

  if Value.IsObject and Key.IsEmpty then
  begin
    ReadSectionValues(Section, Value.AsType<TStringList>);
    Exit(Value);
  end;
end;

procedure TIniFileHelper.Read(Obj: TObject);
begin
  Execute(Obj, emRead, nil);
end;

procedure TIniFileHelper.InternalWrite(var Value: TValue; const Section, Key: string);
begin
  if not Value.Assigned then
  begin
    WriteString(Section, Key, string.Empty);
    Exit;
  end;

  if Value.IsBoolean then
  begin
    WriteString(Section, Key, TUtils.Conversions.BoolToStr(Value.AsBoolean));
    Exit;
  end;

  if Value.IsDate then
  begin
    WriteDate(Section, Key, Value.AsDate);
    Exit;
  end;

  if Value.IsDateTime then
  begin
    WriteDateTime(Section, Key, Value.AsDateTime);
    Exit;
  end;

  if Value.IsTime then
  begin
    WriteTime(Section, Key, Value.AsTime);
    Exit;
  end;

  if Value.IsFloat then
  begin
    WriteFloat(Section, Key, Value.AsExtended);
    Exit;
  end;

  if Value.IsNumeric then
  begin
    WriteInteger(Section, Key, Value.AsInteger);
    Exit;
  end;

  if Value.IsString then
  begin
    WriteString(Section, Key, Value.AsString);
    Exit;
  end;

  if Value.IsObject and Key.IsEmpty then
  begin
    WriteSectionValues(Section, Value.AsType<TStringList>);
    Exit;
  end;
end;

procedure TIniFileHelper.Write(Obj: TObject);
begin
  Execute(Obj, emWrite, nil);
end;

procedure TIniFileHelper.WriteSectionValues(const Section: string; const Values: TStringList);
var
  Line, Key, Value: string;
  SeparatorIndex: Word;
  LValues: TArray<string>;
begin
  LValues := Values.ToStringArray;
  for Line in LValues do
  begin
    SeparatorIndex := Line.IndexOf('=');

    Key := Line.Substring(0, SeparatorIndex);
    Value := Line.Substring(Succ(SeparatorIndex), Line.Length - SeparatorIndex);

    if not Key.IsEmpty then
      WriteString(Section, Key, Value);
  end;
end;

procedure TIniFileHelper.Execute(Obj: TObject; const Mode: TExecuteMode;
  Section: SectionAttribute);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Key: KeyAttribute;
begin
  if not Assigned(Obj) then
    Exit;

  Context := TRttiContext.Create;
  for Prop in Context.GetType(Obj.ClassType).GetProperties do
  begin
    if Prop.Visibility <> mvPublic then
      Continue;

    Value := Prop.GetValue(Obj);
    if Value.IsObject and (Prop.PropertyType.AsInstance.MetaclassType <> TSTringList) then
    begin
      Section := Prop.GetAttribute<SectionAttribute>();
      Execute(Value.AsObject, Mode, Section);
      Continue;
    end;

    if not Assigned(Section) then
      Continue;

    Key := Prop.GetAttribute<KeyAttribute>();
    if not Assigned(Key) then
      Continue;

    case Mode of
      emRead  : Prop.SetValue(Obj, InternalRead(Value, Section.Text, Key.Text));
      emWrite : InternalWrite(Value, Section.Text, Key.Text);
    end;
  end;
end;

end.

