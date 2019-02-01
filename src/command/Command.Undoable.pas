unit Command.Undoable;

interface

uses
  Command.API,
  FMX.Controls,
  Helper.FMX,
  System.Rtti;

type
  TUndoableCommand = class(TInterfacedObject, ICommand)
  private
    FControl: TControl;
    FValue: TValue;
  public
    constructor Create(const Control: TControl);
    procedure Execute;
  end;

implementation

{ TUndoableCommand }

constructor TUndoableCommand.Create(const Control: TControl);
begin
  FControl := Control;
  FValue := Control.OldValue;
end;

procedure TUndoableCommand.Execute;
begin
  FControl.Value := FValue;
end;

end.
