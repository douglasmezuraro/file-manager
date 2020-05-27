unit Helper.Rtti.Util;

interface

uses
  Component.Attribute.Managed, Helper.Rtti.RttiProperty, Helper.Rtti.RttiType, System.Rtti;

type
  /// <summary>
  ///  Class with util RTTI methods.
  /// </summary>
  TRttiUtil = class abstract
  public
    /// <summary>
    ///  Create the class properties.
    /// </summary>
    /// <param name="AObject">
    /// </param>
    /// <remarks>
    ///  Creates the property only if the property has the "TManaged" attribute.
    /// </remarks>
    class procedure CreateProperties(const AObject: TObject); overload;

    /// <summary>
    ///  Create the class properties.
    /// </summary>
    /// <param name="AObject">
    /// </param>
    /// <param name="Args">
    /// </param>
    /// <remarks>
    ///  Creates the property only if the property has the "TManaged" attribute.
    /// </remarks>
    class procedure CreateProperties(const AObject: TObject; const Args: TArray<TValue>); overload;

    /// <summary>
    ///  Destroy the class properties.
    /// </summary>
    /// <param name="AObject">
    /// </param>
    /// <param name="Args">
    /// </param>
    /// <remarks>
    ///  Destroy the property only if the property has the "TManaged" attribute.
    /// </remarks>
    class procedure DestroyProperties(const AObject: TObject);
  end;

implementation

class procedure TRttiUtil.CreateProperties(const AObject: TObject);
begin
  TRttiUtil.CreateProperties(AObject, []);
end;

class procedure TRttiUtil.CreateProperties(const AObject: TObject; const Args: TArray<TValue>);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Method: TRttiMethod;
  Instance: TObject;
begin
  if not Assigned(AObject) then
  begin
    Exit;
  end;

  Context := TRttiContext.Create;
  for Prop in Context.GetType(AObject.ClassType).GetProperties do
  begin
    Method := Prop.PropertyType.GetConstructor;

    if not Assigned(Method) then
    begin
      Continue;
    end;

    if not Assigned(Prop.GetAttribute<TManagedAttribute>()) then
    begin
      Continue;
    end;

    Instance := Method.Invoke(Prop.PropertyType.AsInstance.MetaclassType, Args).AsObject;
    Prop.SetValue(AObject, Instance);

    CreateProperties(Instance, Args);
  end;
end;

class procedure TRttiUtil.DestroyProperties(const AObject: TObject);
var
  Context: TRttiContext;
  Prop: TRttiProperty;
  Method: TRttiMethod;
begin
  if not Assigned(AObject) then
  begin
    Exit;
  end;

  Context := TRttiContext.Create;
  for Prop in Context.GetType(AObject.ClassType).GetProperties do
  begin
    Method := Prop.PropertyType.GetDestructor;

    if not Assigned(Method) then
    begin
      Continue;
    end;

    if not Assigned(Prop.GetAttribute<TManagedAttribute>()) then
    begin
      Continue;
    end;

    DestroyProperties(Prop.GetValue(AObject).AsObject);

    Method.Invoke(Prop.GetValue(AObject), []);
    Prop.SetValue(AObject, nil);
  end;
end;

end.

