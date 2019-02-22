unit Form.Main;

interface

uses
  Command.Invoker,
  Command.Receiver,
  Command.Undoable,
  FactoryMethod.ControlTemplate,
  FMX.ActnList,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,
  Helper.FMX,
  Helper.Ini,
  Helper.Rtti,
  Model.Config,
  System.Actions,
  System.Classes,
  System.Generics.Collections,
  System.IniFiles,
  System.Rtti,
  System.SysUtils,
  System.UITypes,
  Template.AbstractClass,
  Template.TabItem,
  Util.Methods,
  Util.Types, FMX.Layouts;

type
  TMain = class(TForm)
    PanelButtons: TPanel;
    ButtonCancel: TButton;
    ButtonSave: TButton;
    ActionList: TActionList;
    ActionSave: TAction;
    ActionCancel: TAction;
    LayoutSpace: TLayout;
    TabControlWizard: TTabControl;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    FBinding: TBinding;
    FModel: TConfig;
    FIniFile: TIniFile;
    FInvoker: TCommandInvoker;

    { ModelToView }
    procedure ModelToView(const Obj: TObject; const Parent: IControl);

    { Utils }
    function SaveChanges: Boolean;
    procedure Notify(Sender: TObject);
    procedure ExecuteWithDisabledControls(const Proc: TProc);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.fmx}

constructor TMain.Create(AOwner: TComponent);
begin
  inherited;
  FModel := TConfig.Create;
  FIniFile := TIniFile.Create(TUtils.Methods.IniPath);
  FInvoker := TCommandInvoker.Create;
  FBinding := TBinding.Create;
end;

destructor TMain.Destroy;
begin
  FIniFile.Free;
  FModel.Free;
  FInvoker.Free;
  FBinding.Free;
  inherited;
end;

procedure TMain.ExecuteWithDisabledControls(const Proc: TProc);
var
  Control: IControl;
begin
  for Control in FBinding.Keys do
    (Control as TControl).OnExit := nil;

  Proc;

  for Control in FBinding.Keys do
     (Control as TControl).OnExit := Notify;
end;

procedure TMain.ActionCancelExecute(Sender: TObject);
begin
  if SaveChanges then
    ActionSave.Execute;
  Close;
end;

procedure TMain.ActionSaveExecute(Sender: TObject);
begin
  FIniFile.WriteObject(FModel);
  Close;
end;

procedure TMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vkZ) then
  begin
    ExecuteWithDisabledControls(FInvoker.Execute);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  Self.Caption := FIniFile.FileName;
  FIniFile.ReadObject(FModel);
  ModelToView(FModel, TabControlWizard);
end;

procedure TMain.ModelToView(const Obj: TObject; const Parent: IControl);
var
  Context: TRttiContext;
  Control: IControl;
  DTO: TControlDTO;
  Prop: TRttiProperty;
  Template: TControlTemplate;
begin
  Context := TRttiContext.Create;
  try
    DTO := TControlDTO.Create(10, 10);
    for Prop in Context.GetType(Obj.ClassType).GetProperties do
    begin
      DTO.Model    := Obj;
      DTO.OnNotify := Notify;
      DTO.Owner    := Self;
      DTO.Parent   := Parent;
      DTO.Prop     := Prop;

      Template := TControlTemplateFactory.Fabricate(Prop);
      try
        Template.DTO := DTO;
        Control := Template.Fabricate;
        DTO := Template.DTO;
      finally
        Template.Free;
      end;

      FBinding.Add(Obj, Prop, Control);

      if Template is TTabItemTemplate then
        ModelToView(Prop.GetValue(Obj).AsObject, Control);
    end;
  finally
    Context.Free;
  end;
end;

procedure TMain.Notify(Sender: TObject);
var
  Control: TControl;
  Receiver: TReceiver;
  OldValue: TValue;
begin
  Control := Sender as TControl;

  OldValue := FBinding.Values[Control];

  if Control.Value.Equals(OldValue) then
    Exit;

  Receiver := TReceiver.Create(Control, OldValue);
  FInvoker.Add(TUndoableCommand.Create(Receiver));
  FBinding.Values[Control] := Control.Value;
end;

function TMain.SaveChanges: Boolean;
begin
  Result := False;
end;

end.

