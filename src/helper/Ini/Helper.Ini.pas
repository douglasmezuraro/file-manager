unit Helper.Ini;

interface

uses
  System.Classes, System.IniFiles, System.SysUtils;

type
  /// <summary>
  ///  Class helper for class <c>TIniFile<c>.
  /// </summary>
  TIniFileHelper = class Helper for TIniFile
  public
    /// <summary>
    ///  Write each value of parametter "AValues" in the section of file named as "ASection".
    /// </summary>
    /// <param name="ASection">
    /// </param>
    /// <param name="AValues">
    /// </param>
    procedure WriteSectionValues(const ASection: string; const AValues: TStrings);
  end;

implementation

procedure TIniFileHelper.WriteSectionValues(const ASection: string; const AValues: TStrings);
var
  SeparatorIndex: Word;
  Line, Key, Value: string;
begin
  EraseSection(ASection);
  for Line in AValues.ToStringArray do
  begin
    SeparatorIndex := Line.IndexOf('=');

    Key := Line.Substring(0, SeparatorIndex);
    Value := Line.Substring(Succ(SeparatorIndex));

    if not Key.Trim.IsEmpty then
    begin
      WriteString(ASection, Key, Value);
    end;
  end;
end;

end.

