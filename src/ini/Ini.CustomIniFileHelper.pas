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
    function GetSection(const Obj: TObject): TSection;
  public
    procedure Read(const Obj: TObject);
    procedure Write(const Obj: TObject);
  end;

implementation

{ TCustomIniFileHelper }

function TCustomIniFileHelper.GetSection(const Obj: TObject): TSection;
var
  Context: TRttiContext;
  Attribute: TCustomAttribute;
begin
  Result := nil;

  if not Assigned(Obj) then
    Exit;

  Context := TRttiContext.Create;
  try
    for Attribute in Context.GetType(Obj.ClassType).GetAttributes do
    begin
      if Attribute is TSection then
      begin
        Result := Attribute as TSection;
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
  Attribute: TCustomAttribute;
  Value: TValue;
  Section: TSection;
begin
  if not Assigned(Obj) then
    Exit;

  Context := TRttiContext.Create;
  try
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
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
      if not Assigned(Section) then
        Continue;

      for Attribute in Prop.GetAttributes do
      begin
        if Attribute is TKey then
        begin
          case (Attribute as TKey).DataType of
            dtBinaryStream : Exit;
            dtBool         : Value := ReadBool(Section.Name, (Attribute as TKey).Name, False);
            dtDate         : Value := ReadDate(Section.Name, (Attribute as TKey).Name, DateNull);
            dtDateTime     : Value := ReadDateTime(Section.Name, (Attribute as TKey).Name, DateNull);
            dtFloat        : Value := ReadFloat(Section.Name, (Attribute as TKey).Name, NumericNull);
            dtInteger      : Value := ReadInteger(Section.Name, (Attribute as TKey).Name, NumericNull);
            dtString       : Value := ReadString(Section.Name, (Attribute as TKey).Name, string.Empty);
            dtTime         : Value := ReadTime(Section.Name, (Attribute as TKey).Name, DateNull);
          end;
          Prop.SetValue(Obj, Value);
        end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

procedure TCustomIniFileHelper.Write(const Obj: TObject);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Attribute: TCustomAttribute;
  Value: TValue;
  Section: TSection;
begin
  if not Assigned(Obj) then
    Exit;

  Context := TRttiContext.Create;
  try
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
      if Prop.Visibility in [mvPrivate, mvProtected] then
        Continue;

      Value := Prop.GetValue(Obj);
      if Value.IsObject then
      begin
        Write(Value.AsObject);
        Continue;
      end;

      Section := GetSection(Obj);
      if not Assigned(Section) then
        Continue;

      for Attribute in Prop.GetAttributes do
      begin
        if Attribute is TKey then
        begin
          case (Attribute as TKey).DataType of
            dtBinaryStream : Exit;
            dtBool         : WriteBool(Section.Name, (Attribute as TKey).Name, Value.AsBoolean);
            dtDate         : WriteDate(Section.Name, (Attribute as TKey).Name, StrToDate(Value.AsString));
            dtDateTime     : WriteDate(Section.Name, (Attribute as TKey).Name, StrToDateTime(Value.AsString));
            dtFloat        : WriteFloat(Section.Name, (Attribute as TKey).Name, Value.AsExtended);
            dtInteger      : WriteInteger(Section.Name, (Attribute as TKey).Name, Value.AsInteger);
            dtString       : WriteString(Section.Name, (Attribute as TKey).Name, Value.AsString);
            dtTime         : WriteTime(Section.Name, (Attribute as TKey).Name, StrToTime(Value.AsString));
          end;
        end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.

