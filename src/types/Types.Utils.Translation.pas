unit Types.Utils.Translation;

interface

uses
  FMX.Consts, System.SysUtils, Types.ResourceStrings, Winapi.Windows;

type
  TTranslation = class
  private
    class procedure Hook(const Source: PResStringRec; const Value: PChar); static;
    class procedure ToPortuguese; static;
  public
    class procedure Translate(const Language: string); static;
  end;

implementation

class procedure TTranslation.Hook(const Source: PResStringRec; const Value: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(Source, SizeOf(Source^), PAGE_EXECUTE_READWRITE, @POldProtect);
  Source^.Identifier := Integer(Value);
  VirtualProtect(Source, SizeOf(Source^), POldProtect, @POldProtect);
end;

class procedure TTranslation.ToPortuguese;
begin
  {$REGION 'System ResourceStrings'}
  Hook(@SMsgDlgWarning, 'Atenção');
  Hook(@SMsgDlgError, 'Erro');
  Hook(@SMsgDlgInformation, 'Informação');
  Hook(@SMsgDlgConfirm, 'Confirme');
  Hook(@SMsgDlgYes, '&Sim');
  Hook(@SMsgDlgNo, '&Não');
  Hook(@SMsgDlgOK, 'OK');
  Hook(@SMsgDlgCancel, 'Cancelar');
  Hook(@SMsgDlgHelp, '&Ajuda');
  Hook(@SMsgDlgHelpHelp, 'Ajuda');
  Hook(@SMsgDlgAbort, '&Abortar');
  Hook(@SMsgDlgRetry, '&Repetir');
  Hook(@SMsgDlgIgnore, '&Ignorar');
  Hook(@SMsgDlgAll, '&Tudo');
  Hook(@SMsgDlgNoToAll, 'N&ão para Tudo');
  Hook(@SMsgDlgYesToAll, 'Sim para &Tudo');
  Hook(@SMsgDlgClose, '&Fechar');
  Hook(@SEditUndo, 'Desfazer');
  Hook(@SEditCopy, 'Copiar');
  Hook(@SEditCut, 'Recortar');
  Hook(@SEditPaste, 'Colar');
  Hook(@SEditDelete, 'Deletar');
  Hook(@SEditSelectAll, 'Selecionar tudo');
  {$ENDREGION}

  {$REGION 'Custom ResourceStrings'}
  Hook(@SUnsavedChangesWantToExitAnyway, 'Existem alterações não salvas, deseja sair mesmo assim?');
  Hook(@SUnsavedChangesWantToChangeFileAnyway, 'Existem alterações não salvas, deseja trocar o arquivo mesmo assim?');
  Hook(@SFileNotFound, 'Arquivo não encontrado: %s.');
  Hook(@SFileSuccessfullySaved, 'Arquivo salvo com sucesso!');
  Hook(@SUngrouped, 'Desagrupado');
  Hook(@SValueIsNotAValid, 'O valor "%s" não é um "%s". válido.');
  Hook(@SValueCannotBeEmpty, 'O valor não pode ser vazio.');
  Hook(@SValueDoesNotMatchRegEx, 'O valor não atende a expresão regular.');
  Hook(@SValueIsLessThenMinimumAllowedFloat, 'O valor "%f" é menor que o mínimo permitido "%f".');
  Hook(@SValueIsGreaterLessThenMaximumAllowedFloat, 'O valor "%f" é maior que o máximo permitido "%f".');
  Hook(@SValueIsLessThenMinimumAllowedInteger, 'O valor "%d" é menor que o mínimo permitido "%d".');
  Hook(@SValueIsGreaterLessThenMaximumAllowedInteger, 'O valor "%d" é maior que o máximo permitido "%d".');
  Hook(@SLengthOfValueIsLessThanMinimumAllowed, 'O comprimento do valor atual "%d" é menor que o mínimo permitido "%d".');
  Hook(@SLengthOfValueIsGreaterThanMaximumAllowed, 'O comprimento do valor atual "%d" é maior que o máximo permitido "%d".');
  {$ENDREGION}
end;

class procedure TTranslation.Translate(const Language: string);
begin
  if SameText(Language, 'pt') then
  begin
    ToPortuguese;
    Exit;
  end;
end;

end.

