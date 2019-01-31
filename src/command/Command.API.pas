unit Command.API;

interface

uses
  System.Rtti;

type
  ICommand = interface
  ['{DE47C8D8-2D90-4750-B863-72E939E00D17}']
    procedure Execute;
    function GetValue: TValue;
    property Value: TValue read GetValue;
  end;

implementation

end.
