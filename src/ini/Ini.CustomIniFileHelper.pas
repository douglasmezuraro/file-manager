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

      Value := Prop.GetValue(Obj);
      if Value.IsObject then
      begin
        Read(Value.AsObject);
        Continue;
      end;

      Section := GetSection(Obj);
      if Section.IsEmpty then
        Continue;

      for Attribute in Prop.GetAttributes do
      begin
        case (Attribute as TKey).DataType of
          dtBinaryStream : Exit;
          dtBool         : Value := ReadBool(Section, (Attribute as TKey).Name, False);
          dtDate         : Value := ReadDate(Section, (Attribute as TKey).Name, DateNull);
          dtDateTime     : Value := ReadDateTime(Section, (Attribute as TKey).Name, DateNull);
          dtFloat        : Value := ReadFloat(Section, (Attribute as TKey).Name, NumericNull);
          dtInteger      : Value := ReadInteger(Section, (Attribute as TKey).Name, NumericNull);
          dtString       : Value := ReadString(Section, (Attribute as TKey).Name, string.Empty);
          dtTime         : Value := ReadTime(Section, (Attribute as TKey).Name, DateNull);
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
      begin
        Write(Value.AsObject);
        Continue;
      end;

      Section := GetSection(Obj);
      if Section.IsEmpty then
        Continue;

      for Attribute in Prop.GetAttributes do
      begin
        case (Attribute as TKey).DataType of
          dtBinaryStream : Exit;
          dtBool         : WriteBool(Section, (Attribute as TKey).Name, Value.AsBoolean);
          dtDate         : WriteDate(Section, (Attribute as TKey).Name, StrToDate(Value.AsString));
          dtDateTime     : WriteDate(Section, (Attribute as TKey).Name, StrToDateTime(Value.AsString));
          dtFloat        : WriteFloat(Section, (Attribute as TKey).Name, Value.AsExtended);
          dtInteger      : WriteInteger(Section, (Attribute as TKey).Name, Value.AsInteger);
          dtString       : WriteString(Section, (Attribute as TKey).Name, Value.AsString);
          dtTime         : WriteTime(Section, (Attribute as TKey).Name, StrToTime(Value.AsString));
        end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.

