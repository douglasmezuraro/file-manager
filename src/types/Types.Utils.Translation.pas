unit Types.Utils.Translation;

interface

uses
  FMX.Consts,
  System.SysUtils,
  Types.ResourceStrings,
  Winapi.Windows;

type
  TTranslation = class
  private
    class procedure HookResourceString(const Source: PResStringRec; const Value: PChar); static;
    class procedure ToPortuguese; static;
  public
    class procedure Translate(const Language: string); static;
  end;

implementation

{ TTranslation }

class procedure TTranslation.HookResourceString(const Source: PResStringRec; const Value: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(Source, SizeOf(Source^), PAGE_EXECUTE_READWRITE, @POldProtect);
  Source^.Identifier := Integer(Value);
  VirtualProtect(Source, SizeOf(Source^), POldProtect, @POldProtect);
end;

class procedure TTranslation.ToPortuguese;
begin
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
  HookResourceString(@SMsgDlgNoToAll, 'N&�o para Tudo');
  HookResourceString(@SMsgDlgYesToAll, 'Sim para &Tudo');
  HookResourceString(@SMsgDlgClose, '&Fechar');
  HookResourceString(@SEditUndo, 'Desfazer');
  HookResourceString(@SEditCopy, 'Copiar');
  HookResourceString(@SEditCut, 'Recortar');
  HookResourceString(@SEditPaste, 'Colar');
  HookResourceString(@SEditDelete, 'Deletar');
  HookResourceString(@SEditSelectAll, 'Selecionar tudo');
  HookResourceString(@SUnsavedChangesWantToExitAnyway, 'Existem altera��es n�o salvas, deseja sair mesmo assim?');
  HookResourceString(@SUnsavedChangesWantToChangeFileAnyway, 'Existem altera��es n�o salvas, deseja trocar o arquivo mesmo assim?');
  HookResourceString(@SFileNotFound, 'Arquivo n�o encontrado: %s.');
  HookResourceString(@SFileSuccessfullySaved, 'Arquivo salvo com sucesso!');
  HookResourceString(@SUngrouped, 'Desagrupado');
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

