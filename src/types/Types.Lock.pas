unit Types.Lock;

interface

uses
  System.SysUtils;

type
  /// <summary>
  ///  Class that executes methods with lock.
  /// </summary>
  TLock = class sealed
  private
    FLocked: Boolean;
  public
    /// <summary>
    ///  Executes the method with lock.
    /// </summary>
    /// <param name="AMethod">
    /// </param>
    procedure Execute(const AMethod: TProc); overload;

    /// <summary>
    ///  Executes the method with lock.
    /// </summary>
    /// <param name="AMethod">
    /// </param>
    /// <param name="AArg">
    /// </param>
    procedure Execute<T>(const AMethod: TProc<T>; const AArg: T); overload;

    /// <summary>
    ///  Executes the method with lock.
    /// </summary>
    /// <param name="AMethod">
    /// </param>
    /// <param name="AArg1">
    /// </param>
    /// <param name="AArg2">
    /// </param>
    procedure Execute<T1, T2>(const AMethod: TProc<T1, T2>; const AArg1: T1; const AArg2: T2); overload;

    /// <summary>
    ///  Indicates the lock state.
    /// </summary>
    /// <value>
    ///  Boolean
    /// </value>
    property Locked: Boolean read FLocked;
  end;

implementation

procedure TLock.Execute(const AMethod: TProc);
begin
  FLocked := True;
  try
    AMethod;
  finally
    FLocked := False;
  end;
end;

procedure TLock.Execute<T>(const AMethod: TProc<T>; const AArg: T);
begin
  FLocked := True;
  try
    AMethod(AArg);
  finally
    FLocked := False;
  end;
end;

procedure TLock.Execute<T1, T2>(const AMethod: TProc<T1, T2>; const AArg1: T1; const AArg2: T2);
begin
  FLocked := True;
  try
    AMethod(AArg1, AArg2);
  finally
    FLocked := False;
  end;
end;

end.

