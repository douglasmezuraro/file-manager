unit Helper.FMX.Hyperlink;

interface

uses
  FMX.StdCtrls, System.UITypes;

type
  THyperlinkHelper = class Helper for TLabel
  public type
    TLabelStyle = (lsNone, lsHyperLink);
  public
    procedure SetStyle(const Style: TLabelStyle);
  end;

implementation

procedure THyperlinkHelper.SetStyle(const Style: TLabelStyle);
begin
  case Style of
    TLabelStyle.lsNone:
      begin
        FontColor := TAlphaColorRec.Black;
        Font.Style := Font.Style - [TFontStyle.fsUnderline];
        Cursor := crDefault;
      end;
    TLabelStyle.lsHyperLink:
      begin
        FontColor := TAlphaColorRec.Blue;
        Font.Style := Font.Style + [TFontStyle.fsUnderline];
        Cursor := crHandPoint;
      end;
  end;
end;

end.
