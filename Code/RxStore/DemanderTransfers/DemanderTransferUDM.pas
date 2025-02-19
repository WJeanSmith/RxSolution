unit DemanderTransferUDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ADODB, Variants, ppBands, ppClass, ppCtrls, ppPrnabl,
  ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,  ExtCtrls,
    MyApplicationUtilities, ActnList, DBActns, ppParameter,
  ppModule, raCodMod, ppVar, DateUtils, myChkBox, Math, TXComp, TXRB;


const
  HST_ADD     = 'ADDED';
  HST_DEL     = 'DELETED';
  HST_EDT     = 'EDITED';
  HST_OVR     = '*ADMIN OVERRIDE*';
  HST_ERR     = '*ERROR*';
  HST_PRN     = 'PRINTED';
  HST_CHG     = 'CHANGED PRODUCT';

  ADD_ITEM    = 0;
  ADD_RET     = 1;

type
  TDemanderTransferDM = class(TDataModule)
    tblTransfers: TADOQuery;
    qryTransfersWorker: TADOQuery;
    dstblTransfers: TDataSource;
    dsTransfersWorker: TDataSource;
    qryTransferItems: TADOQuery;
    dsTransferItems: TDataSource;
    qryTransferItemsDemanderTransferItems_ID: TAutoIncField;
    qryTransferItemsDemanderTransfer_ID: TIntegerField;
    qryTransferItemsProductCode_ID: TIntegerField;
    qryTransferItemsECN_str: TWideStringField;
    qryTransferItemsICN_str: TWideStringField;
    qryTransferItemsNSN_str: TWideStringField;
    qryTransferItemsDescription_str: TWideStringField;
    qryTransferItemsSKU_dbl: TFloatField;
    qryTransferItemsRequestedQty_dbl: TFloatField;
    qryTransfersWorkerDemanderTransfer_ID: TAutoIncField;
    qryTransfersWorkerCreated_dat: TDateTimeField;
    qryTransfersWorkerDemanderTransferRefNo_str: TWideStringField;
    qryTransfersWorkerDemanderFrom_ID: TIntegerField;
    qryTransfersWorkerDemanderTo_ID: TIntegerField;
    qryTransfersWorkerLastUpdated_dat: TDateTimeField;
    qryTransfersWorkerLastUpdatedBy_str: TWideStringField;
    qryTransfersWorkerAccount_ID: TIntegerField;
    qryTransfersWorkerAccountName_str: TWideStringField;
    qryTransfersWorkerReference_str: TWideStringField;
    qryTransfersWorkerRequestedDate_dat: TDateTimeField;
    qryTransfersWorkerPostedDate_dat: TDateTimeField;
    qryTransfersWorkerPosted_bol: TBooleanField;
    qryTransfersWorkerAuthorisedBy_str: TWideStringField;
    qryTransfersWorkerRequestedBy_str: TWideStringField;
    qryTransfersWorkerIssuedBy_str: TWideStringField;
    qryTransfersWorkerIssuedDate_dat: TDateTimeField;
    qryTransfersWorkerDemanderFrom_str: TWideStringField;
    qryTransfersWorkerDemanderTo_str: TWideStringField;
    qryTransfersWorkerAuthorisedDate_dat: TDateTimeField;
    qryTransfersWorkerCheckedOut_bol: TBooleanField;
    qryTransfersWorkerCheckedOutName_str: TWideStringField;
    qryTransfersWorkerCheckedOut_dat: TDateTimeField;
    qryTransfersWorkerCheckedOutBy_ID: TIntegerField;
    qryTransfersWorkerSystemStore_ID: TIntegerField;
    qryTransfersWorkerActive_bol: TBooleanField;
    dsDemandersTo: TDataSource;
    tblSystemUsers: TADOQuery;
    tblDemandersTo: TADOQuery;
    tblDemandersToDemander_ID: TAutoIncField;
    tblDemandersToCode_str: TWideStringField;
    tblDemandersToName_str: TWideStringField;
    tblDemandersToDemanderUnique_ID: TGuidField;
    dsUsers: TDataSource;
    qryDemanderToUsers: TADOStoredProc;
    dsDemanderToUsers: TDataSource;
    stpSystemWharehouse: TADOTable;
    stpSystemWharehouseSystemStore_ID: TAutoIncField;
    stpSystemWharehouseSystemAccount_ID: TAutoIncField;
    stpSystemWharehouseDemanderName_str: TWideStringField;
    stpSystemWharehouseDemanderCode_str: TWideStringField;
    stpSystemWharehouseAccountName_str: TStringField;
    stpSystemWharehouseAccount_str: TStringField;
    stpSystemWharehouseDescription: TWideStringField;
    dsqryADOSystemWharehouse: TDataSource;
    ExtraOptions1: TExtraOptions;
    dsDemandersFrom: TDataSource;
    tblDemandersFrom: TADOQuery;
    qryDemanderFromUsers: TADOStoredProc;
    dsDemanderFromUsers: TDataSource;
    qryEditHistory: TADOQuery;
    dsEditHistory: TDataSource;
    qryEditHistoryTransferHistory_ID: TAutoIncField;
    qryEditHistoryDemanderTransfer_ID: TIntegerField;
    qryEditHistoryDemanderTransferItems_ID: TIntegerField;
    qryEditHistoryDescription_str: TStringField;
    qryEditHistoryDate_dat: TDateTimeField;
    qryEditHistoryProductCode_ID: TIntegerField;
    qryEditHistoryType_str: TStringField;
    qryEditHistoryUser_ID: TIntegerField;
    qryEditHistoryUserName_str: TStringField;
    qryTransfersWorkerRemarks_mem: TMemoField;
    qryTransfersWorkerItemsNo_int: TIntegerField;
    qryTransfersWorkerTotalCost_mon: TBCDField;
    ActionList1: TActionList;
    atnSaveAndClose: TAction;
    qryTransfersWorkerLastEditedBy_ID: TIntegerField;
    atnAddSingleProduct: TAction;
    AdoAddSingleItem: TADOCommand;
    atnDeleteAllItems: TAction;
    stpDeleteAllItems: TADOQuery;
    AutoIncField2: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    IntegerField3: TIntegerField;
    atnDeleteSingleItem: TAction;
    atnAddDemanderFromItems: TAction;
    stp_AddDemanderFromItems: TADOStoredProc;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    qryIsDemanderValid: TADOQuery;
    ADODemanderTransfer: TADOConnection;
    stpStockTransferDemanders: TADOStoredProc;
    qryProductDetails: TADOQuery;
    qryProductDetailsProductCode_ID: TAutoIncField;
    qryProductDetailsproductPackSize_ID: TGuidField;
    qryProductDetailsPackSizeValue_dbl: TFloatField;
    qryProductDetailsICN_str: TWideStringField;
    qryProductDetailsECN_str: TWideStringField;
    qryProductDetailsDescription_str: TStringField;
    qryUserSpecifiDemanders: TADOStoredProc;
    dsqryUserSpecifiDemanders: TDataSource;
    atnPostAndClose: TAction;
    stp_Totals: TADOStoredProc;
    stp_TotalsCountOfItem_ID: TIntegerField;
    stp_TotalsSumOfExtendedCost_mon: TFloatField;
    qryTransfersWorkerUseSKUOnly_bol: TBooleanField;
    qryTransferItemsPackQty_int: TIntegerField;
    ppReport1: TppReport;
    qryTransferReportMain: TADOStoredProc;
    dsTransferReportMain: TDataSource;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    atnPrintReportMain: TAction;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel29: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText26: TppDBText;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel43: TppLabel;
    ppLabel59: TppLabel;
    ppLabel63: TppLabel;
    ppLabel67: TppLabel;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText56: TppDBText;
    ppDBText59: TppDBText;
    ppDBText61: TppDBText;
    ppDBText65: TppDBText;
    ppDBText60: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText3: TppDBText;
    ppLabel68: TppLabel;
    ppDBText94: TppDBText;
    ppLine12: TppLine;
    ppDBPipeline1: TppDBPipeline;
    stp_ZeroSKU: TADOQuery;
    qryTransferItemsPackCost_mon: TBCDField;
    qryTransferItemsSKUCost_mon: TBCDField;
    qryTransferItemsExtendedCost_mon: TBCDField;
    stp_ZeroPackQty: TADOQuery;
    atnAddDemanderToItems: TAction;
    stp_AddDemanderToItems: TADOStoredProc;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBText2: TppDBText;
    RemoveUnsedItems: TADOQuery;
    tblDemandersFromDemander_ID: TAutoIncField;
    tblDemandersFromCode_str: TWideStringField;
    tblDemandersFromName_str: TWideStringField;
    tblDemandersFromDemanderUnique_ID: TGuidField;
    qryDemanderFromUsersDemanderUser_ID: TAutoIncField;
    qryDemanderFromUsersDemander_ID: TIntegerField;
    qryDemanderFromUsersTitle_str: TStringField;
    qryDemanderFromUsersFirstName_str: TStringField;
    qryDemanderFromUsersLastName_str: TStringField;
    qryDemanderFromUsersInitials_str: TStringField;
    qryDemanderFromUsersPosition_str: TStringField;
    qryDemanderFromUsersUserLevel_str: TStringField;
    qryDemanderFromUsersLastUpdated_dat: TDateTimeField;
    qryDemanderFromUsersPhone_str: TStringField;
    qryDemanderFromUsersCellPhone_str: TStringField;
    qryDemanderFromUsersFax_str: TStringField;
    qryDemanderFromUsersEMail_str: TStringField;
    qryDemanderFromUsersDescription_str: TStringField;
    qryDemanderFromUserspersonDescription_str: TStringField;
    atnUnLockDemanderTransfer: TAction;
    stpCorrectProductPAckSizes: TADOQuery;
    qryIsRecordLocked: TADOQuery;
    atnUnLockTranfersMain: TAction;
    Stp_DeleteItem: TADOQuery;
    ppDBText9: TppDBText;
    ppLabel14: TppLabel;
    qryGeneric_1: TADOQuery;
    qryTransferItemsSKUUnit_str: TWideStringField;
    qryTransferItemsDemanderSKUOnHand: TFloatField;
    qryTransferItemsDemanderPacksOnHand: TIntegerField;
    ppLabel15: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    procedure qryTransfersWorkerDemanderTo_IDChange(Sender: TField);
    procedure qryTransfersWorkerDemanderFrom_IDChange(Sender: TField);
    procedure atnSaveAndCloseExecute(Sender: TObject);
    procedure atnAddSingleProductExecute(Sender: TObject);
    procedure atnDeleteAllItemsExecute(Sender: TObject);
    procedure atnDeleteSingleItemExecute(Sender: TObject);
    procedure atnAddDemanderFromItemsExecute(Sender: TObject);
    procedure tblTransfersAfterScroll(DataSet: TDataSet);
    procedure qryTransfersWorkerAfterScroll(DataSet: TDataSet);
    procedure qryTransfersWorkerAccount_IDChange(Sender: TField);
    procedure atnPostAndCloseExecute(Sender: TObject);
    procedure qryTransferItemsBeforePost(DataSet: TDataSet);
    procedure atnPrintReportMainExecute(Sender: TObject);
    procedure qryTransfersWorkerUseSKUOnly_bolChange(Sender: TField);
    procedure atnAddDemanderToItemsExecute(Sender: TObject);
    procedure tblDemandersFromDemander_IDChange(Sender: TField);
    procedure atnUnLockDemanderTransferExecute(Sender: TObject);
    function IsRecordLocked: Boolean;
    procedure atnUnLockTranfersMainExecute(Sender: TObject);
    procedure qryTransferItemsAfterPost(DataSet: TDataSet);
    procedure qryTransfersWorkerBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
    procedure AddTransferItem(pReqID, pProductID: double);
    procedure AddEditHistory(const pType, pStr :string; pAddType: integer );
    procedure DeleteAllITems;
    procedure DeleteSingleItem;
    procedure AddDemanderFromItems(Demander: integer; TransferID: integer);
    procedure AddDemanderToItems(Demander: integer; TransferID: integer);
    function IsDemanderValid(DemanderID : Double) : boolean;
    procedure StockItemTransfer(vProductID: double; prmDemander: string; prmSKU: Double; prmReason: string; prmPackQty : Double; vItemID: integer);
    function ValidatePosting: Boolean;
    function PostRecord: Boolean;
    procedure UpdateTransferSubTotals;
    procedure RemoveUnUSedItems;
    procedure RemoveItem(TransferItem_ID: integer);
    function PackSizeofItem(Product: integer): integer;    

  public
    { Public declarations }
    FUserName : string;
    FUserID : Variant;
    FUsesBatchManagement : Boolean;
    CheckComplete, atnEnabled, lockedByUser, AddNewRecord: Boolean;
    vCurrentRecord : integer;
    vVat, vAccount, userDemID : double;


    procedure DataConnect(startDate : TDateTime; endDate :TDateTime);
    procedure EditTransfer;
    procedure AddTransfer;
    procedure LoadItems;
    procedure LoadHistory;
    procedure LoadDemandersTo;
    procedure LoadDemanderToUsers;
    procedure LoadDemandersFrom;
    procedure LoadDemanderFromUsers;
    procedure LoadUsers;
    procedure CloseAllTables;
    procedure LoadAccounts;
    procedure LoadTotals;

    procedure ZeroAllSKU;
    procedure ZeroAllPackQty;

    procedure RefreshtransferList;
    function IsLockedBySameUser: Boolean;
    procedure PrintReportMain;
    procedure UnLockDemanderTransfer;
    procedure UnLockDemanderTransferMain;

  end;

