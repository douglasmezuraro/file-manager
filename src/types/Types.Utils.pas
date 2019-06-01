unit Types.Utils;

interface

uses
  FMX.Dialogs,
  FMX.DialogService,
  FMX.Consts,
  System.IOUtils,
  System.SysUtils,
  System.UITypes,
  Winapi.Windows;

type
  TUtils = class abstract
  strict private type

    TConstants = class
    public
      const InputFile      = 'input.json';
      const Zero           = 0;
      const DateNull       = Zero;
      const NumericNull    = -999;
      const DefaultSpacing = 10;
      const DefaultWidth   = 400;
      const ChangeChar     = '*';
    end;

    TConversions = class
    private type
      TBooleanValues = array[Boolean] of string;
    strict private
      class var FBooleanValues: TBooleanValues;
    public
      class procedure DefineBoolean(const False, True: string); static;
      class function BoolToStr(const Value: Boolean): string; static;
      class function StrToBool(const Value: string): Boolean; static;
    end;

    TMethods = class
    public
      class function FilePath(const FileName: TFileName): string; static;
    end;

    TDialogs = class
    public
      class procedure Information(const Message: string); overload; static;
      class procedure Information(const Message: string; const Args: array of const); overload; static;

      class function Confirmation(const Message: string): Boolean; overload; static;
      class function Confirmation(const Message: string; const Args: array of const): Boolean; overload; static;
    end;

    TTranslation = class
    private
      class procedure SetResourceString(const Source: PResStringRec; const Value: PChar); static;
    public
      class procedure Translate; static;
    end;

  strict private
    class var FConstants: TConstants;
    class var FConversions: TConversions;
    class var FMethods: TMethods;
    class var FDialogs: TDialogs;
    class var FTranslation: TTranslation;
  public
    class property Constants: TConstants read FConstants;
    class property Conversions: TConversions read FConversions;
    class property Methods: TMethods read FMethods;
    class property Dialogs: TDialogs read FDialogs;
    class property Translation: TTranslation read FTranslation;
  end;

implementation

{ TUtils.TConversions }

class function TUtils.TConversions.BoolToStr(const Value: Boolean): string;
begin
  Result := FBooleanValues[Value];
end;

class procedure TUtils.TConversions.DefineBoolean(const False, True: string);
begin
  FBooleanValues[System.False] := False;
  FBooleanValues[System.True] := True;
end;

class function TUtils.TConversions.StrToBool(const Value: string): Boolean;
begin
  Result := SameText(Value, FBooleanValues[True]);
end;

{ TUtils.TMethods }

class function TUtils.TMethods.FilePath(const FileName: TFileName): string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), FileName);
end;

{ TUtils.TDialogs }

class function TUtils.TDialogs.Confirmation(const Message: string;
  const Args: array of const): Boolean;
begin
  Result := TUtils.Dialogs.Confirmation(Format(Message, Args));
end;

class function TUtils.TDialogs.Confirmation(const Message: string): Boolean;
var
  lResult: Boolean;
begin
  TDialogService.MessageDialog(
    Message,
    TMsgDlgType.mtConfirmation,
    FMX.Dialogs.mbYesNo,
    TMsgDlgBtn.mbNo,
    TUtils.Constants.NumericNull,
    procedure(const AResult: TModalResult)
    begin
      lResult := False;
      case AResult of
        mrYes : lResult := True;
        mrNo  : lResult := False;
      end;
    end);

  Result := lResult;
end;

class procedure TUtils.TDialogs.Information(const Message: string; const Args: array of const);
begin
  TUtils.Dialogs.Information(Format(Message, Args));
end;

class procedure TUtils.TDialogs.Information(const Message: string);
begin
  TDialogService.MessageDialog(
    Message,
    TMsgDlgType.mtInformation,
    [TMsgDlgBtn.mbOK],
    TMsgDlgBtn.mbOK,
    TUtils.Constants.NumericNull,
    nil);
end;

{ TUtils.TTranslation }

class procedure TUtils.TTranslation.SetResourceString(const Source: PResStringRec;
  const Value: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(Source, SizeOf(Source^), PAGE_EXECUTE_READWRITE, @POldProtect);
  Source^.Identifier := Integer(Value);
  VirtualProtect(Source, SizeOf(Source^), POldProtect, @POldProtect);
end;

class procedure TUtils.TTranslation.Translate;
begin
  SetResourceString(@SMsgDlgWarning, 'Atenção');
  SetResourceString(@SMsgDlgError, 'Erro');
  SetResourceString(@SMsgDlgInformation,'Informação');
  SetResourceString(@SMsgDlgConfirm , 'Confirme');
  SetResourceString(@SMsgDlgYes , '&Sim');
  SetResourceString(@SMsgDlgNo , '&Não');
  SetResourceString(@SMsgDlgOK , 'OK');
  SetResourceString(@SMsgDlgCancel , 'Cancelar');
  SetResourceString(@SMsgDlgHelp , '&Ajuda');
  SetResourceString(@SMsgDlgHelpHelp , 'Ajuda');
  SetResourceString(@SMsgDlgAbort , '&Abortar');
  SetResourceString(@SMsgDlgRetry , '&Repetir');
  SetResourceString(@SMsgDlgIgnore , '&Ignorar');
  SetResourceString(@SMsgDlgAll , '&Tudo');
  SetResourceString(@SMsgDlgNoToAll , 'N&ao para Tudo');
  SetResourceString(@SMsgDlgYesToAll , 'Sim para &Tudo');
  SetResourceString(@SMsgDlgClose , '&Fechar');
end;

end.

