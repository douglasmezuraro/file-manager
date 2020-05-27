unit Helper.Rtti.RttiType;

interface

uses
  System.Rtti;

type
  /// <summary>
  ///  Class helper for class <c>TRttiType<c>.
  /// </summary>
  TRttiTypeHelper = class Helper for TRttiType
  public
    /// <summary>
    ///  Returns the constructor method.
    /// </summary>
    /// <returns>
    ///  TRttiMethod - Returns the constructor if exists, nil otherwise.
    /// </returns>
    function GetConstructor: TRttiMethod;

    /// <summary>
    ///  Returns the destructor method.
    /// </summary>
    /// <returns>
    ///  TRttiMethod - Retunrs the destructor of exists, nil otherwise.
    /// </returns>
    function GetDestructor: TRttiMethod;
  end;

implementation

function TRttiTypeHelper.GetConstructor: TRttiMethod;
begin
  Result := GetMethod('Create');
end;

function TRttiTypeHelper.GetDestructor: TRttiMethod;
begin
  Result := GetMethod('Destroy');
end;

end.

