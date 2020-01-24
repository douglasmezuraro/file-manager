unit Helper.Rtti.Util;

interface

uses
  Attribute.Managed, Helper.Rtti.RttiProperty, Helper.Rtti.RttiType, System.Rtti;

type
  TRttiUtil = class abstract
  public
    class procedure CreateProperties(const Obj: TObject); overload;
    class procedure CreateProperties(const Obj: TObject; const Args: TArray<TValue>); overload;
    class procedure DestroyProperties(const Obj: TObject);
  end;

implementation

class procedure TRttiUtil.CreateProperties(const Obj: TObject);
begin
  TRttiUtil.CreateProperties(Obj, []);
end;

class procedure TRttiUtil.CreateProperties(const Obj: TObject; const Args: TArray<TValue>);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Method: TRttiMethod;
  Instance: TObject;
begin
  if not Assigned(Obj) then
    Exit;

  Context := TRttiContext.Create;
  for Prop in Context.GetType(Obj.ClassType).GetProperties do
  begin
    Method := Prop.PropertyType.GetConstructor;

    if not Assigned(Method) then
      Continue;

    if not Assigned(Prop.GetAttribute<ManagedAttribute>()) then
      Continue;

    Instance := Method.Invoke(Prop.PropertyType.AsInstance.MetaclassType, Args).AsObject;
    Prop.SetValue(Obj, Instance);

    CreateProperties(Instance, Args);
  end;
end;

class procedure TRttiUtil.DestroyProperties(const Obj: TObject);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Method: TRttiMethod;
begin
  if not Assigned(Obj) then
    Exit;

  Context := TRttiContext.Create;
  for Prop in Context.GetType(Obj.ClassType).GetProperties do
  begin
    Method := Prop.PropertyType.GetDestructor;

    if not Assigned(Method) then
      Continue;

    if not Assigned(Prop.GetAttribute<ManagedAttribute>()) then
      Continue;

    DestroyProperties(Prop.GetValue(Obj).AsObject);

    Method.Invoke(Prop.GetValue(Obj), []);
    Prop.SetValue(Obj, nil);
  end;
end;

end.
