unit Types.Utils.Translation;

interface

uses
  FMX.Consts,
  Winapi.Windows;

type
  TTranslation = class
  private
    class procedure HookResourceString(const Source: PResStringRec; const Value: PChar); static;
  public
    class procedure Translate; static;
  end;

implementation

{ TTranslation }

class procedure TTranslation.HookResourceString(const Source: PResStringRec; const Value: PChar);
var
  PProtect: DWORD;
begin
  VirtualProtect(Source, SizeOf(Source^), PAGE_EXECUTE_READWRITE, @PProtect);
  Source^.Identifier := Integer(Value);
  VirtualProtect(Source, SizeOf(Source^), PProtect, @PProtect);
end;

class procedure TTranslation.Translate;
begin
  { Dialogs }
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
  HookResourceString(@SMsgDlgNoToAll, 'N&ao para Tudo');
  HookResourceString(@SMsgDlgYesToAll, 'Sim para &Tudo');
  HookResourceString(@SMsgDlgClose, '&Fechar');

  { Edit }
	HookResourceString(@SEditUndo, 'Desfazer');
	HookResourceString(@SEditCopy, 'Copiar');
	HookResourceString(@SEditCut, 'Recortar');
	HookResourceString(@SEditPaste, 'Colar');
	HookResourceString(@SEditDelete, 'Deletar');
	HookResourceString(@SEditSelectAll, 'Selecionar tudo');
end;

end.

