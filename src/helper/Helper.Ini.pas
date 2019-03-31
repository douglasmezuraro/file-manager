unit Helper.Ini;

interface

uses
  Attribute.Ini,
  Helper.Rtti,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.TypInfo,
  Util.Methods;

type
  TIniFileHelper = class Helper for TIniFile
  private type
    TExecuteMode = (emRead, emWrite);
  private
    procedure Execute(Obj: TObject; const Mode: TExecuteMode; Section: SectionAttribute);
    procedure Read(var Value: TValue; const Section, Key: string);
    procedure Write(var Value: TValue; const Section, Key: string);
  public
    procedure ReadObject(Obj: TObject);
    procedure WriteObject(Obj: TObject);
  end;

implementation

{ TIniFileHelper }

procedure TIniFileHelper.Read(var Value: TValue; const Section, Key: string);
begin
  if Value.IsBoolean then
  begin
    Value := TUtils.Conversions.StrToBool(ReadString(Section, Key, TUtils.Conversions.BoolToStr(False)));
    Exit;
  end;
    
  if Value.IsDate then
  begin
    Value := ReadDate(Section, Key, TUtils.Constants.DateNull);
    Exit;
  end;
    
  if Value.IsDateTime then
  begin
    Value := ReadDateTime(Section, Key, TUtils.Constants.DateNull);
    Exit;
  end;
    
  if Value.IsTime then
  begin
    Value := ReadTime(Section, Key, TUtils.Constants.DateNull);
    Exit;
  end;
    
  if Value.IsFloat then
  begin
    Value := ReadFloat(Section, Key, TUtils.Constants.NumericNull);
    Exit;
  end;
     
  if Value.IsNumeric then
  begin
    Value := ReadInteger(Section, Key, TUtils.Constants.NumericNull);
    Exit;
  end;
    
  if Value.IsString then
  begin
    Value := ReadString(Section, Key, string.Empty);
    Exit;
  end;
end;

procedure TIniFileHelper.ReadObject(Obj: TObject);
begin
  Execute(Obj, emRead, nil);
end;

procedure TIniFileHelper.Write(var Value: TValue; const Section, Key: string);
begin
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
end;

procedure TIniFileHelper.WriteObject(Obj: TObject);
begin
  Execute(Obj, emWrite, nil);
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
  try
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
      if Prop.Visibility <> mvPublic then
        Continue;

      Value := Prop.GetValue(Obj);
      if Value.IsObject then
      begin
        Section := Prop.GetAtribute<SectionAttribute>();
        Execute(Value.AsObject, Mode, Section);
        Continue;
      end;

      if not Assigned(Section) then  
        Continue;      

      Key := Prop.GetAtribute<KeyAttribute>();
      if not Assigned(Key) then
        Continue;

      case Mode of
        emRead: 
          begin
            Read(Value, Section.Name, Key.Name);
            Prop.SetValue(Obj, Value);
          end;
        emWrite:
          begin
            Write(Value, Section.Name, Key.Name);
          end;
      end;
    end;
  finally
    Context.Free;
  end;
end;

end.

