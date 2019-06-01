unit Template.ComboBox;

interface

uses
  Attribute.Control,
  FMX.Controls,
  FMX.ListBox,
  FMX.Types,
  Helper.FMX,
  Helper.Rtti,
  Template.AbstractClass,
  Types.DTO,
  Types.Utils;

type
  TComboBoxTemplate = class(TLabeledTemplate)
  public
    function CreateControl: IControl; override;
  end;

implementation

{ TComboBoxTemplate }

function TComboBoxTemplate.CreateControl: IControl;
var
  ComboBox: TComboBox;
begin
  inherited;

  ComboBox                 := TComboBox.Create(FDTO.Owner);
  ComboBox.Hint            := GetHint;
  ComboBox.Items.CommaText := FDTO.Prop.GetAtribute<ComboBoxAttribute>().Items;
  ComboBox.OnChange        := FDTO.OnNotify;
  ComboBox.Parent          := FDTO.Parent.GetObject;
  ComboBox.Position.X      := FDTO.Position.X;
  ComboBox.Position.Y      := FDTO.Position.Y;
  ComboBox.ShowHint        := True;
  ComboBox.Value           := GetValue;
  ComboBox.Width           := GetWidth;

  Offset(ComboBox.Height + TUtils.Constants.DefaultSpacing);

  Result := ComboBox;
end;

end.

