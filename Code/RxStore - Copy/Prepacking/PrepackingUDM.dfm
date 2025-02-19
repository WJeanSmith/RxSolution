object PrepackingDM: TPrepackingDM
  OldCreateOrder = False
  Left = 567
  Top = 195
  Height = 706
  Width = 1052
  object adoPrepacking: TADOConnection
    CommandTimeout = 320
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=RxNew;Data Source=spstrainin' +
      'g16;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object qryPrepacking: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    AfterScroll = qryPrepackingAfterScroll
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
      'SELECT tblPrepacking.* FROM tblPrepacking'
      'WHERE tblPrepacking.Created_dat >:StartDate'
      'AND tblPrepacking.Created_dat <:EndDate')
    Left = 40
    Top = 120
  end
  object qryPrepackingItems: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    BeforePost = qryPrepackingItemsBeforePost
    AfterPost = qryPrepackingItemsAfterPost
    DataSource = dsqryPrepackingWorker
    Parameters = <
      item
        Name = 'Prepacking_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT tblPrepackingItem.*, ISNULL(view_ProductQtyOnHand.TotalQt' +
        'yOnHand_int, 0) AS Available'
      
        'FROM tblPrepackingItem LEFT OUTER JOIN view_ProductQtyOnHand ON ' +
        'view_ProductQtyOnHand.ProductCode_ID = tblPrepackingItem.Product' +
        'code_ID'
      'WHERE tblPrepackingItem.Prepacking_ID=:Prepacking_ID'
      '')
    Left = 40
    Top = 240
    object qryPrepackingItemsPrepackingItem_ID: TAutoIncField
      FieldName = 'PrepackingItem_ID'
      ReadOnly = True
    end
    object qryPrepackingItemsPrepacking_ID: TIntegerField
      FieldName = 'Prepacking_ID'
    end
    object qryPrepackingItemsNSN_str: TStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object qryPrepackingItemsECN_str: TStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object qryPrepackingItemsICN_str: TStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object qryPrepackingItemsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryPrepackingItemsDescription_str: TWideStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object qryPrepackingItemsProductBatch_ID: TIntegerField
      FieldName = 'ProductBatch_ID'
    end
    object qryPrepackingItemsBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
    end
    object qryPrepackingItemsExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object qryPrepackingItemsPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object qryPrepackingItemsExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object qryPrepackingItemsQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object qryPrepackingItemsAvailable: TIntegerField
      FieldName = 'Available'
      ReadOnly = True
    end
    object qryPrepackingItemsBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 15
    end
    object qryPrepackingItemsNotFromBulk_bol: TBooleanField
      FieldName = 'NotFromBulk_bol'
    end
    object qryPrepackingItemsProductCode_Str: TWideStringField
      FieldName = 'ProductCode_Str'
      Size = 14
    end
    object qryPrepackingItemsQtyUsed_dbl: TFloatField
      FieldName = 'QtyUsed_dbl'
    end
    object qryPrepackingItemsSourcePortion_dbl: TFloatField
      FieldName = 'SourcePortion_dbl'
    end
    object qryPrepackingItemsRemainingSKUCalc_dbl: TFloatField
      FieldName = 'RemainingSKUCalc_dbl'
    end
    object qryPrepackingItemsRemainingSKUActual_dbl: TFloatField
      FieldName = 'RemainingSKUActual_dbl'
    end
  end
  object dsqryPrepacking: TDataSource
    DataSet = qryPrepacking
    Left = 192
    Top = 120
  end
  object dsPrepackingItems: TDataSource
    DataSet = qryPrepackingItems
    Left = 192
    Top = 240
  end
  object dsDemanders: TDataSource
    DataSet = tblDemanders
    Left = 480
    Top = 256
  end
  object tblSystemUsers: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT tblSystem_User.UserID, ISNULL(tblSystem_User.lastName_str' +
        ', N'#39#39') + N'#39', '#39' + ISNULL(tblSystem_User.firstName_str, N'#39#39') + N'#39'(' +
        ' '#39' + ISNULL(tblSystem_User.position_str, N'#39#39') + N'#39' )'#39' AS Descrip' +
        'tion'
      
        'FROM tblSystem_User INNER JOIN tblSystem_User_Access ON tblSyste' +
        'm_User.UserID = tblSystem_User_Access.UserID'
      
        'WHERE (tblSystem_User_Access.moduleNum_int = 26) AND (tblSystem_' +
        'User_Access.accessLevel_int >2) AND (tblSystem_User.Active_bol =' +
        ' 1)'
      
        'ORDER BY tblSystem_User.lastName_str, tblSystem_User.firstName_s' +
        'tr')
    Left = 392
    Top = 192
  end
  object tblDemanders: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Demander_ID, Code_str, Name_str, DemanderUnique_ID'
      'FROM tblDemander'
      'ORDER BY Name_str')
    Left = 392
    Top = 256
    object tblDemandersDemander_ID: TAutoIncField
      FieldName = 'Demander_ID'
      ReadOnly = True
    end
    object tblDemandersCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object tblDemandersName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object tblDemandersDemanderUnique_ID: TGuidField
      FieldName = 'DemanderUnique_ID'
      FixedChar = True
      Size = 38
    end
  end
  object dsUsers: TDataSource
    DataSet = tblSystemUsers
    Left = 472
    Top = 192
  end
  object qryItemEditHisory: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    DataSource = dsqryPrepackingWorker
    Parameters = <
      item
        Name = 'Prepacking_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TblPrepackingEditHistory.* FROM TblPrepackingEditHistory'
      'WHERE TblPrepackingEditHistory.Prepacking_ID =:Prepacking_ID')
    Left = 40
    Top = 304
    object qryItemEditHisoryPrepackingHistory_ID: TAutoIncField
      FieldName = 'PrepackingHistory_ID'
      ReadOnly = True
    end
    object qryItemEditHisoryPrepacking_ID: TIntegerField
      FieldName = 'Prepacking_ID'
    end
    object qryItemEditHisoryPrepackingItem_ID: TIntegerField
      FieldName = 'PrepackingItem_ID'
    end
    object qryItemEditHisoryDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 255
    end
    object qryItemEditHisoryDate_dat: TDateTimeField
      FieldName = 'Date_dat'
    end
    object qryItemEditHisoryProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryItemEditHisoryType_str: TStringField
      FieldName = 'Type_str'
      Size = 25
    end
    object qryItemEditHisoryUser_ID: TIntegerField
      FieldName = 'User_ID'
    end
    object qryItemEditHisoryUserName_str: TStringField
      FieldName = 'UserName_str'
      Size = 75
    end
  end
  object dsqryItemEditHisory: TDataSource
    DataSet = qryItemEditHisory
    Left = 200
    Top = 304
  end
  object stp_Totals: TADOStoredProc
    Connection = adoPrepacking
    ProcedureName = 'strdprc_StockControlPrepackingItemsTotals;1'
    Parameters = <
      item
        Name = '@PrepackingID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 40
    Top = 392
    object stp_TotalsCountOfPrepackingItem_ID: TIntegerField
      FieldName = 'CountOfPrepackingItem_ID'
      ReadOnly = True
    end
    object stp_TotalsSumOfExtendedCost_mon: TBCDField
      FieldName = 'SumOfExtendedCost_mon'
      ReadOnly = True
      Precision = 19
    end
    object stp_TotalsAddCosts: TFloatField
      FieldName = 'AddCosts'
      ReadOnly = True
    end
  end
  object ActionList1: TActionList
    Left = 840
    Top = 40
    object atnSaveClose: TAction
      Caption = '&Close'
      ShortCut = 16451
      OnExecute = atnSaveCloseExecute
    end
    object atnAddSingleItem: TAction
      Caption = '&Add (Single Product)'
      ShortCut = 45
      OnExecute = atnAddSingleItemExecute
    end
    object atnDeleteItem: TAction
      Caption = '&Delete (selected Product)'
      ShortCut = 16452
      OnExecute = atnDeleteItemExecute
    end
    object atnDeleteAllItems: TAction
      Caption = 'Dele&te (ALL Products)'
      ShortCut = 16468
      OnExecute = atnDeleteAllItemsExecute
    end
    object ItemsFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 0
      DataSource = dsPrepackingItems
    end
    object ItemsPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Prior'
      Hint = 'Prior'
      ImageIndex = 1
      DataSource = dsPrepackingItems
    end
    object ItemsNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Next'
      Hint = 'Next'
      ImageIndex = 2
      DataSource = dsPrepackingItems
    end
    object ItemsLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Last'
      Hint = 'Last'
      ImageIndex = 3
      DataSource = dsPrepackingItems
    end
    object ItemsPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dsPrepackingItems
    end
    object ItemsCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dsPrepackingItems
    end
    object atnSelectBatch: TAction
      Caption = 'Select Batch (F2)'
      ShortCut = 113
      OnExecute = atnSelectBatchExecute
    end
    object atnPrePostandClose: TAction
      Caption = 'Issue Stock'
      Hint = 'Issue Stock from Bulk'
      OnExecute = atnPrePostandCloseExecute
    end
    object atnPostandClose: TAction
      Caption = 'Post'
      OnExecute = atnPostandCloseExecute
    end
    object atnPrintMainReport: TAction
      Caption = 'Print'
      OnExecute = atnPrintMainReportExecute
    end
    object atnPrintReport: TAction
      OnExecute = atnPrintReportExecute
    end
  end
  object AdoAddSingleItem: TADOCommand
    CommandText = 'strdprc_PrepackingItemsADD_Single;1'
    CommandType = cmdStoredProc
    Connection = adoPrepacking
    Prepared = True
    Parameters = <
      item
        Name = '@PrepackingID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ProductCodeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 192
    Top = 24
  end
  object tblProducts: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT ProductCode_ID, Description_str, ICN_str, PackSizeValue_d' +
        'bl, Cost_mon, Bin_str, GenericName_str, NSN_str, ECN_str, Produc' +
        'tCode_str'
      'FROM tblProductPackSize'
      'WHERE InstitutionEDL_bol = 1'
      'ORDER BY Description_str')
    Left = 392
    Top = 312
    object tblProductsProductCode_ID: TAutoIncField
      FieldName = 'ProductCode_ID'
      ReadOnly = True
    end
    object tblProductsDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object tblProductsICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object tblProductsPackSizeValue_dbl: TFloatField
      FieldName = 'PackSizeValue_dbl'
    end
    object tblProductsCost_mon: TBCDField
      FieldName = 'Cost_mon'
      Precision = 19
    end
    object tblProductsBin_str: TWideStringField
      FieldName = 'Bin_str'
    end
    object tblProductsGenericName_str: TWideStringField
      FieldName = 'GenericName_str'
      Size = 255
    end
    object tblProductsNSN_str: TWideStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object tblProductsECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object tblProductsProductCode_str: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
  end
  object dsProducts: TDataSource
    DataSet = tblProducts
    Left = 488
    Top = 312
  end
  object tmpItems: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    BeforePost = tmpItemsBeforePost
    AfterPost = tmpItemsAfterPost
    AfterScroll = tmpItemsAfterScroll
    Parameters = <
      item
        Name = 'PrepackingID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ProductCodeID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT tblPrepackingItem.*, tblProductBatch.QtyOnHand_int AS Bat' +
        'chQty'
      'FROM tblPrepackingItem'
      
        'INNER JOIN tblProductBatch ON tblPrepackingItem.ProductBatch_ID ' +
        '= tblProductBatch.ProductBatch_ID'
      
        'WHERE (tblPrepackingItem.Prepacking_ID=:PrepackingID) AND (tblPr' +
        'epackingItem.ProductCode_ID=:ProductCodeID)')
    Left = 384
    Top = 368
    object tmpItemsPrepackingItem_ID: TAutoIncField
      FieldName = 'PrepackingItem_ID'
      ReadOnly = True
    end
    object tmpItemsPrepacking_ID: TIntegerField
      FieldName = 'Prepacking_ID'
    end
    object tmpItemsNSN_str: TStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object tmpItemsECN_str: TStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object tmpItemsICN_str: TStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object tmpItemsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object tmpItemsDescription_str: TWideStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object tmpItemsProductBatch_ID: TIntegerField
      FieldName = 'ProductBatch_ID'
    end
    object tmpItemsBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
    end
    object tmpItemsExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object tmpItemsPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object tmpItemsExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object tmpItemsQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object tmpItemsBatchQty: TIntegerField
      FieldName = 'BatchQty'
    end
    object tmpItemsBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 15
    end
    object tmpItemsProductCode_Str: TWideStringField
      FieldName = 'ProductCode_Str'
      Size = 14
    end
    object tmpItemsNotFromBulk_bol: TBooleanField
      FieldName = 'NotFromBulk_bol'
    end
    object tmpItemsQtyUsed_dbl: TFloatField
      FieldName = 'QtyUsed_dbl'
    end
    object tmpItemsRemainingSKUCalc_dbl: TFloatField
      FieldName = 'RemainingSKUCalc_dbl'
    end
    object tmpItemsRemainingSKUActual_dbl: TFloatField
      FieldName = 'RemainingSKUActual_dbl'
    end
    object tmpItemsSourcePortion_dbl: TFloatField
      FieldName = 'SourcePortion_dbl'
    end
  end
  object dstmpItems: TDataSource
    DataSet = tmpItems
    Left = 480
    Top = 368
  end
  object dsqryProductBatch: TDataSource
    DataSet = qryProductBatch
    Left = 424
    Top = 488
  end
  object qryProductBatch: TADOQuery
    Tag = 1
    Connection = adoPrepacking
    CursorType = ctStatic
    CommandTimeout = 180
    Parameters = <
      item
        Name = 'ProductCode_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT tblProductBatch.*, tblProductPackSize.Description_str'
      'FROM tblProductBatch '
      
        'LEFT OUTER JOIN tblProductPackSize ON tblProductPackSize.Product' +
        'Code_ID=tblProductBatch.ProductCode_ID'
      'WHERE tblProductBatch.ProductCode_ID=:ProductCode_ID')
    Left = 328
    Top = 488
    object qryProductBatchProductBatch_ID: TAutoIncField
      FieldName = 'ProductBatch_ID'
      ReadOnly = True
    end
    object qryProductBatchProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryProductBatchSupplier_ID: TIntegerField
      FieldName = 'Supplier_ID'
    end
    object qryProductBatchPrice_mon: TBCDField
      FieldName = 'Price_mon'
      Precision = 19
    end
    object qryProductBatchContractBrandName_str: TWideStringField
      FieldName = 'ContractBrandName_str'
      Size = 50
    end
    object qryProductBatchSupplierCode_str: TWideStringField
      FieldName = 'SupplierCode_str'
      Size = 5
    end
    object qryProductBatchBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
    end
    object qryProductBatchBarCode_str: TWideStringField
      FieldName = 'BarCode_str'
      Size = 12
    end
    object qryProductBatchExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object qryProductBatchQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object qryProductBatchQtyReceived_int: TIntegerField
      FieldName = 'QtyReceived_int'
    end
    object qryProductBatchQtyOnHold_int: TIntegerField
      FieldName = 'QtyOnHold_int'
    end
    object qryProductBatchBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 50
    end
    object qryProductBatchReceived_dat: TDateTimeField
      FieldName = 'Received_dat'
    end
    object qryProductBatchLastLeadTime_int: TIntegerField
      FieldName = 'LastLeadTime_int'
    end
    object qryProductBatchRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryProductBatchLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object qryProductBatchShippingPack_int: TIntegerField
      FieldName = 'ShippingPack_int'
    end
    object qryProductBatchDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 250
    end
  end
  object qryFindBatch: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    CommandTimeout = 180
    Parameters = <
      item
        Name = 'ProductBatchID'
        DataType = ftString
        Size = 1
        Value = '0'
      end
      item
        Name = 'PrepackingID'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    Prepared = True
    SQL.Strings = (
      'IF EXISTS ('
      'SELECT ProductBatch_ID FROM tblPrepackingItem'
      'WHERE  ProductBatch_ID=:ProductBatchID'
      'AND Prepacking_ID=:PrepackingID)'
      'SELECT 1 AS Result'
      'ELSE '
      'SELECT 0 AS Result')
    Left = 832
    Top = 448
  end
  object stp_ADDProductBatches: TADOCommand
    CommandText = 'strdprc_PrepackingADDBatches;1'
    CommandType = cmdStoredProc
    Connection = adoPrepacking
    Parameters = <
      item
        Name = '@PrepackingID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
        Name = '@BatchID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 584
    Top = 488
  end
  object qryPrepackingWorker: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    BeforePost = qryPrepackingWorkerBeforePost
    AfterScroll = qryPrepackingWorkerAfterScroll
    Parameters = <
      item
        Name = 'prepacking_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tblPrepacking.* FROM tblPrepacking'
      'WHERE tblPRepacking.PRepacking_ID=:prepacking_ID')
    Left = 40
    Top = 184
    object qryPrepackingWorkerPrepacking_ID: TAutoIncField
      FieldName = 'Prepacking_ID'
      ReadOnly = True
    end
    object qryPrepackingWorkerSystemStore_ID: TIntegerField
      FieldName = 'SystemStore_ID'
    end
    object qryPrepackingWorkerCreated_dat: TDateTimeField
      FieldName = 'Created_dat'
    end
    object qryPrepackingWorkerPrepackingRefNo_str: TWideStringField
      FieldName = 'PrepackingRefNo_str'
      Size = 50
    end
    object qryPrepackingWorkerPackedBy_str: TWideStringField
      FieldName = 'PackedBy_str'
      Size = 50
    end
    object qryPrepackingWorkerPacked_dat: TDateTimeField
      FieldName = 'Packed_dat'
    end
    object qryPrepackingWorkerCheckedBy_str: TWideStringField
      DisplayWidth = 50
      FieldName = 'CheckedBy_str'
      Size = 50
    end
    object qryPrepackingWorkerChecked_dat: TDateTimeField
      FieldName = 'Checked_dat'
    end
    object qryPrepackingWorkerProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
      OnChange = qryPrepackingWorkerProductCode_IDChange
    end
    object qryPrepackingWorkerResultantItem_str: TWideStringField
      FieldName = 'ResultantItem_str'
      Size = 250
    end
    object qryPrepackingWorkerResultPackSize_int: TIntegerField
      FieldName = 'ResultPackSize_int'
    end
    object qryPrepackingWorkerICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object qryPrepackingWorkerRemainderDemander_str: TWideStringField
      FieldName = 'RemainderDemander_str'
    end
    object qryPrepackingWorkerRemainderDemander_ID: TIntegerField
      FieldName = 'RemainderDemander_ID'
    end
    object qryPrepackingWorkerTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryPrepackingWorkerItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryPrepackingWorkerResultExpiry_dat: TDateTimeField
      FieldName = 'ResultExpiry_dat'
    end
    object qryPrepackingWorkerResultBatchNumber_str: TWideStringField
      FieldName = 'ResultBatchNumber_str'
      Size = 10
    end
    object qryPrepackingWorkerAdditionalCost_mon: TBCDField
      FieldName = 'AdditionalCost_mon'
      Precision = 19
    end
    object qryPrepackingWorkerFinalYield_int: TIntegerField
      FieldName = 'FinalYield_int'
      OnChange = qryPrepackingWorkerFinalYield_intChange
    end
    object qryPrepackingWorkerExpectedYield_int: TIntegerField
      FieldName = 'ExpectedYield_int'
      OnChange = qryPrepackingWorkerExpectedYield_intChange
    end
    object qryPrepackingWorkerRemainder_int: TIntegerField
      FieldName = 'Remainder_int'
    end
    object qryPrepackingWorkerHumidity_dbl: TFloatField
      FieldName = 'Humidity_dbl'
    end
    object qryPrepackingWorkerTemperature_dbl: TFloatField
      FieldName = 'Temperature_dbl'
    end
    object qryPrepackingWorkerPosted_bol: TBooleanField
      FieldName = 'Posted_bol'
    end
    object qryPrepackingWorkerPosted_dat: TDateTimeField
      FieldName = 'Posted_dat'
    end
    object qryPrepackingWorkerRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object q: TWideStringField
      FieldName = 'LastEditedBy_str'
      Size = 50
    end
    object qryPrepackingWorkerLastEditedBy_ID: TIntegerField
      FieldName = 'LastEditedBy_ID'
    end
    object qryPrepackingWorkerLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object qryPrepackingWorkerCheckedOut_bol: TBooleanField
      FieldName = 'CheckedOut_bol'
    end
    object qryPrepackingWorkerCheckedOutName_str: TWideStringField
      FieldName = 'CheckedOutName_str'
      Size = 50
    end
    object qryPrepackingWorkerCheckedOut_dat: TDateTimeField
      FieldName = 'CheckedOut_dat'
    end
    object qryPrepackingWorkerCheckedOutBy_ID: TIntegerField
      FieldName = 'CheckedOutBy_ID'
    end
    object qryPrepackingWorkerAccount_ID: TIntegerField
      FieldName = 'Account_ID'
    end
    object qryPrepackingWorkerAccount_str: TWideStringField
      FieldName = 'Account_str'
      Size = 100
    end
    object qryPrepackingWorkerPreposted_bol: TBooleanField
      FieldName = 'Preposted_bol'
    end
    object qryPrepackingWorkerPreposted_dat: TDateTimeField
      FieldName = 'Preposted_dat'
    end
    object qryPrepackingWorkerCalcYield_int: TIntegerField
      FieldName = 'CalcYield_int'
    end
    object qryPrepackingWorkerExpectedUnits_int: TIntegerField
      FieldName = 'ExpectedUnits_int'
    end
    object qryPrepackingWorkerCharges_mon: TBCDField
      FieldName = 'Charges_mon'
      OnChange = qryPrepackingWorkerCharges_monChange
      Precision = 19
    end
    object qryPrepackingWorkerResultCost_mon: TBCDField
      FieldName = 'ResultCost_mon'
      Precision = 19
    end
  end
  object dsqryPrepackingWorker: TDataSource
    DataSet = qryPrepackingWorker
    Left = 192
    Top = 184
  end
  object stp_PrepackingMarkComplete: TADOQuery
    Connection = adoPrepacking
    Parameters = <
      item
        Name = '@PrepackingID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Update tblPrepacking'
      'SET Posted_bol = 1, Posted_dat=GetDate()'
      'WHERE tblPrepacking.Prepacking_ID =:@PrepackingID')
    Left = 456
    Top = 120
  end
  object qryBatchOnHold: TADOQuery
    Tag = 1
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductBatch_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT Sum(ISNULL(TblRequisitionItems.QtyIssued_int, 0)) AS SumQ' +
        'tyOrdered_int'
      
        'FROM TblRequisition INNER JOIN TblRequisitionItems ON TblRequisi' +
        'tion.Requisition_ID = TblRequisitionItems.Requisition_ID'
      
        'WHERE (TblRequisition.Activated_bol=0) AND (TblRequisitionItems.' +
        'ProductBatch_ID=:ProductBatch_ID)')
    Left = 832
    Top = 216
  end
  object qryBatchOnHoldTotal: TADOQuery
    Tag = 1
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductBatch_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT Sum(ISNULL(TblRequisitionItems.QtyIssued_int, 0)) AS SumQ' +
        'tyOrdered_int'
      
        'FROM TblRequisition INNER JOIN TblRequisitionItems ON TblRequisi' +
        'tion.Requisition_ID = TblRequisitionItems.Requisition_ID'
      
        'WHERE (TblRequisition.Activated_bol=0) AND (TblRequisitionItems.' +
        'ProductBatch_ID=:ProductBatch_ID)')
    Left = 832
    Top = 310
  end
  object qryProductPack: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductCodeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ProductCode_ID, PackSizeValue_dbl, ICN_str, ECN_str, NSN_' +
        'str, ProductCode_str, productPackSize_ID'
      'FROM tblProductPackSize'
      'WHERE ProductCode_ID=:ProductCodeID')
    Left = 40
    Top = 472
    object qryProductPackProductCode_ID: TAutoIncField
      FieldName = 'ProductCode_ID'
      ReadOnly = True
    end
    object qryProductPackPackSizeValue_dbl: TFloatField
      FieldName = 'PackSizeValue_dbl'
    end
    object qryProductPackICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object qryProductPackECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object qryProductPackNSN_str: TWideStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object qryProductPackProductCode_str: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object qryProductPackproductPackSize_ID: TGuidField
      FieldName = 'productPackSize_ID'
      FixedChar = True
      Size = 38
    end
  end
  object qryGeneric_1: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductCodeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'SELECT GenericName_str, PackSizeValue_dbl, ShippingPack_int'
      'FROM tblProductPackSize'
      'WHERE ProductCode_ID=:ProductCodeID')
    Left = 832
    Top = 376
  end
  object tblProductBatch: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT tblProductBatch.*'
      'FROM tblProductBatch')
    Left = 688
    Top = 192
    object tblProductBatchProductBatch_ID: TAutoIncField
      FieldName = 'ProductBatch_ID'
      ReadOnly = True
    end
    object tblProductBatchProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object tblProductBatchSupplier_ID: TIntegerField
      FieldName = 'Supplier_ID'
    end
    object tblProductBatchPrice_mon: TBCDField
      FieldName = 'Price_mon'
      Precision = 19
    end
    object tblProductBatchContractBrandName_str: TWideStringField
      FieldName = 'ContractBrandName_str'
      Size = 50
    end
    object tblProductBatchSupplierCode_str: TWideStringField
      FieldName = 'SupplierCode_str'
      Size = 5
    end
    object tblProductBatchBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
    end
    object tblProductBatchBarCode_str: TWideStringField
      FieldName = 'BarCode_str'
      Size = 12
    end
    object tblProductBatchExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object tblProductBatchQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object tblProductBatchQtyReceived_int: TIntegerField
      FieldName = 'QtyReceived_int'
    end
    object tblProductBatchQtyOnHold_int: TIntegerField
      FieldName = 'QtyOnHold_int'
    end
    object tblProductBatchBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 50
    end
    object tblProductBatchReceived_dat: TDateTimeField
      FieldName = 'Received_dat'
    end
    object tblProductBatchLastLeadTime_int: TIntegerField
      FieldName = 'LastLeadTime_int'
    end
    object tblProductBatchRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object tblProductBatchLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object tblProductBatchShippingPack_int: TIntegerField
      FieldName = 'ShippingPack_int'
    end
  end
  object stp_DeleteAllItems: TADOQuery
    Connection = adoPrepacking
    Parameters = <
      item
        Name = 'PrepackingID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM tblPrepackingItem'
      'WHERE Prepacking_ID=:PrepackingID')
    Left = 200
    Top = 472
  end
  object qryTotalQtyonHand: TADOQuery
    Tag = 1
    Connection = adoPrepacking
    Parameters = <
      item
        Name = 'ProductCode_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ISNULL(view_ProductQtyOnHand.TotalQtyOnHand_int, 0) AS Qt' +
        'yOnHand_int'
      'FROM view_ProductQtyOnHand '
      ''
      'WHERE view_ProductQtyOnHand.ProductCode_ID = :ProductCode_ID')
    Left = 824
    Top = 115
  end
  object qryItemPrices: TADOQuery
    Connection = adoPrepacking
    CursorType = ctStatic
    DataSource = dsqryPrepackingWorker
    Parameters = <
      item
        Name = 'Prepacking_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT tblPrepackingItem.ProductCode_ID, tblPrepackingItem.PackC' +
        'ost_mon, tblPrepackingItem.SourcePortion_dbl, tblPrepackingItem.' +
        'QtyUsed_dbl'
      'FROM tblPrepackingItem '
      'WHERE tblPrepackingItem.Prepacking_ID=:Prepacking_ID'
      '')
    Left = 832
    Top = 520
    object qryItemPricesProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryItemPricesPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object qryItemPricesSourcePortion_dbl: TFloatField
      FieldName = 'SourcePortion_dbl'
    end
    object qryItemPricesQtyUsed_dbl: TFloatField
      FieldName = 'QtyUsed_dbl'
    end
  end
  object qryReportMain: TADOStoredProc
    Connection = adoPrepacking
    CursorType = ctStatic
    ProcedureName = 'strdprc_PrepackingReport;1'
    Parameters = <
      item
        Name = '@PrepackingID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 12
      end>
    Left = 344
    Top = 32
  end
  object dsqryReportMain: TDataSource
    DataSet = qryReportMain
    Left = 440
    Top = 32
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsqryReportMain
    UserName = 'DBPipeline1'
    Left = 536
    Top = 32
  end
  object ppReportMain: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
      'C:\MyWorks\Workspace\RxSolution\Lang 2\Code\Reports\prepackingLi' +
      'st.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 632
    Top = 32
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 46831
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ResultantItem_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 23813
        mmTop = 21431
        mmWidth = 66887
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Result ICN:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4128
        mmLeft = 2646
        mmTop = 16404
        mmWidth = 19071
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Number Of Packets:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 26194
        mmWidth = 33867
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'FinalYield_int'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 36513
        mmTop = 26194
        mmWidth = 5842
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DemanderName_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 27517
        mmTop = 11906
        mmWidth = 32766
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ICN_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 22490
        mmTop = 16669
        mmWidth = 12658
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 2646
        mmTop = 46038
        mmWidth = 263526
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Humidity:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 203465
        mmTop = 11906
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Humidity_dbl'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 220928
        mmTop = 11906
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Temperature:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 203465
        mmTop = 16669
        mmWidth = 22490
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Temperature_dbl'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 227542
        mmTop = 16669
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Batch number:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 203465
        mmTop = 25665
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ResultBatchNumber_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 229923
        mmTop = 25665
        mmWidth = 7789
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Expiry:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 203465
        mmTop = 30427
        mmWidth = 11906
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ResultExpiry_dat'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 217488
        mmTop = 30956
        mmWidth = 17526
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'New Price:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 203465
        mmTop = 21167
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ICN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 6879
        mmTop = 40746
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 22489
        mmTop = 40746
        mmWidth = 17717
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Batch number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 167746
        mmTop = 40746
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Expiry'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 204259
        mmTop = 40746
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 224896
        mmTop = 40746
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'NFB?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 231511
        mmTop = 40746
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 255059
        mmTop = 40746
        mmWidth = 8996
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 217488
        mmTop = 2381
        mmWidth = 32343
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Printed:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 203465
        mmTop = 2381
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4128
        mmLeft = 2646
        mmTop = 21431
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Repacking List'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 2646
        mmTop = 0
        mmWidth = 40217
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Theoretical Yield:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2647
        mmTop = 32015
        mmWidth = 29803
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExpectedYield_int'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 32808
        mmTop = 32014
        mmWidth = 5842
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Facility Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2910
        mmTop = 11906
        mmWidth = 23791
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reference No.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2646
        mmTop = 7408
        mmWidth = 24807
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'PrepackingRefNo_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 28575
        mmTop = 7408
        mmWidth = 32216
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ResultCost_mon'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 222780
        mmTop = 21167
        mmWidth = 10710
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ProductCode_ID_1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4128
        mmLeft = 2646
        mmTop = 794
        mmWidth = 3969
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        CharWrap = True
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Description_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 22490
        mmTop = 794
        mmWidth = 106627
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ingredientICN_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 6879
        mmTop = 794
        mmWidth = 7789
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ExtendedCost_mon'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 249767
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'BatchNumber_str'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 182034
        mmTop = 794
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Expiry_dat'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 196586
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'QtyUsed_dbl'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 228600
        mmTop = 794
        mmWidth = 1852
        BandType = 4
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        CheckBoxColor = clWindowText
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDBPipeline1
        DataField = 'NotFromBulk_bol'
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5292
        mmLeft = 233098
        mmTop = 794
        mmWidth = 4498
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = '..............................................................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 203730
        mmTop = 5292
        mmWidth = 60367
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Manufacturer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9868950
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 185473
        mmTop = 5292
        mmWidth = 20108
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 64823
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Checked by:.....................................................' +
          '............................Date:...............................' +
          '..........................................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2646
        mmTop = 53975
        mmWidth = 184574
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Signed Off by:..................................................' +
          '.............................Date:..............................' +
          '..........................................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2646
        mmTop = 60854
        mmWidth = 184658
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 265
        mmLeft = 2646
        mmTop = 45244
        mmWidth = 263526
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 246063
        mmTop = 60061
        mmWidth = 18055
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Packed by:......................................................' +
          '.............................Date:..............................' +
          '......................................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2647
        mmTop = 47096
        mmWidth = 179409
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = True
        Caption = 'AFFIX SAMPLE LABEL HERE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 43392
        mmLeft = 183092
        mmTop = 0
        mmWidth = 83079
        BandType = 8
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Number Of Labels Destroyed: ....................................' +
          '...........................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2647
        mmTop = 30692
        mmWidth = 111930
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Number Of  Labels Printed: .....................................' +
          '..............................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2647
        mmTop = 39158
        mmWidth = 112268
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object stpStockDemanderMoveStock: TADOStoredProc
    Tag = 1
    Connection = adoPrepacking
    ProcedureName = 'strdprc_AuditAPPENDDemanderRemainderStock;1'
    Parameters = <
      item
        Name = '@ProductID'
        Attributes = [paNullable]
        DataType = ftGuid
        Value = Null
      end
      item
        Name = '@DemanderFromUniqueID'
        Attributes = [paNullable]
        DataType = ftGuid
        Value = Null
      end
      item
        Name = '@Quantity'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@QtyUnits'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Reference'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 225
        Value = Null
      end
      item
        Name = '@User'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 200
        Value = Null
      end
      item
        Name = '@VoucherNo'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 225
        Value = Null
      end
      item
        Name = '@expiry'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@batchnumber'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 50
        Value = Null
      end>
    Left = 664
    Top = 358
  end
  object qryProductBatchQty: TADOQuery
    Tag = 1
    Connection = adoPrepacking
    CursorType = ctStatic
    CommandTimeout = 180
    Parameters = <
      item
        Name = 'ProductCode_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT tblProductBatch.*'
      'FROM tblProductBatch '
      'WHERE tblProductBatch.ProductCode_ID=:ProductCode_ID')
    Left = 328
    Top = 560
    object AutoIncField1: TAutoIncField
      FieldName = 'ProductBatch_ID'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Supplier_ID'
    end
    object BCDField1: TBCDField
      FieldName = 'Price_mon'
      Precision = 19
    end
    object WideStringField1: TWideStringField
      FieldName = 'ContractBrandName_str'
      Size = 50
    end
    object WideStringField2: TWideStringField
      FieldName = 'SupplierCode_str'
      Size = 5
    end
    object WideStringField3: TWideStringField
      FieldName = 'BatchNumber_str'
    end
    object WideStringField4: TWideStringField
      FieldName = 'BarCode_str'
      Size = 12
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object IntegerField3: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object IntegerField4: TIntegerField
      FieldName = 'QtyReceived_int'
    end
    object IntegerField5: TIntegerField
      FieldName = 'QtyOnHold_int'
    end
    object WideStringField5: TWideStringField
      FieldName = 'Bin_str'
      Size = 50
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Received_dat'
    end
    object IntegerField6: TIntegerField
      FieldName = 'LastLeadTime_int'
    end
    object MemoField1: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object IntegerField7: TIntegerField
      FieldName = 'ShippingPack_int'
    end
  end
  object qryIsRecordLocked: TADOQuery
    Connection = adoPrepacking
    Parameters = <
      item
        Name = 'Prepacking_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CheckedOut_bol'
      'FROM tblPrepacking'
      'WHERE Prepacking_ID=:Prepacking_ID')
    Left = 728
    Top = 568
  end
  object qryFindMainIngredient: TADOQuery
    Connection = adoPrepacking
    Parameters = <
      item
        Name = 'Generic'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PrepackingID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tblPrepackingItem.ProductCode_ID'
      
        'FROM tblPrepackingItem INNER JOIN tblProductPackSize ON tblPrepa' +
        'ckingItem.ProductCode_ID = tblProductPackSize.ProductCode_ID'
      'WHERE  tblProductPackSize.GenericName_str =:Generic'
      'AND  tblPrepackingItem.Prepacking_ID=:PrepackingID')
    Left = 832
    Top = 584
  end
end
