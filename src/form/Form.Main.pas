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
    CheckBoxCanBalance: TCheckBox;
    CheckBoxIntegrationManager: TCheckBox;
    ComboBoxAccessType: TComboBox;
    ComboBoxConnectionType: TComboBox;
    ComboBoxDatabaseType: TComboBox;
    EditDatabaseAlias: TLabeledEdit;
    EditDatabaseConnectionLogUpdateTime: TLabeledEdit;
    EditDatabaseDisconnectionTimeIdleConnection: TLabeledEdit;
    EditDatabaseFetchLines: TLabeledEdit;
    EditDatabaseMaxConnections: TLabeledEdit;
    EditDatabaseMinConnections: TLabeledEdit;
    EditDatabaseSchema: TLabeledEdit;
    EditDatabaseServer: TLabeledEdit;
    EditIPAddress: TLabeledEdit;
    EditServerComputerName: TLabeledEdit;
    EditServerExeName: TLabeledEdit;
    EditServerGUID: TMaskEdit;
    EditServerName: TLabeledEdit;
    EditServerTimeOut: TLabeledEdit;
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
    procedure EditIPAddressExit(Sender: TObject);
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

procedure TMain.EditIPAddressExit(Sender: TObject);
begin
  if not TMethods.ValidateIP((Sender as TLabeledEdit).Text) then
  begin
    ShowMessageFmt('O IP "%s" não é válido', [(Sender as TLabeledEdit).Text]);
    (Sender as TLabeledEdit).SetFocus;
  end;
end;

procedure TMain.Foo;
begin
  ComboBoxConnectionType.Add(ConnectionTypeMap);
  ComboBoxAccessType.Add(AccessTypeMap);
  ComboBoxDatabaseType.Add(DatabaseTypeMap);
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

  procedure Database;
  begin
    EditDatabaseSchema.Text         := FModel.Database.Schema;
    EditDatabaseMaxConnections.Text := FModel.Database.MaxConnections.ToString;
    EditDatabaseMinConnections.Text := FModel.Database.MinConnections.ToString;
    EditDatabaseDisconnectionTimeIdleConnection.Text := FModel.Database.DisconnectionTimeIdleConnection.ToString;
    EditDatabaseConnectionLogUpdateTime.Text := FModel.Database.ConnectionLogUpdateTime.ToString;
    EditDatabaseFetchLines.Text     := FModel.Database.FetchLines.ToString;
    ComboBoxAccessType.ItemIndex    := ComboBoxAccessType.Items.IndexOf(FModel.Database.AccessType);
    ComboBoxDatabaseType.ItemIndex  := ComboBoxDatabaseType.Items.IndexOf(FModel.Database.DatabaseType);
    EditDatabaseAlias.Text          := FModel.Database.Alias;
    EditDatabaseServer.Text         := FModel.Database.Server;
  end;

begin
  FIniFile.Read(FModel);
  Server;
  Database;
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

  procedure Database;
  begin
    FModel.Database.Schema         := EditDatabaseSchema.Text;
    FModel.Database.MaxConnections := StrToInt(EditDatabaseMaxConnections.Text);
    FModel.Database.MinConnections := StrToInt(EditDatabaseMinConnections.Text);
    FModel.Database.DisconnectionTimeIdleConnection := StrToInt(EditDatabaseDisconnectionTimeIdleConnection.Text);
    FModel.Database.ConnectionLogUpdateTime := StrToInt(EditDatabaseConnectionLogUpdateTime.Text);
    FModel.Database.FetchLines     := StrToInt(EditDatabaseFetchLines.Text);
    FModel.Database.AccessType     := ComboBoxAccessType.Text;
    FModel.Database.DatabaseType   := ComboBoxDatabaseType.Text;
    FModel.Database.Alias          := EditDatabaseAlias.Text;
    FModel.Database.Server         := EditDatabaseServer.Text;
  end;

begin
  Server;
  Database;
  FIniFile.Write(FModel);
end;

end.

