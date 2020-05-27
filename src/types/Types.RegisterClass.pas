unit Types.RegisterClass;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Types.Consts;

type
  TRegisterClass = class sealed
  strict private
    FClasses: TDictionary<string, TClass>;
  private
    procedure Lock;
    procedure UnLock;
  public
    /// <summary>
    ///  Constructor of class
    /// </summary>
    constructor Create;

    /// <summary>
    ///  Destructor of class
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    ///  Register the class "AClass"
    /// </summary>
    /// <param name="AClass">
    /// </param>
    /// <returns>
    ///  True when the class is registered, false when the class is already registered
    /// </returns>
    function RegisterClass(const AClass: TClass): Boolean;

    /// <summary>
    ///  Unregister the class "AClass"
    /// </summary>
    /// <param name="AClass">
    /// </param>
    /// <returns>
    ///  True when the class is registered, false when the class is not found
    /// </returns>
    function UnRegisterClass(const AClass: TClass): Boolean;

    /// <summary>
    ///  Return a class registered with the name "AName"
    /// </summary>
    /// <param name="AName">
    /// </param>
    /// <returns>
    ///  TClass
    /// </returns>
    /// <remarks>
    ///  If the class is not registered the function raises a "EClassNotFound" exception
    /// </remarks>
    function FindClass(const AName: string): TClass;
  end;

var
  RegisteredClasses: TRegisterClass = nil;

implementation

constructor TRegisterClass.Create;
begin
  FClasses := TDictionary<string, TClass>.Create;
end;

destructor TRegisterClass.Destroy;
begin
  FClasses.Destroy;
  inherited;
end;

function TRegisterClass.FindClass(const AName: string): TClass;
begin
  Lock;
  try
    if not FClasses.ContainsKey(AName) then
    begin
      raise EClassNotFound.Create(Format(SClassShouldBeRegistrated, [AName]));
    end;

    Result := FClasses.Items[AName];
  finally
    UnLock;
  end;
end;

procedure TRegisterClass.Lock;
begin
  MonitorEnter(Self);
end;

function TRegisterClass.RegisterClass(const AClass: TClass): Boolean;
begin
  Lock;
  try
    if not FClasses.ContainsKey(AClass.ClassName) then
    begin
      FClasses.Add(AClass.ClassName, AClass);
      Exit(True);
    end;

    Result := False;
  finally
    UnLock;
  end;
end;

procedure TRegisterClass.UnLock;
begin
  MonitorExit(Self);
end;

function TRegisterClass.UnRegisterClass(const AClass: TClass): Boolean;
begin
  Lock;
  try
    if FClasses.ContainsKey(AClass.ClassName) then
    begin
      FClasses.Remove(AClass.ClassName);
      Exit(True);
    end;

    Result := False;
  finally
    UnLock;
  end;
end;

initialization
  RegisteredClasses := TRegisterClass.Create;

finalization
  RegisteredClasses.Free;

end.