var
  DemanderTransferDM: TDemanderTransferDM;

implementation

uses MainUDM, RxSolutionUFrm, RxSolutionSecurityClass, ProductGeneralUFrm,
  DemanderTransferDetailUFrm;

{$R *.dfm}


procedure TDemanderTransferDM.DataConnect(startDate : TDateTime; endDate :TDateTime);
var
 FDataBasePath       : string;
begin

if Assigned(MainDM) then
 begin
 ADODemanderTransfer.ConnectionString := MainDM.ADOMainDBConnection.ConnectionString;

 userDemID := 0;
 if IsDemanderValid(RxSolutionFrm.Security.User.UserDemanderID.Value) then
   userDemID := RxSolutionFrm.Security.User.UserDemanderID.Value;

 with tblTransfers do
  begin
  Close;
  Prepared := False;
  Parameters.ParamByName('StartDate').Value     := startDate;
  Parameters.ParamByName('EndDate').Value       := endDate+1;

  if userDemID > 0 then
   begin
   //Setup filter on user specs
   Filtered := False;
   Filter := 'DemanderFrom_ID ='+QuotedStr(FloatToStr(userDemID));
   Filtered := True;
   end;
 
  Prepared := True;
  Open;
  end;

 vCurrentRecord := tblTransfers.FieldByName('DemanderTransfer_ID').AsInteger;

 FUserName      := RxSolutionFrm.Security.User.LastName.ToString + ', ' +
                RxSolutionFrm.Security.User.FirstName.ToString;
 FUserID        := RxSolutionFrm.Security.User.UserNumID.Value;
 FUsesBatchManagement := MainDm.tblMainSystem.FieldByName('batchManagement_bol').AsBoolean;
 end; 

