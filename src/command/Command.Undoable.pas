unit Command.Undoable;

interface

uses
  Command.API,
  Command.Receiver,
  Helper.FMX;

type
  TUndoableCommand = class(TInterfacedObject, ICommand)
  private
    FReceiver: TReceiver;
  public
    constructor Create(const Receiver: TReceiver);
    procedure Execute;
  end;

implementation

{ TUndoableCommand }

constructor TUndoableCommand.Create(const Receiver: TReceiver);
begin
  FReceiver := Receiver;
end;

procedure TUndoableCommand.Execute;
begin
  FReceiver.Key.Value := FReceiver.Value;
  FReceiver.Key.SetFocus;
end;

end.

