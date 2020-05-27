unit Command.Undoable;

interface

uses
  FMX.Types, Command.API, Command.Receiver, Helper.FMX.FMXObject;

type
  TUndoableCommand = class sealed(TInterfacedObject, ICommand)
  private
    FReceiver: TReceiver;
  public
    /// <summary>
    ///  Constructor of class
    /// </summary>
    /// <param name="AReceiver">
    /// </param>
    constructor Create(const AReceiver: TReceiver);

    /// <summary>
    ///  Executes the command
    /// </summary>
    procedure Execute;
  end;

implementation

constructor TUndoableCommand.Create(const AReceiver: TReceiver);
begin
  FReceiver := AReceiver;
end;

procedure TUndoableCommand.Execute;
begin
  FReceiver.Key.GetObject.Value := FReceiver.Value;
  if FReceiver.Key.GetCanFocus then
    FReceiver.Key.SetFocus;
end;

end.