end;

procedure TDemanderTransferDM.AddTransfer;
var
 vFetchSuccess : boolean;
begin
 userDemID := 0;
 if IsDemanderValid(RxSolutionFrm.Security.User.UserDemanderID.Value) then
   userDemID := RxSolutionFrm.Security.User.UserDemanderID.Value;
 //
 tblTransfers.Append;
 tblTransfers.FieldByName('DemanderTransferRefNo_str').AsString   := MainDm.GetNextVoucherNumber(vFetchSuccess, 1, MODULE_DEMANDER_TRANSFERS);
 tblTransfers.FieldByName('Created_dat').AsDateTime         := Now();
 tblTransfers.FieldByName('CheckedOut_bol').AsBoolean       := True;
 tblTransfers.FieldByName('CheckedOutName_str').AsString    := FUserName;
 tblTransfers.FieldByName('CheckedOut_dat').AsDateTime      := Now;
 tblTransfers.FieldByName('CheckedOutBy_ID').AsInteger      := FUserID;
 tblTransfers.FieldByName('SystemStore_ID').Value           := MainDm.tblMainSystem.fieldByName('SystemStore_ID').AsInteger;
 tblTransfers.FieldByName('Active_bol').AsBoolean           := True;
 tblTransfers.FieldByName('UseSKUOnly_bol').AsBoolean       := True;
 
 //Lock user to specific demander if they are setup so.
 if userDemID > 0 then
  begin
  tblTransfers.FieldByName('DemanderFrom_ID').AsFloat       := userDemID;
  //tblTransfers.FieldByName('DemanderFrom_str').AsString     := tblDemandersFrom.FieldByName('Name_str').AsString;
  end;

 tblTransfers.Post;

 vCurrentRecord := tblTransfers.FieldByName('DemanderTransfer_ID').AsInteger;
 EditTransfer;

end;

procedure TDemanderTransferDM.EditTransfer;
begin

 //
 with qryTransfersWorker do
  begin
  Close;
  Parameters.ParamByName('DemanderTransferID').Value := vCurrentRecord;
  Open;
  if (not FieldByName('Posted_bol').AsBoolean) and (not FieldByName('CheckedOut_bol').AsBoolean) then
   begin
   Edit;
   FieldByName('CheckedOut_bol').AsBoolean       := True;
   FieldByName('CheckedOutName_str').AsString    := FUserName;
   FieldByName('CheckedOut_dat').AsDateTime      := Now;
   FieldByName('CheckedOutBy_ID').AsInteger      := FUserID;
   FieldByName('SystemStore_ID').Value           := MainDm.tblMainSystem.fieldByName('SystemStore_ID').AsInteger;
   Post;
   end;
  end;
 
 LoadItems;
 LoadHistory;
 LoadDemandersFrom;
 LoadDemanderFromUsers;
 LoadDemandersTo;
 LoadDemanderToUsers;
 LoadUsers;
 LoadAccounts;
 LoadTotals;
 {}
