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
  Model.Config, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TMain = class(TForm)
    PageControlLayout: TPageControl;
    TabSheetServer: TTabSheet;
    TabSheetDatabase: TTabSheet;
    TabSheetClient: TTabSheet;
    TabSheetLog: TTabSheet;
    TabSheetMonitor: TTabSheet;
    TabSheetUpdate: TTabSheet;
    TabSheetSPP: TTabSheet;
    TabSheetDUnit: TTabSheet;
    TabSheetScanner: TTabSheet;
    TabSheetWorkflow: TTabSheet;
    PanelButtons: TPanel;
    ButtonSave: TSpeedButton;
    ButtonExit: TSpeedButton;
    ActionList: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    procedure FormShow(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
  private
    FModel: TConfig;
    procedure ViewToModel;
    procedure ModelToView;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

procedure TMain.ActionExitExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  ViewToModel;
  Exit; //TODO
end;

constructor TMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FModel := TConfig.Create;
end;

destructor TMain.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  PageControlLayout.ActivePage := TabSheetServer;
  ModelToView;
end;

procedure TMain.ModelToView;
begin
  Exit; //TODO
end;

procedure TMain.ViewToModel;
begin
  Exit; //TODO
end;

end.

