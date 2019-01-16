unit Form.Main;

interface

uses
  FMX.ActnList,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  Ini.CustomIniFileHelper,
  Model.Config,
  System.Actions,
  System.Classes,
  System.IniFiles,
  System.UITypes,
  Util.Methods, FMX.Edit, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components;

type
  TMain = class(TForm)
    PanelButtons: TPanel;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    ActionList: TActionList;
    ActionSave: TAction;
    ActionCancel: TAction;
    TabControlWizard: TTabControl;
    TabItemServer: TTabItem;
    EditServerName: TEdit;
    LabelServerName: TLabel;
    EditServerGUID: TEdit;
    LabelServerGUID: TLabel;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

{$R *.fmx}

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  ViewToModel;
  ModalResult := mrOk;
end;

constructor TMain.Create(AOwner: TComponent);
begin
  inherited;
  FModel := TConfig.Create;
  FIniFile := TIniFile.Create(Util.Methods.TMethods.GetIniPath);
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  inherited;
end;

procedure TMain.FillComboBoxes;
begin
  Exit;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  FillComboBoxes;
  ModelToView;
end;

procedure TMain.ModelToView;
begin
  FIniFile.ReadObject(FModel);

  { Server }
  EditServerName.Text := FModel.Server.Name;
  EditServerGUID.Text := FModel.Server.GUID;
end;

procedure TMain.ViewToModel;
begin
  FIniFile.WriteObject(FModel);

  { Server }
  FModel.Server.Name := EditServerName.Text;
  FModel.Server.GUID := EditServerGUID.Text;
end;

end.