end;

procedure TDemanderTransferDM.LoadItems;
begin
 //
 with qryTransferItems do
  begin
  Close;
  Parameters.ParamByName('DemanderTransferID').Value := vCurrentRecord;
  Open;
  end;
             
end;

procedure TDemanderTransferDM.LoadHistory;
begin
 //
 with qryEditHistory do
  begin
  Close;
  Parameters.ParamByName('DemanderTransferID').Value := vCurrentRecord;
  Open;
  end;
end;

procedure TDemanderTransferDM.LoadDemandersTo;
begin
 //load all demdner excluding the Demander (From)
 with tblDemandersTo do
  begin
  Close;
  Parameters.ParamByName('DemanderID').Value := qryTransfersWorker.FieldByName('DemanderFrom_ID').Value;
  Open;
  end;

end;

procedure TDemanderTransferDM.LoadDemanderToUsers;
begin
 //load users that belong to the Demander (To)
 with qryDemanderToUsers do
  begin
  Close;
  Parameters.ParamByName('@DemanderID').Value := qryTransfersWorker.FieldByName('DemanderTo_ID').Value;
  open;
  end;

end;

procedure TDemanderTransferDM.LoadDemandersFrom;
begin
 //
  with tblDemandersFrom do
  begin
  Close;
  if userDemID > 0 then
   begin
   //Setup filter on user specs
   Filtered := False;
   Filter := 'Demander_ID ='+QuotedStr(FloatToStr(userDemID));
   Filtered := True;
   end;
  Open;
  end;

end;

procedure TDemanderTransferDM.LoadDemanderFromUsers;
begin
 //load users that belong to the Demander (From)
 with qryDemanderFromUsers do
  begin
  Close;
  Parameters.ParamByName('@DemanderID').Value := qryTransfersWorker.FieldByName('DemanderFrom_ID').Value;
  open;
  end;

end;

procedure TDemanderTransferDM.LoadUsers;
begin
 //load users that have access to the system
 with tblSystemUsers do
  begin
  Close;
  Open;
  end;

end;

procedure TDemanderTransferDM.LoadAccounts;
begin

 with stpSystemWharehouse do
  begin
  Close;
  Open;
  end;

end;

procedure TDemanderTransferDM.LoadTotals;
begin

// if qryTransfersWorker.Active then
  with stp_Totals do
   begin
   Close;
   Parameters.ParamByName('@DemanderTransferID').Value := vCurrentRecord;
   Open;
   end;
   
end;

procedure TDemanderTransferDM.UpdateTransferSubTotals;
begin
 with qryTransfersWorker do
  begin
  if not (State in [dsEdit, dsInsert]) then Edit;
  FieldByName('ItemsNo_int').AsInteger           := stp_Totals.FieldByName('CountOfItem_ID').AsInteger;
  FieldByName('TotalCost_mon').AsCurrency        := stp_Totals.FieldByName('SumOfExtendedCost_mon').AsCurrency;
  //Post;
  end;
end;

procedure TDemanderTransferDM.CloseAllTables;
begin
 //
 tblDemandersTo.Close;
 qryDemanderToUsers.Close;
 tblDemandersFrom.Close;
 qryDemanderFromUsers.Close;
 qryTransferItems.close;
 qryEditHistory.Close;
 tblSystemUsers.Close;
 stpSystemWharehouse.Close;

end;

procedure TDemanderTransferDM.RemoveUnUsedItems;
begin
 with RemoveUnsedItems do
  begin
  Parameters.ParamByName('DemanderTransferID').Value := vCurrentRecord;
  ExecSQL;
  end;

end;


procedure TDemanderTransferDM.qryTransfersWorkerDemanderTo_IDChange(
  Sender: TField);
begin
//load all the users that belong to the current demander
 LoadDemanderToUsers;
 with qryTransfersWorker do
  begin
  FieldByName('DemanderTo_Str').AsString := tblDemandersTo.FieldByName('Name_str').AsString;
  end;
end;

procedure TDemanderTransferDM.qryTransfersWorkerDemanderFrom_IDChange(
  Sender: TField);
begin

 with qryTransfersWorker do
  begin
  FieldByName('DemanderFrom_Str').AsString := tblDemandersFrom.FieldByName('Name_str').AsString;
  end;

 LoadItems;
 LoadDemanderFromUsers;

 LoadDemandersTo;
 LoadDemanderToUsers;

end;

procedure TDemanderTransferDM.atnSaveAndCloseExecute(Sender: TObject);
begin
 //Bud Issue 2499 SM
 if qryTransferItems.State in [dsEdit, dsInsert] then
   qryTransferItems.Post;

 //if not posted then
 if (not qryTransfersWorker.FieldByName('Posted_bol').AsBoolean) then
 begin 
 with qryTransfersWorker do
  begin
  if not (State in [dsEdit, dsInsert]) then
    Edit;

  FieldByName('CheckedOut_bol').AsBoolean       := False;
  FieldByName('CheckedOutName_str').AsString    := '';
  FieldByName('CheckedOutBy_ID').AsInteger      := 0;

//  FieldByName('CheckedOut_dat').AsDateTime      := NullDate;
  Post;
  end;
 LoadTotals;
 UpdateTransferSubTotals;
 end;

 CloseAllTables;
 RefreshtransferList;
 DemanderTransferDetailFrm.Close; 
end;

