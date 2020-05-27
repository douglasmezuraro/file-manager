unit Command.API;

interface

type
  ICommand = interface
  ['{DE47C8D8-2D90-4750-B863-72E939E00D17}']

    /// <summary>
    ///  Executes the command
    /// </summary>
    procedure Execute;
  end;

  ICommandInvoker = interface(IInterface)
  ['{C90D4CF3-0A45-44BD-B513-D9ACE13CD666}']

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

end.

