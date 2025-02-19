object RequisitionDM: TRequisitionDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 332
  Top = 53
  Height = 948
  Width = 1378
  object ADORequisitionConnection: TADOConnection
    CommandTimeout = 400
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=rxsolution;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=RxBarCoding;Data Source=.\sqlexpre' +
      'ss'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    OnWillExecute = ADORequisitionConnectionWillExecute
    Left = 58
    Top = 12
  end
  object dstblRequisitionsCatalog: TDataSource
    DataSet = qryRequisitionsCatalog
    Left = 475
    Top = 68
  end
  object dstblRequisitionsCatalogUniqueDemanders: TDataSource
    DataSet = qryUserSpecifiDemanders
    Left = 323
    Top = 116
  end
  object dstblRequisitionsReport: TDataSource
    DataSet = qryRequisitionsReport
    Left = 603
    Top = 94
  end
  object dsqryADOSystemWharehouse: TDataSource
    DataSet = stpSystemWharehouse
    Left = 187
    Top = 172
  end
  object dsstpStockControlRequisition: TDataSource
    DataSet = stpStockControlRequisition
    Left = 435
    Top = 308
  end
  object stpStockControlRequisition: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    BeforePost = stpStockControlRequisitionBeforePost
    OnNewRecord = stpStockControlRequisitionNewRecord
    ProcedureName = 'strdprc_StockControlRequisition'
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Prepared = True
    Left = 99
    Top = 276
    object stpStockControlRequisitionRequisition_ID: TAutoIncField
      FieldName = 'Requisition_ID'
      ReadOnly = True
    end
    object stpStockControlRequisitionDemander_ID: TIntegerField
      FieldName = 'Demander_ID'
      OnChange = stpStockControlRequisitionDemander_IDChange
    end
    object stpStockControlRequisitionDemander_Str: TStringField
      FieldName = 'Demander_Str'
      Size = 100
    end
    object stpStockControlRequisitionSystemStore_ID: TIntegerField
      FieldName = 'SystemStore_ID'
      OnChange = stpStockControlRequisitionSystemStore_IDChange
    end
    object stpStockControlRequisitionSystemStore_str: TStringField
      FieldName = 'SystemStore_str'
      Size = 100
    end
    object stpStockControlRequisitionRequisition_str: TStringField
      FieldName = 'Requisition_str'
      Size = 50
    end
    object stpStockControlRequisitionRequisition_dat: TDateTimeField
      FieldName = 'Requisition_dat'
    end
    object stpStockControlRequisitionVoucherNo_str: TStringField
      FieldName = 'VoucherNo_str'
      Size = 50
    end
    object stpStockControlRequisitionOrderedBy_str: TStringField
      FieldName = 'OrderedBy_str'
      OnChange = stpStockControlRequisitionOrderedBy_strChange
      Size = 50
    end
    object stpStockControlRequisitionAuthorizedBy_str: TStringField
      FieldName = 'AuthorizedBy_str'
      OnChange = stpStockControlRequisitionAuthorizedBy_strChange
      Size = 50
    end
    object stpStockControlRequisitionAuthorized_Dat: TDateTimeField
      FieldName = 'Authorized_Dat'
    end
    object stpStockControlRequisitionCharges_mon: TBCDField
      FieldName = 'Charges_mon'
      OnChange = stpStockControlRequisitionCharges_monChange
      Precision = 19
    end
    object stpStockControlRequisitionTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object stpStockControlRequisitionItemsNo_int: TSmallintField
      FieldName = 'ItemsNo_int'
    end
    object stpStockControlRequisitionRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object stpStockControlRequisitionActivatedBy_str: TStringField
      FieldName = 'ActivatedBy_str'
      Size = 50
    end
    object stpStockControlRequisitionActivated_bol: TBooleanField
      FieldName = 'Activated_bol'
    end
    object stpStockControlRequisitionActivated_dat: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object stpStockControlRequisitionIssuedBy_str: TStringField
      FieldName = 'IssuedBy_str'
      OnChange = stpStockControlRequisitionIssuedBy_strChange
      Size = 50
    end
    object stpStockControlRequisitionIssued_Dat: TDateTimeField
      FieldName = 'Issued_Dat'
    end
    object stpStockControlRequisitionReceived_dat: TDateTimeField
      FieldName = 'Received_dat'
    end
    object stpStockControlRequisitionReceivedBy_str: TStringField
      FieldName = 'ReceivedBy_str'
      OnChange = stpStockControlRequisitionReceivedBy_strChange
      Size = 50
    end
    object stpStockControlRequisitionLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object stpStockControlRequisitionCode_str: TStringField
      FieldName = 'Code_str'
      Size = 12
    end
    object stpStockControlRequisitionLastUpdateBy_str: TStringField
      FieldName = 'LastUpdateBy_str'
      Size = 75
    end
    object stpStockControlRequisitionLastUpdateBy_dbl: TIntegerField
      FieldName = 'LastUpdateBy_dbl'
    end
    object stpStockControlRequisitionCompleted_bol: TBooleanField
      FieldName = 'Completed_bol'
    end
    object stpStockControlRequisitionItemsComplete_bol: TBooleanField
      FieldName = 'ItemsComplete_bol'
    end
    object stpStockControlRequisitionDemaderBudget_mon: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'DemaderBudget_mon'
      LookupDataSet = tblRequisitionsCatalogUniqueDemanders
      LookupKeyFields = 'Demander_ID'
      LookupResultField = 'Budget_mon'
      KeyFields = 'Demander_ID'
      Lookup = True
    end
    object stpStockControlRequisitionDemanderBudgetBalance_mon: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'DemanderBudgetBalance_mon'
      LookupDataSet = tblRequisitionsCatalogUniqueDemanders
      LookupKeyFields = 'Demander_ID'
      LookupResultField = 'BudgetBalance_mon'
      KeyFields = 'Demander_ID'
      Lookup = True
    end
    object stpStockControlRequisitionPOReference_str: TWideStringField
      FieldName = 'POReference_str'
      Size = 50
    end
    object stpStockControlRequisitionCheckedOutBy_ID: TIntegerField
      FieldName = 'CheckedOutBy_ID'
    end
    object stpStockControlRequisitionCheckedOutName_str: TWideStringField
      FieldName = 'CheckedOutName_str'
      Size = 50
    end
    object stpStockControlRequisitionCheckedOut_bol: TBooleanField
      FieldName = 'CheckedOut_bol'
    end
    object stpStockControlRequisitionCheckedOut_dat: TDateTimeField
      FieldName = 'CheckedOut_dat'
    end
    object stpStockControlRequisitionSupplier_ID: TIntegerField
      FieldName = 'Supplier_ID'
      OnChange = stpStockControlRequisitionSupplier_IDChange
    end
    object stpStockControlRequisitionSupplier_Str: TWideStringField
      FieldName = 'Supplier_Str'
      Size = 30
    end
    object stpStockControlRequisitionOrdered_dat: TDateTimeField
      FieldName = 'Ordered_dat'
    end
  end
  object dsstpStockControlRequisitionItems: TDataSource
    DataSet = stpStockControlRequisitionItems
    Left = 435
    Top = 356
  end
  object stpStockControlRequisitionItems: TADOStoredProc
    Tag = 1
    CacheSize = 30
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Filtered = True
    AfterOpen = stpStockControlRequisitionItemsAfterOpen
    AfterInsert = stpStockControlRequisitionItemsAfterInsert
    BeforePost = stpStockControlRequisitionItemsBeforePost
    AfterPost = stpStockControlRequisitionItemsAfterPost
    AfterDelete = stpStockControlRequisitionItemsAfterDelete
    OnNewRecord = stpStockControlRequisitionItemsNewRecord
    ProcedureName = 'strdprc_StockControlRequisitionItems'
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Prepared = True
    Left = 99
    Top = 324
    object stpStockControlRequisitionItemsRequisitionItems_ID: TAutoIncField
      FieldName = 'RequisitionItems_ID'
      ReadOnly = True
    end
    object stpStockControlRequisitionItemsRequisition_ID: TIntegerField
      FieldName = 'Requisition_ID'
    end
    object stpStockControlRequisitionItemsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object stpStockControlRequisitionItemsQtyDemanderOnHand_int: TIntegerField
      FieldName = 'QtyDemanderOnHand_int'
      OnChange = stpStockControlRequisitionItemsQtyDemanderOnHand_intChange
    end
    object stpStockControlRequisitionItemsQtyOrdered_int: TIntegerField
      FieldName = 'QtyOrdered_int'
    end
    object stpStockControlRequisitionItemsQtyIssued_int: TIntegerField
      FieldName = 'QtyIssued_int'
      OnChange = stpStockControlRequisitionItemsQtyIssued_intChange
    end
    object stpStockControlRequisitionItemsQtyAuthorized_int: TIntegerField
      FieldName = 'QtyAuthorized_int'
      OnChange = stpStockControlRequisitionItemsQtyAuthorized_intChange
    end
    object stpStockControlRequisitionItemsPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object stpStockControlRequisitionItemsExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object stpStockControlRequisitionItemsLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object stpStockControlRequisitionItemsLastUpdate_int: TIntegerField
      FieldName = 'LastUpdate_int'
    end
    object stpStockControlRequisitionItemsQtyOnOrder_int: TIntegerField
      FieldName = 'QtyOnOrder_int'
    end
    object stpStockControlRequisitionItemsRequisition_str: TStringField
      FieldName = 'Requisition_str'
      Size = 50
    end
    object stpStockControlRequisitionItemsProductCode_str: TStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object stpStockControlRequisitionItemsNSN_str: TStringField
      FieldName = 'NSN_str'
      Size = 14
    end
    object stpStockControlRequisitionItemsICN_str: TStringField
      FieldName = 'ICN_str'
      Size = 14
    end
    object stpStockControlRequisitionItemsECN_str: TStringField
      FieldName = 'ECN_str'
      Size = 14
    end
    object stpStockControlRequisitionItemsDeliveryDate_dat: TDateTimeField
      FieldName = 'DeliveryDate_dat'
    end
    object stpStockControlRequisitionItemsQtyOnBackOrder_int: TIntegerField
      FieldName = 'QtyOnBackOrder_int'
    end
    object stpStockControlRequisitionItemsExtendedCostPot_mon: TBCDField
      FieldName = 'ExtendedCostPot_mon'
      Precision = 19
    end
    object stpStockControlRequisitionItemsLastUpdateBy_dbl: TIntegerField
      FieldName = 'LastUpdateBy_dbl'
    end
    object stpStockControlRequisitionItemsLastUpdateBy_str: TStringField
      FieldName = 'LastUpdateBy_str'
      Size = 75
    end
    object stpStockControlRequisitionItemsCompleted_bol: TBooleanField
      FieldName = 'Completed_bol'
    end
    object stpStockControlRequisitionItemsQtyCostingRequest_int: TIntegerField
      FieldName = 'QtyCostingRequest_int'
    end
    object stpStockControlRequisitionItemsBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object stpStockControlRequisitionItemsExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object stpStockControlRequisitionItemsReceiptItem_ID: TIntegerField
      FieldName = 'ReceiptItem_ID'
    end
    object stpStockControlRequisitionItemsDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object stpStockControlRequisitionItemsDescription: TStringField
      FieldName = 'Description'
      Size = 250
    end
    object stpStockControlRequisitionItemsGroup1_str: TWideStringField
      FieldName = 'Group1_str'
      Size = 50
    end
    object stpStockControlRequisitionItemsGroup2_str: TWideStringField
      FieldName = 'Group2_str'
      Size = 50
    end
    object stpStockControlRequisitionItemsShippingPack_int: TIntegerField
      FieldName = 'ShippingPack_int'
    end
    object stpStockControlRequisitionItemsBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 5
    end
    object stpStockControlRequisitionItemsProductBatch_ID: TIntegerField
      FieldName = 'ProductBatch_ID'
    end
    object stpStockControlRequisitionItemsAvailable: TIntegerField
      DefaultExpression = '0'
      FieldKind = fkLookup
      FieldName = 'Available'
      LookupDataSet = qryTotalQtyonHand
      LookupKeyFields = 'ProductCode_ID'
      LookupResultField = 'QtyAvailable'
      KeyFields = 'ProductCode_ID'
      Lookup = True
    end
    object stpStockControlRequisitionItemsMarkUp_dbl: TFloatField
      FieldName = 'MarkUp_dbl'
    end
    object stpStockControlRequisitionItemsCal_PackCost: TFloatField
      DefaultExpression = '0'
      FieldName = 'Cal_PackCost'
    end
    object stpStockControlRequisitionItemsVATUsed_dbl: TFloatField
      FieldName = 'VATUsed_dbl'
    end
    object stpStockControlRequisitionItemsQtyApproved_int: TIntegerField
      FieldName = 'QtyApproved_int'
    end
  end
  object stpStockControlRequisitionItemsTotals: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'strdprc_StockControlRequisitionItemsTotals'
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Left = 99
    Top = 436
    object stpStockControlRequisitionItemsTotalsCountOfRequisitionItems_ID: TIntegerField
      FieldName = 'CountOfRequisitionItems_ID'
      ReadOnly = True
    end
    object stpStockControlRequisitionItemsTotalsSumOfExtendedCost_mon: TBCDField
      FieldName = 'SumOfExtendedCost_mon'
      ReadOnly = True
      Precision = 19
    end
    object stpStockControlRequisitionItemsTotalsSumOfExtendedCostPot_mon: TBCDField
      FieldName = 'SumOfExtendedCostPot_mon'
      ReadOnly = True
      Precision = 19
    end
    object stpStockControlRequisitionItemsTotalsCostDiff: TBCDField
      FieldName = 'CostDiff'
      ReadOnly = True
      Precision = 19
    end
  end
  object dsstpStockControlRequisitionItemsTotals: TDataSource
    DataSet = stpStockControlRequisitionItemsTotals
    Left = 435
    Top = 452
  end
  object stpRequisitionsDemanderAuthorisedItems: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_RequisitionsDemanderAuthorisedItems'
    Parameters = <
      item
        Name = 'DemanderID'
        DataType = ftFloat
        Value = 0
      end>
    Left = 97
    Top = 583
    object stpRequisitionsDemanderAuthorisedItemsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object stpRequisitionsDemanderAuthorisedItemsCost_mon: TBCDField
      FieldName = 'Cost_mon'
      Precision = 19
    end
    object stpRequisitionsDemanderAuthorisedItemsQtyAuthorized_int: TIntegerField
      FieldName = 'QtyAuthorized_int'
    end
    object stpRequisitionsDemanderAuthorisedItemsMaxStockSet_int: TIntegerField
      FieldName = 'MaxStockSet_int'
    end
  end
  object stpRequisitionsDemanderInstitutionalEDLItemsAdd: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_RequisitionUPDATE_AddInstitutionalEDLProducts'
    Parameters = <
      item
        Name = 'RequisitionID'
        DataType = ftFloat
        Value = 1
      end>
    Left = 96
    Top = 687
  end
  object stpRequisitionUPDATE_DeleteAllProductItems: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_RequisitionUPDATE_DeleteAllProductItems'
    Parameters = <
      item
        Name = 'RequisitionID'
        DataType = ftFloat
        Value = Null
      end>
    Left = 440
    Top = 592
  end
  object stpStockControlRequisitionEditHistory: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_RequisitionsEditHistory'
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Left = 96
    Top = 376
    object stpStockControlRequisitionEditHistoryRequisitionHistory_ID: TAutoIncField
      FieldName = 'RequisitionHistory_ID'
      ReadOnly = True
    end
    object stpStockControlRequisitionEditHistoryRequisition_ID: TIntegerField
      FieldName = 'Requisition_ID'
    end
    object stpStockControlRequisitionEditHistoryDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 255
    end
    object stpStockControlRequisitionEditHistoryUser_ID: TIntegerField
      FieldName = 'User_ID'
    end
    object stpStockControlRequisitionEditHistoryDate_dat: TDateTimeField
      FieldName = 'Date_dat'
    end
    object stpStockControlRequisitionEditHistoryProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object stpStockControlRequisitionEditHistoryRequisitionItem_ID: TIntegerField
      FieldName = 'RequisitionItem_ID'
    end
    object stpStockControlRequisitionEditHistoryType_str: TStringField
      FieldName = 'Type_str'
      Size = 25
    end
    object stpStockControlRequisitionEditHistoryUserName_str: TStringField
      FieldName = 'UserName_str'
      Size = 75
    end
    object stpStockControlRequisitionEditHistoryItem_ID: TIntegerField
      FieldName = 'Item_ID'
    end
  end
  object dsstpStockControlRequisitionEditHistory: TDataSource
    DataSet = stpStockControlRequisitionEditHistory
    Left = 436
    Top = 407
  end
  object stpRequisitionsAPPEND_Audit: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_RequisitionsAPPEND_Audit'
    Parameters = <
      item
        Name = 'RequisitionID'
        DataType = ftFloat
        Value = Null
      end>
    Left = 96
    Top = 631
  end
  object stpRequisitionsItemsDELETE_NoIssues: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_RequisitionsItemsDELETE_NoIssues'
    Parameters = <
      item
        Name = 'RequisitionID'
        DataType = ftFloat
        Value = Null
      end>
    Left = 96
    Top = 536
  end
  object dstblSystemUsers: TDataSource
    DataSet = tblSystemUsers
    Left = 411
    Top = 20
  end
  object dsstpRequisitionsReportPicklist: TDataSource
    DataSet = qryRequisitionsReportPicklist
    Left = 754
    Top = 91
  end
  object stpRequisition_BackOrderItemsPerDemander: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_Requisition_BackOrderItemsPerDemander'
    Parameters = <
      item
        Name = 'DemanderID'
        DataType = ftFloat
        Value = Null
      end>
    Left = 443
    Top = 525
    object stpRequisition_BackOrderItemsPerDemanderDemander_ID: TIntegerField
      FieldName = 'Demander_ID'
    end
    object stpRequisition_BackOrderItemsPerDemanderProductCode_ID: TAutoIncField
      FieldName = 'ProductCode_ID'
      ReadOnly = True
    end
    object stpRequisition_BackOrderItemsPerDemanderSumOfQtyOrdered_int: TIntegerField
      FieldName = 'SumOfQtyOrdered_int'
      ReadOnly = True
    end
    object stpRequisition_BackOrderItemsPerDemanderSumOfQtyIssued_int: TIntegerField
      FieldName = 'SumOfQtyIssued_int'
      ReadOnly = True
    end
    object stpRequisition_BackOrderItemsPerDemanderMaxOfQtyAuthorized_int: TIntegerField
      FieldName = 'MaxOfQtyAuthorized_int'
      ReadOnly = True
    end
    object stpRequisition_BackOrderItemsPerDemanderMaxOfMaxStockSet_int: TIntegerField
      FieldName = 'MaxOfMaxStockSet_int'
      ReadOnly = True
    end
    object stpRequisition_BackOrderItemsPerDemanderMaxOfCost_mon: TBCDField
      FieldName = 'MaxOfCost_mon'
      ReadOnly = True
      Precision = 19
    end
    object stpRequisition_BackOrderItemsPerDemanderMaxOfPackCost_mon: TBCDField
      FieldName = 'MaxOfPackCost_mon'
      ReadOnly = True
      Precision = 19
    end
  end
  object qryRequisitionsCatalog: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    OnFilterRecord = qryRequisitionsCatalogFilterRecord
    Parameters = <
      item
        Name = 'StartDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 37539d
      end
      item
        Name = 'EndDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 37571d
      end>
    SQL.Strings = (
      
        'SELECT TblRequisition.Requisition_dat, TblRequisition.Activated_' +
        'bol, TblRequisition.Requisition_str, TblRequisition.VoucherNo_st' +
        'r, TblRequisition.Requisition_ID, TblRequisition.SystemStore_ID,' +
        ' '
      
        'TblRequisition.Demander_ID, TblRequisition.Ordered_dat, TblRequi' +
        'sition.OrderedBy_str, TblRequisition.AuthorizedBy_str, TblRequis' +
        'ition.Authorized_Dat, TblRequisition.Charges_mon, '
      
        'TblRequisition.TotalCost_mon, TotalCost_mon AS ReqCost, TblRequi' +
        'sition.ItemsNo_int, TblRequisition.ActivatedBy_str, TblRequisiti' +
        'on.Activated_dat, TblRequisition.IssuedBy_str, TblRequisition.Is' +
        'sued_Dat, '
      
        'TblRequisition.Received_dat, TblRequisition.ReceivedBy_str, TblR' +
        'equisition.LastUpdate_dat, TblDemander.Name_str, TblDemander.Cod' +
        'e_str, TblDemander.Type_str, TblRequisition.Demander_Str, '
      
        'TblRequisition.SystemStore_str, TblRequisition.ItemsComplete_bol' +
        ', TblRequisition.POReference_str,'
      
        'TblRequisition.CheckedOutBy_ID, TblRequisition.CheckedOutName_st' +
        'r, TblRequisition.CheckedOut_bol, TblRequisition.CheckedOut_dat'
      
        'FROM TblRequisition LEFT OUTER JOIN TblDemander ON TblDemander.D' +
        'emander_ID = TblRequisition.Demander_ID'
      
        'WHERE (((TblRequisition.Requisition_dat)>=:StartDate And (TblReq' +
        'uisition.Requisition_dat)<=:EndDate))'
      
        'ORDER BY TblRequisition.Requisition_dat DESC , TblRequisition.Ac' +
        'tivated_bol DESC , TblRequisition.Requisition_str, TblRequisitio' +
        'n.VoucherNo_str;')
    Left = 64
    Top = 64
    object qryRequisitionsCatalogRequisition_dat: TDateTimeField
      FieldName = 'Requisition_dat'
    end
    object qryRequisitionsCatalogActivated_bol: TBooleanField
      FieldName = 'Activated_bol'
    end
    object qryRequisitionsCatalogRequisition_str: TStringField
      FieldName = 'Requisition_str'
      Size = 50
    end
    object qryRequisitionsCatalogVoucherNo_str: TStringField
      FieldName = 'VoucherNo_str'
      Size = 50
    end
    object qryRequisitionsCatalogRequisition_ID: TAutoIncField
      FieldName = 'Requisition_ID'
      ReadOnly = True
    end
    object qryRequisitionsCatalogSystemStore_ID: TIntegerField
      FieldName = 'SystemStore_ID'
    end
    object qryRequisitionsCatalogDemander_ID: TIntegerField
      FieldName = 'Demander_ID'
    end
    object qryRequisitionsCatalogOrdered_dat: TDateTimeField
      FieldName = 'Ordered_dat'
    end
    object qryRequisitionsCatalogOrderedBy_str: TStringField
      FieldName = 'OrderedBy_str'
      Size = 50
    end
    object qryRequisitionsCatalogAuthorizedBy_str: TStringField
      FieldName = 'AuthorizedBy_str'
      Size = 50
    end
    object qryRequisitionsCatalogAuthorized_Dat: TDateTimeField
      FieldName = 'Authorized_Dat'
    end
    object qryRequisitionsCatalogCharges_mon: TBCDField
      FieldName = 'Charges_mon'
      Precision = 19
    end
    object qryRequisitionsCatalogTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryRequisitionsCatalogReqCost: TBCDField
      FieldName = 'ReqCost'
      Precision = 19
    end
    object qryRequisitionsCatalogItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryRequisitionsCatalogActivatedBy_str: TStringField
      FieldName = 'ActivatedBy_str'
      Size = 50
    end
    object qryRequisitionsCatalogActivated_dat: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object qryRequisitionsCatalogIssuedBy_str: TStringField
      FieldName = 'IssuedBy_str'
      Size = 50
    end
    object qryRequisitionsCatalogIssued_Dat: TDateTimeField
      FieldName = 'Issued_Dat'
    end
    object qryRequisitionsCatalogReceived_dat: TDateTimeField
      FieldName = 'Received_dat'
    end
    object qryRequisitionsCatalogReceivedBy_str: TStringField
      FieldName = 'ReceivedBy_str'
      Size = 50
    end
    object qryRequisitionsCatalogLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object qryRequisitionsCatalogName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object qryRequisitionsCatalogCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object qryRequisitionsCatalogType_str: TWideStringField
      FieldName = 'Type_str'
      Size = 50
    end
    object qryRequisitionsCatalogDemander_Str: TStringField
      FieldName = 'Demander_Str'
      Size = 100
    end
    object qryRequisitionsCatalogSystemStore_str: TStringField
      FieldName = 'SystemStore_str'
      Size = 100
    end
    object qryRequisitionsCatalogItemsComplete_bol: TBooleanField
      FieldName = 'ItemsComplete_bol'
    end
    object qryRequisitionsCatalogPOReference_str: TWideStringField
      FieldName = 'POReference_str'
      Size = 50
    end
    object qryRequisitionsCatalogCheckedOutBy_ID: TIntegerField
      FieldName = 'CheckedOutBy_ID'
    end
    object qryRequisitionsCatalogCheckedOutName_str: TWideStringField
      FieldName = 'CheckedOutName_str'
      Size = 50
    end
    object qryRequisitionsCatalogCheckedOut_bol: TBooleanField
      FieldName = 'CheckedOut_bol'
    end
    object qryRequisitionsCatalogCheckedOut_dat: TDateTimeField
      FieldName = 'CheckedOut_dat'
    end
  end
  object ADOCommand_General: TADOCommand
    Connection = ADORequisitionConnection
    Parameters = <>
    Left = 248
    Top = 280
  end
  object ADOCommand1: TADOCommand
    CommandText = 'strdprc_RequisitionsItemsADD_Single'
    CommandType = cmdStoredProc
    Connection = ADORequisitionConnection
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyAuthorizedint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'LastUpdatedat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'QtyOrderedint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyIssuedint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyDemanderOnHandint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyOnBackOrderint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'ProductCodeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 248
    Top = 232
  end
  object tblRequisitionsCatalogUniqueDemanders: TADOTable
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    OnFilterRecord = tblRequisitionsCatalogUniqueDemandersFilterRecord
    IndexFieldNames = 'Code_str'
    TableName = 'strdprc_RequisitionsCatalogUniqueDemanders'
    Left = 64
    Top = 120
    object tblRequisitionsCatalogUniqueDemandersDemander_ID: TAutoIncField
      FieldName = 'Demander_ID'
      ReadOnly = True
    end
    object tblRequisitionsCatalogUniqueDemandersName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object tblRequisitionsCatalogUniqueDemandersCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object tblRequisitionsCatalogUniqueDemandersActive_bol: TBooleanField
      FieldName = 'Active_bol'
    end
    object tblRequisitionsCatalogUniqueDemandersOpenOrMaxDriven: TBooleanField
      FieldName = 'OpenOrMaxDriven'
    end
    object tblRequisitionsCatalogUniqueDemandersBudget_mon: TBCDField
      FieldName = 'Budget_mon'
      Precision = 19
    end
    object tblRequisitionsCatalogUniqueDemandersBudgetBalance_mon: TBCDField
      FieldName = 'BudgetBalance_mon'
      Precision = 19
    end
  end
  object tblGeneralProductStockDetails: TADOTable
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    TableName = 'strdprc_GeneralProductStockDetails'
    Left = 96
    Top = 224
    object tblGeneralProductStockDetailsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object tblGeneralProductStockDetailsCost_mon: TBCDField
      FieldName = 'Cost_mon'
      Precision = 19
    end
    object tblGeneralProductStockDetailsProductCode_str: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object tblGeneralProductStockDetailsNSN_str: TWideStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object tblGeneralProductStockDetailsICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object tblGeneralProductStockDetailsECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object tblGeneralProductStockDetailsStockLevel_int: TIntegerField
      FieldName = 'StockLevel_int'
    end
    object tblGeneralProductStockDetailsStockLevelPot_int: TIntegerField
      FieldName = 'StockLevelPot_int'
    end
    object tblGeneralProductStockDetailsQtyOnRequest_int: TIntegerField
      FieldName = 'QtyOnRequest_int'
    end
    object tblGeneralProductStockDetailsQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object tblGeneralProductStockDetailsQtyOnOrder_int: TIntegerField
      FieldName = 'QtyOnOrder_int'
    end
    object tblGeneralProductStockDetailsQtyOnHold_int: TIntegerField
      FieldName = 'QtyOnHold_int'
    end
    object tblGeneralProductStockDetailsMaxStockSet_int: TIntegerField
      FieldName = 'MaxStockSet_int'
    end
    object tblGeneralProductStockDetailsDescription: TWideStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 470
    end
    object tblGeneralProductStockDetailsPackSize: TWideStringField
      FieldName = 'PackSize'
      ReadOnly = True
      Size = 101
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsqryRequisitionsCatalog
    RefreshAfterPost = True
    UserName = 'DBPipeline1'
    Left = 648
    Top = 384
  end
  object dsqryRequisitionsCatalog: TDataSource
    DataSet = qryRequisitionsCatalog
    Left = 312
    Top = 64
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 720
    Top = 384
    Version = '11.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object stpRequisitionMarkAsComplete: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    ProcedureName = 'strdprc_RequisitionsItemsMarkAsComplete'
    Parameters = <
      item
        Name = 'ReqID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 664
    Top = 472
  end
  object stpStockControlRequisitionItemsComplete: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_StockControlRequisitionItemsComplete'
    Parameters = <
      item
        Name = 'ReqID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Prepared = True
    Left = 664
    Top = 528
    object stpStockControlRequisitionItemsCompleteRequisition_ID: TIntegerField
      FieldName = 'Requisition_ID'
    end
  end
  object stpGetDemanderYTDE: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    ProcedureName = 'strdprc_Demander_YTDE'
    Parameters = <
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 251
    Top = 455
  end
  object stpSetDemanderBudgetBalance: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    ProcedureName = 'strdprc_DemanderUPDATEBudgetBalance'
    Parameters = <
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@DemanderYTDE'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end>
    Left = 256
    Top = 514
  end
  object qryRequisitionsReport: TADOStoredProc
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    CommandTimeout = 180
    ProcedureName = 'strdprc_RequisitionsReport'
    Parameters = <
      item
        Name = '@Requisition_ID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 600
    Top = 32
    object qryRequisitionsReportGroup1_str: TWideStringField
      FieldName = 'Group1_str'
      Size = 50
    end
    object qryRequisitionsReportSupplement_str: TWideStringField
      FieldName = 'Supplement_str'
      Size = 100
    end
    object qryRequisitionsReportDescription_str: TStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object qryRequisitionsReportProductCode_str: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object qryRequisitionsReportNSN_str: TWideStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object qryRequisitionsReportICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object qryRequisitionsReportECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object qryRequisitionsReportCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object qryRequisitionsReportRequisition_str: TStringField
      FieldName = 'Requisition_str'
      Size = 50
    end
    object qryRequisitionsReportRequisition_ID: TAutoIncField
      FieldName = 'Requisition_ID'
      ReadOnly = True
    end
    object qryRequisitionsReportOrdered_dat: TDateTimeField
      FieldName = 'Ordered_dat'
    end
    object qryRequisitionsReportOrderedBy_str: TStringField
      FieldName = 'OrderedBy_str'
      Size = 50
    end
    object qryRequisitionsReportAuthorizedBy_str: TStringField
      FieldName = 'AuthorizedBy_str'
      Size = 50
    end
    object qryRequisitionsReportAuthorized_Dat: TDateTimeField
      FieldName = 'Authorized_Dat'
    end
    object qryRequisitionsReportVoucherNo_str: TStringField
      FieldName = 'VoucherNo_str'
      Size = 50
    end
    object qryRequisitionsReportCharges_mon: TBCDField
      FieldName = 'Charges_mon'
      Precision = 19
    end
    object qryRequisitionsReportTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryRequisitionsReportReceived_dat: TDateTimeField
      FieldName = 'Received_dat'
    end
    object qryRequisitionsReportItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryRequisitionsReportRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryRequisitionsReportActivated_bol: TBooleanField
      FieldName = 'Activated_bol'
    end
    object qryRequisitionsReportActivated_dat: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object qryRequisitionsReportQtyOrdered_int: TIntegerField
      FieldName = 'QtyOrdered_int'
    end
    object qryRequisitionsReportQtyDemanderOnHand_int: TIntegerField
      FieldName = 'QtyDemanderOnHand_int'
    end
    object qryRequisitionsReportQtyIssued_int: TIntegerField
      FieldName = 'QtyIssued_int'
    end
    object qryRequisitionsReportprd_QtyOnHand: TIntegerField
      FieldName = 'prd_QtyOnHand'
      ReadOnly = True
    end
    object qryRequisitionsReportQtyAuthorized_int: TIntegerField
      FieldName = 'QtyAuthorized_int'
    end
    object qryRequisitionsReportBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object qryRequisitionsReportExpiry_Dat: TDateTimeField
      FieldName = 'Expiry_Dat'
    end
    object qryRequisitionsReportPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object qryRequisitionsReportExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object qryRequisitionsReportName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object qryRequisitionsReportAddress1_str: TWideStringField
      FieldName = 'Address1_str'
      Size = 50
    end
    object qryRequisitionsReportAddress2_str: TWideStringField
      FieldName = 'Address2_str'
      Size = 50
    end
    object qryRequisitionsReportAddress3_str: TWideStringField
      FieldName = 'Address3_str'
      Size = 50
    end
    object qryRequisitionsReportCity_str: TWideStringField
      FieldName = 'City_str'
      Size = 50
    end
    object qryRequisitionsReportIssued_Dat: TDateTimeField
      FieldName = 'Issued_Dat'
    end
    object qryRequisitionsReportIssuedBy_str: TStringField
      FieldName = 'IssuedBy_str'
      Size = 50
    end
    object qryRequisitionsReportQtyReqExtCost: TBCDField
      FieldName = 'QtyReqExtCost'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportCal_PackCost: TBCDField
      FieldName = 'Cal_PackCost'
      Precision = 19
    end
    object qryRequisitionsReportVATUsed_dbl: TFloatField
      FieldName = 'VATUsed_dbl'
      ReadOnly = True
    end
    object qryRequisitionsReportSellingPricePack: TFloatField
      FieldName = 'SellingPricePack'
      ReadOnly = True
    end
    object qryRequisitionsReportCalQtyPricePack: TBCDField
      FieldName = 'CalQtyPricePack'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportTotalQtySellingPrice: TFloatField
      FieldName = 'TotalQtySellingPrice'
      ReadOnly = True
    end
    object qryRequisitionsReportVatOnEach: TFloatField
      FieldName = 'VatOnEach'
      ReadOnly = True
    end
    object qryRequisitionsReportTotalVatOnEach: TFloatField
      FieldName = 'TotalVatOnEach'
      ReadOnly = True
    end
    object qryRequisitionsReportPotCalQtyPricePack: TBCDField
      FieldName = 'PotCalQtyPricePack'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportPotTotalQtySellingPrice: TFloatField
      FieldName = 'PotTotalQtySellingPrice'
      ReadOnly = True
    end
    object qryRequisitionsReportPotVatOnEach: TFloatField
      FieldName = 'PotVatOnEach'
      ReadOnly = True
    end
    object qryRequisitionsReportPotTotalVatOnEach: TFloatField
      FieldName = 'PotTotalVatOnEach'
      ReadOnly = True
    end
    object qryRequisitionsReportDemName_str: TWideStringField
      FieldName = 'DemName_str'
      Size = 50
    end
    object qryRequisitionsReportDemCode_Str: TWideStringField
      FieldName = 'DemCode_Str'
      Size = 14
    end
    object qryRequisitionsReportDemDescrip_Str: TWideStringField
      FieldName = 'DemDescrip_Str'
      ReadOnly = True
      Size = 67
    end
    object qryRequisitionsReportDemAccount_str: TWideStringField
      FieldName = 'DemAccount_str'
      Size = 50
    end
    object qryRequisitionsReportDemAddress1_str: TWideStringField
      FieldName = 'DemAddress1_str'
      Size = 100
    end
    object qryRequisitionsReportDemAddress2_str: TWideStringField
      FieldName = 'DemAddress2_str'
      Size = 100
    end
    object qryRequisitionsReportDemCity_str: TWideStringField
      FieldName = 'DemCity_str'
      Size = 100
    end
    object qryRequisitionsReportDemAddressCode_str: TWideStringField
      FieldName = 'DemAddressCode_str'
      Size = 100
    end
    object qryRequisitionsReportDemCountry: TWideStringField
      FieldName = 'DemCountry'
      Size = 100
    end
    object qryRequisitionsReportDemanderCode_str: TWideStringField
      FieldName = 'DemanderCode_str'
      Size = 10
    end
    object qryRequisitionsReportDemanderName_str: TWideStringField
      FieldName = 'DemanderName_str'
      Size = 50
    end
    object qryRequisitionsReportSysAddress1_str: TWideStringField
      FieldName = 'SysAddress1_str'
      Size = 150
    end
    object qryRequisitionsReportSysAddress2_str: TWideStringField
      FieldName = 'SysAddress2_str'
      Size = 150
    end
    object qryRequisitionsReportSysAddress3_str: TWideStringField
      FieldName = 'SysAddress3_str'
      Size = 150
    end
    object qryRequisitionsReportSysCity_str: TWideStringField
      FieldName = 'SysCity_str'
      Size = 150
    end
    object qryRequisitionsReportBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 5
    end
    object qryRequisitionsReportGroup2_str: TWideStringField
      FieldName = 'Group2_str'
      Size = 50
    end
    object qryRequisitionsReportSystemCode_str: TStringField
      FieldName = 'SystemCode_str'
      Size = 13
    end
    object qryRequisitionsReportAccount_str: TStringField
      FieldName = 'Account_str'
      Size = 25
    end
    object qryRequisitionsReportAccountName_str: TStringField
      FieldName = 'AccountName_str'
      Size = 100
    end
    object qryRequisitionsReportReceivedBy_str: TStringField
      FieldName = 'ReceivedBy_str'
      Size = 50
    end
    object qryRequisitionsReportBudget_mon: TBCDField
      FieldName = 'Budget_mon'
      Precision = 19
    end
    object qryRequisitionsReportBudgetBalance_mon: TBCDField
      FieldName = 'BudgetBalance_mon'
      Precision = 19
    end
    object qryRequisitionsReportQtyIssdExtCost: TBCDField
      FieldName = 'QtyIssdExtCost'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportProvincialLogo_img: TBlobField
      FieldName = 'ProvincialLogo_img'
    end
    object qryRequisitionsReportQtyApproved_int: TIntegerField
      FieldName = 'QtyApproved_int'
    end
    object qryRequisitionsReportQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object qryRequisitionsReportQtyOnOrder_int: TIntegerField
      FieldName = 'QtyOnOrder_int'
    end
    object qryRequisitionsReportApprovedCost: TBCDField
      FieldName = 'ApprovedCost'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportValonHand: TBCDField
      FieldName = 'ValonHand'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportValordered: TBCDField
      FieldName = 'Valordered'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportValReceived: TBCDField
      FieldName = 'ValReceived'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportISOStdNumber_str: TWideStringField
      FieldName = 'ISOStdNumber_str'
      Size = 50
    end
  end
  object qryRequisitionsReportPicklist: TADOStoredProc
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    ProcedureName = 'strdprc_RequisitionsReportPicklist'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Requisition_ID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 0
      end>
    Left = 752
    Top = 32
    object qryRequisitionsReportPicklistICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object qryRequisitionsReportPicklistSupplement_str: TWideStringField
      FieldName = 'Supplement_str'
      Size = 100
    end
    object qryRequisitionsReportPicklistBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 5
    end
    object qryRequisitionsReportPicklistDescription: TWideStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 420
    end
    object qryRequisitionsReportPicklistProductCode_str: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object qryRequisitionsReportPicklistCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object qryRequisitionsReportPicklistRequisition_str: TStringField
      FieldName = 'Requisition_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistRequisition_ID: TAutoIncField
      FieldName = 'Requisition_ID'
      ReadOnly = True
    end
    object qryRequisitionsReportPicklistOrdered_dat: TDateTimeField
      FieldName = 'Ordered_dat'
    end
    object qryRequisitionsReportPicklistOrderedBy_str: TStringField
      FieldName = 'OrderedBy_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistAuthorizedBy_str: TStringField
      FieldName = 'AuthorizedBy_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistAuthorized_Dat: TDateTimeField
      FieldName = 'Authorized_Dat'
    end
    object qryRequisitionsReportPicklistVoucherNo_str: TStringField
      FieldName = 'VoucherNo_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistCharges_mon: TBCDField
      FieldName = 'Charges_mon'
      Precision = 19
    end
    object qryRequisitionsReportPicklistTotalCost_mon: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object qryRequisitionsReportPicklistReceived_dat: TDateTimeField
      FieldName = 'Received_dat'
    end
    object qryRequisitionsReportPicklistItemsNo_int: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object qryRequisitionsReportPicklistRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryRequisitionsReportPicklistActivated_bol: TBooleanField
      FieldName = 'Activated_bol'
    end
    object qryRequisitionsReportPicklistActivated_dat: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object qryRequisitionsReportPicklistQtyOrdered_int: TIntegerField
      FieldName = 'QtyOrdered_int'
    end
    object qryRequisitionsReportPicklistQtyDemanderOnHand_int: TIntegerField
      FieldName = 'QtyDemanderOnHand_int'
    end
    object qryRequisitionsReportPicklistprd_QtyOnHand: TIntegerField
      FieldName = 'prd_QtyOnHand'
      ReadOnly = True
    end
    object qryRequisitionsReportPicklistQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object qryRequisitionsReportPicklistQtyAuthorized_int: TIntegerField
      FieldName = 'QtyAuthorized_int'
    end
    object qryRequisitionsReportPicklistPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object qryRequisitionsReportPicklistExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object qryRequisitionsReportPicklistGenericName_str: TWideStringField
      FieldName = 'GenericName_str'
      Size = 255
    end
    object qryRequisitionsReportPicklistStrength_str: TWideStringField
      FieldName = 'Strength_str'
      Size = 30
    end
    object qryRequisitionsReportPicklistForm_str: TWideStringField
      FieldName = 'Form_str'
      Size = 30
    end
    object qryRequisitionsReportPicklistRoute_str: TWideStringField
      FieldName = 'Route_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistCost_mon: TBCDField
      FieldName = 'Cost_mon'
      Precision = 19
    end
    object qryRequisitionsReportPicklistName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistAddress1_str: TWideStringField
      FieldName = 'Address1_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistAddress2_str: TWideStringField
      FieldName = 'Address2_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistAddress3_str: TWideStringField
      FieldName = 'Address3_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistCity_str: TWideStringField
      FieldName = 'City_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistIssued_Dat: TDateTimeField
      FieldName = 'Issued_Dat'
    end
    object qryRequisitionsReportPicklistIssuedBy_str: TStringField
      FieldName = 'IssuedBy_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistQtyReqExtCost: TBCDField
      FieldName = 'QtyReqExtCost'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportPicklistDemanderCode_str: TWideStringField
      FieldName = 'DemanderCode_str'
      Size = 10
    end
    object qryRequisitionsReportPicklistDemanderName_str: TWideStringField
      FieldName = 'DemanderName_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistSysAddress1_str: TWideStringField
      FieldName = 'SysAddress1_str'
      Size = 150
    end
    object qryRequisitionsReportPicklistSysAddress2_str: TWideStringField
      FieldName = 'SysAddress2_str'
      Size = 150
    end
    object qryRequisitionsReportPicklistSysAddress3_str: TWideStringField
      FieldName = 'SysAddress3_str'
      Size = 150
    end
    object qryRequisitionsReportPicklistSysCity_str: TWideStringField
      FieldName = 'SysCity_str'
      Size = 150
    end
    object qryRequisitionsReportPicklistGroup1_str: TWideStringField
      FieldName = 'Group1_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistGroup2_str: TWideStringField
      FieldName = 'Group2_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistSystemCode_str: TStringField
      FieldName = 'SystemCode_str'
      Size = 13
    end
    object qryRequisitionsReportPicklistAccount_str: TStringField
      FieldName = 'Account_str'
      Size = 25
    end
    object qryRequisitionsReportPicklistAccountName_str: TStringField
      FieldName = 'AccountName_str'
      Size = 100
    end
    object qryRequisitionsReportPicklistECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object qryRequisitionsReportPicklistBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object qryRequisitionsReportPicklistExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object qryRequisitionsReportPicklistQtyIssdExtCost: TBCDField
      FieldName = 'QtyIssdExtCost'
      ReadOnly = True
      Precision = 19
    end
    object qryRequisitionsReportPicklistProvincialLogo_img: TBlobField
      FieldName = 'ProvincialLogo_img'
    end
    object qryRequisitionsReportPicklistISOStdNumber_str: TWideStringField
      FieldName = 'ISOStdNumber_str'
      Size = 50
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 360
    Top = 232
  end
  object AuditTableCounter: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    Parameters = <
      item
        Name = 'Item_ID'
        DataType = ftFloat
        Value = 0
      end>
    SQL.Strings = (
      'Select Count(Audit_ID) as Total from TblAudit where :Item_ID')
    Left = 480
    Top = 232
  end
  object ADOQuery1: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    DataSource = dsstpStockControlRequisitionItems
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
    Left = 605
    Top = 306
  end
  object stpAuditAPPEND: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    ProcedureName = 'strdprc_AuditAPPEND'
    Parameters = <
      item
        Name = 'SystemStoreID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = 'ProductCodeID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = 'DemanderID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = 'SupplierID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = 'ItemID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = 'Type'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1
        Value = Null
      end
      item
        Name = 'Reference'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 25
        Value = Null
      end
      item
        Name = 'DemanderSupplier'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'ProductCode'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'VoucherNo'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'Date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'Quantity'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'Value'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = Null
      end
      item
        Name = 'QuantityOnHand'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'User'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'NSN'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'ICN'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'ECN'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'BatchNumber_str'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 100
        Value = Null
      end
      item
        Name = 'ExpiryDate_dat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 744
    Top = 168
  end
  object tmrRefresher: TTimer
    Interval = 30000
    OnTimer = tmrRefresherTimer
    Left = 744
    Top = 231
  end
  object qryCurrentOnHold: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TblRequisitionItems.ProductCode_ID,  Sum(TblRequisitionIt' +
        'ems.QtyIssued_int) AS SumOfQtyOrdered_int'
      
        'FROM TblRequisition INNER JOIN TblRequisitionItems ON TblRequisi' +
        'tion.Requisition_ID = TblRequisitionItems.Requisition_ID'
      'WHERE ((TblRequisition.Activated_bol)=0) '
      'GROUP BY TblRequisitionItems.ProductCode_ID')
    Left = 624
    Top = 664
  end
  object qryCurrentOnOrder: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TblOrderItems.ProductCode_ID, Sum(TblOrderItems.QtyOrdere' +
        'd_int) AS SumOfQtyOrdered_int'
      
        'FROM TblOrder INNER JOIN TblOrderItems ON TblOrder.OrderNo_ID = ' +
        'TblOrderItems.OrderNo_ID'
      
        'WHERE (((TblOrder.Activated_bol)=1) AND ((TblOrderItems.Complete' +
        'd_bol)=0))'
      'GROUP BY TblOrderItems.ProductCode_ID;')
    Left = 624
    Top = 720
  end
  object dsqryProductBatch: TDataSource
    DataSet = qryProductBatch
    Left = 248
    Top = 392
  end
  object qryProductBatch: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
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
      'SELECT * FROM tblProductBatch'
      'WHERE ProductCode_ID=:ProductCode_ID')
    Left = 248
    Top = 344
  end
  object qryUpdateBatchQty: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductBatch_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM tblProductBatch'
      'WHERE ProductBatch_ID=:ProductBatch_ID')
    Left = 840
    Top = 784
    object qryUpdateBatchQtyProductBatch_ID: TAutoIncField
      FieldName = 'ProductBatch_ID'
      ReadOnly = True
    end
    object qryUpdateBatchQtyProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object qryUpdateBatchQtySupplier_ID: TIntegerField
      FieldName = 'Supplier_ID'
    end
    object qryUpdateBatchQtyPrice_mon: TBCDField
      FieldName = 'Price_mon'
      Precision = 19
    end
    object qryUpdateBatchQtyContractBrandName_str: TWideStringField
      FieldName = 'ContractBrandName_str'
      Size = 50
    end
    object qryUpdateBatchQtySupplierCode_str: TWideStringField
      FieldName = 'SupplierCode_str'
      Size = 5
    end
    object qryUpdateBatchQtyBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
    end
    object qryUpdateBatchQtyBarCode_str: TWideStringField
      FieldName = 'BarCode_str'
      Size = 12
    end
    object qryUpdateBatchQtyExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object qryUpdateBatchQtyQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object qryUpdateBatchQtyQtyReceived_int: TIntegerField
      FieldName = 'QtyReceived_int'
    end
    object qryUpdateBatchQtyQtyOnHold_int: TIntegerField
      FieldName = 'QtyOnHold_int'
    end
    object qryUpdateBatchQtyBin_str: TWideStringField
      FieldName = 'Bin_str'
      Size = 50
    end
    object qryUpdateBatchQtyReceived_dat: TDateTimeField
      FieldName = 'Received_dat'
    end
    object qryUpdateBatchQtyLastLeadTime_int: TIntegerField
      FieldName = 'LastLeadTime_int'
    end
    object qryUpdateBatchQtyRemarks_mem: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object qryUpdateBatchQtyLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object qryUpdateBatchQtyShippingPack_int: TIntegerField
      FieldName = 'ShippingPack_int'
    end
  end
  object qryCheckBatchOnHand: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'BatchRecpID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.TblReceiptItems.BatchNumber_str, dbo.TblReceiptItems.' +
        'Expiry_dat, TblReceiptItems.BatchQty_int, ISNULL(TblReceiptItems' +
        '.QtyOnHold_int, 0) AS QtyOnHold_int'
      'FROM         dbo.TblReceiptItems'
      'WHERE     tblReceiptItems.ReceiptItem_ID=:BatchRecpID')
    Left = 840
    Top = 840
    object qryCheckBatchOnHandBatchNumber_str: TStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object qryCheckBatchOnHandExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object qryCheckBatchOnHandBatchQty_int: TIntegerField
      FieldName = 'BatchQty_int'
    end
    object qryCheckBatchOnHandQtyOnHold_int: TIntegerField
      FieldName = 'QtyOnHold_int'
    end
  end
  object ADOQuery2: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    DataSource = dsstpStockControlRequisitionItems
    Parameters = <
      item
        Name = '@ReceiptItem_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.TblReceiptItems.BatchNumber_str, dbo.TblReceiptItems.' +
        'Expiry_dat, dbo.TblReceiptItems.QtyReceived_int, TblReceiptItems' +
        '.QtyonHold_int, TblReceiptItems.BatchQty_int,'
      
        '                      dbo.TblReceiptItems.ProductCode_ID, dbo.tb' +
        'lProductPackSize.QtyOnHand_int, TblReceiptItems.ReceiptItem_ID, ' +
        'TblReceiptItems.PackCost_mon'
      'FROM         dbo.TblReceiptItems, dbo.tblProductPackSize'
      'WHERE (dbo.TblReceiptItems.ReceiptItem_ID=:@ReceiptItem_ID) ')
    Left = 1104
    Top = 840
  end
  object qryRequisitionsReport_byDescrip: TADOStoredProc
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    CommandTimeout = 180
    ProcedureName = 'strdprc_RequisitionsReport_ByDescrip'
    Parameters = <
      item
        Name = '@Requisition_ID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 600
    Top = 168
    object WideStringField1: TWideStringField
      FieldName = 'Group1_str'
      Size = 50
    end
    object WideStringField2: TWideStringField
      FieldName = 'Supplement_str'
      Size = 100
    end
    object StringField1: TStringField
      FieldName = 'Description_str'
      Size = 250
    end
    object WideStringField3: TWideStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object WideStringField4: TWideStringField
      FieldName = 'NSN_str'
      Size = 13
    end
    object WideStringField5: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object WideStringField6: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object WideStringField7: TWideStringField
      FieldName = 'Code_str'
      Size = 14
    end
    object StringField2: TStringField
      FieldName = 'Requisition_str'
      Size = 50
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'Requisition_ID'
      ReadOnly = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Ordered_dat'
    end
    object StringField3: TStringField
      FieldName = 'OrderedBy_str'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'AuthorizedBy_str'
      Size = 50
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Authorized_Dat'
    end
    object StringField5: TStringField
      FieldName = 'VoucherNo_str'
      Size = 50
    end
    object BCDField1: TBCDField
      FieldName = 'Charges_mon'
      Precision = 19
    end
    object BCDField2: TBCDField
      FieldName = 'TotalCost_mon'
      Precision = 19
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'Received_dat'
    end
    object IntegerField1: TIntegerField
      FieldName = 'ItemsNo_int'
    end
    object MemoField1: TMemoField
      FieldName = 'Remarks_mem'
      BlobType = ftMemo
    end
    object BooleanField1: TBooleanField
      FieldName = 'Activated_bol'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'Activated_dat'
    end
    object IntegerField2: TIntegerField
      FieldName = 'QtyOrdered_int'
    end
    object IntegerField3: TIntegerField
      FieldName = 'QtyDemanderOnHand_int'
    end
    object IntegerField4: TIntegerField
      FieldName = 'QtyIssued_int'
    end
    object IntegerField5: TIntegerField
      FieldName = 'prd_QtyOnHand'
      ReadOnly = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'QtyAuthorized_int'
    end
    object WideStringField8: TWideStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'Expiry_Dat'
    end
    object BCDField3: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object BCDField4: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object WideStringField9: TWideStringField
      FieldName = 'Name_str'
      Size = 50
    end
    object WideStringField10: TWideStringField
      FieldName = 'Address1_str'
      Size = 50
    end
    object WideStringField11: TWideStringField
      FieldName = 'Address2_str'
      Size = 50
    end
    object WideStringField12: TWideStringField
      FieldName = 'Address3_str'
      Size = 50
    end
    object WideStringField13: TWideStringField
      FieldName = 'City_str'
      Size = 50
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'Issued_Dat'
    end
    object StringField6: TStringField
      FieldName = 'IssuedBy_str'
      Size = 50
    end
    object BCDField5: TBCDField
      FieldName = 'QtyReqExtCost'
      ReadOnly = True
      Precision = 19
    end
    object WideStringField14: TWideStringField
      FieldName = 'DemanderCode_str'
      Size = 10
    end
    object WideStringField15: TWideStringField
      FieldName = 'DemanderName_str'
      Size = 50
    end
    object WideStringField16: TWideStringField
      FieldName = 'SysAddress1_str'
      Size = 150
    end
    object WideStringField17: TWideStringField
      FieldName = 'SysAddress2_str'
      Size = 150
    end
    object WideStringField18: TWideStringField
      FieldName = 'SysAddress3_str'
      Size = 150
    end
    object WideStringField19: TWideStringField
      FieldName = 'SysCity_str'
      Size = 150
    end
    object WideStringField20: TWideStringField
      FieldName = 'Bin_str'
      Size = 5
    end
    object WideStringField21: TWideStringField
      FieldName = 'Group2_str'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'SystemCode_str'
      Size = 13
    end
    object StringField8: TStringField
      FieldName = 'Account_str'
      Size = 25
    end
    object StringField9: TStringField
      FieldName = 'AccountName_str'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'ReceivedBy_str'
      Size = 50
    end
    object BCDField6: TBCDField
      FieldName = 'Budget_mon'
      Precision = 19
    end
    object BCDField7: TBCDField
      FieldName = 'BudgetBalance_mon'
      Precision = 19
    end
    object BCDField8: TBCDField
      FieldName = 'QtyIssdExtCost'
      ReadOnly = True
      Precision = 19
    end
  end
  object dsReportByDescription: TDataSource
    DataSet = qryRequisitionsReport_byDescrip
    Left = 603
    Top = 230
  end
  object qryBatchOnHold: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
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
    Left = 488
    Top = 736
  end
  object qryTotalQtyonHand1: TADOQuery
    Connection = ADORequisitionConnection
    Parameters = <>
    SQL.Strings = (
      
        'SELECT (ISNULL(view_ProductQtyOnHand.TotalQtyOnHand_int, 0) - IS' +
        'NULL(view_ProductQtyOnHold.SumQtyonHold_int,0)) AS QtyAvailable,' +
        ' tblProductPackSize.ProductCode_ID'
      
        'FROM tblProductPackSize LEFT OUTER JOIN view_ProductQtyOnHand ON' +
        ' view_ProductQtyOnHand.ProductCode_ID = tblProductPackSize.Produ' +
        'ctCode_ID '
      
        'LEFT OUTER JOIN view_ProductQtyOnHold ON view_ProductQtyOnHold.P' +
        'roductCode_ID = tblProductPackSize.ProductCode_ID')
    Left = 192
    Top = 64
  end
  object stp_CustomReport: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    Parameters = <>
    Left = 832
    Top = 240
  end
  object qrySqlStatements: TADOTable
    Connection = ADORequisitionConnection
    TableName = 'tblReport_Queries'
    Left = 840
    Top = 304
  end
  object dsstp_CustomReport: TDataSource
    DataSet = stp_CustomReport
    Left = 936
    Top = 232
  end
  object stp_UpdateItemsVat: TADOStoredProc
    Connection = ADORequisitionConnection
    ProcedureName = 'strdprc_RequisitionsItemsUpdateVAT;1'
    Parameters = <
      item
        Name = '@ReqID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@VAT'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 928
    Top = 384
  end
  object qryTotalQtyonHand: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    DataSource = dsstpStockControlRequisitionItems
    Parameters = <>
    SQL.Strings = (
      
        'SELECT (ISNULL(view_ProductQtyOnHand.TotalQtyOnHand_int, 0)) AS ' +
        'QtyAvailable, tblProductPackSize.ProductCode_ID'
      
        'FROM tblProductPackSize LEFT OUTER JOIN view_ProductQtyOnHand ON' +
        ' view_ProductQtyOnHand.ProductCode_ID = tblProductPackSize.Produ' +
        'ctCode_ID '
      
        'LEFT OUTER JOIN view_ProductQtyOnHold ON view_ProductQtyOnHold.P' +
        'roductCode_ID = tblProductPackSize.ProductCode_ID')
    Left = 376
    Top = 176
    object qryTotalQtyonHandQtyAvailable: TIntegerField
      FieldName = 'QtyAvailable'
      ReadOnly = True
    end
    object qryTotalQtyonHandProductCode_ID: TAutoIncField
      FieldName = 'ProductCode_ID'
      ReadOnly = True
    end
    object qryTotalQtyonHandIssued: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Issued'
      LookupDataSet = qryOnHoldOnRequisition
      LookupKeyFields = 'ProductCode_ID'
      LookupResultField = 'SumQtyIssued'
      KeyFields = 'ProductCode_ID'
      Lookup = True
    end
  end
  object qryProductBatch1: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
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
      'DECLARE @IsBatching bit'
      'DECLARE @ProductCode_ID int'
      ''
      
        'SET @IsBatching = ISNULL((SELECT batchManagement_bol From tblSys' +
        'tem) ,0)'
      'SET @ProductCode_ID =:ProductCode_ID'
      ''
      'IF @IsBatching = 0'
      'BEGIN'
      'SELECT * FROM tblProductBatch'
      'WHERE ProductCode_ID=@ProductCode_ID'
      'END'
      ''
      'IF @IsBatching = 1'
      'BEGIN'
      'SELECT * FROM tblProductBatch'
      'WHERE ProductCode_ID=@ProductCode_ID'
      'AND Expiry_dat > GETDATE()  '
      'END')
    Left = 336
    Top = 344
  end
  object stp_ADDProductBatches: TADOCommand
    CommandText = 'strdprc_RequisitionsItemsADDBatches;1'
    CommandType = cmdStoredProc
    Connection = ADORequisitionConnection
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyAuthorizedint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'LastUpdatedat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'QtyOrderedint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyIssuedint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyDemanderOnHandint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'QtyOnBackOrderint'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'ProductCodeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'BatchID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'Expiry'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'BatchNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 848
    Top = 504
  end
  object tmpItems: TADOQuery
    Connection = ADORequisitionConnection
    BeforePost = tmpItemsBeforePost
    AfterPost = tmpItemsAfterPost
    OnCalcFields = tmpItemsCalcFields
    Parameters = <
      item
        Name = 'RequisitionID'
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
      
        'SELECT tblRequisitionItems.*, tblProductBatch.QtyOnHand_int AS B' +
        'atchQty'
      'FROM tblRequisitionItems'
      
        'INNER JOIN tblProductBatch ON tblRequisitionItems.ProductBatch_I' +
        'D = tblProductBatch.ProductBatch_ID'
      
        'WHERE (tblRequisitionItems.Requisition_ID=:RequisitionID) AND (t' +
        'blRequisitionItems.ProductCode_ID=:ProductCodeID)'
      'ORDER BY tblRequisitionItems.Expiry_Dat')
    Left = 848
    Top = 592
    object tmpItemsRequisitionItems_ID: TAutoIncField
      FieldName = 'RequisitionItems_ID'
      ReadOnly = True
    end
    object tmpItemsRequisition_ID: TIntegerField
      FieldName = 'Requisition_ID'
    end
    object tmpItemsProductCode_ID: TIntegerField
      FieldName = 'ProductCode_ID'
    end
    object tmpItemsQtyDemanderOnHand_int: TIntegerField
      FieldName = 'QtyDemanderOnHand_int'
    end
    object tmpItemsQtyOrdered_int: TIntegerField
      FieldName = 'QtyOrdered_int'
    end
    object tmpItemsQtyIssued_int: TIntegerField
      FieldName = 'QtyIssued_int'
    end
    object tmpItemsQtyAuthorized_int: TIntegerField
      FieldName = 'QtyAuthorized_int'
    end
    object tmpItemsPackCost_mon: TBCDField
      FieldName = 'PackCost_mon'
      Precision = 19
    end
    object tmpItemsExtendedCost_mon: TBCDField
      FieldName = 'ExtendedCost_mon'
      Precision = 19
    end
    object tmpItemsLastUpdate_dat: TDateTimeField
      FieldName = 'LastUpdate_dat'
    end
    object tmpItemsLastUpdate_int: TIntegerField
      FieldName = 'LastUpdate_int'
    end
    object tmpItemsQtyOnHand_int: TIntegerField
      FieldName = 'QtyOnHand_int'
    end
    object tmpItemsQtyOnOrder_int: TIntegerField
      FieldName = 'QtyOnOrder_int'
    end
    object tmpItemsRequisition_str: TStringField
      FieldName = 'Requisition_str'
      Size = 50
    end
    object tmpItemsProductCode_str: TStringField
      FieldName = 'ProductCode_str'
      Size = 14
    end
    object tmpItemsNSN_str: TStringField
      FieldName = 'NSN_str'
      Size = 14
    end
    object tmpItemsICN_str: TStringField
      FieldName = 'ICN_str'
      Size = 14
    end
    object tmpItemsECN_str: TStringField
      FieldName = 'ECN_str'
      Size = 14
    end
    object tmpItemsDeliveryDate_dat: TDateTimeField
      FieldName = 'DeliveryDate_dat'
    end
    object tmpItemsQtyOnBackOrder_int: TIntegerField
      FieldName = 'QtyOnBackOrder_int'
    end
    object tmpItemsExtendedCostPot_mon: TBCDField
      FieldName = 'ExtendedCostPot_mon'
      Precision = 19
    end
    object tmpItemsLastUpdateBy_dbl: TIntegerField
      FieldName = 'LastUpdateBy_dbl'
    end
    object tmpItemsLastUpdateBy_str: TStringField
      FieldName = 'LastUpdateBy_str'
      Size = 75
    end
    object tmpItemsCompleted_bol: TBooleanField
      FieldName = 'Completed_bol'
    end
    object tmpItemsQtyCostingRequest_int: TIntegerField
      FieldName = 'QtyCostingRequest_int'
    end
    object tmpItemsBatchNumber_str: TWideStringField
      FieldName = 'BatchNumber_str'
      Size = 50
    end
    object tmpItemsExpiry_dat: TDateTimeField
      FieldName = 'Expiry_dat'
    end
    object tmpItemsReceiptItem_ID: TIntegerField
      FieldName = 'ReceiptItem_ID'
    end
    object tmpItemsProductBatch_ID: TIntegerField
      FieldName = 'ProductBatch_ID'
    end
    object tmpItemsMarkUp_dbl: TFloatField
      FieldName = 'MarkUp_dbl'
    end
    object tmpItemsCal_PackCost: TBCDField
      FieldName = 'Cal_PackCost'
      Precision = 19
    end
    object tmpItemsVATUsed_dbl: TFloatField
      FieldName = 'VATUsed_dbl'
    end
    object tmpItemsBatchQty_int: TIntegerField
      FieldName = 'BatchQty_int'
    end
    object tmpItemsBatchQty: TIntegerField
      FieldName = 'BatchQty'
    end
  end
  object dstmpItems: TDataSource
    DataSet = tmpItems
    Left = 936
    Top = 592
  end
  object qryBatchProductOnHold: TADOQuery
    Connection = ADORequisitionConnection
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT tblRequisitionItems.ProductBatch_ID, view_BatchProductOnH' +
        'old.SumQtyOnHold_int'
      
        'FROM tblRequisitionItems INNER JOIN view_BatchProductOnHold ON v' +
        'iew_BatchProductOnHold.ProductBatch_ID = tblRequisitionItems.Pro' +
        'ductBatch_ID'
      'WHERE tblRequisitionItems.Requisition_ID=:RequisitionID')
    Left = 1096
    Top = 712
  end
  object dsOnHoldBatch: TDataSource
    DataSet = qryBatchProductOnHold
    Left = 1208
    Top = 712
  end
  object qryFindBatch: TADOQuery
    Connection = ADORequisitionConnection
    CommandTimeout = 180
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ProductBatchID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'IF EXISTS ('
      'SELECT ProductBatch_ID FROM tblRequisitionItems'
      'WHERE Requisition_ID=:RequisitionID'
      'AND ProductBatch_ID=:ProductBatchID)'
      'SELECT 1 AS Result'
      'ELSE '
      'SELECT 0 AS Result')
    Left = 952
    Top = 464
  end
  object qryOnHoldOnRequisition: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    CommandTimeout = 180
    Parameters = <
      item
        Name = 'RequisitionID'
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
      
        'SELECT SUM(QtyIssued_int) AS SumQtyIssued, tblRequisitionItems.P' +
        'roductCode_ID'
      'FROM tblRequisitionItems'
      
        'INNER JOIN tblRequisition ON tblRequisition.Requisition_ID=tblRe' +
        'quisitionITems.Requisition_ID'
      'WHERE (tblRequisition.Activated_bol = 0) '
      'AND(tblRequisitionItems.Requisition_ID=:RequisitionID)'
      'AND(tblRequisitionItems.ProductCode_ID=:ProductCodeID)'
      'GROUP BY tblRequisitionItems.ProductCode_ID')
    Left = 488
    Top = 672
  end
  object qryOnHoldBatchOnRequisition: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RequisitionID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ProductBatchID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT SUM(QtyIssued_int) AS SumQtyIssued, tblRequisitionItems.P' +
        'roductBatch_ID'
      'FROM tblRequisitionItems'
      
        'INNER JOIN tblRequisition ON tblRequisition.Requisition_ID=tblRe' +
        'quisitionITems.Requisition_ID'
      'WHERE (tblRequisition.Activated_bol = 0) '
      'AND(tblRequisitionItems.Requisition_ID=:RequisitionID)'
      'AND(tblRequisitionItems.ProductBatch_ID=:ProductBatchID)'
      'GROUP BY tblRequisitionItems.ProductBatch_ID')
    Left = 1216
    Top = 768
  end
  object qryBatchOnHoldTotal: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
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
    Left = 848
    Top = 656
  end
  object qryUserSpecifiDemanders: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    ProcedureName = 'stp_RequisitionsUserDemanders;1'
    Parameters = <
      item
        Name = '@DemanderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 880
    Top = 16
  end
  object dsqryUserSpecifiDemanders: TDataSource
    DataSet = qryUserSpecifiDemanders
    Left = 1072
    Top = 24
  end
  object qryIsDemanderValid: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    Parameters = <
      item
        Name = '@DemanderID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'IF EXISTS ('
      'SELECT Demander_ID FROM tblDemander'
      'WHERE Demander_ID=:@DemanderID)'
      'SELECT 1 AS Result'
      'ELSE '
      'SELECT 0 AS Result')
    Left = 920
    Top = 144
  end
  object qryIsItemDemanderAuthorised: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
    Parameters = <
      item
        Name = '@ProductID'
        Size = -1
        Value = Null
      end
      item
        Name = '@DemanderID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'IF EXISTS ('
      'SELECT ProductCode_ID FROM tblDemanderItems'
      'WHERE ProductCode_ID=:@ProductID  AND Demander_ID=:@DemanderID)'
      'SELECT 1 AS Result'
      'ELSE '
      'SELECT 0 AS Result')
    Left = 920
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'in'
    FileName = 'ORDER_'
    Filter = 'in|in'
    Left = 1112
    Top = 392
  end
  object qrySupplierName: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'SupplierID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Name_str, Code_str '
      'FROM tblSupplier'
      'WHERE Supplier_ID=:SupplierID')
    Left = 1120
    Top = 472
    object qrySupplierNameName_str: TWideStringField
      FieldName = 'Name_str'
      Size = 100
    end
    object qrySupplierNameCode_str: TWideStringField
      FieldName = 'Code_str'
      Size = 7
    end
  end
  object qryDemanderAccount: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DemanderID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Name_str, Code_str, Account_str FROM tblDemander'
      'WHERE Demander_ID=:DemanderID')
    Left = 1120
    Top = 536
  end
  object qryRDMFile: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Requisition_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT TblProductPackSize.ICN_str, TblProductPackSize.ECN_str, T' +
        'blDemander.Code_str, TblRequisition.Requisition_str, TblRequisit' +
        'ion.Requisition_ID, TblRequisition.VoucherNo_str, '
      
        'TblRequisitionItems.PackCost_mon, TblRequisitionItems.QtyApprove' +
        'd_int,TblDemander.Name_str,TblDemander.Name_str AS DemName_str, '
      
        'tblDemander.Code_str AS DemCode_Str, tblDemander.Account_str AS ' +
        'DemAccount_str, TblSystem.DemanderCode_str, TblSystem.DemanderNa' +
        'me_str, TblSystemAccounts.SystemCode_str, TblSystemAccounts.Acco' +
        'unt_str, TblSystemAccounts.AccountName_str'
      
        'FROM (TblSystem INNER JOIN TblSystemAccounts ON (TblSystemAccoun' +
        'ts.SystemStore_ID = TblSystem.SystemStore_ID) AND (TblSystem.Sys' +
        'temStore_ID = TblSystemAccounts.SystemStore_ID)) INNER JOIN ((Tb' +
        'lRequisitionItems INNER JOIN TblProductPackSize ON TblRequisitio' +
        'nItems.ProductCode_ID = TblProductPackSize.ProductCode_ID) INNER' +
        ' JOIN (TblDemander INNER JOIN TblRequisition ON TblDemander.Dema' +
        'nder_ID = TblRequisition.Demander_ID) ON TblRequisitionItems.Req' +
        'uisition_ID = TblRequisition.Requisition_ID) ON TblSystemAccount' +
        's.SystemAccount_ID = TblRequisition.SystemStore_ID'
      
        'WHERE (((TblRequisition.Requisition_ID)=:Requisition_ID) AND (((' +
        'TblRequisitionItems.QtyApproved_int)<>0)) )'
      
        'ORDER BY TblProductPackSize.Bin_str, TblProductPackSize.GenericN' +
        'ame_str, ((((((Tblproductpacksize.Strength_str)+'#39' '#39')+Tblproductp' +
        'acksize.Form_str)+'#39'; '#39')+Tblproductpacksize.PackSize_str)+'#39' '#39')+Tb' +
        'lproductpacksize.PackSizeUnit_str, TblProductPackSize.ProductCod' +
        'e_str;')
    Left = 1120
    Top = 152
  end
  object tblOrderListUniqueSuppliers: TADOTable
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Filtered = True
    TableName = 'strdprc_OrderListUniqueSuppliers'
    Left = 1088
    Top = 608
  end
  object dsSuppliers: TDataSource
    DataSet = tblOrderListUniqueSuppliers
    Left = 1208
    Top = 608
  end
  object OriginalProductBatch: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
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
      'SELECT * FROM tblProductBatch'
      'WHERE ProductCode_ID=:ProductCode_ID')
    Left = 328
    Top = 672
  end
  object tblSystemUsers: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT tblSystem_User.UserID, ISNULL(tblSystem_User.lastName_str' +
        ', N'#39#39') + N'#39', '#39' + ISNULL(tblSystem_User.firstName_str, N'#39#39') + N'#39'(' +
        ' '#39' + ISNULL(tblSystem_User.position_str, N'#39#39') + N'#39' )'#39' AS Descrip' +
        'tion'
      'FROM tblSystem_User'
      'WHERE Active_bol = 1'
      
        'ORDER BY tblSystem_User.lastName_str, tblSystem_User.firstName_s' +
        'tr')
    Left = 256
    Top = 16
  end
  object qryIsReqLocked: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Requisition_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CheckedOut_bol '
      'FROM tblRequisition'
      'WHERE Requisition_ID=:Requisition_ID')
    Left = 1112
    Top = 288
  end
  object stpSystemWharehouse: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.TblSystem.SystemStore_ID, dbo.TblSystemAccounts.S' +
        'ystemAccount_ID, dbo.TblSystem.DemanderName_str, '
      
        '                      dbo.TblSystem.DemanderCode_str, dbo.TblSys' +
        'temAccounts.AccountName_str, dbo.TblSystemAccounts.Account_str, '
      
        '                      dbo.TblSystemAccounts.Account_str + N'#39' '#39' +' +
        ' dbo.TblSystemAccounts.AccountName_str AS Description'
      'FROM         dbo.TblSystem INNER JOIN'
      
        '                      dbo.TblSystemAccounts ON dbo.TblSystem.Sys' +
        'temStore_ID = dbo.TblSystemAccounts.SystemStore_ID'
      
        'ORDER BY dbo.TblSystemAccounts.AccountName_str, dbo.TblSystem.De' +
        'manderName_str, dbo.TblSystem.DemanderCode_str')
    Left = 48
    Top = 176
    object stpSystemWharehouseSystemStore_ID: TAutoIncField
      FieldName = 'SystemStore_ID'
      ReadOnly = True
    end
    object stpSystemWharehouseSystemAccount_ID: TAutoIncField
      FieldName = 'SystemAccount_ID'
      ReadOnly = True
    end
    object stpSystemWharehouseDemanderName_str: TWideStringField
      FieldName = 'DemanderName_str'
      Size = 50
    end
    object stpSystemWharehouseDemanderCode_str: TWideStringField
      FieldName = 'DemanderCode_str'
      Size = 10
    end
    object stpSystemWharehouseAccountName_str: TStringField
      FieldName = 'AccountName_str'
      Size = 100
    end
    object stpSystemWharehouseAccount_str: TStringField
      FieldName = 'Account_str'
      Size = 25
    end
    object stpSystemWharehouseDescription: TWideStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 126
    end
  end
  object stpRequisitionDemandersUsers: TADOQuery
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    DataSource = dsstpStockControlRequisition
    Parameters = <
      item
        Name = 'Demander_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  DemanderUser_ID, Demander_ID, LastName_str + N'#39', '#39' + Fir' +
        'stName_str AS Name'
      'FROM         dbo.TBLDemanderUser'
      'WHERE Demander_ID=:Demander_ID'
      'ORDER BY LastName_str, FirstName_str, Initials_str')
    Left = 80
    Top = 491
  end
  object stpStockControlIssuedRequestedTotals: TADOStoredProc
    Tag = 1
    Connection = ADORequisitionConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'strdprc_StockControlIssuedRequestedTotals;1'
    Parameters = <
      item
        Name = 'RequisitionID'
        DataType = ftFloat
        Precision = 15
        Value = 1
      end>
    Left = 107
    Top = 756
    object stpStockControlIssuedRequestedTotalsCountOfRequisitionItems_ID: TIntegerField
      FieldName = 'CountOfRequisitionItems_ID'
      ReadOnly = True
    end
  end
  object dsstpStockControlIssuedRequestedTotals: TDataSource
    DataSet = stpStockControlIssuedRequestedTotals
    Left = 107
    Top = 812
  end
  object qryBatchOnHoldReturnsTotal: TADOQuery
    Tag = 1
    Connection = ADORequisitionConnection
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
      
        'SELECT Sum(ISNULL(TblReturnsItems.QtyReturned_int, 0)) AS SumQty' +
        'Returned_int'
      
        'FROM TblReturns INNER JOIN TblReturnsItems ON TblReturns.Returns' +
        '_ID = TblReturnsItems.Returns_ID'
      
        'WHERE (TblReturns.Posted_bol=0) AND (TblReturnsItems.ProductBatc' +
        'h_ID=:ProductBatch_ID)')
    Left = 848
    Top = 704
  end
end
