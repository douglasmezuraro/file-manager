unit Command.Invoker;

interface

uses
  Command.API, System.Generics.Collections;

type
  TCommandInvoker = class sealed(TInterfacedObject, ICommandInvoker)
  private
    FStack: TStack<ICommand>;
  public
    /// <summary>
    ///  Constructor of class
    /// </summary>
    constructor Create;

    /// <summary>
    ///  Destructor of class
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    ///  Add the command in the top of command stack
    /// </summary>
    /// <param name="ACommand">
    /// </param>
    procedure Add(const ACommand: ICommand);

    /// <summary>
    ///  Clean the stack command
    /// </summary>
    /// <remarks>
    ///  If the stack is empty the method does nothing
    /// </remarks>
    procedure Clear;

    /// <summary>
    ///  Executes the command in the top of the stack
    /// </summary>
    /// <remarks>
    ///  If the stack is empty the method does nothing, it pops it or the top command
    /// </remarks>
    procedure Execute;

    /// <summary>
    ///  returns if the command stack is empty
    /// </summary>
    /// <returns>
    ///  True when the stack is empty, false otherwise
    /// </returns>
    function IsEmpty: Boolean;
  end;

implementation

procedure TCommandInvoker.Add(const ACommand: ICommand);
begin
  FStack.Push(ACommand);
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

function TCommandInvoker.IsEmpty: Boolean;
begin
  Result := FStack.Count = 0;
end;

end.

