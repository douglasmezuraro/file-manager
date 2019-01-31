unit Command;

interface

type
  TCommand = class abstract
  public
    procedure Execute; virtual; abstract;
  end;

implementation

end.
