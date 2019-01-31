unit Command.Manager;

interface

uses
  Command.API,
  System.Generics.Collections;

type
  TCommandManager = class
  private type
    TCommandStack = TStack<ICommand>;
  private
    FUndo: TCommandStack;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Command: ICommand);
    procedure Execute;
  end;

implementation

{ TCommandManager }

procedure TCommandManager.Add(const Command: ICommand);
begin
  FUndo.Push(Command);
end;

constructor TCommandManager.Create;
begin
  FUndo := TCommandStack.Create;
end;

destructor TCommandManager.Destroy;
begin
  FUndo.Free;
  inherited Destroy;
end;

procedure TCommandManager.Execute;
begin
  if FUndo.Count = 0 then
    Exit;

  FUndo.Pop.Execute;
end;

end.

