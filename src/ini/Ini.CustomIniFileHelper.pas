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
  public
    procedure Read(const Obj: TObject);
    procedure Write(const Obj: TObject);
  end;

implementation

{ TCustomIniFileHelper }

function TCustomIniFileHelper.GetSection(const Obj: TObject): string;
var
  Context: TRttiContext;
  Typ: TRttiType;
  Attribute: TCustomAttribute;
begin
  Result := string.Empty;
  Context := TRttiContext.Create;
  try
    Typ := Context.GetType(Obj.ClassType);
    for Attribute in Typ.GetAttributes do
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
  Typ: TRttiType;
  Prop: TRttiProperty;
  Attribute: TCustomAttribute;
  Value: TValue;
  Section: string;
begin
  Context := TRttiContext.Create;
  try
    Typ := Context.GetType(Obj.ClassType);
    for Prop in typ.GetProperties do
    begin
      if Prop.Visibility <> mvPublic then
        Continue;

      if Prop.PropertyType.TypeKind = tkClass then
      begin
        Value := Prop.GetValue(Obj);
        Read(Value.AsObject);
        Continue;
      end;

      for Attribute in Prop.GetAttributes do
      begin
        Section := GetSection(Obj);
        if Section.IsEmpty then
          Continue;

        case (Attribute as TKey).DataType of
          dtBinaryStream:
            begin
              Exit;
            end;
          dtBool:
            begin
              Value := ReadBool(Section, (Attribute as TKey).Name, False);
            end;
          dtDate:
            begin
              Value := ReadDate(Section, (Attribute as TKey).Name, DateNull);
            end;
          dtDateTime:
            begin
              Value := ReadDateTime(Section, (Attribute as TKey).Name, DateNull);
            end;
          dtFloat:
            begin
              Value := ReadFloat(Section, (Attribute as TKey).Name, NumericNull);
            end;
          dtInteger:
            begin
              Value := ReadInteger(Section, (Attribute as TKey).Name, NumericNull);
            end;
          dtString:
            begin
              Value := ReadString(Section, (Attribute as TKey).Name, string.Empty);
            end;
          dtTime:
            begin
              Value := ReadTime(Section, (Attribute as TKey).Name, DateNull);
            end;
        end;
        Prop.SetValue(Obj, Value);
      end;
    end;
  finally
    Context.Free;
  end;
end;

procedure TCustomIniFileHelper.Write(const Obj: TObject);
var
  Context: TRttiContext;
  Typ: TRttiType;
  Prop: TRttiProperty;
  Attribute: TCustomAttribute;
  Value: TValue;
  Section: string;
begin
  Context := TRttiContext.Create;
  try
    Typ := Context.GetType(Obj.ClassType);
    for Prop in Typ.GetProperties do
    begin
      if Prop.Visibility <> mvPublic then
        Continue;

      Value := Prop.GetValue(Obj);

      if Value.IsObject then
        Write(Value.AsObject);

      Section := GetSection(Obj);
      if Section.IsEmpty then
        Continue;

      for Attribute in Prop.GetAttributes do
      begin
        case (Attribute as TKey).DataType of
          dtBinaryStream:
            begin
              Exit;
            end;
          dtBool:
            begin
              WriteBool(Section, (Attribute as TKey).Name, Value.AsBoolean);
            end;
          dtDate:
            begin
              WriteDate(Section, (Attribute as TKey).Name, StrToDate(Value.AsString));
            end;
          dtDateTime:
            begin
              WriteDate(Section, (Attribute as TKey).Name, StrToDateTime(Value.AsString));
            end;
          dtFloat:
            begin
              WriteFloat(Section, (Attribute as TKey).Name, Value.AsExtended);
            end;
          dtInteger:
            begin
              WriteInteger(Section, (Attribute as TKey).Name, Value.AsInteger);
            end;
          dtString:
            begin
              WriteString(Section, (Attribute as TKey).Name, Value.AsString);
            end;
          dtTime:
            begin
              WriteTime(Section, (Attribute as TKey).Name, StrToTime(Value.AsString));
            end;
        end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.

