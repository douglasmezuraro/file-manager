unit Types.Utils.Dialogs;

interface

uses
  FMX.Dialogs,
  FMX.DialogService,
  System.SysUtils,
  System.UITypes;

type
  TDialogs = class abstract
  public
    { Information }
    class procedure Information(const Message: string); overload; static;
    class procedure Information(const Message: string; const Args: array of const); overload; static;
    { Confirmation }
    class function Confirmation(const Message: string): Boolean; overload; static;
    class function Confirmation(const Message: string; const Args: array of const): Boolean; overload; static;
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
    0,
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
    0,
    nil);
end;

class procedure TDialogs.Information(const Message: string; const Args: array of const);
begin
  Information(Format(Message, Args));
end;

end.
