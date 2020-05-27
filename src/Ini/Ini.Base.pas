unit Ini.Base;

interface

uses
  Ini.Attribute.Key, Ini.Attribute.Section, Ini.API, Helper.Ini, Helper.Rtti.RttiProperty,
  Helper.Rtti.Util, Helper.Rtti.Value, System.Classes, System.IniFiles, System.IOUtils, System.Rtti,
  System.SysUtils, System.TypInfo, Types.Consts;

type
  /// <summary>
  ///  Class of TIniMappedObject.
  /// </summary>
  TIniMappedObjectClass = class of TIniMappedObject;

  /// <summary>
  ///  Concrete class that maps an ini file.
  /// </summary>
  TIniMappedObject = class abstract(TInterfacedObject, IIniMappedObject)
  strict private type
    TAction = (None, Read, Write);
  strict private
    FFile: TIniFile;
    FAction: TAction;
  private
    procedure Execute(const AObject: TObject; ASection: TSectionAttribute);
    function ReadValue(var AValue: TValue; const ASection, AKey: string): TValue;
    procedure WriteValue(var AValue: TValue; const ASection, AKey: string);
    procedure Read;
  public
    /// <summary>
    ///  Constructor of class.
    /// </summary>
    /// <param name="AFileName">
    /// </param>
    constructor Create(const AFileName: string);

    /// <summary>
    ///  Destructor of class.
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    ///  Write the file.
    /// </summary>
    /// <remarks>
    ///  Write the file passed as parameter in class constructor.
    /// </remarks>
    procedure Write; overload;

    /// <summary>
    ///  Write the file.
    /// </summary>
    /// <param name="FileName">
    /// </param>
    /// <remarks>
    ///  Write the file passed as parameter.
    /// </remarks>
    procedure Write(const AFileName: string); overload;

    /// <summary>
    ///  Auto create the properties of the class.
    /// </summary>
    procedure CreateProperties;

    /// <summary>
    ///  Auto destroy the properties of the class.
    /// </summary>
    procedure DestroyProperties;

    /// <summary>
    ///  Returns the instance of the object that implements the interface.
    /// </summary>
    /// <returns>
    ///  TObject
    /// </returns>
    function GetObject: TObject;
  end;

implementation

constructor TIniMappedObject.Create(const AFileName: string);
begin
  if not TFile.Exists(AFileName) then
  begin
    raise EFileNotFoundException.CreateFmt(SFileNotFound, [AFileName]);
  end;

  FFile := TIniFile.Create(AFileName);
  CreateProperties;
  Read;
end;

procedure TIniMappedObject.CreateProperties;
begin
  TRttiUtil.CreateProperties(Self);
end;

destructor TIniMappedObject.Destroy;
begin
  FFile.Free;
  DestroyProperties;
  inherited Destroy;
end;

procedure TIniMappedObject.DestroyProperties;
begin
  TRttiUtil.DestroyProperties(Self);
end;

procedure TIniMappedObject.Read;
begin
  FAction := TAction.Read;
  Execute(Self, nil);
end;

procedure TIniMappedObject.Write(const AFileName: string);
begin
  FAction := TAction.Write;

  if Assigned(FFile) and (not FFile.FileName.Equals(AFileName)) then
  begin
    FFile.Free;
    FFile := TIniFile.Create(AFileName);
  end;

  Write;
end;

procedure TIniMappedObject.Write;
begin
  Execute(Self, nil);
end;

procedure TIniMappedObject.Execute(const AObject: TObject; ASection: TSectionAttribute);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Value: TValue;
  Key: TKeyAttribute;
begin
  Context := TRttiContext.Create;
  for Prop in Context.GetType(AObject.ClassType).GetProperties do
  begin
    if not (Prop.Visibility in [mvPublic, mvPublished]) then
    begin
      Continue;
    end;

    Value := Prop.GetValue(AObject);
    if Value.IsObject and (Prop.PropertyType.AsInstance.MetaclassType <> TSTringList) then
    begin
      ASection := Prop.GetAttribute<TSectionAttribute>();
      Execute(Value.AsObject, ASection);
      Continue;
    end;

    if not Assigned(ASection) then
    begin
      Continue;
    end;

    Key := Prop.GetAttribute<TKeyAttribute>();
    if not Assigned(Key) then
    begin
      Continue;
    end;

    case FAction of
      TAction.Read: Prop.SetValue(AObject, ReadValue(Value, ASection.Value, Key.Value));
      TAction.Write: WriteValue(Value, ASection.Value, Key.Value);
    end;
  end;
end;

function TIniMappedObject.GetObject: TObject;
begin
  Result := Self;
end;

function TIniMappedObject.ReadValue(var AValue: TValue; const ASection, AKey: string): TValue;
begin
  Result := AValue;

  if AValue.IsBoolean then
  begin
    AValue := StrToBool(FFile.ReadString(ASection, AKey, False.ToString(TUseBoolStrs.True)));
    Exit(AValue);
  end;

  if AValue.IsDate then
  begin
    AValue := FFile.ReadDate(ASection, AKey, MaxDateTime);
    Exit(AValue);
  end;

  if AValue.IsDateTime then
  begin
    AValue := FFile.ReadDateTime(ASection, AKey, MaxDateTime);
    Exit(AValue);
  end;

  if AValue.IsTime then
  begin
    AValue := FFile.ReadTime(ASection, AKey, MaxDateTime);
    Exit(AValue);
  end;

  if AValue.IsFloat then
  begin
    AValue := FFile.ReadFloat(ASection, AKey, Double.MaxValue);
    Exit(AValue);
  end;

  if AValue.IsNumeric then
  begin
    AValue := FFile.ReadInteger(ASection, AKey, Integer.MaxValue);
    Exit(AValue);
  end;

  if AValue.IsString then
  begin
    AValue := FFile.ReadString(ASection, AKey, string.Empty).Trim;
    Exit(AValue);
  end;

  if AValue.IsObject then
  begin
    FFile.ReadSectionValues(ASection, AValue.AsType<TStringList>);
    Exit(AValue);
  end;
end;

procedure TIniMappedObject.WriteValue(var AValue: TValue; const ASection, AKey: string);
begin
  if not AValue.Assigned then
  begin
    FFile.WriteString(ASection, AKey, string.Empty);
    Exit;
  end;

  if AValue.IsBoolean then
  begin
    FFile.WriteString(ASection, AKey, AValue.AsBoolean.ToString(TUseBoolStrs.True));
    Exit;
  end;

  if AValue.IsDate then
  begin
    FFile.WriteDate(ASection, AKey, AValue.AsDate);
    Exit;
  end;

  if AValue.IsDateTime then
  begin
    FFile.WriteDateTime(ASection, AKey, AValue.AsDateTime);
    Exit;
  end;

  if AValue.IsTime then
  begin
    FFile.WriteTime(ASection, AKey, AValue.AsTime);
    Exit;
  end;

  if AValue.IsFloat then
  begin
    FFile.WriteFloat(ASection, AKey, AValue.AsExtended);
    Exit;
  end;

  if AValue.IsNumeric then
  begin
    FFile.WriteInteger(ASection, AKey, AValue.AsInteger);
    Exit;
  end;

  if AValue.IsString then
  begin
    FFile.WriteString(ASection, AKey, AValue.AsString);
    Exit;
  end;

  if AValue.IsObject then
  begin
    FFile.WriteSectionValues(ASection, AValue.AsType<TStringList>);
    Exit;
  end;
end;

end.

