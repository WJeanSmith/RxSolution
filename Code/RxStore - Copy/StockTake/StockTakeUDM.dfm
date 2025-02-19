object StockTakeDM: TStockTakeDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 256
  Top = 1
  Height = 884
  Width = 1201
  object AdoStockTakeConn: TADOConnection
    CommandTimeout = 320
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=rxsolution;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=RxBarCoding;Data Source=.\sqlexpre' +
      'ss'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 18
  end
  object dsStockTakeCatalog: TDataSource
    DataSet = qryStockTakeCatalog
    Left = 184
    Top = 79
  end
  object qryStockTakeItems: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    BeforePost = qryStockTakeItemsBeforePost
    OnNewRecord = qryStockTakeItemsNewRecord
    Parameters = <
      item
        Name = 'StockTake_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 19
      end>
    SQL.Strings = (
      'SELECT TblStockTakeItem.* '
      'FROM TblStockTakeItem '
      'WHERE tblStockTakeItem.StockTake_ID=:StockTake_ID')
    Left = 48
    Top = 183
    object qryStockTakeItemsStockTakeItem_ID: TAutoIncField
      FieldName = 'StockTakeItem_ID'
      ReadOnly = True
    end
    object qryStockTakeItemsStockTake_ID: TIntegerField
      FieldName = 'StockTake_ID'
    end
    object qryStockTakeItemsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryStockTakeItemsType_str: TWideStringField
      FieldName = 'Type_str'
      Size = 1
    end
    object qryStockTakeItemsOldQty_int: TIntegerField
      FieldName = 'OldQty_int'
    end
    object qryStockTakeItemsNewQty_int: TIntegerField
      FieldName = 'NewQty_int'
      OnChange = qryStockTakeItemsNewQty_intChange
    end
    object qryStockTakeItemsPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      OnChange = qryStockTakeItemsPackCost_monChange
      Precision = 19
    end
    object qryStockTakeItemsExpiryDate_dat: TDateTimeField
      FieldName = 'ExpiryDate_dat'
    end
    object qryStockTakeItemsUserName_str: TWideStringField
      FieldName = 'UserName_str'
      Size = 50
    end
    object qryStockTakeItemsLastUpDated_dat: TDateTimeField
      FieldName = 'LastUpDated_dat'
    end
    object qryStockTakeItemsLastUpdatedBy_int: TIntegerField
      FieldName = 'LastUpdatedBy_int'
    end
    object qryStockTakeItemsReason_str: TWideStringField
      FieldName = 'Reason_str'
      Size = 255
    end
    object qryStockTakeItemsICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 50
    end
    object qryStockTakeItemsNSN_str: TWideStringField
      FieldName = 'NSN_str'
      Size = 50
    end
    object qryStockTakeItemsECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 50
    end
    object qryStockTakeItemsExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object qryStockTakeItemsDiffQty_int: TIntegerField
      FieldName = 'DiffQty_int'
    end
    object qryStockTakeItemsBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object qryStockTakeItemsDescription_str: TWideStringField
      FieldName = 'Description_str'
      Size = 100
    end
    object qryStockTakeItemsProductCode_str: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object qryStockTakeItemsReceiptItem_ID: TIntegerField
      FieldName = 'ReceiptItem_ID'
    end
    object qryStockTakeItemsBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 50
    end
    object qryStockTakeItemsProductBatch_ID: TIntegerField
      FieldName = 'ProductBatch_ID'
    end
  end
  object dsStockTakeITems: TDataSource
    DataSet = qryStockTakeItems
    Left = 184
    Top = 183
  end
  object stp_StockTakeItems: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'stp_StockTakeItems;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Left = 184
    Top = 31
  end
  object tblProductPack: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = '@ProductCodeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT Cost_mon, ICN_str, NSN_str, ECN_str, ProductCode_str, Bin' +
        '_str'
      'FROM tblProductPackSize'
      'WHERE tblProductPackSize.ProductCode_ID=:@ProductCodeID')
    Left = 48
    Top = 231
    object tblProductPackCost_mon: TBCDField
      FieldName = 'Cost_mon'
      Precision = 19
    end
    object tblProductPackICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object tblProductPackNSN_str: TWideStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object tblProductPackECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object tblProductPackProductCode_str: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object tblProductPackBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 5
    end
  end
  object qryNumbering: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblSystemRecordNumbering')
    Left = 184
    Top = 231
  end
  object qryStockTakeCatalog1: TADOTable
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    TableName = 'TblStockTake'
    Left = 360
    Top = 39
    object qryStockTakeCatalog1SystemStore_ID: TIntegerField
      FieldName = 'SystemStore_ID'
    end
    object qryStockTakeCatalog1SystemStore_str: TStringField
      FieldName = 'SystemStore_str'
      Size = 100
    end
    object qryStockTakeCatalog1StockTake_str: TStringField
      FieldName = 'StockTake_str'
      Size = 50
    end
    object qryStockTakeCatalog1StockTake_dat: TDateTimeField
      FieldName = 'StockTake_dat'
    end
    object qryStockTakeCatalog1Charges_mon: TBCDField
      FieldName = 'Charges_mon'
      Precision = 19
    end
    object qryStockTakeCatalog1TotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryStockTakeCatalog1ItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryStockTakeCatalog1Remarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryStockTakeCatalog1ActivatedBy_str: TStringField
      FieldName = 'ActivatedBy_str'
      Size = 50
    end
    object qryStockTakeCatalog1Activated_bol: TBooleanField
      FieldName = 'Activated_bol'
    end
    object qryStockTakeCatalog1Activated_dat: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object qryStockTakeCatalog1LastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object qryStockTakeCatalog1Code_str: TStringField
      FieldName = 'Code_str'
      Size = 12
    end
    object qryStockTakeCatalog1LastUpdateBy_str: TStringField
      FieldName = 'LastUpdateBy_str'
      Size = 75
    end
    object qryStockTakeCatalog1LastUpdateBy_dbl: TIntegerField
      FieldName = 'LastUpdateBy_dbl'
    end
    object qryStockTakeCatalog1Completed_bol: TBooleanField
      FieldName = 'Completed_bol'
    end
    object qryStockTakeCatalog1CheckedOutBy_ID: TIntegerField
      FieldName = 'CheckedOutBy_ID'
    end
    object qryStockTakeCatalog1CheckedOutName_str: TWideStringField
      FieldName = 'CheckedOutName_str'
      Size = 50
    end
    object qryStockTakeCatalog1CheckedOut_bol: TBooleanField
      FieldName = 'CheckedOut_bol'
    end
    object qryStockTakeCatalog1CheckedOut_dat: TDateTimeField
      FieldName = 'CheckedOut_dat'
    end
    object qryStockTakeCatalog1StockTake_ID: TAutoIncField
      FieldName = 'StockTake_ID'
      ReadOnly = True
    end
    object qryStockTakeCatalog1VerifiedBy_str: TStringField
      FieldName = 'VerifiedBy_str'
      Size = 50
    end
    object qryStockTakeCatalog1StockCapturedBy_str: TStringField
      FieldName = 'StockCapturedBy_str'
      Size = 50
    end
    object qryStockTakeCatalog1StockCaptured_dat: TDateTimeField
      FieldName = 'StockCaptured_dat'
    end
    object qryStockTakeCatalog1VerifiedDate_Dat: TDateTimeField
      FieldName = 'VerifiedDate_Dat'
    end
    object qryStockTakeCatalog1Reason_str: TWideStringField
      FieldName = 'Reason_str'
      Size = 250
    end
  end
  object ActionList1: TActionList
    Left = 912
    Top = 31
    object atnAddSingleItem: TAction
      Caption = 'Add (Single Item) Ins'
      ShortCut = 45
      OnExecute = atnAddSingleItemExecute
    end
    object atnPostStockTake: TAction
      Caption = 'Post'
      Hint = 'Post'
      OnExecute = atnPostStockTakeExecute
    end
    object atnDeleteItem: TAction
      Caption = 'atnDeleteItem'
      Hint = 'Delete item'
      ShortCut = 46
      OnExecute = atnDeleteItemExecute
    end
    object atnItemCancel: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dsStockTakeITems
    end
    object atnItemFirst: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 0
      DataSource = dsStockTakeITems
    end
    object atnItemPrior: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Prior'
      Hint = 'Prior'
      ImageIndex = 1
      DataSource = dsStockTakeITems
    end
    object atnItemNext: TDataSetNext
      Category = 'Dataset'
      Caption = '&Next'
      Hint = 'Next'
      ImageIndex = 2
      DataSource = dsStockTakeITems
    end
    object atnItemLast: TDataSetLast
      Category = 'Dataset'
      Caption = '&Last'
      Hint = 'Last'
      ImageIndex = 3
      DataSource = dsStockTakeITems
    end
    object atnItemPost: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dsStockTakeITems
    end
    object atnStockTakeDelete: TAction
      Caption = 'Delete (Stocktake)'
      Hint = 'Delete Stocktake'
      OnExecute = atnStockTakeDeleteExecute
    end
    object atnSaveAndClose: TAction
      Caption = '&Close'
      Hint = 'Close'
      OnExecute = atnSaveAndCloseExecute
    end
    object atnAddAllEDLItems: TAction
      Caption = 'Add (All EDL products) Ctrl+E'
      ShortCut = 16453
      OnExecute = atnAddAllEDLItemsExecute
    end
    object atnAddGroup1Items: TAction
      Caption = 'Add (All Group1 products)'
      OnExecute = atnAddGroup1ItemsExecute
    end
    object atnAddGroup2Items: TAction
      Caption = 'Add (All Group2 products)'
      OnExecute = atnAddGroup2ItemsExecute
    end
    object atnAddBinLocationProducts: TAction
      Caption = 'Add (All Bin Location products)'
      OnExecute = atnAddBinLocationProductsExecute
    end
    object atnPrintStockTake: TAction
      Caption = 'Print (Stocktake)'
      Hint = 'Print Report'
      ShortCut = 16464
      OnExecute = atnPrintStockTakeExecute
    end
    object atnDeleteItemsOnStockTake: TAction
      Caption = 'Delete (All items)'
      ShortCut = 16468
      OnExecute = atnDeleteItemsOnStockTakeExecute
    end
    object atnPrint_Surpluses: TAction
      Caption = 'Print (Surplus Report)'
      Hint = 'Print Surplus Report'
      ShortCut = 16467
      OnExecute = atnPrint_SurplusesExecute
    end
    object atnPrint_Deficits: TAction
      Caption = 'Print (Deficit Report)'
      Hint = 'Print Deficit Report'
      ShortCut = 16452
      OnExecute = atnPrint_DeficitsExecute
    end
    object atnAddBatchItem: TAction
      Caption = 'Add Another Batch'
      ShortCut = 113
      OnExecute = atnAddBatchItemExecute
    end
    object atnPrintDifferencesReport: TAction
      Caption = 'Print (Anomalies Report)'
      ShortCut = 16449
      OnExecute = atnPrintDifferencesReportExecute
    end
    object atnRefreshStocktakeList: TAction
      Caption = 'atnRefreshStocktakeList'
      OnExecute = atnRefreshStocktakeListExecute
    end
    object atnPrint_SecondCountListReport: TAction
      Caption = 'Print (Second Count Report)'
      ShortCut = 16467
      OnExecute = atnPrint_SecondCountListReportExecute
    end
    object atnSelectBatch: TAction
      Caption = 'Add Batch Product Item'
      OnExecute = atnSelectBatchExecute
    end
    object atnPrintProblematicItems: TAction
      Caption = 'Check Items On Hold'
      OnExecute = atnPrintProblematicItemsExecute
    end
  end
  object AdoAddSingleItem: TADOCommand
    CommandText = 'strdprc_StockTakeItemsADD_Single;1'
    CommandType = cmdStoredProc
    Connection = AdoStockTakeConn
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdatedat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ProductCodeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BatchNo_str'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 50
        Value = Null
      end
      item
        Name = '@Expiry_dat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 576
    Top = 31
  end
  object tblSystemUsers: TADOTable
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    TableName = 'strdprc_SystemUsers'
    Left = 779
    Top = 35
    object tblSystemUsersUserID: TAutoIncField
      FieldName = 'UserID'
      ReadOnly = True
    end
    object tblSystemUsersDescription: TWideStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 66
    end
  end
  object ppDBStockTake: TppDBPipeline
    DataSource = dsadoStockTakeReport
    UserName = 'ppDBStockTake'
    Left = 344
    Top = 439
  end
  object stp_StockTakeITemsTotals: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockControlStockTakeItemsTotals;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 56
    Top = 303
  end
  object dsstp_StockTakeITemsTotals: TDataSource
    DataSet = stp_StockTakeITemsTotals
    Left = 197
    Top = 303
  end
  object adoAddInstitutionalEDL: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTake_AddInstitutionalEDLProducts;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 576
    Top = 103
  end
  object adoAddGroup1Products: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTake_AddGroup1Products;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Group1Str'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 576
    Top = 167
  end
  object adoAddGroup2Products: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTake_AddGroup2Products;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Group2Str'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 576
    Top = 247
  end
  object adoAddBinLocationProducts: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTake_AddBinLocationProducts;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@BinStr'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 20
        Value = Null
      end>
    Left = 576
    Top = 319
  end
  object adoDeleteAllItems: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTake_DeleteAllProductItems;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 576
    Top = 383
  end
  object adoStockTakeReport: TADOStoredProc
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    ProcedureName = 'strdprc_StockTakeReport;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 2
      end>
    Left = 56
    Top = 431
  end
  object dsadoStockTakeReport: TDataSource
    DataSet = adoStockTakeReport
    Left = 192
    Top = 431
  end
  object ppStockTake_Report: TppReport
    AutoStop = False
    DataPipeline = ppDBStockTake
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\RxStoreStd\Report\RequisitionPickList.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 464
    Top = 431
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBStockTake'
    object ppTitleBand2: TppTitleBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppDBText16: TppDBText
        UserName = 'DBText20'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 6757
        mmLeft = 3440
        mmTop = 8996
        mmWidth = 83344
        BandType = 1
      end
      object ppDBText17: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 5292
        mmLeft = 23019
        mmTop = 16669
        mmWidth = 55033
        BandType = 1
      end
      object ppDBText19: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_dat'
        DataPipeline = ppDBStockTake
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 5027
        mmLeft = 23019
        mmTop = 22490
        mmWidth = 55033
        BandType = 1
      end
      object ppLabel19: TppLabel
        UserName = 'Label29'
        HyperlinkColor = clBlue
        SaveOrder = 12
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Items'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 28046
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label30'
        HyperlinkColor = clBlue
        SaveOrder = 13
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 22490
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel29: TppLabel
        UserName = 'Label32'
        HyperlinkColor = clBlue
        SaveOrder = 14
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 16933
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel30: TppLabel
        UserName = 'Label33'
        HyperlinkColor = clBlue
        SaveOrder = 15
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 7408
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel31: TppLabel
        UserName = 'Label104'
        HyperlinkColor = clBlue
        SaveOrder = 11
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 11377
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel32: TppLabel
        UserName = 'Label35'
        HyperlinkColor = clBlue
        SaveOrder = 16
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 15346
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel33: TppLabel
        UserName = 'Label36'
        HyperlinkColor = clBlue
        SaveOrder = 17
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Captured By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 6879
        mmWidth = 16404
        BandType = 1
      end
      object ppDBText20: TppDBText
        UserName = 'DBText27'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCapturedBy_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 181505
        mmTop = 6879
        mmWidth = 29655
        BandType = 1
      end
      object ppDBText21: TppDBText
        UserName = 'DBText28'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCaptured_dat'
        DataPipeline = ppDBStockTake
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 181505
        mmTop = 10848
        mmWidth = 26607
        BandType = 1
      end
      object ppDBText24: TppDBText
        UserName = 'DBText33'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'City_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 20638
        mmWidth = 10795
        BandType = 1
      end
      object ppDBText25: TppDBText
        UserName = 'DBText34'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'Address1_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 16140
        mmWidth = 18521
        BandType = 1
      end
      object ppDBText26: TppDBText
        UserName = 'DBText36'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 11642
        mmWidth = 27390
        BandType = 1
      end
      object ppDBText27: TppDBText
        UserName = 'DBText59'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderCode_Str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 7673
        mmWidth = 27072
        BandType = 1
      end
      object ppLabel37: TppLabel
        UserName = 'Label40'
        HyperlinkColor = clBlue
        SaveOrder = 18
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Verified By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 15875
        mmWidth = 16404
        BandType = 1
      end
      object ppDBText28: TppDBText
        UserName = 'DBText60'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedBy_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 181505
        mmTop = 15346
        mmWidth = 19643
        BandType = 1
      end
      object ppDBText29: TppDBText
        UserName = 'DBText61'
        HyperlinkColor = clBlue
        SaveOrder = 10
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedDate_Dat'
        DataPipeline = ppDBStockTake
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 181505
        mmTop = 19844
        mmWidth = 23199
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        HyperlinkColor = clBlue
        SaveOrder = 19
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'ItemsNo_int'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 28575
        mmWidth = 42069
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 34396
        mmWidth = 281253
        BandType = 1
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 35719
        mmWidth = 281253
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Stocktaking'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7758
        mmLeft = 3440
        mmTop = 794
        mmWidth = 35785
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        SaveOrder = 20
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 228071
        mmTop = 529
        mmWidth = 49213
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 10848
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 19579
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Institution Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 1323
        mmWidth = 23019
        BandType = 1
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reason:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 28046
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText63: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Reason_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 28046
        mmWidth = 15790
        BandType = 1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLabel43: TppLabel
        UserName = 'Label64'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pack Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 164042
        mmTop = 529
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label67'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 50536
        mmTop = 529
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label68'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ICN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 4498
        mmTop = 529
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Old Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 178594
        mmTop = 529
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label14'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Batch Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 220134
        mmTop = 529
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label19'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 39688
        mmTop = 529
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label42'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ECN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 529
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Expiry Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 243417
        mmTop = 529
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'New Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 191823
        mmTop = 529
        mmWidth = 11906
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 6085
        mmWidth = 280723
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Value'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 275696
        mmTop = 529
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label131'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Diff.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 207169
        mmTop = 529
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText56: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ICN_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Anchors = [atLeft, atBottom]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3969
        mmLeft = 50536
        mmTop = 0
        mmWidth = 111390
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PackCost_mon'
        DataPipeline = ppDBStockTake
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3387
        mmLeft = 159946
        mmTop = 0
        mmWidth = 18119
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText24'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'OldQty_int'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3979
        mmLeft = 179123
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText46'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Bin_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4000
        mmLeft = 39423
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText51'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ECN_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4000
        mmLeft = 22225
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText17'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'NewQty_int'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3979
        mmLeft = 191294
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3754
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'BatchNumber_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3440
        mmLeft = 219869
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText5'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExtendedCost_mon'
        DataPipeline = ppDBStockTake
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3387
        mmLeft = 259387
        mmTop = 265
        mmWidth = 23982
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExpiryDate_dat'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3979
        mmLeft = 243417
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText118: TppDBText
        UserName = 'DBText118'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffQty_int'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3979
        mmLeft = 205317
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Style = psDash
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 4498
        mmWidth = 283369
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 49213
        BandType = 8
      end
      object ppLabel68: TppLabel
        UserName = 'Label20'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 14023
        BandType = 8
      end
      object ppDBText94: TppDBText
        UserName = 'DBText10'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 4763
        mmLeft = 76729
        mmTop = 1588
        mmWidth = 41540
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable10'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Color = 16383986
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 250561
        mmTop = 5027
        mmWidth = 33338
        BandType = 8
      end
      object ppDBText2: TppDBText
        UserName = 'DBText4'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'TotalCost_mon'
        DataPipeline = ppDBStockTake
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3387
        mmLeft = 265272
        mmTop = 794
        mmWidth = 18627
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 2910
        mmTop = 265
        mmWidth = 280723
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Save = True
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object stp_StockTakeMarkComplete: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTake_MarkComplete;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PostedBy'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 50
        Value = Null
      end>
    Left = 328
    Top = 175
  end
  object stpStockTakeEditHistory: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTakesEditHistory;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 328
    Top = 103
    object stpStockTakeEditHistoryStockTakeHistory_ID: TAutoIncField
      FieldName = 'StockTakeHistory_ID'
      ReadOnly = True
    end
    object stpStockTakeEditHistoryStockTake_ID: TIntegerField
      FieldName = 'StockTake_ID'
    end
    object stpStockTakeEditHistoryDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 255
    end
    object stpStockTakeEditHistoryUser_ID: TIntegerField
      FieldName = 'User_ID'
    end
    object stpStockTakeEditHistoryDate_dat: TDateTimeField
      FieldName = 'Date_dat'
    end
    object stpStockTakeEditHistoryProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object stpStockTakeEditHistoryStockTakeItem_ID: TIntegerField
      FieldName = 'StockTakeItem_ID'
    end
    object stpStockTakeEditHistoryType_str: TStringField
      FieldName = 'Type_str'
      Size = 25
    end
    object stpStockTakeEditHistoryUserName_str: TStringField
      FieldName = 'UserName_str'
      Size = 75
    end
    object stpStockTakeEditHistoryItem_ID: TIntegerField
      FieldName = 'Item_ID'
    end
  end
  object dsStockTakeHistory: TDataSource
    DataSet = stpStockTakeEditHistory
    Left = 456
    Top = 103
  end
  object dstblGroup2: TDataSource
    DataSet = tblGroup2
    Left = 912
    Top = 135
  end
  object tblGroup2: TADOTable
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    TableDirect = True
    TableName = 'TlkProductPackSizeGroup2'
    Left = 784
    Top = 135
    object tblGroup2Code_str: TWideStringField
      FieldName = 'Code_str'
      Size = 50
    end
    object tblGroup2Description_str: TWideStringField
      FieldName = 'Description_str'
      Size = 120
    end
  end
  object dstblGroup1: TDataSource
    DataSet = tblGroup1
    Left = 912
    Top = 207
  end
  object tblGroup1: TADOTable
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    TableDirect = True
    TableName = 'TlkProductPackSizeGroup1'
    Left = 784
    Top = 207
    object WideStringField1: TWideStringField
      FieldName = 'Code_str'
      Size = 50
    end
    object WideStringField2: TWideStringField
      FieldName = 'Description_str'
      Size = 120
    end
  end
  object dstblBinLocations: TDataSource
    DataSet = tblBinLocations
    Left = 912
    Top = 295
  end
  object qryProductBatchReceipts: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    DataSource = dsStockTakeITems
    Parameters = <
      item
        Name = 'ProductCode_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.TblReceiptItems.ReceiptItem_ID, dbo.TblReceiptItems.R' +
        'eceiptNo_ID,'
      
        '                      dbo.TblReceiptItems.BatchNumber_str, dbo.T' +
        'blReceiptItems.Expiry_dat, dbo.TblReceiptItems.QtyReceived_int, ' +
        'dbo.tblReceiptItems.BatchQty_int,'
      
        '                      dbo.TblReceiptItems.ProductCode_ID,  dbo.T' +
        'blReceiptItems.ShippingPack_int, PackCost_mon'
      'FROM         dbo.TblReceiptItems INNER JOIN'
      
        '                      dbo.tblProductPackSize ON dbo.TblReceiptIt' +
        'ems.ProductCode_ID = dbo.tblProductPackSize.ProductCode_ID'
      
        'WHERE      (dbo.tblProductPackSize.ProductCode_ID = :ProductCode' +
        '_ID) '
      '')
    Left = 784
    Top = 375
    object qryProductBatchReceiptsReceiptItem_ID: TAutoIncField
      FieldName = 'ReceiptItem_ID'
      ReadOnly = True
    end
    object qryProductBatchReceiptsBatchNumber_str: TStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object qryProductBatchReceiptsExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object qryProductBatchReceiptsQtyReceived_int: TIntegerField
      FieldName = 'QtyReceived_int'
    end
    object qryProductBatchReceiptsBatchQty_int: TIntegerField
      FieldName = 'BatchQty_int'
    end
    object qryProductBatchReceiptsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryProductBatchReceiptsShippingPack_int: TIntegerField
      FieldName = 'ShippingPack_int'
    end
    object qryProductBatchReceiptsReceiptNo_ID: TIntegerField
      FieldName = 'ReceiptNo_ID'
    end
    object qryProductBatchReceiptsPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
  end
  object dsBatchProducts: TDataSource
    DataSet = qryProductBatchReceipts
    Left = 920
    Top = 375
  end
  object ppDBSurpluses: TppDBPipeline
    DataSource = dsadoSurpluses
    UserName = 'ppDBSurpluses'
    Left = 344
    Top = 503
  end
  object adoSurpluses: TADOStoredProc
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    ProcedureName = 'strdprc_StockTake_SurplusReport;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Left = 56
    Top = 503
  end
  object dsadoSurpluses: TDataSource
    DataSet = adoSurpluses
    Left = 192
    Top = 503
  end
  object ppDBDeficits: TppDBPipeline
    DataSource = dsadoDeficits
    UserName = 'DBDeficits'
    Left = 344
    Top = 567
  end
  object ppDeficitsReport: TppReport
    AutoStop = False
    DataPipeline = ppDBDeficits
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Documents and Settings\smahlaba.SIFISOM\Desktop\Stocktake_Rep' +
      'orts\Deficit_report_v1.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 480
    Top = 566
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBDeficits'
    object ppTitleBand3: TppTitleBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppDBText39: TppDBText
        UserName = 'DBText20'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 6757
        mmLeft = 3440
        mmTop = 8996
        mmWidth = 83344
        BandType = 1
      end
      object ppDBText40: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 5292
        mmLeft = 23019
        mmTop = 16669
        mmWidth = 55033
        BandType = 1
      end
      object ppDBText41: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_dat'
        DataPipeline = ppDBDeficits
        DisplayFormat = 'ddd dd mmmm yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 5027
        mmLeft = 23019
        mmTop = 22490
        mmWidth = 55033
        BandType = 1
      end
      object ppLabel38: TppLabel
        UserName = 'Label29'
        HyperlinkColor = clBlue
        SaveOrder = 12
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Items'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 28046
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel39: TppLabel
        UserName = 'Label30'
        HyperlinkColor = clBlue
        SaveOrder = 13
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 22490
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel40: TppLabel
        UserName = 'Label32'
        HyperlinkColor = clBlue
        SaveOrder = 14
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Ref. Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 16933
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel41: TppLabel
        UserName = 'Label33'
        HyperlinkColor = clBlue
        SaveOrder = 15
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 7673
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel42: TppLabel
        UserName = 'Label104'
        HyperlinkColor = clBlue
        SaveOrder = 11
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 11642
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel44: TppLabel
        UserName = 'Label35'
        HyperlinkColor = clBlue
        SaveOrder = 16
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 15610
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel45: TppLabel
        UserName = 'Label36'
        HyperlinkColor = clBlue
        SaveOrder = 17
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Captured By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 7938
        mmWidth = 16404
        BandType = 1
      end
      object ppDBText42: TppDBText
        UserName = 'DBText27'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCapturedBy_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 184150
        mmTop = 7938
        mmWidth = 18923
        BandType = 1
      end
      object ppDBText43: TppDBText
        UserName = 'DBText28'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCaptured_dat'
        DataPipeline = ppDBDeficits
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 184150
        mmTop = 11906
        mmWidth = 14012
        BandType = 1
      end
      object ppDBText44: TppDBText
        UserName = 'DBText33'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'City_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 118534
        mmTop = 20902
        mmWidth = 13970
        BandType = 1
      end
      object ppDBText45: TppDBText
        UserName = 'DBText34'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'Address1_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 118534
        mmTop = 16404
        mmWidth = 9483
        BandType = 1
      end
      object ppDBText46: TppDBText
        UserName = 'DBText36'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 118534
        mmTop = 11906
        mmWidth = 22945
        BandType = 1
      end
      object ppDBText47: TppDBText
        UserName = 'DBText59'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderCode_Str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 118534
        mmTop = 7938
        mmWidth = 3217
        BandType = 1
      end
      object ppLabel46: TppLabel
        UserName = 'Label40'
        HyperlinkColor = clBlue
        SaveOrder = 18
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Verified By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 16933
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText48: TppDBText
        UserName = 'DBText60'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedBy_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 184150
        mmTop = 16404
        mmWidth = 29887
        BandType = 1
      end
      object ppDBText49: TppDBText
        UserName = 'DBText61'
        HyperlinkColor = clBlue
        SaveOrder = 10
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedDate_Dat'
        DataPipeline = ppDBDeficits
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4106
        mmLeft = 184150
        mmTop = 20902
        mmWidth = 14012
        BandType = 1
      end
      object ppLine7: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 34396
        mmWidth = 281253
        BandType = 1
      end
      object ppLine8: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 35719
        mmWidth = 281253
        BandType = 1
      end
      object ppLabel47: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Stocktaking Deficit Report'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7758
        mmLeft = 3440
        mmTop = 794
        mmWidth = 79203
        BandType = 1
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        SaveOrder = 19
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 229394
        mmTop = 2646
        mmWidth = 49213
        BandType = 1
      end
      object ppLabel48: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 11906
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel49: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 20638
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel50: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Institution Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 1588
        mmWidth = 23019
        BandType = 1
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reason:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 28046
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Reason_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3768
        mmLeft = 118534
        mmTop = 28046
        mmWidth = 14393
        BandType = 1
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        LookAhead = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3754
        mmLeft = 23283
        mmTop = 28310
        mmWidth = 17198
        BandType = 1
      end
    end
    object ppHeaderBand3: TppHeaderBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLabel51: TppLabel
        UserName = 'Label64'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pack Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 169334
        mmTop = 529
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label67'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 48948
        mmTop = 529
        mmWidth = 119592
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label68'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ICN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 4498
        mmTop = 529
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Old Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 184415
        mmTop = 529
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label19'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 529
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label42'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ECN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 21167
        mmTop = 529
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'New Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 196586
        mmTop = 529
        mmWidth = 11906
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 6085
        mmWidth = 280723
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Stock Value'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 264319
        mmTop = 529
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label7'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Batch Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 223573
        mmTop = 265
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Expiry Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 246857
        mmTop = 265
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label134'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Diff.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 210609
        mmTop = 529
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText51: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ICN_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Anchors = [atLeft, atBottom]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3969
        mmLeft = 48419
        mmTop = 0
        mmWidth = 120121
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PackCost_mon'
        DataPipeline = ppDBDeficits
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3969
        mmLeft = 169334
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText24'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'OldQty_int'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3969
        mmLeft = 185209
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText46'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Bin_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4000
        mmLeft = 37571
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText51'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ECN_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4000
        mmLeft = 21167
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText17'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'NewQty_int'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3969
        mmLeft = 196586
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3754
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffCost_mon'
        DataPipeline = ppDBDeficits
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3429
        mmLeft = 266341
        mmTop = 265
        mmWidth = 17822
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        HyperlinkColor = clBlue
        Anchors = [atTop, atRight]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'BatchNumber_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4004
        mmLeft = 223573
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExpiryDate_dat'
        DataPipeline = ppDBDeficits
        DisplayFormat = 'mm/dd/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3969
        mmLeft = 246328
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText120: TppDBText
        UserName = 'DBText120'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffQty_int'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3969
        mmLeft = 209021
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Style = psDash
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 4233
        mmWidth = 283369
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable6'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 49213
        BandType = 8
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc2'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffCost_mon'
        DataPipeline = ppDBDeficits
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 3387
        mmLeft = 259808
        mmTop = 529
        mmWidth = 24384
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'Line4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 794
        mmLeft = 2910
        mmTop = 0
        mmWidth = 280459
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable10'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Color = 16383986
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 259028
        mmTop = 5027
        mmWidth = 25135
        BandType = 8
      end
      object ppLabel93: TppLabel
        UserName = 'Label202'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 14023
        BandType = 8
      end
      object ppDBText50: TppDBText
        UserName = 'DBText102'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBDeficits
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDeficits'
        mmHeight = 4763
        mmLeft = 76729
        mmTop = 1588
        mmWidth = 41540
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Save = True
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList3: TppParameterList
    end
  end
  object adoDeficits: TADOStoredProc
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    ProcedureName = 'strdprc_StockTake_DeficitReport;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Left = 56
    Top = 567
  end
  object dsadoDeficits: TDataSource
    DataSet = adoDeficits
    Left = 192
    Top = 567
  end
  object ppSurplusesReport: TppReport
    AutoStop = False
    DataPipeline = ppDBSurpluses
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Documents and Settings\smahlaba.SIFISOM\Desktop\Stocktake_Rep' +
      'orts\Surplus_report_v1.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 480
    Top = 503
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBSurpluses'
    object ppTitleBand1: TppTitleBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText20'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 6757
        mmLeft = 3440
        mmTop = 8996
        mmWidth = 83344
        BandType = 1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 5292
        mmLeft = 23019
        mmTop = 16669
        mmWidth = 55033
        BandType = 1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_dat'
        DataPipeline = ppDBSurpluses
        DisplayFormat = 'ddd dd mmmm yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 5027
        mmLeft = 23019
        mmTop = 22490
        mmWidth = 55033
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label29'
        HyperlinkColor = clBlue
        SaveOrder = 12
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Items'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 28046
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label30'
        HyperlinkColor = clBlue
        SaveOrder = 13
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 22490
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label32'
        HyperlinkColor = clBlue
        SaveOrder = 14
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Ref. Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 16933
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label33'
        HyperlinkColor = clBlue
        SaveOrder = 15
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 7144
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label104'
        HyperlinkColor = clBlue
        SaveOrder = 11
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 11113
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label35'
        HyperlinkColor = clBlue
        SaveOrder = 16
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 15081
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label36'
        HyperlinkColor = clBlue
        SaveOrder = 17
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Captured By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166423
        mmTop = 7408
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText27'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCapturedBy_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 183092
        mmTop = 7408
        mmWidth = 29655
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText28'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCaptured_dat'
        DataPipeline = ppDBSurpluses
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 183092
        mmTop = 11377
        mmWidth = 26607
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText33'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'City_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 117475
        mmTop = 20373
        mmWidth = 10795
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText34'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'Address1_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 117475
        mmTop = 15875
        mmWidth = 18521
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText36'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 117475
        mmTop = 11377
        mmWidth = 27390
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText59'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderCode_Str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 117475
        mmTop = 6350
        mmWidth = 27072
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label40'
        HyperlinkColor = clBlue
        SaveOrder = 18
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Verified By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166423
        mmTop = 16404
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText60'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedBy_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 183092
        mmTop = 15875
        mmWidth = 19643
        BandType = 1
      end
      object ppDBText14: TppDBText
        UserName = 'DBText61'
        HyperlinkColor = clBlue
        SaveOrder = 10
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedDate_Dat'
        DataPipeline = ppDBSurpluses
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4022
        mmLeft = 183092
        mmTop = 20373
        mmWidth = 23199
        BandType = 1
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 34396
        mmWidth = 281253
        BandType = 1
      end
      object ppLine5: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 35719
        mmWidth = 281253
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Stocktaking Surplus Report'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7758
        mmLeft = 3440
        mmTop = 794
        mmWidth = 83207
        BandType = 1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        SaveOrder = 19
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 227542
        mmTop = 1058
        mmWidth = 49213
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166423
        mmTop = 11377
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel17: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166423
        mmTop = 20108
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel18: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Institution Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 1058
        mmWidth = 23019
        BandType = 1
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reason:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 28046
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Reason_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 3768
        mmLeft = 117475
        mmTop = 28046
        mmWidth = 14393
        BandType = 1
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 28310
        mmWidth = 17198
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label64'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pack Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 169598
        mmTop = 265
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label67'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 529
        mmWidth = 118534
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label68'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ICN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 4498
        mmTop = 529
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Old Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 184944
        mmTop = 265
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label19'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 39952
        mmTop = 529
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label42'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ECN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 529
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'New Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 197909
        mmTop = 265
        mmWidth = 12700
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 6085
        mmWidth = 280723
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Stock Value '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 265907
        mmTop = 265
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Batch Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 224632
        mmTop = 529
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Expiry Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 245269
        mmTop = 265
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Diff.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 211667
        mmTop = 265
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText18: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ICN_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Anchors = [atLeft, atBottom]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3969
        mmLeft = 50800
        mmTop = 0
        mmWidth = 117211
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PackCost_mon'
        DataPipeline = ppDBSurpluses
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3969
        mmLeft = 169598
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText24'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'OldQty_int'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3969
        mmLeft = 185738
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText46'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Bin_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4000
        mmLeft = 39688
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText51'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ECN_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4000
        mmLeft = 22225
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText17'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'NewQty_int'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3969
        mmLeft = 197909
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3754
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText68'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffCost_mon'
        DataPipeline = ppDBSurpluses
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3440
        mmLeft = 264584
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText4'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'BatchNumber_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3969
        mmLeft = 224367
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText701'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExpiryDate_dat'
        DataPipeline = ppDBSurpluses
        DisplayFormat = 'mm/dd/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4004
        mmLeft = 245269
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText119: TppDBText
        UserName = 'DBText119'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffQty_int'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3969
        mmLeft = 209815
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Style = psDash
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 4498
        mmWidth = 283369
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable6'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 49213
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable10'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Color = 16383986
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 260086
        mmTop = 5027
        mmWidth = 23548
        BandType = 8
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffCost_mon'
        DataPipeline = ppDBSurpluses
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 3440
        mmLeft = 248180
        mmTop = 794
        mmWidth = 35983
        BandType = 8
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 794
        mmLeft = 2910
        mmTop = 0
        mmWidth = 280459
        BandType = 8
      end
      object ppLabel87: TppLabel
        UserName = 'Label201'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 14023
        BandType = 8
      end
      object ppDBText15: TppDBText
        UserName = 'DBText101'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBSurpluses
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSurpluses'
        mmHeight = 4763
        mmLeft = 76729
        mmTop = 1588
        mmWidth = 41540
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Save = True
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object checkUnPosted_Req: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT tblRequisition.Activated_bol'
      'FROM tblRequisition'
      'WHERE tblRequisition.Activated_bol = 0')
    Left = 792
    Top = 495
  end
  object checkUnPosted_Rec: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT tblReceipt.Activated_bol'
      'FROM tblReceipt'
      'WHERE tblReceipt.Activated_bol = 0')
    Left = 792
    Top = 551
  end
  object adoAddBatchItem: TADOCommand
    CommandText = 'strdprc_StockTakeADD_SingleBatchItem;1'
    CommandType = cmdStoredProc
    Connection = AdoStockTakeConn
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@LastUpdatedat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ProductCodeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BatchNo_str'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 50
        Value = Null
      end
      item
        Name = '@Expiry_dat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@BatchQty'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ReceiptItem_ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 688
    Top = 31
  end
  object addBatchItem: TADOStoredProc
    Connection = AdoStockTakeConn
    ProcedureName = 'strdprc_StockTakeAddBatchItem;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ProductCodeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 792
    Top = 439
  end
  object qryStockTakeCatalog: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    AfterScroll = qryStockTakeCatalogAfterScroll
    Parameters = <
      item
        Name = 'StartDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'EndDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM tblStockTake'
      'Where StockTake_dat>=:StartDate'
      'AND StockTake_dat<=:EndDate'
      '')
    Left = 56
    Top = 82
    object qryStockTakeCatalogStockTake_ID: TAutoIncField
      FieldName = 'StockTake_ID'
      ReadOnly = True
    end
    object qryStockTakeCatalogSystemStore_ID: TIntegerField
      FieldName = 'SystemStore_ID'
    end
    object qryStockTakeCatalogSystemStore_str: TStringField
      FieldName = 'SystemStore_str'
      Size = 100
    end
    object qryStockTakeCatalogStockTake_str: TStringField
      FieldName = 'StockTake_str'
      Size = 50
    end
    object qryStockTakeCatalogStockTake_dat: TDateTimeField
      FieldName = 'StockTake_dat'
    end
    object qryStockTakeCatalogVerifiedBy_str: TStringField
      FieldName = 'VerifiedBy_str'
      Size = 50
    end
    object qryStockTakeCatalogVerifiedDate_Dat: TDateTimeField
      FieldName = 'VerifiedDate_Dat'
    end
    object qryStockTakeCatalogCharges_mon: TBCDField
      FieldName = 'Charges_mon'
      Precision = 19
    end
    object qryStockTakeCatalogTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryStockTakeCatalogItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryStockTakeCatalogRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryStockTakeCatalogActivatedBy_str: TStringField
      FieldName = 'ActivatedBy_str'
      Size = 50
    end
    object qryStockTakeCatalogActivated_bol: TBooleanField
      FieldName = 'Activated_bol'
    end
    object qryStockTakeCatalogActivated_dat: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object qryStockTakeCatalogStockCapturedBy_str: TStringField
      FieldName = 'StockCapturedBy_str'
      Size = 50
    end
    object qryStockTakeCatalogStockCaptured_dat: TDateTimeField
      FieldName = 'StockCaptured_dat'
    end
    object qryStockTakeCatalogLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object qryStockTakeCatalogCode_str: TStringField
      FieldName = 'Code_str'
      Size = 12
    end
    object qryStockTakeCatalogLastUpdateBy_str: TStringField
      FieldName = 'LastUpdateBy_str'
      Size = 75
    end
    object qryStockTakeCatalogLastUpdateBy_dbl: TIntegerField
      FieldName = 'LastUpdateBy_dbl'
    end
    object qryStockTakeCatalogCompleted_bol: TBooleanField
      FieldName = 'Completed_bol'
    end
    object qryStockTakeCatalogCheckedOutBy_ID: TIntegerField
      FieldName = 'CheckedOutBy_ID'
    end
    object qryStockTakeCatalogCheckedOutName_str: TWideStringField
      FieldName = 'CheckedOutName_str'
      Size = 50
    end
    object qryStockTakeCatalogCheckedOut_bol: TBooleanField
      FieldName = 'CheckedOut_bol'
    end
    object qryStockTakeCatalogCheckedOut_dat: TDateTimeField
      FieldName = 'CheckedOut_dat'
    end
    object qryStockTakeCatalogReason_str: TWideStringField
      FieldName = 'Reason_str'
      Size = 250
    end
  end
  object ppAnomaliesReport: TppReport
    AutoStop = False
    DataPipeline = ppDBAnomalies
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Documents and Settings\smahlaba.SIFISOM\Desktop\Stocktake_Rep' +
      'orts\Anomalies_Report_v1.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 488
    Top = 630
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBAnomalies'
    object ppTitleBand4: TppTitleBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppDBText71: TppDBText
        UserName = 'DBText20'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 6757
        mmLeft = 3440
        mmTop = 8996
        mmWidth = 83344
        BandType = 1
      end
      object ppDBText72: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 5292
        mmLeft = 23019
        mmTop = 16669
        mmWidth = 55033
        BandType = 1
      end
      object ppDBText73: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_dat'
        DataPipeline = ppDBAnomalies
        DisplayFormat = 'ddd dd mmmm yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 5027
        mmLeft = 23019
        mmTop = 22490
        mmWidth = 55033
        BandType = 1
      end
      object ppLabel70: TppLabel
        UserName = 'Label29'
        HyperlinkColor = clBlue
        SaveOrder = 12
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Items'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 28046
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel71: TppLabel
        UserName = 'Label30'
        HyperlinkColor = clBlue
        SaveOrder = 13
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 22490
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel72: TppLabel
        UserName = 'Label32'
        HyperlinkColor = clBlue
        SaveOrder = 14
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 16933
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel73: TppLabel
        UserName = 'Label33'
        HyperlinkColor = clBlue
        SaveOrder = 15
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 7408
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel74: TppLabel
        UserName = 'Label104'
        HyperlinkColor = clBlue
        SaveOrder = 11
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 11377
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel75: TppLabel
        UserName = 'Label35'
        HyperlinkColor = clBlue
        SaveOrder = 16
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 15346
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel76: TppLabel
        UserName = 'Label36'
        HyperlinkColor = clBlue
        SaveOrder = 17
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Captured By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 6879
        mmWidth = 16404
        BandType = 1
      end
      object ppDBText74: TppDBText
        UserName = 'DBText27'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCapturedBy_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 181505
        mmTop = 6879
        mmWidth = 29549
        BandType = 1
      end
      object ppDBText75: TppDBText
        UserName = 'DBText28'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'StockCaptured_dat'
        DataPipeline = ppDBAnomalies
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 181505
        mmTop = 10848
        mmWidth = 26543
        BandType = 1
      end
      object ppDBText76: TppDBText
        UserName = 'DBText33'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'City_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 118004
        mmTop = 20638
        mmWidth = 10753
        BandType = 1
      end
      object ppDBText77: TppDBText
        UserName = 'DBText34'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'Address1_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 118004
        mmTop = 16140
        mmWidth = 18457
        BandType = 1
      end
      object ppDBText78: TppDBText
        UserName = 'DBText36'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 118004
        mmTop = 11642
        mmWidth = 27305
        BandType = 1
      end
      object ppDBText79: TppDBText
        UserName = 'DBText59'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderCode_Str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 118004
        mmTop = 7673
        mmWidth = 26966
        BandType = 1
      end
      object ppLabel77: TppLabel
        UserName = 'Label40'
        HyperlinkColor = clBlue
        SaveOrder = 18
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Verified By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 15875
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText80: TppDBText
        UserName = 'DBText60'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedBy_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 181505
        mmTop = 15346
        mmWidth = 19558
        BandType = 1
      end
      object ppDBText81: TppDBText
        UserName = 'DBText61'
        HyperlinkColor = clBlue
        SaveOrder = 10
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16311512
        DataField = 'VerifiedDate_Dat'
        DataPipeline = ppDBAnomalies
        DisplayFormat = 'd-mmm-yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 181505
        mmTop = 19844
        mmWidth = 23114
        BandType = 1
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 34396
        mmWidth = 281253
        BandType = 1
      end
      object ppLine14: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 35719
        mmWidth = 281253
        BandType = 1
      end
      object ppLabel78: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Stocktaking Anomalies Report'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7673
        mmLeft = 3440
        mmTop = 794
        mmWidth = 94192
        BandType = 1
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        SaveOrder = 19
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 228071
        mmTop = 529
        mmWidth = 49213
        BandType = 1
      end
      object ppLabel79: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 10848
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel80: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 19579
        mmWidth = 6879
        BandType = 1
      end
      object ppLabel81: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Institution Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 1323
        mmWidth = 23019
        BandType = 1
      end
      object ppLabel82: TppLabel
        UserName = 'Label58'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reason:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 28046
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText83: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Reason_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4106
        mmLeft = 118004
        mmTop = 28046
        mmWidth = 15748
        BandType = 1
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        LookAhead = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4129
        mmLeft = 23019
        mmTop = 28575
        mmWidth = 17198
        BandType = 1
      end
    end
    object ppHeaderBand4: TppHeaderBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLabel83: TppLabel
        UserName = 'Label64'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pack Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 166952
        mmTop = 529
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label67'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 529
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label68'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ICN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 4498
        mmTop = 529
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label14'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Batch Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 230717
        mmTop = 529
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label19'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 39688
        mmTop = 529
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label42'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ECN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 529
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label84'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Expiry Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 264055
        mmTop = 529
        mmWidth = 18256
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 6085
        mmWidth = 280723
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label92'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'New Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 198967
        mmTop = 529
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'Label117'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Old Qty'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 183092
        mmTop = 529
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'Label135'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Diff.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 216165
        mmTop = 529
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText84: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ICN_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Anchors = [atLeft, atBottom]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3969
        mmLeft = 50536
        mmTop = 0
        mmWidth = 111390
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PackCost_mon'
        DataPipeline = ppDBAnomalies
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3429
        mmLeft = 162719
        mmTop = 0
        mmWidth = 18203
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText46'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Bin_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4000
        mmLeft = 39423
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'DBText51'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ECN_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4000
        mmLeft = 22225
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3754
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText70'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExpiryDate_dat'
        DataPipeline = ppDBAnomalies
        DisplayFormat = 'mm/dd/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3429
        mmLeft = 264055
        mmTop = 0
        mmWidth = 18965
        BandType = 4
      end
      object ppDBText91: TppDBText
        UserName = 'DBText31'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        Anchors = [atTop, atRight]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'BatchNumber_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3440
        mmLeft = 230717
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText112: TppDBText
        UserName = 'DBText112'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'OldQty_int'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clHighlight
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3979
        mmLeft = 183347
        mmTop = 0
        mmWidth = 12975
        BandType = 4
      end
      object ppDBText113: TppDBText
        UserName = 'DBText113'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'NewQty_int'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3979
        mmLeft = 198427
        mmTop = 0
        mmWidth = 14034
        BandType = 4
      end
      object ppDBText121: TppDBText
        UserName = 'DBText121'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DiffQty_int'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3969
        mmLeft = 214313
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Style = psDash
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 4233
        mmWidth = 283369
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable6'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 49213
        BandType = 8
      end
      object ppLabel94: TppLabel
        UserName = 'Label20'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 14023
        BandType = 8
      end
      object ppDBText95: TppDBText
        UserName = 'DBText10'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4763
        mmLeft = 76729
        mmTop = 1588
        mmWidth = 41540
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable10'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Color = 16383986
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 228865
        mmTop = 1323
        mmWidth = 37042
        BandType = 8
      end
      object ppLine16: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 2910
        mmTop = 265
        mmWidth = 280723
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Save = True
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
    end
    object raCodeModule4: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList4: TppParameterList
    end
  end
  object adoAnomalies: TADOStoredProc
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    ProcedureName = 'strdprc_StockTake_Anomalies;1'
    Parameters = <
      item
        Name = '@StockTakeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Left = 56
    Top = 631
  end
  object dsAnomalies: TDataSource
    DataSet = adoAnomalies
    Left = 184
    Top = 631
  end
  object ppDBAnomalies: TppDBPipeline
    DataSource = dsAnomalies
    UserName = 'ppDBAnomalies'
    Left = 336
    Top = 631
  end
  object ppSecondCountReport: TppReport
    AutoStop = False
    DataPipeline = ppDBAnomalies
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Documents and Settings\smahlaba.SIFISOM\Desktop\Stocktake_Rep' +
      'orts\Anomalies_Report_v1.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 600
    Top = 630
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBAnomalies'
    object ppTitleBand5: TppTitleBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppDBText82: TppDBText
        UserName = 'DBText20'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 6757
        mmLeft = 3440
        mmTop = 8996
        mmWidth = 83344
        BandType = 1
      end
      object ppDBText87: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBStockTake
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBStockTake'
        mmHeight = 5292
        mmLeft = 23019
        mmTop = 16669
        mmWidth = 55033
        BandType = 1
      end
      object ppDBText90: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_dat'
        DataPipeline = ppDBAnomalies
        DisplayFormat = 'ddd dd mmmm yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 5027
        mmLeft = 23019
        mmTop = 22490
        mmWidth = 55033
        BandType = 1
      end
      object ppLabel95: TppLabel
        UserName = 'Label29'
        HyperlinkColor = clBlue
        SaveOrder = 8
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Items'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 28046
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel96: TppLabel
        UserName = 'Label30'
        HyperlinkColor = clBlue
        SaveOrder = 9
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 22490
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel97: TppLabel
        UserName = 'Label32'
        HyperlinkColor = clBlue
        SaveOrder = 10
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4129
        mmLeft = 3440
        mmTop = 16933
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel98: TppLabel
        UserName = 'Label33'
        HyperlinkColor = clBlue
        SaveOrder = 11
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 7408
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel99: TppLabel
        UserName = 'Label104'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 11377
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel100: TppLabel
        UserName = 'Label35'
        HyperlinkColor = clBlue
        SaveOrder = 12
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 15346
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText97: TppDBText
        UserName = 'DBText33'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'City_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 20638
        mmWidth = 10795
        BandType = 1
      end
      object ppDBText98: TppDBText
        UserName = 'DBText34'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'Address1_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 16140
        mmWidth = 18521
        BandType = 1
      end
      object ppDBText99: TppDBText
        UserName = 'DBText36'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderName_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 11642
        mmWidth = 27390
        BandType = 1
      end
      object ppDBText100: TppDBText
        UserName = 'DBText59'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'DemanderCode_Str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 7673
        mmWidth = 27072
        BandType = 1
      end
      object ppLine17: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 34396
        mmWidth = 281253
        BandType = 1
      end
      object ppLine18: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2910
        mmTop = 35719
        mmWidth = 281253
        BandType = 1
      end
      object ppLabel103: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Second Count Report'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7535
        mmLeft = 3440
        mmTop = 794
        mmWidth = 65320
        BandType = 1
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        SaveOrder = 13
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 228071
        mmTop = 529
        mmWidth = 49213
        BandType = 1
      end
      object ppLabel106: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Institution Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 1323
        mmWidth = 23019
        BandType = 1
      end
      object ppLabel107: TppLabel
        UserName = 'Label58'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reason:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 28046
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText103: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Reason_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4022
        mmLeft = 118004
        mmTop = 28046
        mmWidth = 15790
        BandType = 1
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        LookAhead = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4129
        mmLeft = 23019
        mmTop = 28575
        mmWidth = 17198
        BandType = 1
      end
    end
    object ppHeaderBand5: TppHeaderBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLabel108: TppLabel
        UserName = 'Label64'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Pack Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4498
        mmLeft = 173832
        mmTop = 529
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'Label67'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 529
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label68'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ICN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 4498
        mmTop = 529
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label14'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Batch Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 189442
        mmTop = 529
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label19'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 39688
        mmTop = 529
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label42'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ECN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 529
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'Label84'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Expiry Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 223044
        mmTop = 529
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '2nd Count'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 4498
        mmLeft = 247650
        mmTop = 529
        mmWidth = 14817
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 6085
        mmWidth = 280723
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText104: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ICN_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Anchors = [atLeft, atBottom]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3969
        mmLeft = 50536
        mmTop = 0
        mmWidth = 117740
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PackCost_mon'
        DataPipeline = ppDBAnomalies
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3387
        mmLeft = 169682
        mmTop = 0
        mmWidth = 18119
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'DBText46'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Bin_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4000
        mmLeft = 39423
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'DBText51'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ECN_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4000
        mmLeft = 22225
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3754
        mmLeft = 0
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText109: TppDBText
        UserName = 'DBText70'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExpiryDate_dat'
        DataPipeline = ppDBAnomalies
        DisplayFormat = 'mm/dd/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3387
        mmLeft = 223044
        mmTop = 0
        mmWidth = 18923
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape1'
        mmHeight = 4498
        mmLeft = 247121
        mmTop = 0
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText110: TppDBText
        UserName = 'DBText31'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        Anchors = [atTop, atRight]
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'BatchNumber_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 3378
        mmLeft = 189442
        mmTop = 0
        mmWidth = 32544
        BandType = 4
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Style = psDash
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 4233
        mmWidth = 241300
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape2'
        mmHeight = 5821
        mmLeft = 2646
        mmTop = 7144
        mmWidth = 280459
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable6'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 49213
        BandType = 8
      end
      object ppLabel116: TppLabel
        UserName = 'Label20'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 14023
        BandType = 8
      end
      object ppDBText111: TppDBText
        UserName = 'DBText10'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = 16383986
        DataField = 'StockTake_str'
        DataPipeline = ppDBAnomalies
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAnomalies'
        mmHeight = 4763
        mmLeft = 76729
        mmTop = 1588
        mmWidth = 41540
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'SystemVariable10'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Color = 16383986
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 241830
        mmTop = 1323
        mmWidth = 37042
        BandType = 8
      end
      object ppLine20: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 2910
        mmTop = 265
        mmWidth = 280723
        BandType = 8
      end
      object ppLabel101: TppLabel
        UserName = 'Label36'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Captured By:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 7408
        mmWidth = 16140
        BandType = 8
      end
      object ppLabel102: TppLabel
        UserName = 'Label40'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Verified By'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148696
        mmTop = 7408
        mmWidth = 15081
        BandType = 8
      end
      object ppLabel104: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 77258
        mmTop = 7408
        mmWidth = 7726
        BandType = 8
      end
      object ppLabel105: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 221192
        mmTop = 7408
        mmWidth = 7726
        BandType = 8
      end
      object ppLabel118: TppLabel
        UserName = 'Label118'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '........................................................'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 20373
        mmTop = 7673
        mmWidth = 45043
        BandType = 8
      end
      object ppLabel119: TppLabel
        UserName = 'Label119'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '........................................'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 7673
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel120: TppLabel
        UserName = 'Label120'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '.........................................................'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 164307
        mmTop = 7673
        mmWidth = 45847
        BandType = 8
      end
      object ppLabel121: TppLabel
        UserName = 'Label121'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '........................................'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 228865
        mmTop = 7673
        mmWidth = 32279
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      Save = True
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
    end
    object raCodeModule5: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList5: TppParameterList
    end
  end
  object ADOQuery1: TADOQuery
    Connection = AdoStockTakeConn
    Parameters = <
      item
        Name = '@StockTakeID'
        DataType = ftString
        Size = 1
        Value = '1'
      end
      item
        Name = '@BatchQty'
        DataType = ftString
        Size = 1
        Value = '0'
      end
      item
        Name = '@Batchnumber_str'
        DataType = ftString
        Size = 4
        Value = 'eeee'
      end
      item
        Name = '@Expiry_dat'
        DataType = ftDateTime
        Size = 10
        Value = Null
      end
      item
        Name = '@ReceiptItem_ID'
        DataType = ftString
        Size = 1
        Value = '1'
      end
      item
        Name = '@DiffQty'
        DataType = ftString
        Size = 1
        Value = '0'
      end
      item
        Name = '@ProductCodeID'
        DataType = ftString
        Size = 3
        Value = '123'
      end>
    SQL.Strings = (
      
        'INSERT INTO TblStockTakeItem (StockTake_ID, ProductCode_ID, Last' +
        'UpDated_dat, PackCost_mon, NSN_str, ICN_str, ECN_str, ProductCod' +
        'e_str, newqty_int, Description_str, OldQty_int, Bin_str, Batchnu' +
        'mber_str, ExpiryDate_dat, ReceiptItem_ID, DiffQty_int)'
      '('
      
        'SELECT :@StockTakeID, TblProductPackSize.ProductCode_ID, GetDate' +
        '(), TblProductPackSize.Cost_mon, TblProductPackSize.NSN_str, Tbl' +
        'ProductPackSize.ICN_str, TblProductPackSize.ECN_str, TblProductP' +
        'ackSize.ProductCode_str, 0, TblProductPackSize.Description_str, ' +
        ':@BatchQty, TblProductPackSize.Bin_str, :@Batchnumber_str, :@Exp' +
        'iry_dat, :@ReceiptItem_ID, :@DiffQty'
      'FROM TblProductPackSize'
      'WHERE ((TblProductPackSize.ProductCode_ID=:@ProductCodeID))'
      ')')
    Left = 320
    Top = 239
  end
  object qryCheckAllItems: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StocktakeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 38
      end>
    SQL.Strings = (
      
        'select distinct tblrequisitionitems.productcode_id, tblrequisiti' +
        'onitems.icn_str, '
      
        ' tblrequisitionitems.ecn_str, tblproductpacksize.form_str, tblre' +
        'quisitionitems.nsn_str,'
      
        ' tblproductpacksize.packdescription_str, tblproductpacksize.supp' +
        'lement_str, '
      
        ' tblproductpacksize.group1_str, tblproductpacksize.group2_str, t' +
        'blproductpacksize.bin_str, tblrequisition.requisition_str '
      '  '
      'from tblrequisitionitems'
      ''
      
        ' inner join tblrequisition on tblrequisitionitems.requisition_id' +
        ' = tblrequisition.requisition_ID '
      
        ' inner join tblStocktakeItem on tblStocktakeItem.Productcode_ID ' +
        '= tblrequisitionitems.Productcode_ID'
      
        ' inner join tblproductpacksize on tblproductpacksize.productcode' +
        '_id = tblrequisitionitems.Productcode_ID'
      ''
      
        'where  tblrequisition.activated_bol = 0 and tblStocktakeItem.Sto' +
        'cktake_ID = :StocktakeID'
      'and tblrequisitionitems.QtyIssued_int > 0')
    Left = 752
    Top = 623
    object qryCheckAllItemsproductcode_id: TIntegerField
      FieldName = 'productcode_id'
    end
    object qryCheckAllItemsicn_str: TStringField
      FieldName = 'icn_str'
      Size = 14
    end
    object qryCheckAllItemsecn_str: TStringField
      FieldName = 'ecn_str'
      Size = 14
    end
    object qryCheckAllItemsform_str: TWideStringField
      FieldName = 'form_str'
      Size = 30
    end
    object qryCheckAllItemsnsn_str: TStringField
      FieldName = 'nsn_str'
      Size = 14
    end
    object qryCheckAllItemspackdescription_str: TWideStringField
      FieldName = 'packdescription_str'
      Size = 150
    end
    object qryCheckAllItemssupplement_str: TWideStringField
      FieldName = 'supplement_str'
      Size = 100
    end
    object qryCheckAllItemsgroup1_str: TWideStringField
      FieldName = 'group1_str'
      Size = 50
    end
    object qryCheckAllItemsgroup2_str: TWideStringField
      FieldName = 'group2_str'
      Size = 50
    end
    object qryCheckAllItemsbin_str: TWideStringField
      FieldName = 'bin_str'
      Size = 5
    end
    object qryCheckAllItemsrequisition_str: TStringField
      FieldName = 'requisition_str'
      Size = 50
    end
  end
  object ppDBcheckAllItems: TppDBPipeline
    DataSource = dsqryCheckAllItems
    UserName = 'DBcheckAllItems'
    Left = 968
    Top = 624
  end
  object dsqryCheckAllItems: TDataSource
    DataSet = qryCheckAllItems
    Left = 848
    Top = 623
  end
  object tblProductBatch: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    BeforePost = tblProductBatchBeforePost
    Parameters = <
      item
        Name = '@ProductCodeID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT QtyonHand_int, Price_mon, Bin_str, ShippingPack_int, Batc' +
        'hNumber_str, Expiry_dat, ProductBatch_ID, ProductCode_ID'
      'FROM tblProductBatch'
      'WHERE tblProductBatch.ProductCode_ID=:@ProductCodeID')
    Left = 200
    Top = 367
    object tblProductBatchQtyonHand_int: TIntegerField
      FieldName = 'QtyonHand_int'
    end
    object tblProductBatchPrice_mon: TBCDField
      FieldName = 'Price_mon'
      Precision = 19
    end
    object tblProductBatchBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 50
    end
    object tblProductBatchShippingPack_int: TIntegerField
      FieldName = 'ShippingPack_int'
    end
    object tblProductBatchBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
    end
    object tblProductBatchExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object tblProductBatchProductBatch_ID: TAutoIncField
      FieldName = 'ProductBatch_ID'
      ReadOnly = True
    end
    object tblProductBatchProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
  end
  object tblBinLocations: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Code_str, Description_str FROM tblBin'
      'ORDER BY Code_str')
    Left = 776
    Top = 295
  end
  object qryTotalOnHand: TADOQuery
    Tag = 1
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductCode_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT TblProductPackSize.ProductCode_ID, TblProductPackSize.Cos' +
        't_mon, ISNULL(view_ProductQtyOnHand.TotalQtyOnHand_int , 0) AS Q' +
        'tyOnHand_int, TblProductPackSize.NSN_str, TblProductPackSize.ICN' +
        '_str, TblProductPackSize.ECN_str, TblProductPackSize.QtyOnOrder_' +
        'int, TblProductPackSize.ProductCode_Str, TblProductPackSize.QtyO' +
        'nRequest_int, TblProductPackSize.QtyOnHold_int '
      
        'FROM TblProductPackSize LEFT OUTER JOIN view_ProductQtyOnHand ON' +
        ' view_ProductQtyOnHand.ProductCode_ID = TblProductPackSize.Produ' +
        'ctCode_ID'
      'WHERE (((TblProductPackSize.ProductCode_ID)=:ProductCode_ID));')
    Left = 437
    Top = 249
  end
  object qryStockTakeWorker: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    BeforePost = qryStockTakeWorkerBeforePost
    AfterScroll = qryStockTakeWorkerAfterScroll
    Parameters = <
      item
        Name = 'Stocktake_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM tblStockTake'
      'WHERE StockTake_ID=:Stocktake_ID')
    Left = 56
    Top = 135
    object qryStockTakeWorkerStockTake_ID: TAutoIncField
      FieldName = 'StockTake_ID'
      ReadOnly = True
    end
    object qryStockTakeWorkerSystemStore_ID: TIntegerField
      FieldName = 'SystemStore_ID'
    end
    object qryStockTakeWorkerSystemStore_str: TStringField
      FieldName = 'SystemStore_str'
      Size = 100
    end
    object qryStockTakeWorkerStockTake_str: TStringField
      FieldName = 'StockTake_str'
      Size = 50
    end
    object qryStockTakeWorkerStockTake_dat: TDateTimeField
      FieldName = 'StockTake_dat'
    end
    object qryStockTakeWorkerVerifiedBy_str: TStringField
      FieldName = 'VerifiedBy_str'
      Size = 50
    end
    object qryStockTakeWorkerCharges_mon: TBCDField
      FieldName = 'Charges_mon'
      Precision = 19
    end
    object qryStockTakeWorkerTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryStockTakeWorkerItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryStockTakeWorkerRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryStockTakeWorkerActivatedBy_str: TStringField
      FieldName = 'ActivatedBy_str'
      Size = 50
    end
    object qryStockTakeWorkerActivated_bol: TBooleanField
      FieldName = 'Activated_bol'
    end
    object qryStockTakeWorkerActivated_dat: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object qryStockTakeWorkerStockCapturedBy_str: TStringField
      FieldName = 'StockCapturedBy_str'
      Size = 50
    end
    object qryStockTakeWorkerLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object qryStockTakeWorkerCode_str: TStringField
      FieldName = 'Code_str'
      Size = 12
    end
    object qryStockTakeWorkerLastUpdateBy_str: TStringField
      FieldName = 'LastUpdateBy_str'
      Size = 75
    end
    object qryStockTakeWorkerLastUpdateBy_dbl: TIntegerField
      FieldName = 'LastUpdateBy_dbl'
    end
    object qryStockTakeWorkerCompleted_bol: TBooleanField
      FieldName = 'Completed_bol'
    end
    object qryStockTakeWorkerCheckedOutBy_ID: TIntegerField
      FieldName = 'CheckedOutBy_ID'
    end
    object qryStockTakeWorkerCheckedOutName_str: TWideStringField
      FieldName = 'CheckedOutName_str'
      Size = 50
    end
    object qryStockTakeWorkerCheckedOut_bol: TBooleanField
      FieldName = 'CheckedOut_bol'
    end
    object qryStockTakeWorkerCheckedOut_dat: TDateTimeField
      FieldName = 'CheckedOut_dat'
    end
    object qryStockTakeWorkerVerifiedDate_Dat: TDateTimeField
      FieldName = 'VerifiedDate_Dat'
    end
    object qryStockTakeWorkerStockCaptured_dat: TDateTimeField
      FieldName = 'StockCaptured_dat'
    end
    object qryStockTakeWorkerReason_str: TWideStringField
      FieldName = 'Reason_str'
      Size = 250
    end
  end
  object dsStocktakeWorker: TDataSource
    DataSet = qryStockTakeWorker
    Left = 184
    Top = 135
  end
  object qryIsRecordLocked: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Stocktake_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CheckedOut_bol '
      'FROM tblStocktake'
      'WHERE Stocktake_ID=:Stocktake_ID')
    Left = 912
    Top = 87
  end
  object stpRemoveZeroBatches: TADOQuery
    Connection = AdoStockTakeConn
    Parameters = <>
    SQL.Strings = (
      'DELETE FROM tblProductBatch'
      'WHERE QtyOnHand_int < 1')
    Left = 848
    Top = 695
  end
  object checkUnPosted_Ret: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT tblReturns.Posted_bol'
      'FROM tblReturns'
      'WHERE tblReturns.Posted_bol = 0')
    Left = 936
    Top = 552
  end
  object checkUnPosted_RetDemander: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT tblCredit.Posted_bol'
      'FROM tblCredit'
      'WHERE tblCredit.Posted_bol = 0')
    Left = 936
    Top = 446
  end
  object MainMenu1: TMainMenu
    Left = 1024
    Top = 17
  end
  object ppStockItemsOnHoldReceipt: TppDBPipeline
    DataSource = dsStockItemsOnHoldReceipt
    UserName = 'ppStockItemsOnHoldReceipt'
    Left = 224
    Top = 695
  end
  object ppStockItemsOnHoldSupllier: TppDBPipeline
    DataSource = dsStockItemsOnHoldSupllier
    UserName = 'ppStockItemsOnHoldSupllier'
    Left = 592
    Top = 515
  end
  object ppStockItemsOnHoldDemander: TppDBPipeline
    DataSource = dsStockItemsOnHoldDemander
    UserName = 'ppStockItemsOnHoldDemander'
    Left = 416
    Top = 708
  end
  object dsStockItemsOnHoldReceipt: TDataSource
    DataSet = qryStockItemsOnHoldReceipt
    Left = 616
    Top = 759
  end
  object dsStockItemsOnHoldSupllier: TDataSource
    DataSet = qryStockItemsOnHoldSupllier
    Left = 760
    Top = 759
  end
  object dsStockItemsOnHoldDemander: TDataSource
    DataSet = qryStockItemsOnHoldDemander
    Left = 928
    Top = 759
  end
  object qryStockItemsOnHoldReceipt: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StocktakeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 38
      end>
    SQL.Strings = (
      
        'SELECT  TblReceiptItems.productcode_id, TblReceiptItems.icn_str,' +
        ' '
      
        'TblReceiptItems.ecn_str, tblproductpacksize.form_str, TblReceipt' +
        'Items.nsn_str,'
      
        'tblproductpacksize.packdescription_str, tblproductpacksize.suppl' +
        'ement_str, '
      
        'tblproductpacksize.group1_str, tblproductpacksize.group2_str, tb' +
        'lproductpacksize.bin_str, TblReceipt.ReceiptNo_str, TblReceipt.R' +
        'eceiptDate_dat '
      ' '
      'FROM  TblReceipt INNER JOIN'
      
        'TblReceiptItems ON TblReceipt.ReceiptNo_ID = TblReceiptItems.Rec' +
        'eiptNo_ID'
      
        'inner join tblStocktakeItem on tblStocktakeItem.Productcode_ID =' +
        ' TblReceiptItems.Productcode_ID'
      
        'inner join tblproductpacksize on tblproductpacksize.productcode_' +
        'id = TblReceiptItems.Productcode_ID'
      ''
      
        'WHERE (TblReceipt.Activated_bol = 0) AND (TblReceiptItems.QtyRec' +
        'eived_int > 0) AND tblStocktakeItem.Stocktake_ID = :StocktakeID')
    Left = 56
    Top = 379
    object qryStockItemsOnHoldReceiptproductcode_id: TIntegerField
      FieldName = 'productcode_id'
    end
    object qryStockItemsOnHoldReceipticn_str: TStringField
      FieldName = 'icn_str'
      Size = 14
    end
    object qryStockItemsOnHoldReceiptecn_str: TStringField
      FieldName = 'ecn_str'
      Size = 14
    end
    object qryStockItemsOnHoldReceiptform_str: TWideStringField
      FieldName = 'form_str'
      Size = 30
    end
    object qryStockItemsOnHoldReceiptnsn_str: TStringField
      FieldName = 'nsn_str'
      Size = 14
    end
    object qryStockItemsOnHoldReceiptpackdescription_str: TWideStringField
      FieldName = 'packdescription_str'
      Size = 150
    end
    object qryStockItemsOnHoldReceiptsupplement_str: TWideStringField
      FieldName = 'supplement_str'
      Size = 100
    end
    object qryStockItemsOnHoldReceiptgroup1_str: TWideStringField
      FieldName = 'group1_str'
      Size = 50
    end
    object qryStockItemsOnHoldReceiptgroup2_str: TWideStringField
      FieldName = 'group2_str'
      Size = 50
    end
    object qryStockItemsOnHoldReceiptbin_str: TWideStringField
      FieldName = 'bin_str'
    end
    object qryStockItemsOnHoldReceiptReceiptNo_str: TStringField
      FieldName = 'ReceiptNo_str'
      Size = 50
    end
    object qryStockItemsOnHoldReceiptReceiptDate_dat: TDateTimeField
      FieldName = 'ReceiptDate_dat'
    end
  end
  object qryStockItemsOnHoldSupllier: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StocktakeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 38
      end>
    SQL.Strings = (
      
        'SELECT     TblReturnsItems.productcode_id, TblReturnsItems.icn_s' +
        'tr, '
      
        'TblReturnsItems.ecn_str, tblproductpacksize.form_str, TblReturns' +
        'Items.nsn_str,'
      
        ' tblproductpacksize.packdescription_str, tblproductpacksize.supp' +
        'lement_str, '
      
        ' tblproductpacksize.group1_str, tblproductpacksize.group2_str, t' +
        'blproductpacksize.bin_str, TblReturns.ReturnsNo_str, TblReturns.' +
        'Returns_dat, TblReturns.ItemsNo_int'
      'FROM         TblReturns INNER JOIN'
      
        '                      TblReturnsItems ON TblReturns.Returns_ID =' +
        ' TblReturnsItems.Returns_ID'
      
        'inner join tblStocktakeItem on tblStocktakeItem.Productcode_ID =' +
        ' TblReturnsItems.Productcode_ID'
      
        'inner join tblproductpacksize on tblproductpacksize.productcode_' +
        'id = TblReturnsItems.Productcode_ID'
      ''
      
        'WHERE     (TblReturns.Posted_bol = 0) AND (TblReturnsItems.QtyRe' +
        'turned_int > 0) AND tblStocktakeItem.Stocktake_ID = :StocktakeID')
    Left = 72
    Top = 768
    object qryStockItemsOnHoldSupllierproductcode_id: TIntegerField
      FieldName = 'productcode_id'
    end
    object qryStockItemsOnHoldSuplliericn_str: TWideStringField
      FieldName = 'icn_str'
      Size = 50
    end
    object qryStockItemsOnHoldSupllierecn_str: TWideStringField
      FieldName = 'ecn_str'
      Size = 50
    end
    object qryStockItemsOnHoldSupllierform_str: TWideStringField
      FieldName = 'form_str'
      Size = 30
    end
    object qryStockItemsOnHoldSuplliernsn_str: TWideStringField
      FieldName = 'nsn_str'
      Size = 50
    end
    object qryStockItemsOnHoldSupllierpackdescription_str: TWideStringField
      FieldName = 'packdescription_str'
      Size = 150
    end
    object qryStockItemsOnHoldSuplliersupplement_str: TWideStringField
      FieldName = 'supplement_str'
      Size = 100
    end
    object qryStockItemsOnHoldSuplliergroup1_str: TWideStringField
      FieldName = 'group1_str'
      Size = 50
    end
    object qryStockItemsOnHoldSuplliergroup2_str: TWideStringField
      FieldName = 'group2_str'
      Size = 50
    end
    object qryStockItemsOnHoldSupllierbin_str: TWideStringField
      FieldName = 'bin_str'
    end
    object qryStockItemsOnHoldSupllierReturnsNo_str: TStringField
      FieldName = 'ReturnsNo_str'
      Size = 50
    end
    object qryStockItemsOnHoldSupllierReturns_dat: TDateTimeField
      FieldName = 'Returns_dat'
    end
    object qryStockItemsOnHoldSupllierItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
  end
  object qryStockItemsOnHoldDemander: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StocktakeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 38
      end>
    SQL.Strings = (
      
        'SELECT     TblCreditItems.productcode_id, TblCreditItems.icn_str' +
        ', '
      
        'TblCreditItems.ecn_str, tblproductpacksize.form_str, TblCreditIt' +
        'ems.nsn_str,'
      
        ' tblproductpacksize.packdescription_str, tblproductpacksize.supp' +
        'lement_str, '
      
        ' tblproductpacksize.group1_str, tblproductpacksize.group2_str, t' +
        'blproductpacksize.bin_str, TblCredit.Credit_str, TblCredit.Credi' +
        't_dat'
      'FROM         TblCredit INNER JOIN'
      
        '                      TblCreditItems ON TblCredit.Credit_ID = Tb' +
        'lCreditItems.Credit_ID'
      
        'inner join tblStocktakeItem on tblStocktakeItem.Productcode_ID =' +
        ' TblCreditItems.Productcode_ID'
      
        'inner join tblproductpacksize on tblproductpacksize.productcode_' +
        'id = TblCreditItems.Productcode_ID'
      
        'WHERE     (TblCredit.Posted_bol = 0) AND (TblCreditItems.QtyCred' +
        'it_int > 0) AND tblStocktakeItem.Stocktake_ID = :StocktakeID')
    Left = 72
    Top = 693
    object qryStockItemsOnHoldDemanderproductcode_id: TIntegerField
      FieldName = 'productcode_id'
    end
    object qryStockItemsOnHoldDemandericn_str: TStringField
      FieldName = 'icn_str'
      Size = 14
    end
    object qryStockItemsOnHoldDemanderecn_str: TStringField
      FieldName = 'ecn_str'
      Size = 14
    end
    object qryStockItemsOnHoldDemanderform_str: TWideStringField
      FieldName = 'form_str'
      Size = 30
    end
    object qryStockItemsOnHoldDemandernsn_str: TStringField
      FieldName = 'nsn_str'
      Size = 14
    end
    object qryStockItemsOnHoldDemanderpackdescription_str: TWideStringField
      FieldName = 'packdescription_str'
      Size = 150
    end
    object qryStockItemsOnHoldDemandersupplement_str: TWideStringField
      FieldName = 'supplement_str'
      Size = 100
    end
    object qryStockItemsOnHoldDemandergroup1_str: TWideStringField
      FieldName = 'group1_str'
      Size = 50
    end
    object qryStockItemsOnHoldDemandergroup2_str: TWideStringField
      FieldName = 'group2_str'
      Size = 50
    end
    object qryStockItemsOnHoldDemanderbin_str: TWideStringField
      FieldName = 'bin_str'
    end
    object qryStockItemsOnHoldDemanderCredit_str: TStringField
      FieldName = 'Credit_str'
      Size = 50
    end
    object qryStockItemsOnHoldDemanderCredit_dat: TDateTimeField
      FieldName = 'Credit_dat'
    end
  end
  object ppqryStockItemsOnHoldStockTake: TppDBPipeline
    DataSource = dsqryStockItemsOnHoldStockTake
    UserName = 'ppStockItemsOnHoldStockTake'
    Left = 608
    Top = 700
  end
  object dsqryStockItemsOnHoldStockTake: TDataSource
    DataSet = qryStockItemsOnHoldStockTake
    Left = 272
    Top = 768
  end
  object qryStockItemsOnHoldStockTake: TADOQuery
    Connection = AdoStockTakeConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StocktakeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 38
      end>
    SQL.Strings = (
      
        'SELECT    tblStocktakeItem.Stocktake_ID, TblStockTakeItem.produc' +
        'tcode_id, TblStockTakeItem.icn_str, '
      
        ' tblStockTakeItem.ecn_str, tblproductpacksize.form_str, TblStock' +
        'TakeItem.nsn_str,'
      
        ' tblproductpacksize.packdescription_str, tblproductpacksize.supp' +
        'lement_str, '
      
        ' tblproductpacksize.group1_str, tblproductpacksize.group2_str, t' +
        'blproductpacksize.bin_str, '
      
        ' TblStockTake.StockTake_str, TblStockTake.StockTake_dat, TblStoc' +
        'kTake.ItemsNo_int'
      'FROM       TblStockTakeItem INNER JOIN'
      
        '                      TblStockTake ON TblStockTake.StockTake_ID ' +
        '= TblStockTakeItem.StockTake_ID'
      
        #9#9#9#9#9#9'inner join tblproductpacksize on tblproductpacksize.produc' +
        'tcode_id = tblStocktakeItem.Productcode_ID'
      
        'WHERE (tblStocktakeItem.Stocktake_ID <> :StocktakeID) AND (TblSt' +
        'ockTakeItem.NewQty_int > 0) AND (TblStockTake.Completed_bol = 0)' +
        ' ')
    Left = 344
    Top = 378
    object qryStockItemsOnHoldStockTakeproductcode_id: TIntegerField
      FieldName = 'productcode_id'
    end
    object qryStockItemsOnHoldStockTakeicn_str: TWideStringField
      FieldName = 'icn_str'
      Size = 50
    end
    object qryStockItemsOnHoldStockTakeecn_str: TWideStringField
      FieldName = 'ecn_str'
      Size = 50
    end
    object qryStockItemsOnHoldStockTakeform_str: TWideStringField
      FieldName = 'form_str'
      Size = 30
    end
    object qryStockItemsOnHoldStockTakensn_str: TWideStringField
      FieldName = 'nsn_str'
      Size = 50
    end
    object qryStockItemsOnHoldStockTakepackdescription_str: TWideStringField
      FieldName = 'packdescription_str'
      Size = 150
    end
    object qryStockItemsOnHoldStockTakesupplement_str: TWideStringField
      FieldName = 'supplement_str'
      Size = 100
    end
    object qryStockItemsOnHoldStockTakegroup1_str: TWideStringField
      FieldName = 'group1_str'
      Size = 50
    end
    object qryStockItemsOnHoldStockTakegroup2_str: TWideStringField
      FieldName = 'group2_str'
      Size = 50
    end
    object qryStockItemsOnHoldStockTakebin_str: TWideStringField
      FieldName = 'bin_str'
    end
    object qryStockItemsOnHoldStockTakeStockTake_str: TStringField
      FieldName = 'StockTake_str'
      Size = 50
    end
    object qryStockItemsOnHoldStockTakeStockTake_dat: TDateTimeField
      FieldName = 'StockTake_dat'
    end
    object qryStockItemsOnHoldStockTakeItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
  end
  object ppStockItemsOnHold: TppReport
    NoDataBehaviors = [ndBlankReport]
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Users\mmankga\MyWorks\RxSolution 1.2.6.0001\Documentation\Ite' +
      'msOnHold_before_StockTake_05_02_2012.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 976
    Top = 695
    Version = '11.03'
    mmColumnWidth = 0
    object ppTitleBand12: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'Line24'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 0
        mmLeft = 794
        mmTop = 12700
        mmWidth = 258498
        BandType = 1
      end
    end
    object ppHeaderBand8: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object ppRequistions: TppSubReport
        UserName = 'Requistions'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBcheckAllItems'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284427
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppRequisitions: TppChildReport
          AutoStop = False
          DataPipeline = ppDBcheckAllItems
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Version = '11.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBcheckAllItems'
          object ppTitleBand10: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 29633
            mmPrintPosition = 0
            object ppLabel179: TppLabel
              UserName = 'Label179'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Requisitions'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4106
              mmLeft = 3175
              mmTop = 8996
              mmWidth = 17399
              BandType = 1
            end
            object ppShape8: TppShape
              UserName = 'Shape8'
              ParentWidth = True
              mmHeight = 5027
              mmLeft = 0
              mmTop = 8202
              mmWidth = 284427
              BandType = 1
            end
            object ppLabel180: TppLabel
              UserName = 'Label180'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 
                '(Please check the folowing items. They are in an un-posted state' +
                ')'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4995
              mmLeft = 3440
              mmTop = 8202
              mmWidth = 131572
              BandType = 1
            end
            object ppLabel181: TppLabel
              UserName = 'Label181'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Items which are not valid for stocktaking'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 18
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 7535
              mmLeft = 3440
              mmTop = 794
              mmWidth = 122894
              BandType = 1
            end
            object ppShape5: TppShape
              UserName = 'Shape5'
              ParentWidth = True
              mmHeight = 5027
              mmLeft = 0
              mmTop = 14817
              mmWidth = 284427
              BandType = 1
            end
            object ppLabel158: TppLabel
              UserName = 'Label158'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'REQUISITIONS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4106
              mmLeft = 3175
              mmTop = 15081
              mmWidth = 20616
              BandType = 1
            end
            object ppLabel178: TppLabel
              UserName = 'Label178'
              HyperlinkColor = clBlue
              SaveOrder = 0
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ICN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 2117
              mmTop = 21696
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel177: TppLabel
              UserName = 'Label177'
              HyperlinkColor = clBlue
              SaveOrder = 1
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ECN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 20902
              mmTop = 21696
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel176: TppLabel
              UserName = 'Label176'
              HyperlinkColor = clBlue
              SaveOrder = 2
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Bin'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 38100
              mmTop = 21960
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel175: TppLabel
              UserName = 'Label175'
              HyperlinkColor = clBlue
              SaveOrder = 3
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Description'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 49477
              mmTop = 21961
              mmWidth = 112184
              BandType = 1
            end
            object ppLabel174: TppLabel
              UserName = 'Label174'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Tradename'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 163777
              mmTop = 21961
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel173: TppLabel
              UserName = 'Label173'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 221721
              mmTop = 21961
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel169: TppLabel
              UserName = 'Label169'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 260615
              mmTop = 21961
              mmWidth = 11113
              BandType = 1
            end
            object ppLine36: TppLine
              UserName = 'Line36'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 27252
              mmWidth = 280723
              BandType = 1
            end
          end
          object ppHeaderBand11: TppHeaderBand
            PrintOnLastPage = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand10: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6085
            mmPrintPosition = 0
            object ppDBText150: TppDBText
              UserName = 'DBText150'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'icn_str'
              DataPipeline = ppDBcheckAllItems
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBcheckAllItems'
              mmHeight = 3429
              mmLeft = 4498
              mmTop = 0
              mmWidth = 8297
              BandType = 4
            end
            object ppDBText151: TppDBText
              UserName = 'DBText151'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'ecn_str'
              DataPipeline = ppDBcheckAllItems
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBcheckAllItems'
              mmHeight = 3429
              mmLeft = 21960
              mmTop = 0
              mmWidth = 9144
              BandType = 4
            end
            object ppDBText153: TppDBText
              UserName = 'DBText153'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'bin_str'
              DataPipeline = ppDBcheckAllItems
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBcheckAllItems'
              mmHeight = 3429
              mmLeft = 39952
              mmTop = 0
              mmWidth = 8551
              BandType = 4
            end
            object ppDBText154: TppDBText
              UserName = 'DBText154'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'packdescription_str'
              DataPipeline = ppDBcheckAllItems
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBcheckAllItems'
              mmHeight = 3429
              mmLeft = 52123
              mmTop = 0
              mmWidth = 24045
              BandType = 4
            end
            object ppDBText155: TppDBText
              UserName = 'DBText155'
              CharWrap = True
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'supplement_str'
              DataPipeline = ppDBcheckAllItems
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBcheckAllItems'
              mmHeight = 3429
              mmLeft = 168805
              mmTop = 0
              mmWidth = 19219
              BandType = 4
            end
            object ppDBText156: TppDBText
              UserName = 'DBText156'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group1_str'
              DataPipeline = ppDBcheckAllItems
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBcheckAllItems'
              mmHeight = 3429
              mmLeft = 227808
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText157: TppDBText
              UserName = 'DBText157'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group2_str'
              DataPipeline = ppDBcheckAllItems
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBcheckAllItems'
              mmHeight = 3429
              mmLeft = 265377
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
          end
          object ppFooterBand11: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand6: TppSummaryBand
            AlignToBottom = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup10: TppGroup
            BreakName = 'requisition_str'
            DataPipeline = ppDBcheckAllItems
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group10'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDBcheckAllItems'
            object ppGroupHeaderBand10: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 12435
              mmPrintPosition = 0
              object ppLabel182: TppLabel
                UserName = 'Label1301'
                HyperlinkColor = clBlue
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Caption = 'Reference Number:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial Narrow'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4106
                mmLeft = 3969
                mmTop = 529
                mmWidth = 26670
                BandType = 3
                GroupNo = 0
              end
              object ppDBText146: TppDBText
                UserName = 'DBText146'
                HyperlinkColor = clBlue
                AutoSize = True
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                DataField = 'requisition_str'
                DataPipeline = ppDBcheckAllItems
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Tahoma'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDBcheckAllItems'
                mmHeight = 3429
                mmLeft = 11113
                mmTop = 5292
                mmWidth = 17611
                BandType = 3
                GroupNo = 0
              end
              object ppLine32: TppLine
                UserName = 'Line401'
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Pen.Style = psDash
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 10319
                mmWidth = 280723
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand10: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup11: TppGroup
            BreakName = 'productcode_id'
            DataPipeline = ppDBcheckAllItems
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group11'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDBcheckAllItems'
            object ppGroupHeaderBand11: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand11: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppReceipt: TppSubReport
        UserName = 'Receipt'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppRequistions
        TraverseAllData = False
        DataPipelineName = 'ppStockItemsOnHoldReceipt'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 9525
        mmWidth = 284427
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = ppStockItemsOnHoldReceipt
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Version = '11.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppStockItemsOnHoldReceipt'
          object ppTitleBand6: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 15875
            mmPrintPosition = 0
            object ppSystemVariable21: TppSystemVariable
              UserName = 'SystemVariable21'
              HyperlinkColor = clBlue
              SaveOrder = 0
              Save = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              VarType = vtDateTime
              DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 232834
              mmTop = 0
              mmWidth = 49213
              BandType = 1
            end
            object ppShape6: TppShape
              UserName = 'Shape6'
              ParentWidth = True
              mmHeight = 5292
              mmLeft = 0
              mmTop = 529
              mmWidth = 284427
              BandType = 1
            end
            object ppLabel154: TppLabel
              UserName = 'Label154'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'RECEIPTS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 3175
              mmTop = 1058
              mmWidth = 14552
              BandType = 1
            end
            object ppLabel123: TppLabel
              UserName = 'Label123'
              HyperlinkColor = clBlue
              SaveOrder = 1
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ECN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 20902
              mmTop = 7144
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel122: TppLabel
              UserName = 'Label122'
              HyperlinkColor = clBlue
              SaveOrder = 2
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ICN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 2117
              mmTop = 7144
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel125: TppLabel
              UserName = 'Label125'
              HyperlinkColor = clBlue
              SaveOrder = 3
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Bin'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 38100
              mmTop = 7408
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel126: TppLabel
              UserName = 'Label126'
              HyperlinkColor = clBlue
              SaveOrder = 4
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Description'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 49477
              mmTop = 7144
              mmWidth = 112184
              BandType = 1
            end
            object ppLabel127: TppLabel
              UserName = 'Label127'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Tradename'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 163777
              mmTop = 7144
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel128: TppLabel
              UserName = 'Label128'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 221721
              mmTop = 7144
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel160: TppLabel
              UserName = 'Label160'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 260615
              mmTop = 7144
              mmWidth = 11113
              BandType = 1
            end
            object ppLine37: TppLine
              UserName = 'Line37'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 12700
              mmWidth = 280723
              BandType = 1
            end
          end
          object ppHeaderBand6: TppHeaderBand
            PrintOnLastPage = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppDBText92: TppDBText
              UserName = 'DBText1'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'ecn_str'
              DataPipeline = ppStockItemsOnHoldReceipt
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldReceipt'
              mmHeight = 3429
              mmLeft = 19315
              mmTop = 0
              mmWidth = 9144
              BandType = 4
            end
            object ppDBText96: TppDBText
              UserName = 'DBText2'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'bin_str'
              DataPipeline = ppStockItemsOnHoldReceipt
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldReceipt'
              mmHeight = 3429
              mmLeft = 35454
              mmTop = 0
              mmWidth = 8551
              BandType = 4
            end
            object ppDBText101: TppDBText
              UserName = 'DBText3'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'packdescription_str'
              DataPipeline = ppStockItemsOnHoldReceipt
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldReceipt'
              mmHeight = 3429
              mmLeft = 48683
              mmTop = 0
              mmWidth = 24045
              BandType = 4
            end
            object ppDBText122: TppDBText
              UserName = 'DBText122'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'supplement_str'
              DataPipeline = ppStockItemsOnHoldReceipt
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldReceipt'
              mmHeight = 3429
              mmLeft = 165365
              mmTop = 0
              mmWidth = 19219
              BandType = 4
            end
            object ppDBText123: TppDBText
              UserName = 'DBText123'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group1_str'
              DataPipeline = ppStockItemsOnHoldReceipt
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldReceipt'
              mmHeight = 3429
              mmLeft = 227808
              mmTop = 794
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText124: TppDBText
              UserName = 'DBText124'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group2_str'
              DataPipeline = ppStockItemsOnHoldReceipt
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldReceipt'
              mmHeight = 3429
              mmLeft = 265377
              mmTop = 265
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText134: TppDBText
              UserName = 'DBText134'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'icn_str'
              DataPipeline = ppStockItemsOnHoldReceipt
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldReceipt'
              mmHeight = 3429
              mmLeft = 2381
              mmTop = 0
              mmWidth = 8297
              BandType = 4
            end
          end
          object ppFooterBand6: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup6: TppGroup
            BreakName = 'ReceiptNo_str'
            DataPipeline = ppStockItemsOnHoldReceipt
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group6'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppStockItemsOnHoldReceipt'
            object ppGroupHeaderBand6: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 12435
              mmPrintPosition = 0
              object ppLabel159: TppLabel
                UserName = 'Label159'
                HyperlinkColor = clBlue
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Caption = 'Reference Number:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial Narrow'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4106
                mmLeft = 3969
                mmTop = 794
                mmWidth = 26670
                BandType = 3
                GroupNo = 0
              end
              object ppDBText114: TppDBText
                UserName = 'DBText114'
                HyperlinkColor = clBlue
                AutoSize = True
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                DataField = 'ReceiptNo_str'
                DataPipeline = ppStockItemsOnHoldReceipt
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Tahoma'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppStockItemsOnHoldReceipt'
                mmHeight = 3429
                mmLeft = 11113
                mmTop = 5556
                mmWidth = 17399
                BandType = 3
                GroupNo = 0
              end
              object ppLine25: TppLine
                UserName = 'Line25'
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Pen.Style = psDash
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 10848
                mmWidth = 280723
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand6: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup9: TppGroup
            BreakName = 'productcode_id'
            DataPipeline = ppStockItemsOnHoldReceipt
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group9'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppStockItemsOnHoldReceipt'
            object ppGroupHeaderBand9: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand9: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSupplier: TppSubReport
        UserName = 'Supplier'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppReceipt
        TraverseAllData = False
        DataPipelineName = 'ppStockItemsOnHoldSupllier'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 18785
        mmWidth = 284427
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = ppStockItemsOnHoldSupllier
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Version = '11.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppStockItemsOnHoldSupllier'
          object ppTitleBand7: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 16933
            mmPrintPosition = 0
            object ppShape7: TppShape
              UserName = 'Shape7'
              ParentWidth = True
              mmHeight = 5027
              mmLeft = 0
              mmTop = 2117
              mmWidth = 284427
              BandType = 1
            end
            object ppLabel155: TppLabel
              UserName = 'Label155'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'RETURNS TO SUPPLIERS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 3175
              mmTop = 2646
              mmWidth = 42863
              BandType = 1
            end
            object ppLabel129: TppLabel
              UserName = 'Label1'
              HyperlinkColor = clBlue
              SaveOrder = 0
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ICN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 529
              mmTop = 8731
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel130: TppLabel
              UserName = 'Label2'
              HyperlinkColor = clBlue
              SaveOrder = 1
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ECN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 19315
              mmTop = 8731
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel132: TppLabel
              UserName = 'Label3'
              HyperlinkColor = clBlue
              SaveOrder = 2
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Bin'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 36777
              mmTop = 8731
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel136: TppLabel
              UserName = 'Label136'
              HyperlinkColor = clBlue
              SaveOrder = 3
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Description'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 47890
              mmTop = 8731
              mmWidth = 112184
              BandType = 1
            end
            object ppLabel137: TppLabel
              UserName = 'Label137'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Tradename'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 162190
              mmTop = 8731
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel138: TppLabel
              UserName = 'Label138'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 220134
              mmTop = 8731
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel139: TppLabel
              UserName = 'Label139'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 259028
              mmTop = 8731
              mmWidth = 11113
              BandType = 1
            end
            object ppLine22: TppLine
              UserName = 'Line1'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 14552
              mmWidth = 280723
              BandType = 1
            end
          end
          object ppHeaderBand7: TppHeaderBand
            PrintOnLastPage = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand7: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppDBText125: TppDBText
              UserName = 'DBText125'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'ecn_str'
              DataPipeline = ppStockItemsOnHoldSupllier
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldSupllier'
              mmHeight = 3429
              mmLeft = 19050
              mmTop = 0
              mmWidth = 9144
              BandType = 4
            end
            object ppDBText126: TppDBText
              UserName = 'DBText126'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'bin_str'
              DataPipeline = ppStockItemsOnHoldSupllier
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldSupllier'
              mmHeight = 3429
              mmLeft = 36248
              mmTop = 0
              mmWidth = 8551
              BandType = 4
            end
            object ppDBText127: TppDBText
              UserName = 'DBText127'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'packdescription_str'
              DataPipeline = ppStockItemsOnHoldSupllier
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldSupllier'
              mmHeight = 3429
              mmLeft = 52652
              mmTop = 0
              mmWidth = 24045
              BandType = 4
            end
            object ppDBText128: TppDBText
              UserName = 'DBText128'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'supplement_str'
              DataPipeline = ppStockItemsOnHoldSupllier
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldSupllier'
              mmHeight = 3429
              mmLeft = 165100
              mmTop = 0
              mmWidth = 19219
              BandType = 4
            end
            object ppDBText129: TppDBText
              UserName = 'DBText129'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group1_str'
              DataPipeline = ppStockItemsOnHoldSupllier
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldSupllier'
              mmHeight = 3429
              mmLeft = 227808
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText130: TppDBText
              UserName = 'DBText130'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group2_str'
              DataPipeline = ppStockItemsOnHoldSupllier
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldSupllier'
              mmHeight = 3429
              mmLeft = 265377
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText117: TppDBText
              UserName = 'DBText117'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'icn_str'
              DataPipeline = ppStockItemsOnHoldSupllier
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldSupllier'
              mmHeight = 3429
              mmLeft = 2117
              mmTop = 0
              mmWidth = 8297
              BandType = 4
            end
          end
          object ppFooterBand8: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup3: TppGroup
            BreakName = 'ReturnsNo_str'
            DataPipeline = ppStockItemsOnHoldSupllier
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group3'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppStockItemsOnHoldSupllier'
            object ppGroupHeaderBand3: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 13229
              mmPrintPosition = 0
              object ppLabel170: TppLabel
                UserName = 'Label1302'
                HyperlinkColor = clBlue
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Caption = 'Return Number:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial Narrow'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4106
                mmLeft = 11113
                mmTop = 2117
                mmWidth = 22013
                BandType = 3
                GroupNo = 0
              end
              object ppDBText147: TppDBText
                UserName = 'DBText147'
                HyperlinkColor = clBlue
                AutoSize = True
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                DataField = 'ReturnsNo_str'
                DataPipeline = ppStockItemsOnHoldSupllier
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Tahoma'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppStockItemsOnHoldSupllier'
                mmHeight = 3429
                mmLeft = 10848
                mmTop = 7144
                mmWidth = 17822
                BandType = 3
                GroupNo = 0
              end
              object ppLine33: TppLine
                UserName = 'Line33'
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Pen.Style = psDash
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 11377
                mmWidth = 280723
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand3: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup8: TppGroup
            BreakName = 'productcode_id'
            DataPipeline = ppStockItemsOnHoldSupllier
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group8'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppStockItemsOnHoldSupllier'
            object ppGroupHeaderBand8: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand8: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppDemander: TppSubReport
        UserName = 'Demander'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSupplier
        TraverseAllData = False
        DataPipelineName = 'ppStockItemsOnHoldDemander'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 27781
        mmWidth = 284427
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          AutoStop = False
          DataPipeline = ppStockItemsOnHoldDemander
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Version = '11.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppStockItemsOnHoldDemander'
          object ppTitleBand8: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 16404
            mmPrintPosition = 0
            object ppSystemVariable27: TppSystemVariable
              UserName = 'SystemVariable27'
              HyperlinkColor = clBlue
              SaveOrder = 0
              Save = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              VarType = vtDateTime
              DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 232834
              mmTop = 0
              mmWidth = 49213
              BandType = 1
            end
            object ppShape3: TppShape
              UserName = 'Shape3'
              ParentWidth = True
              mmHeight = 5292
              mmLeft = 0
              mmTop = 529
              mmWidth = 284427
              BandType = 1
            end
            object ppLabel156: TppLabel
              UserName = 'Label156'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'RETURN FROM DEMANDER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4106
              mmLeft = 3175
              mmTop = 1058
              mmWidth = 38693
              BandType = 1
            end
            object ppLabel124: TppLabel
              UserName = 'Label124'
              HyperlinkColor = clBlue
              SaveOrder = 1
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ICN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 2117
              mmTop = 8731
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel161: TppLabel
              UserName = 'Label161'
              HyperlinkColor = clBlue
              SaveOrder = 2
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ECN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 20902
              mmTop = 8731
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel162: TppLabel
              UserName = 'Label162'
              HyperlinkColor = clBlue
              SaveOrder = 3
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Bin'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 38100
              mmTop = 8996
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel163: TppLabel
              UserName = 'Label163'
              HyperlinkColor = clBlue
              SaveOrder = 4
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Description'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 49477
              mmTop = 8731
              mmWidth = 112184
              BandType = 1
            end
            object ppLabel164: TppLabel
              UserName = 'Label164'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Tradename'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 163777
              mmTop = 8731
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel165: TppLabel
              UserName = 'Label165'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 221721
              mmTop = 8731
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel166: TppLabel
              UserName = 'Label166'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 260615
              mmTop = 8731
              mmWidth = 11113
              BandType = 1
            end
            object ppLine21: TppLine
              UserName = 'Line21'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 14288
              mmWidth = 280723
              BandType = 1
            end
          end
          object ppHeaderBand9: TppHeaderBand
            PrintOnLastPage = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand8: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBText131: TppDBText
              UserName = 'DBText131'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'ecn_str'
              DataPipeline = ppStockItemsOnHoldDemander
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldDemander'
              mmHeight = 3429
              mmLeft = 19315
              mmTop = 0
              mmWidth = 9144
              BandType = 4
            end
            object ppDBText132: TppDBText
              UserName = 'DBText132'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'bin_str'
              DataPipeline = ppStockItemsOnHoldDemander
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldDemander'
              mmHeight = 3429
              mmLeft = 38629
              mmTop = 0
              mmWidth = 8551
              BandType = 4
            end
            object ppDBText133: TppDBText
              UserName = 'DBText133'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'packdescription_str'
              DataPipeline = ppStockItemsOnHoldDemander
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldDemander'
              mmHeight = 3429
              mmLeft = 50800
              mmTop = 529
              mmWidth = 24045
              BandType = 4
            end
            object ppDBText137: TppDBText
              UserName = 'DBText137'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'supplement_str'
              DataPipeline = ppStockItemsOnHoldDemander
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldDemander'
              mmHeight = 3429
              mmLeft = 163248
              mmTop = 0
              mmWidth = 19219
              BandType = 4
            end
            object ppDBText138: TppDBText
              UserName = 'DBText138'
              CharWrap = True
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group1_str'
              DataPipeline = ppStockItemsOnHoldDemander
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldDemander'
              mmHeight = 3429
              mmLeft = 227808
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText139: TppDBText
              UserName = 'DBText139'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group2_str'
              DataPipeline = ppStockItemsOnHoldDemander
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldDemander'
              mmHeight = 3429
              mmLeft = 265377
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText116: TppDBText
              UserName = 'DBText116'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'icn_str'
              DataPipeline = ppStockItemsOnHoldDemander
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppStockItemsOnHoldDemander'
              mmHeight = 3429
              mmLeft = 2381
              mmTop = 0
              mmWidth = 8297
              BandType = 4
            end
          end
          object ppFooterBand9: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup4: TppGroup
            BreakName = 'Credit_str'
            DataPipeline = ppStockItemsOnHoldDemander
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group4'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppStockItemsOnHoldDemander'
            object ppGroupHeaderBand4: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 12700
              mmPrintPosition = 0
              object ppLabel171: TppLabel
                UserName = 'Label1303'
                HyperlinkColor = clBlue
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Caption = 'Return Number:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial Narrow'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4106
                mmLeft = 11113
                mmTop = 794
                mmWidth = 22013
                BandType = 3
                GroupNo = 0
              end
              object ppDBText149: TppDBText
                UserName = 'DBText149'
                HyperlinkColor = clBlue
                AutoSize = True
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                DataField = 'Credit_str'
                DataPipeline = ppStockItemsOnHoldDemander
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Tahoma'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppStockItemsOnHoldDemander'
                mmHeight = 3429
                mmLeft = 12435
                mmTop = 6085
                mmWidth = 12107
                BandType = 3
                GroupNo = 0
              end
              object ppLine35: TppLine
                UserName = 'Line35'
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Pen.Style = psDash
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 11113
                mmWidth = 280723
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand4: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup7: TppGroup
            BreakName = 'productcode_id'
            DataPipeline = ppStockItemsOnHoldDemander
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group7'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppStockItemsOnHoldDemander'
            object ppGroupHeaderBand7: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand7: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppStockTake: TppSubReport
        UserName = 'StockTake'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppDemander
        TraverseAllData = False
        DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 36248
        mmWidth = 284427
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport9: TppChildReport
          AutoStop = False
          DataPipeline = ppqryStockItemsOnHoldStockTake
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 9
          Version = '11.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
          object ppTitleBand9: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14817
            mmPrintPosition = 0
            object ppSystemVariable30: TppSystemVariable
              UserName = 'SystemVariable30'
              HyperlinkColor = clBlue
              SaveOrder = 0
              Save = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              VarType = vtDateTime
              DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 232834
              mmTop = 0
              mmWidth = 49213
              BandType = 1
            end
            object ppShape4: TppShape
              UserName = 'Shape4'
              ParentWidth = True
              mmHeight = 5292
              mmLeft = 0
              mmTop = 529
              mmWidth = 284427
              BandType = 1
            end
            object ppLabel157: TppLabel
              UserName = 'Label157'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'STOCK TAKES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4106
              mmLeft = 3175
              mmTop = 1058
              mmWidth = 20616
              BandType = 1
            end
            object ppLabel140: TppLabel
              UserName = 'Label140'
              HyperlinkColor = clBlue
              SaveOrder = 1
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ICN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 2117
              mmTop = 8202
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel141: TppLabel
              UserName = 'Label141'
              HyperlinkColor = clBlue
              SaveOrder = 2
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'ECN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 20902
              mmTop = 8202
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel142: TppLabel
              UserName = 'Label142'
              HyperlinkColor = clBlue
              SaveOrder = 3
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Bin'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 38100
              mmTop = 8467
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel143: TppLabel
              UserName = 'Label143'
              HyperlinkColor = clBlue
              SaveOrder = 4
              Save = True
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Description'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              WordWrap = True
              mmHeight = 4498
              mmLeft = 49477
              mmTop = 8202
              mmWidth = 112184
              BandType = 1
            end
            object ppLabel144: TppLabel
              UserName = 'Label144'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Tradename'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 163777
              mmTop = 8202
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel145: TppLabel
              UserName = 'Label145'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 221721
              mmTop = 8202
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel146: TppLabel
              UserName = 'Label146'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Group 2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 260615
              mmTop = 8202
              mmWidth = 11113
              BandType = 1
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 13758
              mmWidth = 280723
              BandType = 1
            end
          end
          object ppHeaderBand10: TppHeaderBand
            PrintOnLastPage = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand9: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppDBText140: TppDBText
              UserName = 'DBText140'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'ecn_str'
              DataPipeline = ppqryStockItemsOnHoldStockTake
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
              mmHeight = 3429
              mmLeft = 21167
              mmTop = 0
              mmWidth = 9144
              BandType = 4
            end
            object ppDBText141: TppDBText
              UserName = 'DBText141'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'bin_str'
              DataPipeline = ppqryStockItemsOnHoldStockTake
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
              mmHeight = 3429
              mmLeft = 39952
              mmTop = 0
              mmWidth = 8551
              BandType = 4
            end
            object ppDBText142: TppDBText
              UserName = 'DBText142'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'packdescription_str'
              DataPipeline = ppqryStockItemsOnHoldStockTake
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
              mmHeight = 3429
              mmLeft = 50536
              mmTop = 0
              mmWidth = 24045
              BandType = 4
            end
            object ppDBText143: TppDBText
              UserName = 'DBText143'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'supplement_str'
              DataPipeline = ppqryStockItemsOnHoldStockTake
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
              mmHeight = 3429
              mmLeft = 169863
              mmTop = 0
              mmWidth = 19219
              BandType = 4
            end
            object ppDBText144: TppDBText
              UserName = 'DBText144'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group1_str'
              DataPipeline = ppqryStockItemsOnHoldStockTake
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
              mmHeight = 3429
              mmLeft = 227807
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText145: TppDBText
              UserName = 'DBText145'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'group2_str'
              DataPipeline = ppqryStockItemsOnHoldStockTake
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
              mmHeight = 3429
              mmLeft = 265378
              mmTop = 0
              mmWidth = 13589
              BandType = 4
            end
            object ppDBText115: TppDBText
              UserName = 'DBText1401'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'icn_str'
              DataPipeline = ppqryStockItemsOnHoldStockTake
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
              mmHeight = 3429
              mmLeft = 5556
              mmTop = 265
              mmWidth = 8297
              BandType = 4
            end
          end
          object ppFooterBand10: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup5: TppGroup
            BreakName = 'StockTake_str'
            DataPipeline = ppqryStockItemsOnHoldStockTake
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group5'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
            object ppGroupHeaderBand5: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 15875
              mmPrintPosition = 0
              object ppLabel172: TppLabel
                UserName = 'Label1304'
                HyperlinkColor = clBlue
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Caption = 'StockTake Number:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial Narrow'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4106
                mmLeft = 11113
                mmTop = 1588
                mmWidth = 27178
                BandType = 3
                GroupNo = 0
              end
              object ppDBText148: TppDBText
                UserName = 'DBText148'
                HyperlinkColor = clBlue
                AutoSize = True
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                DataField = 'StockTake_str'
                DataPipeline = ppqryStockItemsOnHoldStockTake
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Tahoma'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
                mmHeight = 3429
                mmLeft = 21167
                mmTop = 7408
                mmWidth = 17526
                BandType = 3
                GroupNo = 0
              end
              object ppLine34: TppLine
                UserName = 'Line34'
                Border.BorderPositions = []
                Border.Color = clBlack
                Border.Style = psSolid
                Border.Visible = False
                Pen.Style = psDash
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 13494
                mmWidth = 280723
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand5: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'productcode_id'
            DataPipeline = ppqryStockItemsOnHoldStockTake
            KeepTogether = True
            OutlineSettings.CreateNode = True
            NewFile = False
            StartOnOddPage = False
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppqryStockItemsOnHoldStockTake'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppSystemVariable17: TppSystemVariable
        UserName = 'SystemVariable16'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd, dd mmmm yyyy @ (hh:mm)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 49213
        BandType = 8
      end
      object ppSystemVariable19: TppSystemVariable
        UserName = 'SystemVariable101'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Color = 16383986
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 248709
        mmTop = 1058
        mmWidth = 33338
        BandType = 8
      end
      object ppLine39: TppLine
        UserName = 'Line22'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1588
        mmTop = 265
        mmWidth = 280723
        BandType = 8
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
end
