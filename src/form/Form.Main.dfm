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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlLayout: TPageControl
    Left = 0
    Top = 0
    Width = 600
    Height = 517
    ActivePage = TabSheetWorkflow
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 489
    object TabSheetServer: TTabSheet
      Caption = 'Servidor'
      ExplicitWidth = 627
      ExplicitHeight = 271
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
    Left = 300
    Top = 312
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
