unit Util.Types;

interface

uses
  Attribute.Control,
  Attribute.Ini,
  FMX.Types,
  System.Classes,
  System.Generics.Collections,
  System.Rtti;

type
  TPropertyBinding = TPair<TObject, TRttiProperty>;
  TControlBinding = TDictionary<IControl, TPropertyBinding>;

  TPosition = record
    X: Single;
    Y: Single;
  end;

  TDTO = record
    Owner: TComponent;
    Parent: IControl;
    Position: TPosition;
    Value: TValue;
    ControlAttribute: TControlAttribute;
    OnNotify: TNotifyEvent;
    IniAttribute: TIniAttribute;
    constructor Create(const X, Y: Single);
  end;

implementation

{ TDTO }

constructor TDTO.Create(const X, Y: Single);
begin
  Position.X := X;
  Position.Y := Y;
end;

end.

