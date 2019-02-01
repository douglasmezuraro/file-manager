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
    FUndo: TCommandStack;
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
  FUndo.Push(Command);
end;

constructor TCommandInvoker.Create;
begin
  FUndo := TCommandStack.Create;
end;

destructor TCommandInvoker.Destroy;
begin
  FUndo.Free;
  inherited Destroy;
end;

procedure TCommandInvoker.Execute;
begin
  if not IsEmpty then
    FUndo.Pop.Execute;
end;

function TCommandInvoker.GetIsEmpty: Boolean;
begin
  Result := FUndo.Count = 0;
end;

end.

