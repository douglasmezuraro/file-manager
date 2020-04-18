unit Types.Utils.RegEx;

interface

type
  TRegEx = class
  public const
    GUID = '\{([0-9A-z]){8}(\-([0-9A-z]){4}){3}\-([0-9A-z]){12}\}';
    IP = '(([0-9]{1,3}.){3}[0-9]{1,3})|localhost\b';
  end;

implementation

end.

