unit Types.Utils.Dialogs;

interface

uses
  FMX.Dialogs,
  FMX.DialogService,
  System.SysUtils,
  System.UITypes;

type
  TDialogs = class abstract
  private
    const UndefinedHelpCtx = 0;
  public
    { Confirmation }
    class function Confirmation(const Message: string): Boolean; overload; static;
    class function Confirmation(const Message: string; const Args: array of const): Boolean; overload; static;
    { Information }
    class procedure Information(const Message: string); overload; static;
    class procedure Information(const Message: string; const Args: array of const); overload; static;
    { Warning }
    class procedure Warning(const Message: string); overload; static;
    class procedure Warning(const Message: string; const Args: array of const); overload; static;
  end;

implementation

{ TDialogs }

class function TDialogs.Confirmation(const Message: string): Boolean;
var
  LResult: Boolean;
begin
  TDialogService.MessageDialog(
    Message,
    TMsgDlgType.mtConfirmation,
    FMX.Dialogs.mbYesNo,
    TMsgDlgBtn.mbNo,
    UndefinedHelpCtx,
    procedure(const AResult: TModalResult)
    begin
      LResult := AResult in [mrYes, mrYesToAll];
    end);

  Result := LResult;
end;

class function TDialogs.Confirmation(const Message: string; const Args: array of const): Boolean;
begin
  Result := Confirmation(Format(Message, Args));
end;

class procedure TDialogs.Information(const Message: string);
begin
  TDialogService.MessageDialog(
    Message,
    TMsgDlgType.mtInformation,
    [TMsgDlgBtn.mbOK],
    TMsgDlgBtn.mbOK,
    UndefinedHelpCtx,
    nil);
end;

class procedure TDialogs.Information(const Message: string; const Args: array of const);
begin
  Information(Format(Message, Args));
end;

class procedure TDialogs.Warning(const Message: string);
begin
  TDialogService.MessageDialog(
    Message,
    TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbOK],
    TMsgDlgBtn.mbOK,
    UndefinedHelpCtx,
    nil);
end;

class procedure TDialogs.Warning(const Message: string; const Args: array of const);
begin
  Warning(Format(Message, Args));
end;

end.