procedure TDemanderTransferDM.AddTransferItem(pReqID, pProductID: double);
begin
//Send data to stored procedure to add new item to current item list
 with AdoAddSingleItem do
  begin
 // Prepared := False;
  Parameters.ParamByName('@TransferID').Value := pReqID;
  Parameters.ParamByName('@ProductCodeID').Value:= pProductID;
  Execute;
  end;

end;

function TDemanderTransferDM.IsLockedBySameUser;
begin

 if FUserID = qryTransfersWorker.FieldByName('CheckedOutBy_ID').AsVariant then
  Result := True
 else
  Result := False;
end;

procedure TDemanderTransferDM.atnAddSingleProductExecute(Sender: TObject);
var
  vProductSelector  : TProductSelector;
  vRetID            : integer;
  vProductID        : cIDArray;
  vProductCost      : cCostArray;
  i                 : integer;
begin


// Use same table as curently being edited
// Get current ID's for Transfer items
 with qryTransfersWorker do
  begin
  //************ Post Main Record Before adding items
  if (State in [dsEdit, dsInsert]) then Post;

  vRetID := FieldByName('DemanderTransfer_ID').AsInteger;
  //*********** Check if Demander has been selected first
  if (FieldByName('DemanderFrom_ID').IsNull) then
   begin
   MessageDlg('Please select the Demander From before adding items', mtWarning, [mbOK], 0);
   Abort;
   end;
  end;

 vProductSelector := TProductSelector.Create;
 with qryTransferItems, vProductSelector do
  if Active then
   try
   if Product_SelectItems( vProductCost, vProductID) then
    for i := low(vProductID) to high(vProductID) do
     try
     if not Locate('ProductCode_ID;DemanderTransfer_ID', VarArrayOf([vProductID[i], vRetID]), []) then
      begin
      AddTransferItem(vCurrentRecord, vProductID[i]);
      end;

    with qryTransferItems do
     begin
     Close;
     Open;
     end;

     LoadTotals;              //Refresh totals
     UpdateTransferSubTotals;         //Update header totals
     AddEditHistory(HST_ADD, 'Adding product(s)', ADD_RET);
     //Added by SM; move cursor to last added item
     Locate('ProductCode_ID;DemanderTransfer_ID', VarArrayOf([vProductID[i], vRetID]), []);
     except
     end;
   finally
    Free;
    end;
end; 

//Add any changes to the history table
procedure TDemanderTransferDM.AddEditHistory(const pType, pStr :string;
                                              pAddType: integer );
var
  vRetID, vRetItemID  :double;
begin
 
  vRetID      := 0;
  vRetItemID  := 0;
 // Get current ID's for Return items

 vRetID := vCurrentRecord;

  with qryTransferItems do
    if Active then
      if RecordCount > 0 then
        vRetItemID := FieldByName('DemanderTransferItems_ID').AsFloat;

  //Open the correct history records
  with qryEditHistory do
   begin
   if not Active then
    begin
    Close;
    Prepared := False;
    Parameters.ParamByName('DemanderTransferID').Value := vRetID;
    Prepared := True;
    Open;
    end;
  //Add new edit history entry
  Append;
  FieldByname('DemanderTransfer_ID').AsFloat     := vRetID;
  FieldByName('Description_str').AsString := pStr;
  FieldByName('UserName_str').AsString    := FUserName;
  FieldByName('User_ID').AsFloat          := FUserID;
  FieldByName('Date_dat').AsDateTime      := Now;
  FieldByName('Type_str').AsString        := pType;
  FieldByName('DemanderTransferItems_ID').AsFloat := vRetItemID;
  case pAddType of
   ADD_ITEM :
    begin
    FieldByName('ProductCode_ID').AsFloat   := qryTransferItems.FieldByName('Productcode_ID').AsFloat;
    end;
   ADD_RET :
    begin
    FieldByName('ProductCode_ID').AsFloat   := 0;
    end;
   end;

  Post;
  Close;
  Open;
  end;
end;

procedure TDemanderTransferDM.DeleteAllITems;
begin

