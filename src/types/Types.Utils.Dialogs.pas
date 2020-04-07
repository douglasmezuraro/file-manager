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
    const HelpCtx = 0;
  public
    {$REGION 'Confirmation'}
    class function Confirmation(const Message: string): Boolean; overload; static;
    class function Confirmation(const Message: string; const Args: array of const): Boolean; overload; static;
    {$ENDREGION}
    {$REGION 'Error'}
    class procedure Error(const Message: string); overload; static;
    class procedure Error(const Message: string; const Args: array of const); overload; static;
    {$ENDREGION}
    {$REGION 'Information'}
    class procedure Information(const Message: string); overload; static;
    class procedure Information(const Message: string; const Args: array of const); overload; static;
    {$ENDREGION}
    {$REGION 'Warning'}
    class procedure Warning(const Message: string); overload; static;
    class procedure Warning(const Message: string; const Args: array of const); overload; static;
    {$ENDREGION}
  end;

implementation

class function TDialogs.Confirmation(const Message: string; const Args: array of const): Boolean;
begin
  Result := Confirmation(Format(Message, Args));
end;

class function TDialogs.Confirmation(const Message: string): Boolean;
var
  LResult: Boolean;
begin
  TDialogService.MessageDialog(Message, TMsgDlgType.mtConfirmation, FMX.Dialogs.mbYesNo, TMsgDlgBtn.mbNo, HelpCtx,
    procedure(const AResult: TModalResult)
    begin
      LResult := IsPositiveResult(AResult);
    end);

  Result := LResult;
end;

class procedure TDialogs.Error(const Message: string; const Args: array of const);
begin
  Error(Format(Message, Args));
end;

class procedure TDialogs.Error(const Message: string);
begin
  TDialogService.MessageDialog(Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, HelpCtx, nil);
end;

class procedure TDialogs.Information(const Message: string; const Args: array of const);
begin
  Information(Format(Message, Args));
end;

class procedure TDialogs.Information(const Message: string);
begin
  TDialogService.MessageDialog(Message, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, HelpCtx, nil);
end;

class procedure TDialogs.Warning(const Message: string; const Args: array of const);
begin
  Warning(Format(Message, Args));
end;

class procedure TDialogs.Warning(const Message: string);
begin
  TDialogService.MessageDialog(Message, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, HelpCtx, nil);
end;

end.

