unit Types.Dialogs;

interface

uses
  FMX.Dialogs, FMX.DialogService, System.SysUtils, System.UITypes;

type
  /// <summary>
  ///  Class that implements dialogues.
  /// </summary>
  TDialogs = class sealed
  strict private const
    HELP_CTX = 0;
  public
    /// <summary>
    ///  Shows the confirmation dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <returns>
    ///  Returns true if the "Yes" button is clicked, false otherwise.
    /// </returns>
    /// <remarks>
    ///  The message who appears on dialog is the "AAMessage" parametter
    /// </remarks>
    class function Confirmation(const AMessage: string): Boolean; overload; static;

    /// <summary>
    ///  Shows the confirmation dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <returns>
    ///  Returns true if the "Yes" button is clicked, false otherwise.
    /// </returns>
    /// <remarks>
    ///  The message who appears on dialog is a result of a "System.SysUtils.Format" call with the "AAMessage" and "AArgs" as parameters
    /// </remarks>
    class function Confirmation(const AMessage: string; const AArgs: array of const): Boolean; overload; static;

    /// <summary>
    ///  Shows the error dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <remarks>
    ///  The message who appears on dialog is the "AAMessage" parametter
    /// </remarks>
    class procedure Error(const AMessage: string); overload; static;

    /// <summary>
    ///  Shows the error dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <remarks>
    ///  The message who appears on dialog is a result of a "System.SysUtils.Format" call with the "AAMessage" and "AArgs" as parameters
    /// </remarks>
    class procedure Error(const AMessage: string; const AArgs: array of const); overload; static;

    /// <summary>
    ///  Shows the information dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <remarks>
    ///  The message who appears on dialog is the "AAMessage" parametter
    /// </remarks>
    class procedure Information(const AMessage: string); overload; static;

    /// <summary>
    ///  Shows the information dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <remarks>
    ///  The message who appears on dialog is a result of a "System.SysUtils.Format" call with the "AAMessage" and "AArgs" as parameters
    /// </remarks>
    class procedure Information(const AMessage: string; const AArgs: array of const); overload; static;

    /// <summary>
    ///  Shows the warning dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <remarks>
    ///  The message who appears on dialog is the "AAMessage" parametter
    /// </remarks>
    class procedure Warning(const AMessage: string); overload; static;

    /// <summary>
    ///  Shows the warning dialog
    /// </summary>
    /// <param name="AMessage">
    /// </param>
    /// <remarks>
    ///  The message who appears on dialog is a result of a "System.SysUtils.Format" call with the "AAMessage" and "AArgs" as parameters
    /// </remarks>
    class procedure Warning(const AMessage: string; const AArgs: array of const); overload; static;
  end;

implementation

class function TDialogs.Confirmation(const AMessage: string; const AArgs: array of const): Boolean;
begin
  Result := Confirmation(Format(AMessage, AArgs));
end;

class function TDialogs.Confirmation(const AMessage: string): Boolean;
var
  LResult: Boolean;
begin
  TDialogService.MessageDialog(AMessage, TMsgDlgType.mtConfirmation, FMX.Dialogs.mbYesNo, TMsgDlgBtn.mbNo, HELP_CTX,
    procedure(const AResult: TModalResult)
    begin
      LResult := IsPositiveResult(AResult);
    end);

  Result := LResult;
end;

class procedure TDialogs.Error(const AMessage: string; const AArgs: array of const);
begin
  Error(Format(AMessage, AArgs));
end;

class procedure TDialogs.Error(const AMessage: string);
begin
  TDialogService.MessageDialog(AMessage, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, HELP_CTX, nil);
end;

class procedure TDialogs.Information(const AMessage: string; const AArgs: array of const);
begin
  Information(Format(AMessage, AArgs));
end;

class procedure TDialogs.Information(const AMessage: string);
begin
  TDialogService.MessageDialog(AMessage, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, HELP_CTX, nil);
end;

class procedure TDialogs.Warning(const AMessage: string; const AArgs: array of const);
begin
  Warning(Format(AMessage, AArgs));
end;

class procedure TDialogs.Warning(const AMessage: string);
begin
  TDialogService.MessageDialog(AMessage, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, HELP_CTX, nil);
end;

end.

