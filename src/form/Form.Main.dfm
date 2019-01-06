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
    ActivePage = TabSheetServer
    Align = alClient
    TabOrder = 0
    object TabSheetServer: TTabSheet
      Caption = 'Servidor'
      ExplicitLeft = 68
      ExplicitTop = 23
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
        FocusControl = ComboBoxConnectionType
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
      object EditIPAddress: TLabeledEdit
        Left = 16
        Top = 152
        Width = 241
        Height = 21
        Hint = 'ENDERECOIP'
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o IP'
        TabOrder = 3
      end
      object ComboBoxConnectionType: TComboBox
        Left = 16
        Top = 198
        Width = 241
        Height = 21
        Hint = 'ENDERECOIP'
        TabOrder = 4
        Text = 'ComboBoxConnectionType'
      end
      object CheckBoxCanBalance: TCheckBox
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
      object CheckBoxIntegrationManager: TCheckBox
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
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetClient: TTabSheet
      Caption = 'Cliente'
      ImageIndex = 2
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 3
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetMonitor: TTabSheet
      Caption = 'Monitor'
      ImageIndex = 4
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetUpdate: TTabSheet
      Caption = 'Update'
      ImageIndex = 5
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetSPP: TTabSheet
      Caption = 'SPP'
      ImageIndex = 6
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetDUnit: TTabSheet
      Caption = 'DUnit'
      ImageIndex = 7
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetScanner: TTabSheet
      Caption = 'Scanner'
      ImageIndex = 8
      ExplicitWidth = 627
      ExplicitHeight = 271
    end
    object TabSheetWorkflow: TTabSheet
      Caption = 'Fluxo de trabalho'
      ImageIndex = 9
      ExplicitWidth = 627
      ExplicitHeight = 271
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
