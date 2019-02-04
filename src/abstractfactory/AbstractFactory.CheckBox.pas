unit AbstractFactory.CheckBox;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.Graphics,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.Rtti,
  System.SysUtils;

type
  TCheckBoxFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function New(var DTO: TDTO): TControl;
  end;

implementation

{ TCheckBoxFactory }

function TCheckBoxFactory.New(var DTO: TDTO): TControl;
var
  Control: TCheckBox;
begin
  Control            := TCheckBox.Create(DTO.Owner);
  Control.Name       := Format('%s_%s', [DTO.Parent.Name, DTO.Ident.Name]).ToUpper;
  Control.Parent     := DTO.Parent;
  Control.Position.X := DTO.X;
  Control.Position.Y := DTO.Y;
  Control.Value      := DTO.Value;
  Control.Text       := DTO.Control.Text;
  Control.TagObject  := DTO.Ident;
  Control.Width      := 400;
  Control.OnExit     := DTO.OnChange;

  DTO.Y := DTO.Y + Control.Height + 10;

  Result := Control;
end;

end.

