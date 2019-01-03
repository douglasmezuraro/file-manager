unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    PageControlLayout: TPageControl;
    TabSheetServer: TTabSheet;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
