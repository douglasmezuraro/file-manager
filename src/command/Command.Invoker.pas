unit Command.Invoker;

interface

uses
  Command.API,
  System.Generics.Collections;

type
  TCommandInvoker = class
  private type
    TCommandStack = TStack<ICommand>;
  private
    FUndoStack: TCommandStack;
    function GetIsEmpty: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Command: ICommand);
    procedure Execute;
    property IsEmpty: Boolean read GetIsEmpty;
  end;

implementation

{ TCommandInvoker }

procedure TCommandInvoker.Add(const Command: ICommand);
begin
  FUndoStack.Push(Command);
end;

constructor TCommandInvoker.Create;
begin
  FUndoStack := TCommandStack.Create;
end;

destructor TCommandInvoker.Destroy;
begin
  FUndoStack.Free;
  inherited Destroy;
end;

procedure TCommandInvoker.Execute;
begin
  if not IsEmpty then
    FUndoStack.Pop.Execute;
end;

function TCommandInvoker.GetIsEmpty: Boolean;
begin
  Result := FUndoStack.Count = 0;
end;

end.

