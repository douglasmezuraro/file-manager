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
  Helper.Value,
  System.Rtti,
  System.Types;

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
  Edit: TEdit;
begin
  Caption            := TLabel.Create(DTO.Owner);
  Caption.Parent     := DTO.Parent;
  Caption.Text       := DTO.Caption.Text;
  Caption.Position.X := DTO.X;
  Caption.Position.Y := DTO.Y;
  Caption.Width      := 400;

  DTO.Y := DTO.Y + Caption.Height + 5;

  { Edit }
  Edit            := TEdit.Create(DTO.Owner);
  Edit.Parent     := DTO.Parent;
  Edit.Position.X := DTO.X;
  Edit.Position.Y := DTO.Y;
  Edit.Data       := DTO.Value;
  Edit.TagString  := DTO.Ident.Name;
  Edit.Width      := 400;

  DTO.Y := DTO.Y + Edit.Height + 10;

  Result := Edit;
end;

end.

