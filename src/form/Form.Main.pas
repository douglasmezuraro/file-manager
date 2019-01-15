unit Form.Main;

interface

uses
  Helper.ComboBox,
  Ini.CustomIniFileHelper,
  Model.Config,
  System.Actions,
  System.Classes,
  System.IniFiles,
  System.SysUtils,
  Util.Constants,
  Util.Methods,
  Util.Types,
  Vcl.ActnList,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Mask,
  Vcl.StdCtrls;

type
  TMain = class(TForm)
    ActionExit: TAction;
    ActionList: TActionList;
    ActionSave: TAction;
    ButtonExit: TSpeedButton;
    ButtonSave: TSpeedButton;
    CheckBoxClientDisableMenuBackground: TCheckBox;
    CheckBoxLogRegisterMethodLog: TCheckBox;
    CheckBoxLogRegisterSignatureLog: TCheckBox;
    CheckBoxLogRegisterSQLLog: TCheckBox;
    CheckBoxServerCanBalance: TCheckBox;
    CheckBoxServerIntegrationManager: TCheckBox;
    ComboBoxDatabaseAccessType: TComboBox;
    ComboBoxServerConnectionType: TComboBox;
    ComboBoxDatabaseType: TComboBox;
    EditClientAutoLoginPassword: TLabeledEdit;
    EditClientAutoLoginUser: TLabeledEdit;
    EditClientTimeout: TLabeledEdit;
    EditDatabaseAlias: TLabeledEdit;
    EditDatabaseConnectionLogUpdateTime: TLabeledEdit;
    EditDatabaseDisconnectionTimeIdleConnection: TLabeledEdit;
    EditDatabaseFetchLines: TLabeledEdit;
    EditDatabaseMaxConnections: TLabeledEdit;
    EditDatabaseMinConnections: TLabeledEdit;
    EditDatabaseSchema: TLabeledEdit;
    EditDatabaseServer: TLabeledEdit;
    EditServerComputerName: TLabeledEdit;
    EditServerExeName: TLabeledEdit;
    EditServerGUID: TMaskEdit;
    EditServerIPAddress: TLabeledEdit;
    EditServerName: TLabeledEdit;
    EditServerTimeOut: TLabeledEdit;
    GroupBoxAutoLogin: TGroupBox;
    LabelAccessType: TLabel;
    LabelConnectionType: TLabel;
    LabelDatabaseType: TLabel;
    LabelGUID: TLabel;
    PageControlLayout: TPageControl;
    PanelButtons: TPanel;
    TabSheetClient: TTabSheet;
    TabSheetDatabase: TTabSheet;
    TabSheetDUnit: TTabSheet;
    TabSheetLog: TTabSheet;
    TabSheetMonitor: TTabSheet;
    TabSheetScanner: TTabSheet;
    TabSheetServer: TTabSheet;
    TabSheetSPP: TTabSheet;
    TabSheetUpdate: TTabSheet;
    TabSheetWorkflow: TTabSheet;
    procedure FormShow(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure EditServerIPAddressExit(Sender: TObject);
    procedure ComboBoxDatabaseTypeExit(Sender: TObject);
  private
    FModel: TConfig;
    FIniFile: TIniFile;
    procedure FillComboBoxes;
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

procedure TMain.ComboBoxDatabaseTypeExit(Sender: TObject);
begin
  EditDatabaseServer.Enabled := TDatabaseType((Sender as TComboBox).ItemIndex) <> dtOracle;
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

procedure TMain.EditServerIPAddressExit(Sender: TObject);
begin
  if not TMethods.ValidateIP((Sender as TLabeledEdit).Text) then
  begin
    ShowMessageFmt('O IP "%s" não é válido', [(Sender as TLabeledEdit).Text]);
    (Sender as TLabeledEdit).SetFocus;
  end;
end;

procedure TMain.FillComboBoxes;
begin
  ComboBoxServerConnectionType.Add(ConnectionTypeMap);
  ComboBoxDatabaseAccessType.Add(AccessTypeMap);
  ComboBoxDatabaseType.Add(DatabaseTypeMap);
end;

procedure TMain.FormShow(Sender: TObject);
begin
  PageControlLayout.ActivePage := TabSheetServer;
  FillComboBoxes;
  ModelToView;
end;

procedure TMain.ModelToView;

  procedure Server;
  begin
    EditServerName.Text                      := FModel.Server.Name;
    EditServerGUID.Text                      := FModel.Server.GUID;
    EditServerComputerName.Text              := FModel.Server.ComputerName;
    EditServerIPAddress.Text                 := FModel.Server.IPAddress;
    ComboBoxServerConnectionType.ItemIndex   := ComboBoxServerConnectionType.Items.IndexOf(FModel.Server.ConnectionType);
    CheckBoxServerCanBalance.Checked         := FModel.Server.CanBalance;
    EditServerExeName.Text                   := FModel.Server.ExeName;
    EditServerTimeOut.Text                   := FModel.Server.TimeOut.ToString;
    CheckBoxServerIntegrationManager.Checked := FModel.Server.IntegrationManager;
  end;

  procedure Database;
  begin
    EditDatabaseSchema.Text                  := FModel.Database.Schema;
    EditDatabaseMaxConnections.Text          := FModel.Database.MaxConnections.ToString;
    EditDatabaseMinConnections.Text          := FModel.Database.MinConnections.ToString;
    EditDatabaseDisconnectionTimeIdleConnection.Text := FModel.Database.DisconnectionTimeIdleConnection.ToString;
    EditDatabaseConnectionLogUpdateTime.Text := FModel.Database.ConnectionLogUpdateTime.ToString;
    EditDatabaseFetchLines.Text              := FModel.Database.FetchLines.ToString;
    ComboBoxDatabaseAccessType.ItemIndex     := ComboBoxDatabaseAccessType.Items.IndexOf(FModel.Database.AccessType);
    ComboBoxDatabaseType.ItemIndex           := ComboBoxDatabaseType.Items.IndexOf(FModel.Database.DatabaseType);
    EditDatabaseAlias.Text                   := FModel.Database.Alias;
    EditDatabaseServer.Text                  := FModel.Database.Server;
  end;

  procedure Client;
  var
    AutoLogin: array[TAutoLogin] of string;
  begin
    TMethods.Assign<string>(AutoLogin, FModel.Client.AutoLogin.Split([',']));
    EditClientAutoLoginUser.Text                := AutoLogin[alUser];
    EditClientAutoLoginPassword.Text            := AutoLogin[alPassword];
    EditClientTimeout.Text                      := FModel.Client.TimeOut.ToString;
    CheckBoxClientDisableMenuBackground.Checked := FModel.Client.DisableMenuBackground;
  end;

  procedure Log;
  begin
    CheckBoxLogRegisterMethodLog.Checked    := FModel.Log.RegisterMethodLog;
    CheckBoxLogRegisterSQLLog.Checked       := FModel.Log.RegisterSQLLog;
    CheckBoxLogRegisterSignatureLog.Checked := FModel.Log.RegisterSignatureLog;
  end;

begin
  FIniFile.ReadObject(FModel);
  Server;
  Database;
  Client;
  Log;
end;

procedure TMain.ViewToModel;

  procedure Server;
  begin
    FModel.Server.Name               := EditServerName.Text;
    FModel.Server.GUID               := EditServerGUID.Text;
    FModel.Server.ComputerName       := EditServerComputerName.Text;
    FModel.Server.IPAddress          := EditServerIPAddress.Text;
    FModel.Server.ConnectionType     := ComboBoxServerConnectionType.Text;
    FModel.Server.CanBalance         := CheckBoxServerCanBalance.Checked;
    FModel.Server.ExeName            := EditServerExeName.Text;
    FModel.Server.TimeOut            := StrToInt(EditServerTimeOut.Text);
    FModel.Server.IntegrationManager := CheckBoxServerIntegrationManager.Checked;
  end;

  procedure Database;
  begin
    FModel.Database.Schema         := EditDatabaseSchema.Text;
    FModel.Database.MaxConnections := StrToInt(EditDatabaseMaxConnections.Text);
    FModel.Database.MinConnections := StrToInt(EditDatabaseMinConnections.Text);
    FModel.Database.DisconnectionTimeIdleConnection := StrToInt(EditDatabaseDisconnectionTimeIdleConnection.Text);
    FModel.Database.ConnectionLogUpdateTime := StrToInt(EditDatabaseConnectionLogUpdateTime.Text);
    FModel.Database.FetchLines     := StrToInt(EditDatabaseFetchLines.Text);
    FModel.Database.AccessType     := ComboBoxDatabaseAccessType.Text;
    FModel.Database.DatabaseType   := ComboBoxDatabaseType.Text;
    FModel.Database.Alias          := EditDatabaseAlias.Text;
    FModel.Database.Server         := EditDatabaseServer.Text;
  end;

  procedure Client;
  var
    AutoLogin: array[TAutoLogin] of string;
  begin
    AutoLogin[alUser]                   := EditClientAutoLoginUser.Text;
    AutoLogin[alPassword]               := EditClientAutoLoginPassword.Text;
    FModel.Client.AutoLogin             := string.Join(',', AutoLogin);
    FModel.Client.TimeOut               := StrToInt(EditClientTimeout.Text);
    FModel.Client.DisableMenuBackground := CheckBoxClientDisableMenuBackground.Checked;
  end;

  procedure Log;
  begin
    FModel.Log.RegisterMethodLog    := CheckBoxLogRegisterMethodLog.Checked;
    FModel.Log.RegisterSQLLog       := CheckBoxLogRegisterSQLLog.Checked;
    FModel.Log.RegisterSignatureLog := CheckBoxLogRegisterSignatureLog.Checked;
  end;

begin
  Server;
  Database;
  Client;
  Log;
  FIniFile.WriteObject(FModel);
end;

end.