if MessageDlg('Are you sure you want to remove this item from the list?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
 begin
 with stpDeleteAllItems do
  begin
  Parameters.ParamByName('DemanderTransferID').Value := vCurrentRecord;
  ExecSQL;
  end;

 AddEditHistory(HST_DEL, 'All products deleted', ADD_RET);
 LoadItems;
 end;

end;

procedure TDemanderTransferDM.atnDeleteAllItemsExecute(Sender: TObject);
begin
 DeleteAllITems;
 LoadTotals;
 UpdateTransferSubTotals;
end;

procedure TDemanderTransferDM.DeleteSingleItem;
var
 vProductCode: integer;
 vDescription: string;
begin
 with qryTransferItems do
  begin
  if Active then
   if recordCount > 0 then
    begin
    vProductCode := FieldByName('ProductCode_ID').AsInteger;
    vDescription := FieldByName('Description_str').AsString;
    if MessageDlg('Are you sure you want to remove the selected item from the list?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
     begin
     AddEditHistory(HST_DEL, vDescription +' '+ ' DELETED', ADD_RET);
     RemoveItem(FieldByName('DemanderTransferItems_ID').AsInteger);
     Close; //Refresh the item list
     Open;
     end;  
    end;
  end;
end;

//Remove a single item from item list.
procedure TDemanderTransferDM.RemoveItem(TransferItem_ID: integer);
begin
//
 with Stp_DeleteItem do
  begin
  Parameters.ParamByName('TransferItem_ID').Value := TransferItem_ID;
  ExecSQL;
  end;

end;

procedure TDemanderTransferDM.atnDeleteSingleItemExecute(Sender: TObject);
begin
 DeleteSingleItem;
 LoadTotals;
 UpdateTransferSubTotals;
end;

//Add Authorised items from the 'Demander From'
procedure TDemanderTransferDM.AddDemanderFromItems(Demander: integer; TransferID: integer);
begin
 //
 try
 with stp_AddDemanderFromItems do
  begin
  Parameters.ParamByName('@TransferID').Value  := TransferID;
  Parameters.ParamByName('@DemanderID').Value  := Demander;
  ExecProc;
  end;
 except
  begin MainDm.CorrectProductPackSizes;
  AddEditHistory(HST_ERR, 'System Error: Some packsizes are 0. User must fix product pack sizes', ADD_RET);
  end;
 end;

end;

//Add Authorised items from the 'Demander To'
procedure TDemanderTransferDM.AddDemanderToItems(Demander: integer; TransferID: integer);
begin

 try
 with stp_AddDemanderToItems do
  begin
  Parameters.ParamByName('@TransferID').Value  := TransferID;
  Parameters.ParamByName('@DemanderID').Value  := Demander;
  ExecProc;
  end;
 except
  begin MainDm.CorrectProductPackSizes;
  AddEditHistory(HST_ERR, 'System Error: Some packsizes are 0. User must fix product pack sizes', ADD_RET);
  end;
 end;

end;

procedure TDemanderTransferDM.atnAddDemanderFromItemsExecute(Sender: TObject);
var
 DemanderFromID, TransferID: integer;
 DemanderStr: string;
begin

 //************ Post Main Record Before adding items
 if (qryTransfersWorker.State in [dsEdit, dsInsert]) then qryTransfersWorker.Post;

 if not (VarIsNULL(qryTransfersWorker.FieldByName('DemanderFrom_ID').Value)) then
  begin
  if MessageDlg('All the current items will be removed from the list. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
   DeleteAllITems;
   DemanderFromID:= qryTransfersWorker.FieldByName('DemanderFrom_ID').AsInteger;
   DemanderStr   := qryTransfersWorker.FieldByName('DemanderFrom_str').AsString;
   TransferID    := vCurrentRecord;
   AddDemanderFromItems(DemanderFromID, TransferID);
   AddEditHistory(HST_ADD, 'Adding authorised Demander items ['+DemanderStr+']', ADD_ITEM);
   LoadItems;
   end;
  end
 else
  ShowMessage('Please select a demander first.');

 LoadTotals;
 UpdateTransferSubTotals;

end;

procedure TDemanderTransferDM.tblTransfersAfterScroll(DataSet: TDataSet);
begin
 vCurrentRecord := tblTransfers.FieldByName('DemanderTransfer_ID').AsInteger;
end;

procedure TDemanderTransferDM.qryTransfersWorkerAfterScroll(
  DataSet: TDataSet);
begin
// vCurrentRecord := qryTransfersWorker.FieldByName('DemanderTransfer_ID').AsInteger;
end;

//Check if demander ID does exist on the system
function TDemanderTransferDM.IsDemanderValid(DemanderID : Double) : boolean;
begin
Result := False;

 with qryIsDemanderValid do
  begin
  Parameters.ParamByName('@DemanderID').Value := DemanderID;
  Open;
  if FieldByName('Result').AsInteger > 0 then
   Result := True
  else
   Result := False;
  Close;
  end; 

end;

procedure TDemanderTransferDM.qryTransfersWorkerAccount_IDChange(
  Sender: TField);
begin
//update the Account being used...
 with qryTransfersWorker do
  begin
  FieldByName('AccountName_str').AsString := stpSystemWharehouse.fieldByName('AccountName_str').AsString;
  end;

end;


procedure TDemanderTransferDM.StockItemTransfer(vProductID: double; prmDemander: string; prmSKU: Double;
    prmReason: string; prmPackQty : Double; vItemID: Integer);
var
  prvPack : double;
  prvF, prvT, vProductSizeID : string;

begin

  with stpStockTransferDemanders do
    begin

    qryProductDetails.Close;
    qryProductDetails.Parameters.ParamByName('ProductCodeID').Value := vProductID;
    qryProductDetails.Open;

    vProductSizeID := qryProductDetails.FieldByName('productPackSize_ID').AsString;

    prvPack := qryProductDetails.FieldByName('PackSizeValue_dbl').AsFloat;
    prvF    := qryTransfersWorker.FieldByname('DemanderFrom_str').AsString;
    prvT    := qryTransfersWorker.FieldByname('DemanderTo_str').AsString;

    //make sure pack size is greater then 0 otherwise make it 1
    if (prvPack < 1) then
     prvPack := 1;

    // prmPackQty will always be = 0
    if (prmPackQty <> 0) then
     prmSKU := prmPackQty * prvPack;
    //condition will not run

    Parameters.ParamByName('@ProductID').Value := vProductSizeID;
    Parameters.ParamByName('@DemanderFromUniqueID').Value := tblDemandersFrom.FieldByName('DemanderUnique_ID').AsVariant;
    Parameters.ParamByName('@DemanderToUniqueID').Value :=  tblDemandersTo.FieldByName('DemanderUnique_ID').AsVariant;
    Parameters.ParamByName('@Quantity').Value := Round( prmSKU / prvPack );
    Parameters.ParamByName('@QtyUnits').Value := prmSKU;
    Parameters.ParamByName('@Reference').Value := 'Demander Transfer [' + prvF + ' to ' + prvT + ']';
    Parameters.ParamByName('@User').Value := FUserName;
    Parameters.ParamByName('@UserID').Value := FUserID;  
    Parameters.ParamByName('@VoucherNo').Value := qryTransfersWorker.fieldByname('Reference_str').AsString; //'TX';
    Parameters.ParamByName('@itemID').Value := vItemID;
    ExecProc;
    end;

end;

//Check if all required fields have been captured before posting.
function TDemanderTransferDM.ValidatePosting: Boolean;
const
  EMSG = 'You may not post this record unless all of the following are completed!' +
          #13 + 'Account' +
          #13 + 'Demander From' +
          #13 + 'Issued By && Date' +
          #13 + 'Demander To'+
          #13 + 'Requested By && Date';
begin
  Result := True;

  if qryTransfersWorker.Active then
   begin
   with qryTransfersWorker do
    begin
    if FieldByName('Account_ID').IsNull then Result := False;
    if FieldByName('DemanderFrom_ID').IsNull then Result := False;
    if FieldByName('IssuedBy_str').IsNull then Result := False;
    if FieldByName('IssuedDate_dat').IsNull then Result := False;
    if FieldByName('DemanderTo_ID').IsNull then Result := False;
    if FieldByName('RequestedBy_str').IsNull then Result := False;
    if FieldByName('RequestedDate_dat').IsNull then Result := False;
    end;

   if not Result then
    MessageDlg(EMSG, mtWarning, [mbOK],0);
   end
  else
   Result := False;
end;


procedure TDemanderTransferDM.atnPostAndCloseExecute(Sender: TObject);
var
 WMS : string;
Level: integer;
begin

 WMS := 'WARNING' + #13 +'Once you Post this record, it can no longer be edited.' + #13 + #13 + 'Continue and Post?';
//Current document

if qryTransferItems.State in [dsEdit, dsInsert] then
 qryTransferItems.Post;

 LoadTotals;
 UpdateTransferSubTotals;

if MessageDlg(WMS, mtWarning, [mbYes, mbNo], 0) = mrYes then
 if ValidatePosting then
  begin
  Level:=ADODemanderTransfer.BeginTrans;
  try
  if PostRecord then
   begin
   if not (qryTransfersWorker.State in [dsEdit, dsInsert]) then qryTransfersWorker.Edit;
   qryTransfersWorker.FieldByName('CheckedOut_bol').AsBoolean           := False;
   qryTransfersWorker.FieldByName('CheckedoutName_str').AsString        := '';
   qryTransfersWorker.FieldByName('CheckedOutBy_ID').AsString           := '';
   qryTransfersWorker.FieldByName('Posted_bol').AsBoolean            := True;
   qryTransfersWorker.FieldByName('PostedDate_dat').AsDateTime           := Now();
   qryTransfersWorker.Post;

   MessageDlg('Demander Tranfers has been posted!', mtInformation, [mbYes], 0);
   RefreshtransferList;
   DemanderTransferDetailFrm.Close;
   end;
  ADODemanderTransfer.CommitTrans;
  except
    on E:Exception do begin
    MEssageDlg('An error has occured and the transaction will rollback. Please close the application and try again.', mtError, [mbOK], 0);
    ADODemanderTransfer.RollbackTrans;
    AddEditHistory(HST_ERR,'DB Transaction Rollback', ADD_RET);
    DemanderTransferDetailFrm.Close;
    end;
  end;
 end;
end;

function TDemanderTransferDM.PostRecord: Boolean;
var
  vProductID  :double;
  vProdDet    :RProductDetails;
  vType       :String;
  vTotalinStock : integer;
  vCost       :Currency;
  vDate       :TDateTime;
  vReason     :String;
  vQtySKUUsed :double;
  vQtyPackUsed : double;
  vPackCost  : double;
  prvPack    : integer;
  vItemdID   : integer;
  vAuditData      :RProductAuditDetails;
  S :string;
  Save_Cursor:TCursor;
begin

 vQtySKUUsed := 0;
 Save_Cursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;
 try
 with qryTransferItems do
  begin
  First;
  While (not eof)  do
   begin
   if (FieldByName('SKU_dbl').AsInteger > 0) or (FieldByName('PackQty_int').AsInteger > 0) then
    begin
    vProductID    := FieldByName('ProductCode_ID').AsInteger;
    vPackCost     := FieldByName('PackCost_mon').AsFloat;
    vCost         := FieldByName('PackCost_mon').AsCurrency * FieldByName('SKU_dbl').AsInteger;
    vQtySKUUsed   := FieldByName('SKU_dbl').AsInteger;
    vQtyPackUsed  := FieldByName('PackQty_int').AsInteger;
    vItemdID      := FieldByName('DemanderTransferItems_ID').AsInteger;

    if qryTransfersWorker.FieldByName('UseSKUOnly_bol').AsBoolean then
      vQtyPackUsed := 0;
    StockItemTransfer(vProductID, '', vQtySKUUsed, 'Reason', vQtyPackUsed, vItemdID);
    end;
    qryTransferItems.Next;
   end;

  end;
 finally
  Screen.Cursor := Save_Cursor;
 end;
 
 RemoveUnUSedItems;
 LoadTotals;
 UpdateTransferSubTotals;
 AddEditHistory(HST_EDT,'Posted', ADD_RET);
 Result := True;
end;


procedure TDemanderTransferDM.qryTransferItemsBeforePost(
  DataSet: TDataSet);
begin
 with qryTransferItems do
  begin
  if FieldByName('SKU_dbl').AsFloat < 0 then
   begin
   ShowMessage('Please enter a positive value');
   Abort;
   end;

  if qryTransfersWorker.FieldByName('UseSKUOnly_bol').AsBoolean then
   begin
   FieldByName('ExtendedCost_mon').AsFloat := FieldByName('SKU_dbl').AsFloat * FieldByName('SKUCost_mon').AsFloat;
   //update pack Qty here  BUG 340
   FieldByName('PackQty_int').AsFloat := Int(FieldByName('SKU_dbl').AsFloat/PackSizeofItem(FieldByName('ProductCode_ID').AsInteger));
   end
  else
   begin
   FieldByName('ExtendedCost_mon').AsFloat := FieldByName('PackQty_int').AsFloat * FieldByName('PackCost_mon').AsFloat;
   //Update SKU Qty here BUG 340
   FieldByName('SKU_dbl').AsFloat := FieldByName('PackQty_int').AsFloat * PackSizeofItem(FieldByName('ProductCode_ID').AsInteger)
   end;

  if FieldByName('SKU_dbl').OldValue <> FieldByName('SKU_dbl').NewValue then
   AddEditHistory(HST_EDT, FieldByName('Description_str').AsString +' SKU changed: '+FloatToStr(FieldByName('SKU_dbl').OldValue)+' to '+FloatToStr(FieldByName('SKU_dbl').NewValue), ADD_RET);
  end;
end;

procedure TDemanderTransferDM.RefreshtransferList;
begin
 //
 with tblTransfers do
  begin
  Close;
  Open;
  Locate('DemanderTransfer_ID', vCurrentRecord, []);
  end;

end;

procedure TDemanderTransferDM.PrintReportMain;
begin

 with qryTransfersWorker do
  begin
  if State in [dsEdit, dsInsert] then
   Post;
  end;

 with qryTransferReportMain do
  begin
  Close;
  Parameters.ParamByName('@DemanderTransferID').Value := vCurrentRecord;
  Open;

  ppReport1.Print;
  AddEditHistory(HST_PRN, 'Main report printed', ADD_RET);
  end;
   
end;

procedure TDemanderTransferDM.atnPrintReportMainExecute(Sender: TObject);
begin
 PrintReportMain;
end;

procedure TDemanderTransferDM.ZeroAllSKU;
begin

 with stp_ZeroSKU do
  begin
  Parameters.ParamByName('DemanderTransferID').Value := vCurrentRecord;
  ExecSQL;
  end;
  LoadItems; 
end;

procedure TDemanderTransferDM.ZeroAllPackQty;
begin

 with stp_ZeroPackQty do
  begin
  Parameters.ParamByName('DemanderTransferID').Value := vCurrentRecord;
  ExecSQL;
  end;
 LoadItems;
end;
procedure TDemanderTransferDM.qryTransfersWorkerUseSKUOnly_bolChange(
  Sender: TField);
begin

 with qryTransfersWorker do
  begin
  if FieldByName('UseSKUOnly_bol').AsBoolean then
   ZeroAllPackQty
  else
   ZeroAllSKU;
  end;

end;

procedure TDemanderTransferDM.atnAddDemanderToItemsExecute(
  Sender: TObject);
var
 DemanderToID, TransferID: integer;
 DemanderStr: string;
begin

 if not (VarIsNULL(qryTransfersWorker.FieldByName('DemanderTo_ID').Value)) then
  begin
  if MessageDlg('All the current items will be removed from the list. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
   DeleteAllITems;
   DemanderToID:= qryTransfersWorker.FieldByName('DemanderTo_ID').AsInteger;
   DemanderStr   := qryTransfersWorker.FieldByName('DemanderTo_str').AsString;
   TransferID    := vCurrentRecord;
   AddDemanderToItems(DemanderToID, TransferID);
   AddEditHistory(HST_ADD, 'Adding authorised Demander items ['+DemanderStr+']', ADD_ITEM);
   LoadItems;
   end;
  end
 else
  ShowMessage('Please select a demander first.');

end;

procedure TDemanderTransferDM.tblDemandersFromDemander_IDChange(
  Sender: TField);
begin
 LoadDemandersTo;
 LoadDemanderToUsers;
end;

procedure TDemanderTransferDM.atnUnLockDemanderTransferExecute(
  Sender: TObject);
begin
 //
 UnLockDemanderTransfer;
end;

procedure TDemanderTransferDM.UnLockDemanderTransfer;
begin
 with qryTransfersWorker do
  begin
  if not (State in [dsEdit, dsInsert]) then Edit;
  FieldByName('CheckedOutBy_ID').AsFloat      := 0;
  FieldByName('CheckedOutName_str').AsString  := '';
  FieldByName('CheckedOut_bol').AsBoolean     := False;
  if State in [dsEdit, dsInsert] then Post;
  end;

 if DemanderTransferDetailFrm.Active then
  DemanderTransferDetailFrm.Close;
end;

procedure TDemanderTransferDM.UnLockDemanderTransferMain;
begin
 with tblTransfers do
  begin
  if not (State in [dsEdit, dsInsert]) then Edit;
  FieldByName('CheckedOutBy_ID').AsFloat      := 0;
  FieldByName('CheckedOutName_str').AsString  := '';
  FieldByName('CheckedOut_bol').AsBoolean     := False;
  if State in [dsEdit, dsInsert] then Post;
  Refresh;
  end;
end;

function TDemanderTransferDM.IsRecordLocked: Boolean;
begin

 with qryIsRecordLocked do
  begin
  Close;
  Parameters.ParamByName('DemanderTransfer_ID').Value := vCurrentRecord;
  Open;

  if FieldByName('CheckedOut_bol').AsBoolean then
   Result := True
  else
   Result := False;
  end;
end;


procedure TDemanderTransferDM.atnUnLockTranfersMainExecute(
  Sender: TObject);
begin
 UnLockDemanderTransferMain;
end;

procedure TDemanderTransferDM.qryTransferItemsAfterPost(DataSet: TDataSet);
begin
 LoadTotals;
 UpdateTransferSubTotals;
end;

//THIS FUNCTION RETURNS THE INTEGER VALUE OF PACK SIZE OF ANY PRODUCT ITEM
function TDemanderTransferDM.PackSizeofItem(Product: integer): integer;
var
 vPacksize: integer;
begin

 vPacksize := 1;
 with qryGeneric_1 do
  begin
  Close;
  Parameters.ParamByName('ProductCodeID').Value := Product;
  Open;
  if recordCount > 0 then
   vPacksize := FieldByName('PackSizeValue_dbl').AsInteger;
  Close;
  end;

 if vPacksize < 1 then
  begin
  vPacksize := 1;
  MainDm.CorrectProductPackSizes;
  end;

 Result  := vPacksize;
end;

procedure TDemanderTransferDM.qryTransfersWorkerBeforePost(
  DataSet: TDataSet);
begin

 with qryTransfersWorker do
  begin
  if (FieldByName('DemanderFrom_str').IsNull) and (not FieldByName('DemanderFrom_ID').IsNull) then
   FieldByName('DemanderFrom_str').AsString      := tblDemandersFrom.FieldByName('Name_str').AsString;
  FieldByName('LastUpdatedBy_str').AsString     := FUserName;
  FieldByName('LastEditedBy_ID').AsInteger      := FUserID;
  FieldByName('LastUpdated_dat').AsDateTime     := Now;
  end;

end;

end.


