unit Helper.FMX.Lang;

interface

uses
  FMX.Consts, FMX.Types, System.SysConst, System.SysUtils, Types.Consts, Winapi.Windows;

type
  /// <summary>
  ///  Class helper for class <c>TLang<c>.
  /// </summary>
  TLangHelper = class Helper for TLang
  private
    procedure HookResourceString(const Source: PResStringRec; const Value: PChar);
    procedure TranslateToPortuguese;
  public
    /// <summary>
    ///  Translate the application to the language passed as parametter.
    /// </summary>
    /// <param name="ALanguage">
    /// </param>
    /// <remarks>
    /// </remarks>
    procedure Translate(const ALanguage: string);
  end;

implementation

procedure TLangHelper.HookResourceString(const Source: PResStringRec; const Value: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(Source, SizeOf(Source^), PAGE_EXECUTE_READWRITE, @POldProtect);
  Source^.Identifier := Integer(Value);
  VirtualProtect(Source, SizeOf(Source^), POldProtect, @POldProtect);
end;

procedure TLangHelper.Translate(const ALanguage: string);
begin
  if ALanguage.Trim.IsEmpty then
  begin
    Exit;
  end;

  Lang := ALanguage;
  LoadLangFromStrings(LangStr[Lang]);

  if Lang.Equals('pt') then
  begin
    TranslateToPortuguese;
    Exit;
  end;
end;

procedure TLangHelper.TranslateToPortuguese;
begin
  // https://github.com/milleramaral/translateDelphiFiles

  {$REGION 'FMX.Consts'}
  HookResourceString(@SMsgDlgWarning, 'Aten��o');
  HookResourceString(@SMsgDlgError, 'Erro');
  HookResourceString(@SMsgDlgInformation, 'Informa��o');
  HookResourceString(@SMsgDlgConfirm, 'Confirme');
  HookResourceString(@SMsgDlgYes, '&Sim');
  HookResourceString(@SMsgDlgNo, '&N�o');
  HookResourceString(@SMsgDlgOK, 'OK');
  HookResourceString(@SMsgDlgCancel, 'Cancelar');
  HookResourceString(@SMsgDlgHelp, '&Ajuda');
  HookResourceString(@SMsgDlgHelpHelp, 'Ajuda');
  HookResourceString(@SMsgDlgAbort, '&Abortar');
  HookResourceString(@SMsgDlgRetry, '&Repetir');
  HookResourceString(@SMsgDlgIgnore, '&Ignorar');
  HookResourceString(@SMsgDlgAll, '&Tudo');
  HookResourceString(@SMsgDlgNoToAll, 'N&�o para tudo');
  HookResourceString(@SMsgDlgYesToAll, 'Sim para &tudo');
  HookResourceString(@SMsgDlgClose, '&Fechar');
  HookResourceString(@SEditUndo, 'Desfazer');
  HookResourceString(@SEditCopy, 'Copiar');
  HookResourceString(@SEditCut, 'Recortar');
  HookResourceString(@SEditPaste, 'Colar');
  HookResourceString(@SEditDelete, 'Deletar');
  HookResourceString(@SEditSelectAll, 'Selecionar tudo');
  {$ENDREGION}

  {$REGION 'Types.Consts'}
  HookResourceString(@SUnsavedChangesWantToExitAnyway, 'Existem altera��es n�o salvas, deseja sair mesmo assim?');
  HookResourceString(@SUnsavedChangesWantToChangeFileAnyway, 'Existem altera��es n�o salvas, deseja trocar o arquivo mesmo assim?');
  HookResourceString(@SFileNotFound, 'Arquivo n�o encontrado: %s.');
  HookResourceString(@SFileSuccessfullySaved, 'Arquivo salvo com sucesso!');
  HookResourceString(@SUngrouped, 'Desagrupado');
  HookResourceString(@SValueIsNotAValidValue, 'O valor "%s" n�o � um "%s". v�lido.');
  HookResourceString(@SValueCannotBeEmpty, 'O valor n�o pode ser vazio.');
  HookResourceString(@SValueDoesNotMatchRegEx, 'O valor n�o atende a expres�o regular.');
  HookResourceString(@SValueIsLessThenMinimumAllowedFloat, 'O valor "%f" � menor que o m�nimo permitido "%f".');
  HookResourceString(@SValueIsGreaterThenMaximumAllowedFloat, 'O valor "%f" � maior que o m�ximo permitido "%f".');
  HookResourceString(@SValueIsLessThenMinimumAllowedInteger, 'O valor "%d" � menor que o m�nimo permitido "%d".');
  HookResourceString(@SValueIsGreaterLessThenMaximumAllowedInteger, 'O valor "%d" � maior que o m�ximo permitido "%d".');
  HookResourceString(@SLengthOfValueIsLessThanMinimumAllowed, 'O comprimento do valor atual "%d" � menor que o m�nimo permitido "%d".');
  HookResourceString(@SLengthOfValueIsGreaterThanMaximumAllowed, 'O comprimento do valor atual "%d" � maior que o m�ximo permitido "%d".');
  HookResourceString(@SClassShouldBeRegistrated, 'A classe "%s" deve ser registrada na se��o "initialization".');
  {$ENDREGION}
end;

end.
