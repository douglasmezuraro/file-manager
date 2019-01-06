unit Form.Main;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ComCtrls,
  Model.Config,
  Ini.CustomIniFileHelper,
  Vcl.ExtCtrls,
  System.Actions,
  System.IniFiles,
  Vcl.ActnList,
  Util.Methods,
  Util.Constants,
  Helper.ComboBox,
  System.SysUtils,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.Samples.Spin;

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
    EditServerName: TLabeledEdit;
    EditServerGUID: TMaskEdit;
    LabelGUID: TLabel;
    EditServerComputerName: TLabeledEdit;
    EditIPAddress: TLabeledEdit;
    ComboBoxConnectionType: TComboBox;
    CheckBoxCanBalance: TCheckBox;
    LabelConnectionType: TLabel;
    EditServerExeName: TLabeledEdit;
    EditServerTimeOut: TLabeledEdit;
    CheckBoxIntegrationManager: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
  private
    FModel: TConfig;
    FIniFile: TIniFile;
    procedure Foo;
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
  ActionExit.Execute;
end;

constructor TMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FModel := TConfig.Create;
  FIniFile := TIniFile.Create(TMethods.GetIniPath(Application.ExeName));
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  inherited;
end;

procedure TMain.Foo;
begin
  ComboBoxConnectionType.Add(ConnectionTypeMap);
end;

procedure TMain.FormShow(Sender: TObject);
begin
  PageControlLayout.ActivePage := TabSheetServer;
  Foo;
  ModelToView;
end;

procedure TMain.ModelToView;

  procedure Server;
  begin
    EditServerName.Text                := FModel.Server.Name;
    EditServerGUID.Text                := FModel.Server.GUID;
    EditServerComputerName.Text        := FModel.Server.ComputerName;
    EditIPAddress.Text                 := FModel.Server.IPAddress;
    ComboBoxConnectionType.ItemIndex   := ComboBoxConnectionType.Items.IndexOf(FModel.Server.ConnectionType);
    CheckBoxCanBalance.Checked         := FModel.Server.CanBalance;
    EditServerExeName.Text             := FModel.Server.ExeName;
    EditServerTimeOut.Text             := FModel.Server.TimeOut.ToString;
    CheckBoxIntegrationManager.Checked := FModel.Server.IntegrationManager;
  end;

begin
  FIniFile.Read(FModel);
  Server;
end;

procedure TMain.ViewToModel;

  procedure Server;
  begin
    FModel.Server.Name               := EditServerName.Text;
    FModel.Server.GUID               := EditServerGUID.Text;
    FModel.Server.ComputerName       := EditServerComputerName.Text;
    FModel.Server.IPAddress          := EditIPAddress.Text;
    FModel.Server.ConnectionType     := ComboBoxConnectionType.Text;
    FModel.Server.CanBalance         := CheckBoxCanBalance.Checked;
    FModel.Server.ExeName            := EditServerExeName.Text;
    FModel.Server.TimeOut            := StrToInt(EditServerTimeOut.Text);
    FModel.Server.IntegrationManager := CheckBoxIntegrationManager.Checked;
  end;

begin
  Server;
  FIniFile.Write(FModel);
end;

end.

