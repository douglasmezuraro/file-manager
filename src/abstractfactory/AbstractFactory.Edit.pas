unit AbstractFactory.Edit;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.Edit,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.SysUtils;

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
  Caption.Position.X := DTO.X;
  Caption.Position.Y := DTO.Y;
  Caption.Width      := 400;

  DTO.Y := DTO.Y + Caption.Height + 5;

  { Edit }
  Control            := TEdit.Create(DTO.Owner);
  Control.Name       := Format('%s_%s', [DTO.Parent.GetObject.Name, DTO.IniAttribute.Name]).ToUpper;
  Control.Parent     := DTO.Parent.GetObject;
  Control.Position.X := DTO.X;
  Control.Position.Y := DTO.Y;
  Control.Value      := DTO.Value;
  Control.Width      := 400;
  Control.OnExit     := DTO.OnNotify;

  DTO.Y := DTO.Y + Control.Height + 10;

  Result := Control;
end;

end.

