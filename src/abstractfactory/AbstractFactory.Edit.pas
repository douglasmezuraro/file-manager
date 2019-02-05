unit AbstractFactory.Edit;

interface

uses
  AbstractFactory.API,
  FMX.Controls,
  FMX.Edit,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.SysUtils,
  Util.Types;

type
  TEditFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function Fabricate(var DTO: TDTO): IControl;
  end;

implementation

{ TEditFactory }

function TEditFactory.Fabricate(var DTO: TDTO): IControl;
var
  Caption: TLabel;
  Control: TEdit;
begin
  Caption            := TLabel.Create(DTO.Owner);
  Caption.Parent     := DTO.Parent.GetObject;
  Caption.Text       := DTO.ControlAttribute.Text;
  Caption.Position.X := DTO.Position.X;
  Caption.Position.Y := DTO.Position.Y;
  Caption.Width      := 400;

  DTO.Position.Y := DTO.Position.Y + Caption.Height + 5;

  { Edit }
  Control            := TEdit.Create(DTO.Owner);
  Control.Parent     := DTO.Parent.GetObject;
  Control.Position.X := DTO.Position.X;
  Control.Position.Y := DTO.Position.Y;
  Control.Value      := DTO.Value;
  Control.Width      := 400;
  Control.OnExit     := DTO.OnNotify;

  DTO.Position.Y := DTO.Position.Y + Control.Height + 10;

  Result := Control;
end;

end.

