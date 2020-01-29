unit Helper.Ini;

interface

uses
  System.Classes, System.IniFiles, System.SysUtils;

type
  TIniFileHelper = class Helper for TIniFile
  public
    procedure WriteSectionValues(const Section: string; const Values: TStrings);
  end;

implementation

procedure TIniFileHelper.WriteSectionValues(const Section: string; const Values: TStrings);
var
  SeparatorIndex: Word;
  Line, Key, Value: string;
begin
  EraseSection(Section);
  for Line in Values.ToStringArray do
  begin
    SeparatorIndex := Line.IndexOf('=');

    Key := Line.Substring(0, SeparatorIndex);
    Value := Line.Substring(Succ(SeparatorIndex));

    if not Key.Trim.IsEmpty then
      WriteString(Section, Key, Value);
  end;
end;

end.

