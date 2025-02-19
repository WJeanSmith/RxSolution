object LocalSettingsFrm: TLocalSettingsFrm
  Left = 1046
  Top = 294
  Width = 680
  Height = 547
  Caption = 'Local Machine Settings'
  Color = 16311512
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox8: TGroupBox
    Left = 26
    Top = 7
    Width = 618
    Height = 136
    Caption = 'Local Settings'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label18: TLabel
      Left = 45
      Top = 26
      Width = 101
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Report Printer:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label23: TLabel
      Left = 53
      Top = 57
      Width = 97
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Label Printer: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label25: TLabel
      Left = 65
      Top = 87
      Width = 81
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Demander: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object cmbReportPrinter: TComboBox
      Left = 150
      Top = 21
      Width = 447
      Height = 24
      ItemHeight = 16
      TabOrder = 0
      OnDropDown = cmbReportPrinterDropDown
    end
    object cmbLabelPrinter: TComboBox
      Left = 150
      Top = 52
      Width = 447
      Height = 24
      ItemHeight = 16
      TabOrder = 1
      OnDropDown = cmbLabelPrinterDropDown
    end
    object chkUsePrinters: TCheckBox
      Left = 150
      Top = 111
      Width = 122
      Height = 21
      BiDiMode = bdRightToLeft
      Caption = 'Use'
      ParentBiDiMode = False
      TabOrder = 2
    end
    object cmbLocalDemander: TComboBox
      Left = 150
      Top = 81
      Width = 447
      Height = 24
      ItemHeight = 16
      TabOrder = 3
      OnDropDown = cmbLocalDemanderDropDown
    end
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 473
    Width = 664
    ActionOk = atnSaveSettings
    ButtonColor = 16311512
    CaptionOk = 'Ok'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    EnableCancel = False
    ShowCancelButton = False
    Color = 16311512
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 26
    Top = 293
    Width = 618
    Height = 153
    Caption = 'Paab Settings'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 46
      Top = 18
      Width = 80
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'User name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 53
      Top = 50
      Width = 73
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 6
      Top = 82
      Width = 120
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Practise Number:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 44
      Top = 114
      Width = 82
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Service Url:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object edtUser: TEdit
      Left = 128
      Top = 16
      Width = 121
      Height = 24
      TabOrder = 0
    end
    object edtPwd: TEdit
      Left = 128
      Top = 48
      Width = 121
      Height = 24
      PasswordChar = '*'
      TabOrder = 1
    end
    object edtPracNumber: TEdit
      Left = 128
      Top = 80
      Width = 121
      Height = 24
      TabOrder = 2
    end
    object edtPaabUrl: TEdit
      Left = 128
      Top = 112
      Width = 465
      Height = 24
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 26
    Top = 149
    Width = 618
    Height = 124
    TabOrder = 3
    object Label3: TLabel
      Left = 368
      Top = 24
      Width = 40
      Height = 16
      Caption = 'Scan '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 474
      Top = 24
      Width = 48
      Height = 16
      Caption = 'fingers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object chkBiometric: TCheckBox
      Left = 16
      Top = 24
      Width = 314
      Height = 21
      BiDiMode = bdRightToLeft
      Caption = 'Biometric Machine attached to system?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
    end
    object chkHaveBarcodeScanner: TCheckBox
      Left = 16
      Top = 84
      Width = 314
      Height = 21
      BiDiMode = bdRightToLeft
      Caption = 'Barcode scanner attached to system?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
    end
    object RzSpinEdit1: TRzSpinEdit
      Left = 411
      Top = 22
      Width = 58
      Height = 24
      Max = 10
      Min = 2
      Value = 2
      TabOrder = 2
      Visible = False
    end
    object chkUsingScannerOnly: TCheckBox
      Left = 16
      Top = 54
      Width = 314
      Height = 20
      BiDiMode = bdRightToLeft
      Caption = 'Machine with fingerprint reader only?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
    end
  end
  object ActionList1: TActionList
    Left = 512
    object atnSaveSettings: TAction
      Caption = 'Ok'
      OnExecute = atnSaveSettingsExecute
    end
  end
end
