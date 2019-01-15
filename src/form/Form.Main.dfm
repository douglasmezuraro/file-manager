object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Config'
  ClientHeight = 562
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlLayout: TPageControl
    Left = 0
    Top = 0
    Width = 600
    Height = 517
    ActivePage = TabSheetDatabase
    Align = alClient
    TabOrder = 0
    object TabSheetServer: TTabSheet
      Caption = 'Servidor'
      object LabelGUID: TLabel
        Left = 16
        Top = 51
        Width = 25
        Height = 13
        Caption = 'GUID'
        FocusControl = EditServerGUID
      end
      object LabelConnectionType: TLabel
        Left = 16
        Top = 179
        Width = 79
        Height = 13
        Caption = 'Tipo de conex'#227'o'
        FocusControl = ComboBoxServerConnectionType
      end
      object EditServerName: TLabeledEdit
        Left = 16
        Top = 24
        Width = 241
        Height = 21
        Hint = 'NOMESERVIDOR'
        EditLabel.Width = 84
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome do servidor'
        TabOrder = 0
      end
      object EditServerGUID: TMaskEdit
        Left = 16
        Top = 70
        Width = 241
        Height = 21
        Hint = 'GUIDSERVIDOR'
        CharCase = ecUpperCase
        EditMask = '{AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA};1;_'
        MaxLength = 38
        TabOrder = 1
        Text = '{        -    -    -    -            }'
      end
      object EditServerComputerName: TLabeledEdit
        Left = 16
        Top = 112
        Width = 241
        Height = 21
        Hint = 'NOMECOMPUTADOR'
        EditLabel.Width = 102
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome do computador'
        TabOrder = 2
      end
      object EditServerIPAddress: TLabeledEdit
        Left = 16
        Top = 152
        Width = 241
        Height = 21
        Hint = 'ENDERECOIP'
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o IP'
        TabOrder = 3
        OnExit = EditServerIPAddressExit
      end
      object ComboBoxServerConnectionType: TComboBox
        Left = 16
        Top = 198
        Width = 241
        Height = 21
        Hint = 'ENDERECOIP'
        Style = csDropDownList
        TabOrder = 4
      end
      object CheckBoxServerCanBalance: TCheckBox
        Left = 16
        Top = 225
        Width = 241
        Height = 17
        Hint = 'PODEBALANCEAR'
        Caption = 'Pode balancear'
        TabOrder = 5
      end
      object EditServerExeName: TLabeledEdit
        Left = 16
        Top = 264
        Width = 241
        Height = 21
        Hint = 'NOMEEXECUTAVELSERVIDOR'
        EditLabel.Width = 98
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome do execut'#225'vel'
        TabOrder = 6
      end
      object EditServerTimeOut: TLabeledEdit
        Left = 16
        Top = 304
        Width = 241
        Height = 21
        Hint = 'TIMEOUTEXECUCAO'
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'TimeOut'
        NumbersOnly = True
        TabOrder = 7
      end
      object CheckBoxServerIntegrationManager: TCheckBox
        Left = 16
        Top = 331
        Width = 241
        Height = 17
        Hint = 'HABILITAGERENCIADORINTEGRACAO'
        Caption = 'Habilitar gerenciador de integra'#231#227'o'
        TabOrder = 8
      end
    end
    object TabSheetDatabase: TTabSheet
      Caption = 'Database'
      ImageIndex = 1
      object LabelAccessType: TLabel
        Left = 16
        Top = 251
        Width = 87
        Height = 13
        Caption = 'Tipo de acesso DB'
      end
      object LabelDatabaseType: TLabel
        Left = 16
        Top = 297
        Width = 67
        Height = 13
        Caption = 'Tipo de banco'
      end
      object EditDatabaseSchema: TLabeledEdit
        Left = 16
        Top = 24
        Width = 241
        Height = 21
        Hint = 'ESQUEMA'
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'Esquema'
        TabOrder = 0
      end
      object EditDatabaseMaxConnections: TLabeledEdit
        Left = 16
        Top = 64
        Width = 241
        Height = 21
        Hint = 'NUMEROMAXIMOCONEXOES'
        EditLabel.Width = 140
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero m'#225'ximo de conex'#245'es'
        NumbersOnly = True
        TabOrder = 1
      end
      object EditDatabaseMinConnections: TLabeledEdit
        Left = 16
        Top = 104
        Width = 241
        Height = 21
        Hint = 'NUMEROMINIMOCONEXOES'
        EditLabel.Width = 136
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero m'#237'nimo de conex'#245'es'
        NumbersOnly = True
        TabOrder = 2
      end
      object EditDatabaseDisconnectionTimeIdleConnection: TLabeledEdit
        Left = 16
        Top = 144
        Width = 241
        Height = 21
        Hint = 'TEMPODESCONEXAOCONEXAOINATIVA'
        EditLabel.Width = 202
        EditLabel.Height = 13
        EditLabel.Caption = 'Tempo de desconex'#227'o de conex'#227'o inativa'
        NumbersOnly = True
        TabOrder = 3
      end
      object EditDatabaseConnectionLogUpdateTime: TLabeledEdit
        Left = 16
        Top = 184
        Width = 241
        Height = 21
        Hint = 'TEMPOATUALIZACAOLOGCONEXOES'
        EditLabel.Width = 200
        EditLabel.Height = 13
        EditLabel.Caption = 'Tempo de atualiza'#231#227'o do log de conex'#245'es'
        NumbersOnly = True
        TabOrder = 4
      end
      object EditDatabaseFetchLines: TLabeledEdit
        Left = 16
        Top = 224
        Width = 241
        Height = 21
        Hint = 'NUMEROLINHASFETCH'
        EditLabel.Width = 110
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero de linhas fetch'
        TabOrder = 5
      end
      object ComboBoxDatabaseAccessType: TComboBox
        Left = 16
        Top = 270
        Width = 241
        Height = 21
        Hint = 'TIPOACESSOBD'
        Style = csDropDownList
        TabOrder = 6
      end
      object ComboBoxDatabaseType: TComboBox
        Left = 16
        Top = 316
        Width = 241
        Height = 21
        Hint = 'TIPOBANCO'
        Style = csDropDownList
        TabOrder = 7
        OnExit = ComboBoxDatabaseTypeExit
      end
      object EditDatabaseAlias: TLabeledEdit
        Left = 16
        Top = 359
        Width = 241
        Height = 21
        Hint = 'ALIAS'
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'Alias'
        TabOrder = 8
      end
      object EditDatabaseServer: TLabeledEdit
        Left = 16
        Top = 402
        Width = 241
        Height = 21
        Hint = 'SERVER'
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'Server'
        TabOrder = 9
      end
    end
    object TabSheetClient: TTabSheet
      Caption = 'Cliente'
      ImageIndex = 2
      object GroupBoxAutoLogin: TGroupBox
        Left = 16
        Top = 11
        Width = 561
        Height = 70
        Caption = 'Login autom'#225'tico'
        TabOrder = 0
        object EditClientAutoLoginUser: TLabeledEdit
          Left = 16
          Top = 32
          Width = 225
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = 'Usu'#225'rio'
          TabOrder = 0
        end
        object EditClientAutoLoginPassword: TLabeledEdit
          Left = 247
          Top = 32
          Width = 225
          Height = 21
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.Caption = 'Senha'
          PasswordChar = '*'
          TabOrder = 1
        end
      end
      object EditClientTimeout: TLabeledEdit
        Left = 16
        Top = 104
        Width = 241
        Height = 21
        EditLabel.Width = 102
        EditLabel.Height = 13
        EditLabel.Caption = 'Timeout de execu'#231#227'o'
        TabOrder = 1
      end
      object CheckBoxClientDisableMenuBackground: TCheckBox
        Left = 16
        Top = 131
        Width = 241
        Height = 17
        Caption = 'Desabilitar fundo do menu'
        TabOrder = 2
      end
    end
    object TabSheetLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 3
      ExplicitLeft = 32
      ExplicitTop = 23
      object CheckBoxLogRegisterMethodLog: TCheckBox
        Left = 18
        Top = 16
        Width = 241
        Height = 17
        Caption = 'Registrar log de m'#233'todos'
        TabOrder = 0
      end
      object CheckBoxLogRegisterSQLLog: TCheckBox
        Left = 18
        Top = 43
        Width = 241
        Height = 17
        Caption = 'Registrar log de SQL'
        TabOrder = 1
      end
      object CheckBoxLogRegisterSignatureLog: TCheckBox
        Left = 18
        Top = 70
        Width = 241
        Height = 17
        Caption = 'Registrar log de assinatura'
        TabOrder = 2
      end
    end
    object TabSheetMonitor: TTabSheet
      Caption = 'Monitor'
      ImageIndex = 4
    end
    object TabSheetUpdate: TTabSheet
      Caption = 'Update'
      ImageIndex = 5
    end
    object TabSheetSPP: TTabSheet
      Caption = 'SPP'
      ImageIndex = 6
    end
    object TabSheetDUnit: TTabSheet
      Caption = 'DUnit'
      ImageIndex = 7
    end
    object TabSheetScanner: TTabSheet
      Caption = 'Scanner'
      ImageIndex = 8
    end
    object TabSheetWorkflow: TTabSheet
      Caption = 'Fluxo de trabalho'
      ImageIndex = 9
    end
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 517
    Width = 600
    Height = 45
    Align = alBottom
    TabOrder = 1
    object ButtonSave: TSpeedButton
      Left = 1
      Top = 1
      Width = 100
      Height = 43
      Action = ActionSave
      Align = alLeft
      ExplicitHeight = 39
    end
    object ButtonExit: TSpeedButton
      Left = 499
      Top = 1
      Width = 100
      Height = 43
      Action = ActionExit
      Align = alRight
      ExplicitLeft = 344
      ExplicitHeight = 39
    end
  end
  object ActionList: TActionList
    Left = 548
    Top = 32
    object ActionSave: TAction
      Caption = '&Salvar'
      OnExecute = ActionSaveExecute
    end
    object ActionExit: TAction
      Caption = '&Sair'
      OnExecute = ActionExitExecute
    end
  end
end
