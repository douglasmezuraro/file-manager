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
  Hook(@SMsgDlgWarning, 'Aten��o');
  Hook(@SMsgDlgError, 'Erro');
  Hook(@SMsgDlgInformation, 'Informa��o');
  Hook(@SMsgDlgConfirm, 'Confirme');
  Hook(@SMsgDlgYes, '&Sim');
  Hook(@SMsgDlgNo, '&N�o');
  Hook(@SMsgDlgOK, 'OK');
  Hook(@SMsgDlgCancel, 'Cancelar');
  Hook(@SMsgDlgHelp, '&Ajuda');
  Hook(@SMsgDlgHelpHelp, 'Ajuda');
  Hook(@SMsgDlgAbort, '&Abortar');
  Hook(@SMsgDlgRetry, '&Repetir');
  Hook(@SMsgDlgIgnore, '&Ignorar');
  Hook(@SMsgDlgAll, '&Tudo');
  Hook(@SMsgDlgNoToAll, 'N&�o para Tudo');
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
  Hook(@SUnsavedChangesWantToExitAnyway, 'Existem altera��es n�o salvas, deseja sair mesmo assim?');
  Hook(@SUnsavedChangesWantToChangeFileAnyway, 'Existem altera��es n�o salvas, deseja trocar o arquivo mesmo assim?');
  Hook(@SFileNotFound, 'Arquivo n�o encontrado: %s.');
  Hook(@SFileSuccessfullySaved, 'Arquivo salvo com sucesso!');
  Hook(@SUngrouped, 'Desagrupado');
  Hook(@SValueIsNotAValid, 'O valor "%s" n�o � um "%s". v�lido.');
  Hook(@SValueCannotBeEmpty, 'O valor n�o pode ser vazio.');
  Hook(@SValueDoesNotMatchRegEx, 'O valor n�o atende a expres�o regular.');
  Hook(@SValueIsLessThenMinimumAllowedFloat, 'O valor "%f" � menor que o m�nimo permitido "%f".');
  Hook(@SValueIsGreaterLessThenMaximumAllowedFloat, 'O valor "%f" � maior que o m�ximo permitido "%f".');
  Hook(@SValueIsLessThenMinimumAllowedInteger, 'O valor "%d" � menor que o m�nimo permitido "%d".');
  Hook(@SValueIsGreaterLessThenMaximumAllowedInteger, 'O valor "%d" � maior que o m�ximo permitido "%d".');
  Hook(@SLengthOfValueIsLessThanMinimumAllowed, 'O comprimento do valor atual "%d" � menor que o m�nimo permitido "%d".');
  Hook(@SLengthOfValueIsGreaterThanMaximumAllowed, 'O comprimento do valor atual "%d" � maior que o m�ximo permitido "%d".');
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

