unit OrderUFrm;
{------------------------------------------------------------------------------}
{NOTE : THIS IS A SHARED UNIT.  IT IS USED TO BUILD BOTH RXSOLUTION & RXSTORE  }
{------------------------------------------------------------------------------}
{   It is optimised for compiling in RxSolution so any specific RxStore        }
{   directives need To be enclose in a compiler directive called -             }
{                                                                              }
{   ($IFDEF RXSTOREBUILD )                                                     }
{     RxStore specific code here.                                              }
{     This can be something like a form or a unit.                             }
{   ($ELSE)                                                                    }
{     RxStolution specific code here.                                          }
{                                                                              }
{   ($ENDIF)                                                                   }
{                                                                              }
{   This example used normal bracket, but for compiler directive use curly     }
{   brackets.                                                                  }
{                                                                              }
{ ---------------------------------------------------------------------------- }
{ EDIT/CHANGE NOTE                                                             }
{ Date Recorded : 2006-03-09                                                   }
{ Recorded By   : Deane Putzier                                                }
{ Reason        : Merging of the code files for compilation in both apps       }
{------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, Menus, ExtCtrls, ImgList,DBActns, ActnList,

  RzBmpBtn, dxExEdtr,  ppCtrls, ppModule, raCodMod, ppVar,
  ppBands, myChkBox, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, dxDBTLCl, dxGrClms,
  dxDBCtrl, dxDBGrid, dxTL, dxCntner, ElPopBtn, ppParameter, RzLabel;

const
 EDGEMARGIN = 10;
 DBGROWHEIGHT = 18;

type
  TOrderFrm = class(TForm)
    ImageList1: TImageList;
    pnlOrderBackground: TPanel;
    shpOrderList: TShape;
    pnlToolBar: TPanel;
    ElSpeedButton4: TElSpeedButton;
    ElSpeedButton5: TElSpeedButton;
    ElSpeedButton6: TElSpeedButton;
    ElSpeedButton7: TElSpeedButton;
    ElSpeedButton10: TElSpeedButton;
    ElSpeedButton1: TElSpeedButton;
    Shape4: TShape;
    Panel4: TPanel;
    Panel7: TPanel;
    ActionList1: TActionList;
    atnOrdersFirst: TDataSetFirst;
    atnOrdersPrior: TDataSetPrior;
    atnOrdersNext: TDataSetNext;
    atnOrdersLast: TDataSetLast;
    atnFilterApply: TAction;
    atnOrdersEdit: TAction;
    atnPrintPurchaseOrder: TAction;
    atnPrintDraftPurchaseOrder: TAction;
    atnPrintOutstandingItems: TAction;
    ppDBPipeline1: TppDBPipeline;
    ppPurchaseOrder: TppReport;
    ppDraftPurchaseOrder: TppReport;
    ppOutstandingItems: TppReport;
    ppDBPipeline2: TppDBPipeline;
    ppHeaderBand3: TppHeaderBand;
    ppLabel23: TppLabel;
    ppLine5: TppLine;
    ppLabel24: TppLabel;
    ppLine6: TppLine;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppTitleBand3: TppTitleBand;
    ppSummaryBand3: TppSummaryBand;
    ppImage7: TppImage;
    ppDBText51: TppDBText;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel33: TppLabel;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText68: TppDBText;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppLabel67: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppLabel32: TppLabel;
    ppLabel63: TppLabel;
    ppLabel66: TppLabel;
    ppLabel68: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBText39: TppDBText;
    ppDBText63: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppShape4: TppShape;
    ppSystemVariable3: TppSystemVariable;
    PopupMenu1: TPopupMenu;
    PurchaseOrder1: TMenuItem;
    DraftPurchaseOrder1: TMenuItem;
    OutstandingItems1: TMenuItem;
    ElSpeedButton12: TElSpeedButton;
    ElSpeedButton11: TElSpeedButton;
    atnOrdersPageUp: TAction;
    atnOrdersPageDown: TAction;
    atnOrdersAdd: TAction;
    atnOrdersDelete: TAction;
    Add1: TMenuItem;
    Edit1: TMenuItem;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    PrintselectedorderDraft1: TMenuItem;
    Printselectedorder1: TMenuItem;
    Printselectedorder2: TMenuItem;
    dbgOrders: TdxDBGrid;
    dbgOrdersOrderNo_str: TdxDBGridColumn;
    dbgOrdersOrder_dat: TdxDBGridDateColumn;
    dbgOrdersSupplier_Str: TdxDBGridColumn;
    dbgOrdersSystemStore_str: TdxDBGridColumn;
    dbgOrdersItemsNo_int: TdxDBGridMaskColumn;
    dbgOrdersEstimatedCost_mon: TdxDBGridCurrencyColumn;
    dbgOrdersActivated_bol: TdxDBGridCheckColumn;
    dbgOrdersActivated_dat: TdxDBGridDateColumn;
    dbgOrdersType_str: TdxDBGridColumn;
    Panel3: TPanel;
    dteStart: TDateTimePicker;
    Panel5: TPanel;
    dteEnd: TDateTimePicker;
    ppLine3: TppLine;
    Panel1: TPanel;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    atnOrdersSetAllItemsComplete: TAction;
    atnOrdersSetAllItemsComplete1: TMenuItem;
    N3: TMenuItem;
    dbgOrdersItemsComplete_bol: TdxDBGridCheckColumn;
    ElSpeedButton19: TElSpeedButton;
    atnDisplayCols: TAction;
    ppDBPipelineRxCosting: TppDBPipeline;
    ppReportRxCosting: TppReport;
    ppTitleBand4: TppTitleBand;
    ppImage10: TppImage;
    ppDBCalc8: TppDBCalc;
    ppDBText27: TppDBText;
    ppDBText30: TppDBText;
    ppSystemVariable13: TppSystemVariable;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel34: TppLabel;
    ppDBText31: TppDBText;
    ppDBText69: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppLabel57: TppLabel;
    ppLabel69: TppLabel;
    myDBCheckBox3: TmyDBCheckBox;
    ppDBText74: TppDBText;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppDBText75: TppDBText;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppDBText76: TppDBText;
    ppHeaderBand4: TppHeaderBand;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBCalc15: TppDBCalc;
    ppDBText81: TppDBText;
    ppLine4: TppLine;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    RzBmpButton1: TRzBmpButton;
    raCodeModule1: TraCodeModule;
    ppLabel90: TppLabel;
    ppTitleBand2: TppTitleBand;
    ppImage4: TppImage;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel30: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText12: TppDBText;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppDBText13: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText35: TppDBText;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppDBText60: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    ppLabel60: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppDBText11: TppDBText;
    ppDBText19: TppDBText;
    ppLabel89: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel31: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel92: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBCalc14: TppDBCalc;
    ppDBText10: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine2: TppLine;
    ppDBText85: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppImage6: TppImage;
    ppSystemVariable2: TppSystemVariable;
    ppLabel7: TppLabel;
    ppDBText9: TppDBText;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLabel2: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppImage5: TppImage;
    ppDBText15: TppDBText;
    ppDBCalc6: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppLabel3: TppLabel;
    raCodeModule3: TraCodeModule;
    ppLabel93: TppLabel;
    ppDBText86: TppDBText;
    ppLabel94: TppLabel;
    ppDBText87: TppDBText;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    dbgOrdersVoucherNo_str: TdxDBGridColumn;
    ppParameterList1: TppParameterList;
    ppTitleBand1: TppTitleBand;
    ppImage1: TppImage;
    ppDBCalc3: TppDBCalc;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel5: TppLabel;
    ppLabel11: TppLabel;
    ppLabel6: TppLabel;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    myDBCheckBox2: TmyDBCheckBox;
    ppDBText52: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText53: TppDBText;
    ppLabel8: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText26: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppLabel84: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel91: TppLabel;
    ppLabel95: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText14: TppDBText;
    ppDBText84: TppDBText;
    ppVariable1: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppDBText34: TppDBText;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel96: TppLabel;
    ppDBText89: TppDBText;
    ppSystemVariable17: TppSystemVariable;
    ppDBText2: TppDBText;
    ppLabel97: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule2: TraCodeModule;
    ppShape2: TppShape;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppLabel98: TppLabel;
    ppDBText88: TppDBText;
    ppSystemVariable5: TppSystemVariable;
    ppLabel99: TppLabel;
    ppDBText90: TppDBText;
    ppSystemVariable7: TppSystemVariable;
    ppLabel101: TppLabel;
    ppLabel100: TppLabel;
    ppShape3: TppShape;
    ppLabel83: TppLabel;
    ppDBText20: TppDBText;
    ppLabel102: TppLabel;
    ppDBText82: TppDBText;
    ppSystemVariable12: TppSystemVariable;
    ppLabel103: TppLabel;
    ppDBText91: TppDBText;
    ppLabel104: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel105: TppLabel;
    ppDBText83: TppDBText;
    lblOrders: TRzLabel;
    dbgOrdersDemanderName_str: TdxDBGridColumn;
    actUnLockRecord: TAction;
    N2: TMenuItem;
    UnLockRecord1: TMenuItem;
    ppLabel106: TppLabel;
    ppDBText92: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlOrderBackgroundResize(Sender: TObject);
    procedure ppPurchaseOrderPreviewFormCreate(Sender: TObject);
    procedure ppDraftPurchaseOrderPreviewFormCreate(Sender: TObject);
    procedure ppOutstandingItemsPreviewFormCreate(Sender: TObject);
    procedure atnPrintPurchaseOrderExecute(Sender: TObject);
    procedure atnPrintDraftPurchaseOrderExecute(Sender: TObject);
    procedure atnPrintOutstandingItemsExecute(Sender: TObject);
    procedure atnOrdersEditExecute(Sender: TObject);
    procedure atnOrdersPageUpExecute(Sender: TObject);
    procedure atnOrdersPageDownExecute(Sender: TObject);
    procedure atnOrdersAddExecute(Sender: TObject);
    procedure atnOrdersPageUpUpdate(Sender: TObject);
    procedure atnOrdersPageDownUpdate(Sender: TObject);
    procedure atnOrdersDeleteExecute(Sender: TObject);
    procedure atnFilterApplyExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dbgOrdersColumnSorting(Sender: TObject;
      Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure atnOrdersSetAllItemsCompleteExecute(Sender: TObject);
    procedure atnDisplayColsExecute(Sender: TObject);
    procedure actUnLockRecordExecute(Sender: TObject);
  private
    FDataPage       :integer;
    FColumnsSorted  :Boolean;
    FRecordUnlocking : Boolean;

    procedure ResizeListComponents;
  protected

    {$IFDEF RXSTOREBUILD}
    procedure CreateParams(var Params: TCreateParams);override;                 // Removes border from the form
    {$ENDIF}

  public
    { Public declarations }
  end;

var
  OrderFrm: TOrderFrm;

implementation

uses

  {$IFDEF RXSTOREBUILD}
  RxStoreMainUFrm,
  SystemSecurityUDM,
  SystemSecurityConstantsU,
  GridColumnSelectorUFrm,
  {$ELSE}
  RxSolutionUFrm, {Was RxStoreMainUFrm,}
  RxSolutionSecurityClass, {Was  SystemSecurityConstantsU,}
  DialogGridColumnSelectorUFrm,
  {$ENDIF}

  OrderUDM,
  MainUDM,
  MyApplicationUtilities;


{$R *.dfm}

{$IFDEF RXSTOREBUILD}
procedure TOrderFrm.CreateParams(var Params: TCreateParams); (*:::::::START:*)(*===========================================*)
                                                                                (*procedure:CreateParams---------------------*)
                                                                                (*===========================================*)
                                                                   (*10.9.2002*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)
  inherited CreateParams(Params);                                               // Call general params
  Params.Style := WS_EX_CLIENTEDGE;                                             // Removes the border from the form edge.
end; (*................................................................*)(*end*)(*...........................................*)
{$ENDIF}


procedure TOrderFrm.FormCreate(Sender: TObject); (*:::::::::::::::::::::START:*)(*===========================================*)
var
  btnEnabled: Boolean;
                                                                                (*procedure:FormCreate-----------------------*)
                                                                                (*===========================================*)
                                                                    (*5.8.2002*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)


  OrderDM := TOrderDM.Create(Self);                             // Create and open data

  dteStart.DateTime   := Date - 30;                                                         // Default variables for filtering
  dteEnd.DateTime     := Date;                                                              // "

  if Assigned(OrderDM) then
    with OrderDM do
      FilterSuppliers(dteStart.DateTime, dteEnd.DateTime);

  FColumnsSorted := True;
  {$IFDEF RXSTOREBUILD}
  btnEnabled := SystemSecurityDM.GetUserRights(SYSTEM_ORDERS) > USER_BROWSER;
  {$ELSE}
  with RxSolutionFrm.Security do
    btnEnabled := GetUserAccessLevel(MODULE_STORE_ORDERS) > USER_BROWSER;
  {$ENDIF}

  with RxSolutionFrm.Security do
   FRecordUnlocking := GetUserAccessLevel(MODULE_RECORDUNLOCKING) > USER_BROWSER;        

  atnOrdersAdd.Enabled := btnEnabled;
  atnOrdersDelete.Enabled := btnEnabled;
  atnOrdersSetAllItemsComplete.Enabled  := btnEnabled;
  atnOrdersEdit.Enabled  := btnEnabled;

  dbgOrdersDemanderName_str.Visible := OrderDM.prvIsBudgetModel;
  actUnLockRecord.Visible := FRecordUnlocking;
end; (*................................................................*)(*end*)(*...........................................*)





procedure TOrderFrm.FormDestroy(Sender: TObject); (*::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:FormDestroy----------------------*)
                                                                                (*===========================================*)
                                                                    (*5.8.2002*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  OrderDM.Free;                                                         // Release datamodule.
end; (*................................................................*)(*end*)(*...........................................*)








{
procedure TOrderFrm.ResizeGridColumns(  var vGrd      : TDBGrid ; (*::::START:*)(*===========================================*)
                                          vStaticCol01  : integer = -1;         (*procedure:ResizeGridColumns----------------*)
                                          vStaticCol02  : integer = -1);        (*===========================================*)
                                                                   (*31.7.2002*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)
  i, ColWidCnt, StaticCols  :integer;

begin (*.............................................................*)(*begin*)(*...........................................*)

  StaticCols := 0;                                                              // Amount of columns that are to be resized
  if vStaticCol01 > -1 then inc(StaticCols);                                    // Not default, increase by 1
  if vStaticCol02 > -1 then inc(StaticCols);                                    // ditto

  with vGrd do                                                                  // Use the passed db grid
    begin
    ColWidCnt := 0;                                                             // Sum counter for grids columns not resizing

    for i := 0 to Columns.Count -1 do                                           // Loop through columns and count totals
      if (i <> vStaticCol01) and (i <> vStaticCol02) then                       // Exclude any static columns
        ColWidCnt := ColWidCnt + Columns[i].Width;                              // Count sum

    case StaticCols of
      1 : Columns[vStaticCol01].Width := vGrd.ClientWidth - ColWidCnt;          // Only one col needs resizing, update.
      2 : begin
          Columns[vStaticCol01].Width := ((vGrd.ClientWidth - ColWidCnt) div 2);// Two need changing so div the remainder by 2
          Columns[vStaticCol02].Width := ((vGrd.ClientWidth - ColWidCnt) div 2);
          end
      end;

    end;
end; (*................................................................*)(*end*)(*...........................................*)
}




procedure TOrderFrm.ResizeListComponents;







var (*.................................................................*)(*var*)(*...........................................*)
  NewHeight, NewWidth :integer;

begin (*.............................................................*)(*begin*)(*...........................................*)
  LockWindowUpdate(Handle);                                                     // Do everything we can to prevent screen
                                                                                // flicker.  Handle belongs to the form (Form.Handle)
  with pnlOrderBackground do                                          // Get the sizes of the background panel
    begin
    NewHeight := Height;
    NewWidth  := Width;
    end; (*with pnlSuppliersListBackground do*)

  with shpOrderList do                                                    // Form frame (Shape)
    begin
    Top     := EDGEMARGIN div 2;
    Left    := EDGEMARGIN div 2;
    Width   := NewWidth - EDGEMARGIN div 2;
    Height  := NewHeight - EDGEMARGIN;
    end; (*with shpSuppliersList do*)

  with pnlToolBar do
    begin
    Top     := 60;
    Left    := EDGEMARGIN;
    Width   := NewWidth - (EDGEMARGIN + (EDGEMARGIN div 2));
    Height  := 26;
    end; (*with shpSuppliersList do*)


  with lblOrders do
    begin
    Left    := EDGEMARGIN + 43;
    Top     := EDGEMARGIN;
    Width   := NewWidth - (EDGEMARGIN * 2);
    end;
          
  with dbgOrders do
    begin
    Left    := EDGEMARGIN;
    Top     := 90;
    Width   := NewWidth - (EDGEMARGIN + (EDGEMARGIN div 2));
    Height  := NewHeight - (Top + EDGEMARGIN);
    end;

//  ResizeGridColumns(dbgOrders,3,4);

  LockWindowUpdate(0);                                                          // Unlock the screen updater
end; (*................................................................*)(*end*)(*...........................................*)

  
procedure TOrderFrm.pnlOrderBackgroundResize(Sender: TObject);
begin
ResizeListComponents;
end;

{
procedure TOrderFrm.LoadOrderControls; (*:::::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:LoadOrderControls----------------*)
                                                                                (*===========================================*)
                                                                   (*31.7.2002*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)
  vStrLst :TStringList;

begin (*.............................................................*)(*begin*)(*...........................................*)


  if Assigned(PurchaseOrderDM) then
    with PurchaseOrderDM do
      try
      vStrLst := TStringList.Create;
      LoadSupplierList(vStrLst);
//      Items.Clear;
//      Items.Assign(vStrLst);
//      ItemIndex := 0;
      finally

      vStrLst.Free;
      end;

end; (*................................................................*)(*end*)(*...........................................*)
}


procedure TOrderFrm.ppPurchaseOrderPreviewFormCreate(Sender: TObject);
begin

  with (Sender as TppReport).PreviewForm do
    begin
    WindowState         := wsMaximized;
    end;

end;

procedure TOrderFrm.ppDraftPurchaseOrderPreviewFormCreate(Sender: TObject);
begin
  with (Sender as TppReport).PreviewForm do
    begin
    WindowState         := wsMaximized;
    end;

end;

procedure TOrderFrm.ppOutstandingItemsPreviewFormCreate(Sender: TObject);
begin
  with (Sender as TppReport).PreviewForm do
    begin
    WindowState         := wsMaximized;
    end;

end;

procedure TOrderFrm.atnPrintPurchaseOrderExecute(Sender: TObject);
var

  IsRxCosting   :Boolean;

begin

  IsRxCosting := MainDM.IsRxCosting;                                // find out if this is in Costing mode

  if not IsRxCosting then
    begin
      with OrderDM, ppPurchaseOrder do
        begin
        //18 Sep 2008
        //Need print from file option
        if LoadSqlStatement(0) then
         begin
         //Change the datasource of the DB pipe line to point to user defined report query
         ppDBPipeline1.DataSource := dsstp_CustomReport;
         //Load from file
         Template.FileName := ExtractFilePath(Application.ExeName) + 'tmp\Order.rtm';
         Template.LoadFromFile;
         end;


        PrinterSetup.DocumentName := SetDocumentPrintName(0);
        Print;
        end
    end
    else
      with OrderDM, ppReportRxCosting do
        begin
        PrinterSetup.DocumentName := SetDocumentPrintName(-1);
        Print;
        end;    // with
end;

procedure TOrderFrm.atnPrintDraftPurchaseOrderExecute(Sender: TObject);
begin

//  pnlPrintMenu.Visible := False;
  if Assigned(OrderDM) then
    with OrderDM, ppDraftPurchaseOrder do
      begin
      PrinterSetup.DocumentName := SetDocumentPrintName(1);
//      tblOrderListReport.Active := False;
//      tblOrderListReport.Active := True;
      Print;
      end;
end;

procedure TOrderFrm.atnPrintOutstandingItemsExecute(Sender: TObject);
begin

//  pnlPrintMenu.Visible := False;
  if Assigned(OrderDM) then
    with OrderDM, ppOutstandingItems do
      begin
      PrinterSetup.DocumentName := SetDocumentPrintName(2);
  //    tblOrderListReportOutstanding.Active := False;
  //    tblOrderListReportOutstanding.Active := True;
      Print;
      end;
end;

procedure TOrderFrm.atnOrdersEditExecute(Sender: TObject);
begin

  if atnOrdersEdit.Enabled then
    if dbgOrders.DataSource.DataSet.RecordCount > 0 then
      if Assigned(OrderDM) then
        with OrderDM do
         begin
         if not (IsRecordLocked) then
          EditOrder
         else
          ShowMessage('Record is being used by another user!'); 
         end;
end;

procedure TOrderFrm.atnOrdersPageUpExecute(Sender: TObject);
begin

  with dbgOrders.DataSource.DataSet do
    if Active then
      if not BOF then
        begin
        FDataPage := (dbgOrders.Height div DBGROWHEIGHT) -2;
        if FDataPage < 1 then FDataPage := 1;
        MoveBy(-FDataPage);
        end;

end;

procedure TOrderFrm.atnOrdersPageDownExecute(Sender: TObject);
begin

  with dbgOrders.DataSource.DataSet do
    if Active then
      if not EOF then
        begin
        FDataPage := (dbgOrders.Height div DBGROWHEIGHT) -2;
        if FDataPage < 1 then FDataPage := 1;
        MoveBy(FDataPage);
        end;

end;

procedure TOrderFrm.atnOrdersAddExecute(Sender: TObject);
begin

  if Assigned(OrderDM) then
    with OrderDM do
      AddOrder;

end;

procedure TOrderFrm.atnOrdersPageUpUpdate(Sender: TObject);
begin

  (Sender as TAction).Enabled := atnOrdersFirst.Enabled;

end;

procedure TOrderFrm.atnOrdersPageDownUpdate(Sender: TObject);
begin

  (Sender as TAction).Enabled := atnOrdersLast.Enabled;

end;

procedure TOrderFrm.atnOrdersDeleteExecute(Sender: TObject);
begin

  if Assigned(OrderDM) then
    with OrderDM do
      DeleteOrder;

end;

procedure TOrderFrm.atnFilterApplyExecute(Sender: TObject);
begin

  if Assigned(OrderDM) then
    with OrderDM do
      FilterSuppliers(dteStart.DateTime, dteEnd.DateTime);

end;

procedure TOrderFrm.Timer1Timer(Sender: TObject);
begin

  if FColumnsSorted then
    begin
    DBdxSortDataSet(dbgOrders);
    FColumnsSorted := False;
    end;


end;

procedure TOrderFrm.dbgOrdersColumnSorting(Sender: TObject;
  Column: TdxDBTreeListColumn; var Allow: Boolean);
begin
  FColumnsSorted := True;
end;

procedure TOrderFrm.atnOrdersSetAllItemsCompleteExecute(Sender: TObject);
begin

  if Assigned(OrderDM) then
    with OrderDM do
      MarkAllItemsAsComplete(0);

end;

procedure TOrderFrm.atnDisplayColsExecute(Sender: TObject);
var
  SelectColumns : TColumnSelector;
  GridCols      : TDxDBGrid;

begin

  SelectColumns := TColumnSelector.Create;
  try
  GridCols := dbgOrders;
  if assigned(GridCols) then
    SelectColumns.SelectColumns(GridCols);
  finally
    SelectColumns.Free;
  end;

end;

procedure TOrderFrm.actUnLockRecordExecute(Sender: TObject);
begin

 with OrderDm do
  begin
  UnlockRecord;
  end;

end;

end.
