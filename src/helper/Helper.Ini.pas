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
    procedure Execute(Obj: TObject; const Mode: TExecuteMode; Section: string); overload;
    procedure Execute(var Value: TValue; const Section, Key: string; const Mode: TExecuteMode); overload;
    function GetSection(const Prop: TRttiProperty): string;
    function GetKey(const Prop: TRttiProperty): string;
  public
    procedure ReadObject(Obj: TObject);
    procedure WriteObject(Obj: TObject);
  end;

implementation

{ TIniFileHelper }

function TIniFileHelper.GetKey(const Prop: TRttiProperty): string;
var
  Key: KeyAttribute;
begin
  Key := Prop.GetAtribute<KeyAttribute>;

  Result := string.Empty;
  if Assigned(Key) then
    Result := Key.Name;
end;

function TIniFileHelper.GetSection(const Prop: TRttiProperty): string;
var
  Section: SectionAttribute;
begin
  Section := Prop.GetAtribute<SectionAttribute>;

  Result := string.Empty;
  if Assigned(Section) then
    Result := Section.Name;
end;

procedure TIniFileHelper.Execute(Obj: TObject; const Mode: TExecuteMode;
  Section: string);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Key: string;
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
        Section := GetSection(Prop);
        Execute(Value.AsObject, Mode, Section);
        Continue;
      end;

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

procedure TIniFileHelper.Execute(var Value: TValue; const Section,
  Key: string; const Mode: TExecuteMode);
begin
  case Mode of
    emRead:
      begin
        if Value.IsBoolean then
          Value := TUtils.Conversions.StrToBool(ReadString(Section, Key, TUtils.Conversions.BoolToStr(False)))
        else if Value.IsDate then
          Value := ReadDate(Section, Key, TUtils.Constants.DateNull)
        else if Value.IsDateTime then
          Value := ReadDateTime(Section, Key, TUtils.Constants.DateNull)
        else if Value.IsTime then
          Value := ReadTime(Section, Key, TUtils.Constants.DateNull)
        else if Value.IsFloat then
           Value := ReadFloat(Section, Key, TUtils.Constants.NumericNull)
        else if Value.IsNumeric then
          Value := ReadInteger(Section, Key, TUtils.Constants.NumericNull)
        else if Value.IsString then
          Value := ReadString(Section, Key, string.Empty);
      end;
    emWrite:
      begin
        if Value.IsBoolean then
          WriteString(Section, Key, TUtils.Conversions.BoolToStr(Value.AsBoolean))
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

procedure TIniFileHelper.ReadObject(Obj: TObject);
begin
  Execute(Obj, emRead, '');
end;

procedure TIniFileHelper.WriteObject(Obj: TObject);
begin
  Execute(Obj, emWrite, '');
end;

end.

