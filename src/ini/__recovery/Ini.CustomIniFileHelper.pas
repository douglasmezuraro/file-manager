unit Ini.CustomIniFileHelper;

interface

uses
  Helper.Value,
  Ini.Key,
  Ini.Section,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.TypInfo,
  Util.Constants,
  Util.Methods;

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
          if Value.IsBoolean then
            Value := TMethods.StrToBool(ReadString(Section.Name, (Attribute as TKey).Name, TMethods.BoolToStr(False)))
          else if Value.IsDate then
            Value := ReadDate(Section.Name, (Attribute as TKey).Name, DateNull)
          else if Value.IsDateTime then
            Value := ReadDateTime(Section.Name, (Attribute as TKey).Name, DateNull)
          else if Value.IsTime then
            Value := ReadTime(Section.Name, (Attribute as TKey).Name, DateNull)
          else if Value.IsFloat then
             Value := ReadFloat(Section.Name, (Attribute as TKey).Name, NumericNull)
          else if Value.IsNumeric then
            Value := ReadInteger(Section.Name, (Attribute as TKey).Name, NumericNull)
          else if Value.IsString then
            Value := ReadString(Section.Name, (Attribute as TKey).Name, string.Empty);

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
          if Value.IsBoolean then
            WriteString(Section.Name, (Attribute as TKey).Name, TMethods.BoolToStr(Value.AsBoolean))
          else if Value.IsDate then
            WriteDate(Section.Name, (Attribute as TKey).Name, Value.AsDate)
          else if Value.IsDateTime then
            WriteDateTime(Section.Name, (Attribute as TKey).Name, StrToDateTime(Value.AsString))
          else if Value.IsTime then
            WriteTime(Section.Name, (Attribute as TKey).Name, StrToTime(Value.AsString))
          else if Value.IsFloat then
            WriteFloat(Section.Name, (Attribute as TKey).Name, Value.AsExtended)
          else if Value.IsNumeric then
            WriteInteger(Section.Name, (Attribute as TKey).Name, Value.AsInteger)
          else if Value.IsString then
            WriteString(Section.Name, (Attribute as TKey).Name, TMethods.BoolToStr(Value.AsBoolean));

          //byte
          //cardinal


        end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.

