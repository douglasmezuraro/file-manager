unit Form.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Util.Constants,
  System.IniFiles,
  Ini.CustomIniFileHelper,
  Model.Config;

type
  TMain = class(TForm)
    PageControlLayout: TPageControl;
    TabSheetServer: TTabSheet;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TMain.Button1Click(Sender: TObject);
var
  Ini: TIniFile;
  Dir: string;
  Obj: TConfig;
begin
  Dir := ExtractFilePath(Application.ExeName) + IniFileName;
  Ini := TIniFile.Create(Dir);
  Obj := TConfig.Create;
  try
    Ini.Read(Obj);
  finally
    Obj.Free;
    Ini.Free;
  end;
end;

end.

