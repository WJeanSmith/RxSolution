object frmFormEditUFrm: TfrmFormEditUFrm
  Left = 391
  Top = 196
  Width = 796
  Height = 668
  Caption = 'Edit/Add Form Range'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object dxgFormRange: TdxDBGrid
    Left = 0
    Top = 143
    Width = 778
    Height = 444
    Bands = <
      item
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'Description_str'
    ShowGroupPanel = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    BandFont.Charset = ANSI_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'Tahoma'
    BandFont.Style = []
    DataSource = ProductDm.dsFormRange
    Filter.Active = True
    Filter.Criteria = {00000000}
    GroupPanelColor = 15779500
    GroupPanelFontColor = clHighlight
    HeaderColor = clInfoBk
    HeaderFont.Charset = ANSI_CHARSET
    HeaderFont.Color = clBlack
    HeaderFont.Height = -12
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = [fsBold]
    LookAndFeel = lfFlat
    OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoCaseInsensitive, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
    OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing, edgoHeaderPanelSizing]
    OptionsDB = [edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoInvertSelect, edgoRowAutoHeight, edgoUseBitmap]
    PreviewFont.Charset = ANSI_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'Tahoma'
    PreviewFont.Style = []
    object dxgFormRangeCode_str: TdxDBGridColumn
      Caption = 'Code'
      DisableEditor = True
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Code_str'
      DisableFilter = True
    end
    object dxgFormRangeDescription_str: TdxDBGridColumn
      Caption = 'Description'
      DisableEditor = True
      Width = 140
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Description_str'
      DisableFilter = True
    end
    object dxgFormRangeInjectable_bol: TdxDBGridCheckColumn
      Caption = 'Injectable?'
      DisableEditor = True
      Width = 118
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Injectable_bol'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxgFormRangedispensingForm_str: TdxDBGridColumn
      Caption = 'Dispensing Form'
      DisableEditor = True
      Width = 109
      BandIndex = 0
      RowIndex = 0
      FieldName = 'dispensingForm_str'
    end
    object dxgFormRangeAdministration_str: TdxDBGridColumn
      Caption = 'Administration Mode'
      DisableEditor = True
      Width = 160
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Administration_str'
    end
    object dxgFormRangeAdministrationCode_str: TdxDBGridColumn
      Caption = 'Admin. Code'
      DisableEditor = True
      Width = 103
      BandIndex = 0
      RowIndex = 0
      FieldName = 'AdministrationCode_str'
    end
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 587
    Width = 778
    CaptionOk = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    ShowDivider = True
    ShowCancelButton = False
    TabOrder = 1
  end
  object pnlProductDetailColorBackground: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 111
    Align = alTop
    BevelOuter = bvNone
    Color = 16311512
    Font.Charset = ANSI_CHARSET
    Font.Color = 16744576
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      778
      111)
    object Label12: TLabel
      Left = 6
      Top = 31
      Width = 62
      Height = 32
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Code'
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label31: TLabel
      Left = 6
      Top = 6
      Width = 206
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'Codes'
      Color = 15779500
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label38: TLabel
      Left = 213
      Top = 6
      Width = 556
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'Description'
      Color = 15779500
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 213
      Top = 64
      Width = 123
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Administration Mode'
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 501
      Top = 64
      Width = 129
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Administration Code'
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 6
      Top = 64
      Width = 62
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Form'
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbeadminMode: TDBEdit
      Left = 337
      Top = 64
      Width = 161
      Height = 22
      Cursor = crHandPoint
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'Administration_str'
      DataSource = ProductDm.dsFormRange
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object wwDBLookupCombo24: TwwDBLookupCombo
      Left = 1060
      Top = 201
      Width = 216
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 16744448
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'Description_str'#9'20'#9'Description_str'#9'T')
      DataField = 'PackContainer_str'
      DataSource = ProductDm.dstblProductCatalog
      LookupTable = ProductDm.qryADOPackSizeContainer
      LookupField = 'Description_str'
      Style = csDropDownList
      DropDownCount = 20
      ButtonEffects.Flat = True
      ParentFont = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object RzDBEdit1: TRzDBEdit
      Left = 69
      Top = 30
      Width = 143
      Height = 32
      DataSource = ProductDm.dsFormRange
      DataField = 'Code_str'
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = RzFrameController1
      ParentFont = False
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 213
      Top = 30
      Width = 556
      Height = 32
      DataSource = ProductDm.dsFormRange
      DataField = 'Description_str'
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = RzFrameController1
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 631
      Top = 64
      Width = 138
      Height = 22
      Cursor = crHandPoint
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'AdministrationCode_str'
      DataSource = ProductDm.dsFormRange
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 69
      Top = 64
      Width = 143
      Height = 22
      Cursor = crHandPoint
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'dispensingForm_str'
      DataSource = ProductDm.dsFormRange
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 6
      Top = 89
      Width = 101
      Height = 21
      DataField = 'Injectable_bol'
      DataSource = ProductDm.dsFormRange
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Injectable'
      Font.Charset = ANSI_CHARSET
      Font.Color = clHighlight
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel20: TPanel
    Left = 0
    Top = 111
    Width = 778
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 3
    object Shape2: TShape
      Left = 0
      Top = 31
      Width = 778
      Height = 1
      Align = alBottom
      Pen.Color = clHighlight
    end
    object RzDBNavigator1: TRzDBNavigator
      Left = 0
      Top = 0
      Width = 288
      Height = 31
      DataSource = ProductDm.dsFormRange
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
  end
  object RzFrameController1: TRzFrameController
    FrameStyle = fsNone
    FrameVisible = True
    Left = 88
    Top = 160
  end
end
