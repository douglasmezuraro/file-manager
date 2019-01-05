unit Ini.CustomIniFileHelper;

interface

uses
  Ini.DataType,
  Ini.Key,
  Ini.Section,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.TypInfo,
  Util.Constants;

type
  TCustomIniFileHelper = class Helper for TCustomIniFile
  private
    function GetSection(const Obj: TObject): string;
    function GetKey(const Obj: TObject): TKey;
  public
    procedure Read(const Obj: TObject);
    procedure Write(const Obj: TObject);
  end;

implementation

{ TCustomIniFileHelper }

function TCustomIniFileHelper.GetKey(const Obj: TObject): TKey;
var
  Context: TRttiContext;
  Attribute: TCustomAttribute;
begin
  Result := nil;
  Context := TRttiContext.Create;
  try
    for Attribute in Context.GetType(Obj).GetAttributes do
    begin
      if Attribute is TKey then
      begin
        Result := (Attribute as TKey);
        Break;
      end;
    end;
  finally
    Context.Free;
  end;
end;

function TCustomIniFileHelper.GetSection(const Obj: TObject): string;
var
  Context: TRttiContext;
  Attribute: TCustomAttribute;
begin
  Result := string.Empty;
  Context := TRttiContext.Create;
  try
    for Attribute in Context.GetType(Obj).GetAttributes do
    begin
      if Attribute is TSection then
      begin
        Result := (Attribute as TSection).Name;
        Break;
      end;
    end;
  finally
    Context.Free;
  end;
end;

procedure TCustomIniFileHelper.Read(const Obj: TObject);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Key: TKey;
  Value: TValue;
  Section: string;
begin
  Context := TRttiContext.Create;
  try
    Section := GetSection(Obj);
    if Section.IsEmpty then
      Exit;
     
    for Prop in Context.GetType(Obj).GetProperties do
    begin
      if Prop.Visibility <> mvPublic then
        Continue;

      Key := GetKey(Obj);
      if not Assigned(Key) then
        Continue;

      case Key.DataType of
        dtBinaryStream:
          begin
            Exit;
          end;
        dtBool:
          begin
            Value := ReadBool(Section, Key.Name, False);
          end;
        dtDate:
          begin
            Value := ReadDate(Section, Key.Name, DateNull);
          end;
        dtDateTime:
          begin
            Value := ReadDateTime(Section, Key.Name, DateNull);
          end;
        dtFloat:
          begin
            Value := ReadFloat(Section, Key.Name, NumericNull);
          end;
        dtInteger:
          begin
            Value := ReadInteger(Section, Key.Name, NumericNull);
          end;
        dtString:
          begin
            Value := ReadString(Section, Key.Name, string.Empty);
          end;
        dtTime:
          begin
            Value := ReadTime(Section, Key.Name, DateNull);
          end;
      end;
      Prop.SetValue(Obj, Value);
    end;
  finally
    Context.Free;
  end;
end;

procedure TCustomIniFileHelper.Write(const Obj: TObject);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Key: TKey;
  Value: TValue;
  Section: string;
begin
  Context := TRttiContext.Create;
  try
    Section := GetSection(Obj);
    if Section.IsEmpty then
      Exit;
     
    for Prop in Context.GetType(Obj).GetProperties do
    begin
      if Prop.Visibility <> mvPublic then
        Continue;

      Key := GetKey(Obj);
      if not Assigned(Key) then
        Continue;

      Value := Prop.GetValue(Obj);
      case Key.DataType of
        dtBinaryStream:
          begin
            Exit;
          end;
        dtBool:
          begin
            WriteBool(Section, Key.Name, Value.AsBoolean);
          end;
        dtDate:
          begin
            WriteDate(Section, Key.Name, StrToDate(Value.AsString));
          end;
        dtDateTime:
          begin
            WriteDate(Section, Key.Name, StrToDateTime(Value.AsString));
          end;
        dtFloat:
          begin
            WriteFloat(Section, Key.Name, Value.AsExtended);
          end;
        dtInteger:
          begin
            WriteInteger(Section, Key.Name, Value.AsInteger);
          end;
        dtString:
          begin
            WriteString(Section, Key.Name, Value.AsString);
          end;
        dtTime:
          begin
            WriteTime(Section, Key.Name, StrToTime(Value.AsString));
          end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.

