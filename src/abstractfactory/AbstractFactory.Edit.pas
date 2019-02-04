unit AbstractFactory.Edit;

interface

uses
  AbstractFactory.API,
  AbstractFactory.DTO,
  FMX.Controls,
  FMX.Edit,
  FMX.Graphics,
  FMX.StdCtrls,
  FMX.Types,
  Helper.FMX,
  System.Rtti,
  System.SysUtils;

type
  TEditFactory = class(TInterfacedObject, IAbstractFactory)
  public
    function New(var DTO: TDTO): TControl;
  end;

implementation

{ TEditFactory }

function TEditFactory.New(var DTO: TDTO): TControl;
var
  Caption: TLabel;
  Control: TEdit;
begin
  Caption            := TLabel.Create(DTO.Owner);
  Caption.Parent     := DTO.Parent;
  Caption.Text       := DTO.Control.Text;
  Caption.Position.X := DTO.X;
  Caption.Position.Y := DTO.Y;
  Caption.Width      := 400;

  DTO.Y := DTO.Y + Caption.Height + 5;

  { Edit }
  Control            := TEdit.Create(DTO.Owner);
  Control.Name       := Format('%s_%s', [DTO.Parent.Name, DTO.Ident.Name]).ToUpper;
  Control.Parent     := DTO.Parent;
  Control.Position.X := DTO.X;
  Control.Position.Y := DTO.Y;
  Control.Value      := DTO.Value;
  Control.TagObject  := DTO.Ident;
  Control.Width      := 400;
  Control.OnExit     := DTO.OnChange;

  DTO.Y := DTO.Y + Control.Height + 10;

  Result := Control;
end;

end.

