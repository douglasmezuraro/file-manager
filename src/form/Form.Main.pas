unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PageControlLayout: TPageControl;
    TabSheetServer: TTabSheet;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.IniFiles;

procedure TForm1.Button1Click(Sender: TObject);
var
  INI: TIniFile;
begin
  INI.ReadString();
  INI.ReadInteger();
  INI.ReadBool();
  INI.ReadBinaryStream();
  INI.ReadDate();
  INI.ReadDateTime();
  INI.ReadFloat();
  INI.ReadTime();
end;

end.
