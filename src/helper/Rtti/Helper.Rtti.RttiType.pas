unit Helper.Rtti.RttiType;

interface

uses
  System.Rtti;

type
  TRttiTypeHelper = class Helper for TRttiType
  public
    function GetConstructor: TRttiMethod;
    function GetDestructor: TRttiMethod;
  end;

implementation

function TRttiTypeHelper.GetConstructor: TRttiMethod;
var
  Method: TRttiMethod;
begin
  Method := GetMethod('Create');

  if Assigned(Method) and (not Method.IsConstructor) then
    Method := nil;

  Result := Method;
end;

function TRttiTypeHelper.GetDestructor: TRttiMethod;
var
  Method: TRttiMethod;
begin
  Method := GetMethod('Destroy');

  if Assigned(Method) and (not Method.IsDestructor) then
    Method := nil;

  Result := Method;
end;

end.
