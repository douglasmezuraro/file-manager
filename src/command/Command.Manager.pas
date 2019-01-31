unit Command.Manager;

interface

uses
  Command;

type
  TCommandManager = class
  public
    procedure Execute(const Command: TCommand);
  end;

implementation

{ TCommandManager }

procedure TCommandManager.Execute(const Command: TCommand);
begin

end;

end.
