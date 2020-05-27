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
  HookResourceString(@SMsgDlgWarning, 'Atenção');
  HookResourceString(@SMsgDlgError, 'Erro');
  HookResourceString(@SMsgDlgInformation, 'Informação');
  HookResourceString(@SMsgDlgConfirm, 'Confirme');
  HookResourceString(@SMsgDlgYes, '&Sim');
  HookResourceString(@SMsgDlgNo, '&Não');
  HookResourceString(@SMsgDlgOK, 'OK');
  HookResourceString(@SMsgDlgCancel, 'Cancelar');
  HookResourceString(@SMsgDlgHelp, '&Ajuda');
  HookResourceString(@SMsgDlgHelpHelp, 'Ajuda');
  HookResourceString(@SMsgDlgAbort, '&Abortar');
  HookResourceString(@SMsgDlgRetry, '&Repetir');
  HookResourceString(@SMsgDlgIgnore, '&Ignorar');
  HookResourceString(@SMsgDlgAll, '&Tudo');
  HookResourceString(@SMsgDlgNoToAll, 'N&ão para tudo');
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
  HookResourceString(@SUnsavedChangesWantToExitAnyway, 'Existem alterações não salvas, deseja sair mesmo assim?');
  HookResourceString(@SUnsavedChangesWantToChangeFileAnyway, 'Existem alterações não salvas, deseja trocar o arquivo mesmo assim?');
  HookResourceString(@SFileNotFound, 'Arquivo não encontrado: %s.');
  HookResourceString(@SFileSuccessfullySaved, 'Arquivo salvo com sucesso!');
  HookResourceString(@SUngrouped, 'Desagrupado');
  HookResourceString(@SValueIsNotAValidValue, 'O valor "%s" não é um "%s". válido.');
  HookResourceString(@SValueCannotBeEmpty, 'O valor não pode ser vazio.');
  HookResourceString(@SValueDoesNotMatchRegEx, 'O valor não atende a expresão regular.');
  HookResourceString(@SValueIsLessThenMinimumAllowedFloat, 'O valor "%f" é menor que o mínimo permitido "%f".');
  HookResourceString(@SValueIsGreaterThenMaximumAllowedFloat, 'O valor "%f" é maior que o máximo permitido "%f".');
  HookResourceString(@SValueIsLessThenMinimumAllowedInteger, 'O valor "%d" é menor que o mínimo permitido "%d".');
  HookResourceString(@SValueIsGreaterLessThenMaximumAllowedInteger, 'O valor "%d" é maior que o máximo permitido "%d".');
  HookResourceString(@SLengthOfValueIsLessThanMinimumAllowed, 'O comprimento do valor atual "%d" é menor que o mínimo permitido "%d".');
  HookResourceString(@SLengthOfValueIsGreaterThanMaximumAllowed, 'O comprimento do valor atual "%d" é maior que o máximo permitido "%d".');
  HookResourceString(@SClassShouldBeRegistrated, 'A classe "%s" deve ser registrada na seção "initialization".');
  {$ENDREGION}
end;

end.
