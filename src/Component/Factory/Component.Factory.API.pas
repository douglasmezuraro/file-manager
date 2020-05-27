unit Component.Factory.API;

interface

uses
  FMX.Types;

type
  /// <summary>
  ///  Interface that component factory classes must implement.
  /// </summary>
  IComponentFactory = interface(IInterface)
  ['{E98A0204-B36C-45A1-BED7-E6C157E015E0}']

    /// <summary>
    ///  Returns a new instance of a component.
    /// </summary>
    /// <returns>
    ///  IControl
    /// </returns>
    function New: IControl;
  end;

implementation

end.

