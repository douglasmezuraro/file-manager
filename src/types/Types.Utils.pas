unit Types.Utils;

interface

uses
  System.SysUtils, Winapi.UrlMon;

type
  /// <summary>
  ///  Class with useful methods.
  /// </summary>
  TUtils = class sealed
  public
    /// <summary>
    ///  Opens the URL in the default browswer.
    /// </summary>
    /// <param name="AURL">
    /// </param>
    /// <remarks>
    ///  When the URL is empty the method does nothing.
    /// </remarks>
    class procedure OpenURL(const AURL: string); static;

    /// <summary>
    ///  Defines the boolean strings.
    /// </summary>
    /// <param name="AFalseBoolStr">
    /// </param>
    /// <param name="ATrueBoolStr">
    /// </param>
    class procedure DefineBoolStrs(const AFalseBoolStr, ATrueBoolStr: string); static;
  end;

implementation

class procedure TUtils.DefineBoolStrs(const AFalseBoolStr, ATrueBoolStr: string);
begin
  SetLength(FalseBoolStrs, Length(FalseBoolStrs) + 1);
  FalseBoolStrs[Low(FalseBoolStrs)] := AFalseBoolStr;
  FalseBoolStrs[High(FalseBoolStrs)] := DefaultFalseBoolStr;

  SetLength(TrueBoolStrs, Length(TrueBoolStrs) + 1);
  TrueBoolStrs[Low(TrueBoolStrs)] := ATrueBoolStr;
  TrueBoolStrs[High(TrueBoolStrs)] := DefaultTrueBoolStr;
end;

class procedure TUtils.OpenURL(const AURL: string);
begin
  if not AURL.Trim.IsEmpty then
  begin
    HLinkNavigateString(nil, PWideChar(AURL));
  end;
end;

end.

