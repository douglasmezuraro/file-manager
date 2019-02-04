unit Util.Types;

interface

uses
  FMX.Types,
  System.Generics.Collections,
  System.Rtti;

type
  TPropertyBinding = TPair<TObject, TRttiProperty>;
  TControlBinding = TDictionary<IControl, TPropertyBinding>;

implementation

end.
