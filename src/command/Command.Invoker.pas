unit Command.Invoker;

interface

uses
  Command.API,
  System.Generics.Collections;

type
  TCommandInvoker = class
  private
    FStack: TStack<ICommand>;
    function GetIsEmpty: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Command: ICommand);
    procedure Clear;
    procedure Execute;
    property IsEmpty: Boolean read GetIsEmpty;
  end;

implementation

{ TCommandInvoker }

procedure TCommandInvoker.Add(const Command: ICommand);
begin
  FStack.Push(Command);
end;

procedure TCommandInvoker.Clear;
begin
  FStack.Clear;
end;

constructor TCommandInvoker.Create;
begin
  FStack := TStack<ICommand>.Create;
end;

destructor TCommandInvoker.Destroy;
begin
  FStack.Free;
  inherited Destroy;
end;

procedure TCommandInvoker.Execute;
begin
  if not IsEmpty then
    FStack.Pop.Execute;
end;

function TCommandInvoker.GetIsEmpty: Boolean;
begin
  Result := FStack.Count = 0;
end;

end.

