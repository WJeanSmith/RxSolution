object Group1_SelectFrm: TGroup1_SelectFrm
  Left = 468
  Top = 335
  Width = 629
  Height = 377
  Caption = 'Group1 Select '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Group2: TGroupBox
    Left = 0
    Top = 0
    Width = 611
    Height = 288
    Align = alClient
    TabOrder = 0
    object dxgOrders_Items: TdxDBGrid
      Left = 2
      Top = 18
      Width = 607
      Height = 268
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'Code_str'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      ArrowsColor = clNavy
      BandColor = clBackground
      BandFont.Charset = ANSI_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -11
      BandFont.Name = 'MS Sans Serif'
      BandFont.Style = []
      DataSource = StockTakeDM.dstblGroup1
      Filter.Active = True
      Filter.DropDownCount = 16
      Filter.Criteria = {00000000}
      GridLineColor = clInactiveCaptionText
      GroupPanelColor = 16311512
      GroupPanelFontColor = clActiveCaption
      GroupNodeColor = 16311512
      GroupNodeTextColor = clActiveCaption
      HeaderColor = clInfoBk
      HeaderFont.Charset = ANSI_CHARSET
      HeaderFont.Color = clBlack
      HeaderFont.Height = -12
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = [fsBold]
      IndentDesc = 10
      LookAndFeel = lfFlat
      OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoCaseInsensitive, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoStoreToRegistry, edgoTabs, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoHeaderPanelSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoHotTrack, edgoInvertSelect, edgoUseBitmap]
      PreviewFont.Charset = ANSI_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -11
      PreviewFont.Name = 'MS Sans Serif'
      PreviewFont.Style = []
      RowFooterColor = clHighlight
      RowFooterTextColor = clWindow
      ShowPreviewGrid = False
      object dxgOrders_ItemsCode_str: TdxDBGridColumn
        Caption = 'Code'
        DisableEditor = True
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Code_str'
      end
      object dxgOrders_ItemsDescription_str: TdxDBGridColumn
        Caption = 'Description'
        DisableEditor = True
        Width = 460
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Description_str'
      end
    end
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 288
    Width = 611
    Height = 44
    CaptionOk = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    TabOrder = 1
  end
end
