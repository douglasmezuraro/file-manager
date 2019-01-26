unit Ini.CustomIniFileHelper;

interface

uses
  Helper.Value,
  Ini.Attribute,
  Ini.Ident,
  Ini.Section,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.TypInfo,
  Util.Constants,
  Util.Methods;

type
  TCustomIniFileHelper = class Helper for TCustomIniFile
  private type
    TExecuteMode = (emRead, emWrite);
  private
    procedure Execute(Obj: TObject; const Mode: TExecuteMode); overload;
    procedure Execute(var Value: TValue; const Section, Key: string; const Mode: TExecuteMode); overload;
    function GetSection(const Obj: TObject): string;
    function GetKey(const Prop: TRttiProperty): string;
  public
    procedure ReadObject(Obj: TObject);
    procedure WriteObject(Obj: TObject);
  end;

implementation

{ TCustomIniFileHelper }

function TCustomIniFileHelper.GetKey(const Prop: TRttiProperty): string;
var
  Attribute: TCustomAttribute;
begin
  Result := string.Empty;
  for Attribute in Prop.GetAttributes do
  begin
    if Attribute is TIdent then
    begin
      Result := (Attribute as TIdent).Name;
      Break;
    end;
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
    for Attribute in Context.GetType(Obj.ClassType).GetAttributes do
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

procedure TCustomIniFileHelper.Execute(Obj: TObject; const Mode: TExecuteMode);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Section, Key: string;
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
        Execute(Value.AsObject, Mode);
        Continue;
      end;

      Section := GetSection(Obj);
      Key := GetKey(Prop);

      if Section.IsEmpty or Key.IsEmpty then
        Continue;

      Execute(Value, Section, Key, Mode);
      if Mode = emRead then
        Prop.SetValue(Obj, Value);
    end;
  finally
    Context.Free;
  end;
end;

procedure TCustomIniFileHelper.Execute(var Value: TValue; const Section,
  Key: string; const Mode: TExecuteMode);
begin
  case Mode of
    emRead:
      begin
        if Value.IsBoolean then
          Value := TMethods.StrToBool(ReadString(Section, Key, TMethods.BoolToStr(False)))
        else if Value.IsDate then
          Value := ReadDate(Section, Key, DateNull)
        else if Value.IsDateTime then
          Value := ReadDateTime(Section, Key, DateNull)
        else if Value.IsTime then
          Value := ReadTime(Section, Key, DateNull)
        else if Value.IsFloat then
           Value := ReadFloat(Section, Key, NumericNull)
        else if Value.IsNumeric then
          Value := ReadInteger(Section, Key, NumericNull)
        else if Value.IsString then
          Value := ReadString(Section, Key, string.Empty);
      end;
    emWrite:
      begin
        if Value.IsBoolean then
          WriteString(Section, Key, TMethods.BoolToStr(Value.AsBoolean))
        else if Value.IsDate then
          WriteDate(Section, Key, Value.AsDate)
        else if Value.IsDateTime then
          WriteDateTime(Section, Key, Value.AsDateTime)
        else if Value.IsTime then
          WriteTime(Section, Key, Value.AsTime)
        else if Value.IsFloat then
          WriteFloat(Section, Key, Value.AsExtended)
        else if Value.IsNumeric then
          WriteInteger(Section, Key, Value.AsInteger)
        else if Value.IsString then
          WriteString(Section, Key, Value.AsString);
      end;
  end;
end;

procedure TCustomIniFileHelper.ReadObject(Obj: TObject);
begin
  Execute(Obj, emRead);
end;

procedure TCustomIniFileHelper.WriteObject(Obj: TObject);
begin
  Execute(Obj, emWrite);
end;

end.

