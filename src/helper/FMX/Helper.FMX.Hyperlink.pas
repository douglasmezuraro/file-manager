unit Helper.FMX.Hyperlink;

interface

uses
  FMX.StdCtrls, System.UITypes;

type
  /// <summary>
  ///  Styles of label.
  /// </summary>
  TLabelStyle = (None, HyperLink);

  /// <summary>
  ///  Class helper for class <c>TLabel<c>.
  /// </summary>
  THyperlinkHelper = class Helper for TLabel
  private
    procedure SetStyle(const Value: TLabelStyle);
  public
    /// <summary>
    ///  Defines the style of label.
    /// </summary>
    /// <value>
    ///  TLabelStyle
    /// </value>
    property Style: TLabelStyle write SetStyle;
  end;

implementation

procedure THyperlinkHelper.SetStyle(const Value: TLabelStyle);
begin
  case Value of
    TLabelStyle.None:
      begin
        FontColor := TAlphaColorRec.Black;
        Font.Style := Font.Style - [TFontStyle.fsUnderline];
        Cursor := crDefault;
      end;
    TLabelStyle.HyperLink:
      begin
        FontColor := TAlphaColorRec.Blue;
        Font.Style := Font.Style + [TFontStyle.fsUnderline];
        Cursor := crHandPoint;
      end;
  end;
end;

end.

