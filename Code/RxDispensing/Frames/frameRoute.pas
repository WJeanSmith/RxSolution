unit frameRoute;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODB, Grids, DBGrids, ComObj,

  SystemConstants,

  RzLabel, RzDBLbl, RzCommon, StdCtrls,
  Mask, RzEdit, RzDBEdit, ExtCtrls, RzPanel, dxExEdtr, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, DBCtrls, dxDBTLCl, dxGrClms, RzDBCmbo, RzTabs,
  RzGroupBar, ActnList, RzButton, RzDlgBtn, RzDBNav, RzBckgnd, Menus,
  ppBands, ppClass, ppCtrls, ppVar, ppMemo, ppPrnabl, ppStrtch, ppRegion,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, jpeg,
  ppParameter;

type
  TfrmeDRRoute = class(TFrame)
    conRoute: TADOConnection;
    qryDRRoute: TADOQuery;
    qryDRRouteSchedule: TADOQuery;
    dsqryDRRoute: TDataSource;
    dsqryDRRouteSchedule: TDataSource;
    qryDRRouteScheduleInfo: TADOQuery;
    dsqryDRRouteScheduleInfo: TDataSource;
    qryRouteScheduleDeliveries: TADOQuery;
    dsqryRouteScheduleDeliveries: TDataSource;
    rzcMain: TRzFrameController;
    ActionList1: TActionList;
    atnPescription_Edit: TAction;
    pnlToolbar_Header: TPanel;
    pnlToolbar_Header_ShapeBorder: TShape;
    pnlToolbar_Header_Display: TRzLabel;
    rgbBatch: TRzGroupBar;
    RzGroup1: TRzGroup;
    pnlHolder_Batch: TPanel;
    rzgDeliveryManager: TRzGroupBox;
    grdBatchDelivery: TdxDBGrid;
    pnlRxList: TPanel;
    rzlBatchHeading: TRzLabel;
    rzbStatusButtons: TRzDialogButtons;
    grdRouteList: TdxDBGrid;
    grdRouteListrouteName_str: TdxDBGridColumn;
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    RzDBEdit18: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzGroupBox4: TRzGroupBox;
    Label8: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    dxDBGrid1: TdxDBGrid;
    dxDBGridDateColumn1: TdxDBGridDateColumn;
    dxDBGridColumn1: TdxDBGridColumn;
    RZlBLComplexSiteDetails: TRzLabel;
    RzLabel1: TRzLabel;
    rzlDeliveryManager: TRzLabel;
    RzDialogButtons2: TRzDialogButtons;
    RzDBNavigator1: TRzDBNavigator;
    grdBatchDeliveryrepeatDate_dat: TdxDBGridDateColumn;
    grdBatchDeliveryprescriptionNumber_Str: TdxDBGridColumn;
    grdBatchDeliverypatientName_Str: TdxDBGridColumn;
    grdBatchDeliveryprescribedAuthorisedBy_Str: TdxDBGridColumn;
    grdBatchDeliverydispensedAuthorisedBy_Str: TdxDBGridColumn;
    grdBatchDeliveryprescriptionItemsCount_Int: TdxDBGridMaskColumn;
    grdBatchDeliverycomplexSiteDescription_str: TdxDBGridColumn;
    grdBatchDeliveryclinic_str: TdxDBGridColumn;
    grdBatchDeliveryprescriptionAuthorised_bol: TdxDBGridCheckColumn;
    grdBatchDeliverydispensingAuthorised_bol: TdxDBGridCheckColumn;
    grdBatchDeliverydispensingCollected_bol: TdxDBGridCheckColumn;
    grdBatchDeliverydispensingPicked_bol: TdxDBGridCheckColumn;
    grdBatchDeliverybatchIsCollated_bol: TdxDBGridCheckColumn;
    grdBatchDeliverybatchIsShipped_bol: TdxDBGridCheckColumn;
    RzBitBtn1: TRzBitBtn;
    atnPrescription_Refresh: TAction;
    RzBitBtn2: TRzBitBtn;
    qryRouteScheduleDeliveriesprescription_ID_Original: TGuidField;
    qryRouteScheduleDeliveriesrepeatDate_dat: TDateTimeField;
    qryRouteScheduleDeliveriescompleted_bol: TBooleanField;
    qryRouteScheduleDeliveriesdownRefferal_Str: TWideStringField;
    qryRouteScheduleDeliveriesissuedOrCollected_Bol: TBooleanField;
    qryRouteScheduleDeliveriesdispensed_Bol: TBooleanField;
    qryRouteScheduleDeliveriesisReferred_bol: TBooleanField;
    qryRouteScheduleDeliveriesactive_bol: TBooleanField;
    qryRouteScheduleDeliveriesclinic_ID: TGuidField;
    qryRouteScheduleDeliveriesprescription_ID: TGuidField;
    qryRouteScheduleDeliveriesprescriptionLastEdited_dat: TDateTimeField;
    qryRouteScheduleDeliveriesprescriptionLastEdited_ID: TGuidField;
    qryRouteScheduleDeliveriesprescriptionLastEdited_Str: TWideStringField;
    qryRouteScheduleDeliveriesprescriptionNumber_Str: TWideStringField;
    qryRouteScheduleDeliveriesdate_Dat: TDateTimeField;
    qryRouteScheduleDeliveriespatient_ID: TGuidField;
    qryRouteScheduleDeliveriespatientName_Str: TWideStringField;
    qryRouteScheduleDeliveriesfolderNumber_Str: TWideStringField;
    qryRouteScheduleDeliveriesadmissionNo_Str: TWideStringField;
    qryRouteScheduleDeliveriesprescriber_ID: TGuidField;
    qryRouteScheduleDeliveriesprescriberName_Str: TWideStringField;
    qryRouteScheduleDeliveriesprescriberRXLevel_Str: TWideStringField;
    qryRouteScheduleDeliveriesprescriberAlert_mem: TMemoField;
    qryRouteScheduleDeliveriesprescribedAuthorisedBy_Str: TWideStringField;
    qryRouteScheduleDeliveriesdispenser_ID: TGuidField;
    qryRouteScheduleDeliveriesdispenserName_Str: TWideStringField;
    qryRouteScheduleDeliveriesdispenserRxLevel_Str: TWideStringField;
    qryRouteScheduleDeliveriesdispensedAuthorisedBy_Str: TWideStringField;
    qryRouteScheduleDeliveriesrepeats_Int: TIntegerField;
    qryRouteScheduleDeliveriesrepeatNo_Int: TIntegerField;
    qryRouteScheduleDeliveriesprescriptionCost_Mon: TBCDField;
    qryRouteScheduleDeliveriesprescriptionItemsCount_Int: TIntegerField;
    qryRouteScheduleDeliveriescomplexSiteDepartment_ID: TGuidField;
    qryRouteScheduleDeliveriescomplexSiteDescription_str: TWideStringField;
    qryRouteScheduleDeliveriesclinic_str: TWideStringField;
    qryRouteScheduleDeliveriesprescriptionActive_bol: TBooleanField;
    qryRouteScheduleDeliveriesprescriptionStatus_Str: TWideStringField;
    qryRouteScheduleDeliveriesprescriptionStatus_ID: TGuidField;
    qryRouteScheduleDeliveriesdownRefRouteSchedule_ID: TGuidField;
    qryRouteScheduleDeliveriesbatchIsBatched_bol: TBooleanField;
    qryRouteScheduleDeliveriesprescriptionAuthorised_bol: TBooleanField;
    qryRouteScheduleDeliveriesdispensingAuthorised_bol: TBooleanField;
    qryRouteScheduleDeliveriesdispensingCollected_bol: TBooleanField;
    qryRouteScheduleDeliveriesdispensingPicked_bol: TBooleanField;
    qryRouteScheduleDeliveriesbatchIsCollated_bol: TBooleanField;
    qryRouteScheduleDeliveriesbatchIsShipped_bol: TBooleanField;
    rzpClinics: TRzGroup;
    grdClinicList: TdxDBGrid;
    qryClinicList: TADOQuery;
    dsqryClinicList: TDataSource;
    grdClinicListclinicName_str: TdxDBGridColumn;
    qryRouteScheduleClinicSummary: TADOQuery;
    qryDRRouteScheduledownRefRoute_ID: TGuidField;
    qryDRRouteScheduledownRefRouteSchedule_ID: TGuidField;
    qryDRRouteScheduledeliveryDate_dat: TDateTimeField;
    qryDRRouteScheduledeliveryPerson_str: TWideStringField;
    qryDRRouteScheduledeliveryStatus_str: TWideStringField;
    qryDRRouteScheduledeliveryPeriodStart_dat: TDateTimeField;
    qryDRRouteScheduledeliveryPeriodEnd_dat: TDateTimeField;
    qryDRRouteScheduledeliveryAproxTime_str: TWideStringField;
    qryDRRouteScheduledeliveryStatusReason_str: TWideStringField;
    qryDRRouteScheduledeliveryDescription_str: TWideStringField;
    dsqryRouteScheduleClinicSummary: TDataSource;
    dxDBGrid2: TdxDBGrid;
    dxDBGrid2clinic_str: TdxDBGridColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    dxDBGridCurrencyColumn1: TdxDBGridCurrencyColumn;
    dxDBGridCurrencyColumn2: TdxDBGridCurrencyColumn;
    dxDBGridCurrencyColumn3: TdxDBGridCurrencyColumn;
    dxDBGridCurrencyColumn4: TdxDBGridCurrencyColumn;
    dxDBGridMaskColumn2: TdxDBGridMaskColumn;
    dxDBGridMaskColumn3: TdxDBGridMaskColumn;
    dxDBGridMaskColumn4: TdxDBGridMaskColumn;
    dxDBGridMaskColumn5: TdxDBGridMaskColumn;
    RzLabel3: TRzLabel;
    RzDialogButtons1: TRzDialogButtons;
    RzDBNavigator3: TRzDBNavigator;
    qryReportBatch01Picking: TADOQuery;
    dsqryReportBatch01Picking: TDataSource;
    atnPrintBatch01Picking: TAction;
    pmPrinting: TPopupMenu;
    RzMenuButton1: TRzMenuButton;
    PickingSchedule1: TMenuItem;
    qryReportBatch02Picklist: TADOQuery;
    dsqryReportBatch02Picklist: TDataSource;
    qryReportBatch03DeliveryConfirmation: TADOQuery;
    dsqryReportBatch03DeliveryConfirmation: TDataSource;
    qryReportBatch04CollectionConfirmation: TADOQuery;
    dsqryReportBatch04CollectionConfirmation: TDataSource;
    atnPrintBatch02Picklist: TAction;
    atnPrintBatch03DeliveryConfirmation: TAction;
    atnPrintBatch04CollectionConfirmation: TAction;
    PickListforDeliveryRoute1: TMenuItem;
    DeliveryConfirmationListforDeliveryRoute1: TMenuItem;
    CollectionConfirmationListforDeliveryRoute1: TMenuItem;
    ppqryReportBatch03DeliveryConfirmation: TppDBPipeline;
    ppqryReportBatch04CollectionConfirmation: TppDBPipeline;
    ppDBqryReportBatch02Picklist: TppDBPipeline;
    ppqryReportBatch01Picking: TppDBPipeline;
    ppBatch01Picking: TppReport;
    ppBatch02Picklist: TppReport;
    ppBatch03DeliveryConfirmation: TppReport;
    ppBatch04CollectionConfirmation: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppRegion3: TppRegion;
    ppLabel9: TppLabel;
    ppLabel8: TppLabel;
    ppParameterDescription: TppMemo;
    ppImage1: TppImage;
    ppLine4: TppLine;
    ppDetailBand1: TppDetailBand;
    ppBackGroundShade: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppDBText15: TppDBText;
    ppShape2: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppDBText14: TppDBText;
    ppLabel22: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText21: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel6: TppLabel;
    ppReportCopyright: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppLabel29: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel14: TppLabel;
    ppPageStyle1: TppPageStyle;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppRegion2: TppRegion;
    ppLabel13: TppLabel;
    ppLine6: TppLine;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLine7: TppLine;
    ppLabel16: TppLabel;
    ppLabel2: TppLabel;
    ppRegion1: TppRegion;
    ppLabel7: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel15: TppLabel;
    ppLabel18: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRegion4: TppRegion;
    ppShape7: TppShape;
    ppLabel21: TppLabel;
    ppLabel12: TppLabel;
    ppShape3: TppShape;
    ppHeaderBand2: TppHeaderBand;
    ppImage3: TppImage;
    ppShape8: TppShape;
    ppDBText22: TppDBText;
    ppDBText6: TppDBText;
    ppLine3: TppLine;
    ppDBText23: TppDBText;
    ppLabel27: TppLabel;
    ppLabel24: TppLabel;
    ppDBText26: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppShape9: TppShape;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppShape10: TppShape;
    ppDBText39: TppDBText;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppDBText7: TppDBText;
    ppDBText30: TppDBText;
    ppDBText35: TppDBText;
    ppDBText29: TppDBText;
    ppDBText38: TppDBText;
    ppLabel28: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppLine1: TppLine;
    ppLabel23: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppPageStyle2: TppPageStyle;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppRegion5: TppRegion;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLine8: TppLine;
    ppDBText34: TppDBText;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBText36: TppDBText;
    ppLabel36: TppLabel;
    ppDBText37: TppDBText;
    ppDBText40: TppDBText;
    ppLine5: TppLine;
    ppLabel37: TppLabel;
    ppRegion6: TppRegion;
    ppDBText41: TppDBText;
    ppLine9: TppLine;
    ppLabel38: TppLabel;
    ppDBText42: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppDBText43: TppDBText;
    ppLine10: TppLine;
    ppLabel41: TppLabel;
    ppDBText44: TppDBText;
    ppRegion7: TppRegion;
    ppLabel42: TppLabel;
    ppLine11: TppLine;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppLabel43: TppLabel;
    ppLine12: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText49: TppDBText;
    ppRegion8: TppRegion;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion9: TppRegion;
    ppDBText50: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppRegion10: TppRegion;
    ppLabel55: TppLabel;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppLabel56: TppLabel;
    ppLine13: TppLine;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppDBText51: TppDBText;
    ppRegion11: TppRegion;
    ppLabel62: TppLabel;
    ppLine14: TppLine;
    ppLabel63: TppLabel;
    ppShape17: TppShape;
    ppLabel64: TppLabel;
    ppShape18: TppShape;
    ppLabel65: TppLabel;
    ppShape19: TppShape;
    ppHeaderBand3: TppHeaderBand;
    ppImage4: TppImage;
    ppShape16: TppShape;
    ppMemo1: TppMemo;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLine15: TppLine;
    ppDetailBand3: TppDetailBand;
    ppShape20: TppShape;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppShape21: TppShape;
    ppDBText57: TppDBText;
    ppShape22: TppShape;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine16: TppLine;
    ppLabel68: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel69: TppLabel;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppLabel70: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppRegion12: TppRegion;
    ppDBText65: TppDBText;
    ppLabel71: TppLabel;
    ppRegion13: TppRegion;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLine17: TppLine;
    ppRegion14: TppRegion;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLine18: TppLine;
    ppRegion15: TppRegion;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppLine19: TppLine;
    ppPageStyle3: TppPageStyle;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppRegion16: TppRegion;
    ppLabel87: TppLabel;
    ppLine20: TppLine;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppLine21: TppLine;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppRegion17: TppRegion;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppHeaderBand4: TppHeaderBand;
    ppRegion18: TppRegion;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppMemo2: TppMemo;
    ppImage5: TppImage;
    ppLine22: TppLine;
    ppDetailBand4: TppDetailBand;
    ppShape35: TppShape;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppLabel104: TppLabel;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppFooterBand4: TppFooterBand;
    ppLine23: TppLine;
    ppLabel105: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppRegion19: TppRegion;
    ppDBText80: TppDBText;
    ppLabel108: TppLabel;
    ppRegion20: TppRegion;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppShape41: TppShape;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppLine24: TppLine;
    ppRegion21: TppRegion;
    ppShape42: TppShape;
    ppShape43: TppShape;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppLine25: TppLine;
    ppPageStyle4: TppPageStyle;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppRegion22: TppRegion;
    ppLabel119: TppLabel;
    ppLine26: TppLine;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppLine27: TppLine;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppRegion23: TppRegion;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppRegion24: TppRegion;
    ppLabel131: TppLabel;
    ppDBText84: TppDBText;
    ppRegion25: TppRegion;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppShape48: TppShape;
    ppShape49: TppShape;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppDBCalc23: TppDBCalc;
    ppLine28: TppLine;
    ppRegion26: TppRegion;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppShape52: TppShape;
    ppShape53: TppShape;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppLine29: TppLine;
    ppRegion27: TppRegion;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    ppLine30: TppLine;
    qryReportBatch05ClinicSummaryTotals: TADOQuery;
    dsqryReportBatch05ClinicSummaryTotals: TDataSource;
    ppqryReportBatch05ClinicSummaryTotals: TppDBPipeline;
    ppBatch05ClinicSummary: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppImage6: TppImage;
    ppShape58: TppShape;
    ppMemo3: TppMemo;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLine31: TppLine;
    ppDetailBand5: TppDetailBand;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText85: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine32: TppLine;
    ppLabel146: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLabel147: TppLabel;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppLabel148: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    ppPageStyle5: TppPageStyle;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppRegion28: TppRegion;
    ppLabel149: TppLabel;
    ppLine33: TppLine;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppLine34: TppLine;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppRegion29: TppRegion;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    atnPrintBatch05ClinicSummaryInformation: TAction;
    ClinicRxSummaryforDeliveryRoute1: TMenuItem;
    procedure qryDRRouteNewRecord(DataSet: TDataSet);
    procedure qryDRRouteScheduleNewRecord(DataSet: TDataSet);
    procedure qryDRRouteScheduleInfoNewRecord(DataSet: TDataSet);
    procedure atnPescription_EditExecute(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure qryDRRouteScheduleBeforePost(DataSet: TDataSet);
    procedure atnPrescription_RefreshExecute(Sender: TObject);
    procedure atnPrintBatch01PickingExecute(Sender: TObject);
    procedure atnPrintBatch02PicklistExecute(Sender: TObject);
    procedure atnPrintBatch03DeliveryConfirmationExecute(Sender: TObject);
    procedure atnPrintBatch04CollectionConfirmationExecute(
      Sender: TObject);
    procedure atnPrintBatch05ClinicSummaryInformationExecute(
      Sender: TObject);
  private
    FDbConnectionString: string;
    FDispenseAuthorise: string;
    FPrescriptionAuthorise: string;
    FUserAccess: Integer;
    procedure Screen_Resize;
    procedure SetDbConnectionString(const Value: string);
    { Private declarations }
  public
    procedure Close;
    function GetCurrentPrescriptionID(pFromWhere : integer): SGUID;
    procedure Open;
    procedure Prescription_Add(pFromWhere : integer);
    procedure Prescription_Delete(pFromWhere : integer);
    procedure Prescription_Edit(pFromWhere : integer);
    procedure Refresh_DataSet(DataSet : TDataset ; PrimaryKeyField : String);
    property DbConnectionString: string read FDbConnectionString write
        SetDbConnectionString;
    property UserAccess: Integer read FUserAccess write FUserAccess;
    { Public declarations }
  end;

  //Security DLL
//  function LoadAccessSystem: TUser; stdcall; external 'SecurityDLL.dll';

  //Prescription DLL
  function Edit_Prescription(DBConStr:string;AHandle: THandle; ID :SGUID;
      AParent: TForm; AccessLevel : integer): LongInt; stdcall; external
      'PrescriptionDLL.dll';

  function Add_Prescription(DBConStr:string;AHandle: THandle; AccessLevel :
      integer): LongInt; stdcall; external 'PrescriptionDLL.dll';

  function Delete_Prescription(DBConStr:string; ID:SGUID; AccessLevel:integer):
      LongInt; stdcall; external 'PrescriptionDLL.dll';

implementation

{$R *.dfm}

procedure TfrmeDRRoute.Close;
begin
  conRoute.Close;
end;

function TfrmeDRRoute.GetCurrentPrescriptionID(pFromWhere : integer): SGUID;
begin
  if pFromWhere = 0 then
    Result := qryRouteScheduleDeliveries.fieldByName('prescription_ID').AsString
    else
    Result := qryRouteScheduleDeliveries.fieldByName('prescription_ID').AsString
end;

procedure TfrmeDRRoute.Open;
begin

  qryDRRoute.Open;
  qryDRRouteSchedule.Open;
  qryDRRouteScheduleInfo.Open;
  qryRouteScheduleDeliveries.Open;
  qryClinicList.Open;
  qryRouteScheduleClinicSummary.Open;
//  qryRouteScheduleSummary.Open;

end;

procedure TfrmeDRRoute.Prescription_Add(pFromWhere : integer);
var
  ID : SGUID;
begin
  ID := GetCurrentPrescriptionID(pFromWhere);
  Add_Prescription(FDbConnectionString, Application.Handle, FUserAccess);
end;

procedure TfrmeDRRoute.Prescription_Delete(pFromWhere : integer);
var
  ID : SGUID;
begin
  ID := GetCurrentPrescriptionID(pFromWhere);
  Delete_Prescription(FDbConnectionString, ID, FUserAccess);
end;

procedure TfrmeDRRoute.Prescription_Edit(pFromWhere : integer);
var
  ID : SGUID;
begin
  ID := GetCurrentPrescriptionID(pFromWhere);
  Edit_Prescription(FDbConnectionString, Application.Handle, ID, nil, FUserAccess);
end;

procedure TfrmeDRRoute.SetDbConnectionString(const Value: string);
begin
  conRoute.Close;
  conRoute.ConnectionString := Value;
  FDbConnectionString := Value;
end;

procedure TfrmeDRRoute.qryDRRouteNewRecord(DataSet: TDataSet);
begin
  with DataSet do
    begin
    FieldByName('downRefRoute_ID').AsString := CreateClassID;
    FieldByName('routeName_str').AsString := 'Pending...';
    FieldByName('routeFrequency_int').AsInteger := 4;
    FieldByName('routeDayOfMonth_int').AsInteger := 0;
    FieldByName('routeApproxLength_int').AsInteger := 0;
    FieldByName('routeDayOfWeek_int').AsInteger := 0;
    end;
end;

procedure TfrmeDRRoute.qryDRRouteScheduleNewRecord(DataSet: TDataSet);
begin
  with DataSet do
    begin
    FieldByName('downRefRoute_ID').AsString := qryDRRoute.FieldByName('downRefRoute_ID').AsString;
    FieldByName('downRefRouteSchedule_ID').AsString := CreateClassID;
    FieldByName('deliveryDate_dat').AsDateTime := Date;
    FieldByName('deliveryPerson_str').AsString := 'Pending...';
    FieldByName('deliveryStatus_str').AsString := 'Pending...';
    FieldByName('deliveryStatusReason_str').AsString := 'No Reason...';
    FieldByName('deliveryPeriodStart_dat').AsDateTime := Date;
    FieldByName('deliveryPeriodEnd_dat').AsDateTime := Date;
    FieldByName('deliveryAproxTime_str').AsString := 'Pending...';
    FieldByName('deliveryDescription_str').AsString := 'Pending...';

    end;
end;

procedure TfrmeDRRoute.qryDRRouteScheduleInfoNewRecord(
  DataSet: TDataSet);
begin

  with DataSet do
    begin
    FieldByName('downRefRouteSchedule_ID').AsString := qryDRRouteSchedule.FieldByName('downRefRouteSchedule_ID').AsString;
    FieldByName('downRefRouteScheduleInfo_ID').AsString := CreateClassID;
    FieldByName('dateRecorded_dat').AsDateTime := Date;
    end;

end;

procedure TfrmeDRRoute.atnPescription_EditExecute(Sender: TObject);
begin
  Prescription_Edit(0);
end;

procedure TfrmeDRRoute.FrameResize(Sender: TObject);
begin
  Screen_Resize;
end;

procedure TfrmeDRRoute.Screen_Resize;
var
  curWid, curHgt  :integer;

const
  STEP = 5;
  HGHT = 45;

begin

  curWid  := pnlToolbar_Header.Width;
  curHgt  := HGHT;

  pnlToolbar_Header.Height := curHgt;
  
  pnlToolbar_Header_ShapeBorder.Left   := STEP;
  pnlToolbar_Header_ShapeBorder.Top    := STEP;
  pnlToolbar_Header_ShapeBorder.Width  := curWid - (STEP * 2);
  pnlToolbar_Header_ShapeBorder.Height := curHgt - (STEP * 2);

  pnlToolbar_Header_Display.Left   := (STEP * 2);
  pnlToolbar_Header_Display.Top    := (STEP * 2);
  pnlToolbar_Header_Display.Width  := curWid - (STEP * 4);
  pnlToolbar_Header_Display.Height := curHgt - (STEP * 4);

  curWid := pnlHolder_Batch.Width;
  curHgt := pnlHolder_Batch.Height;

  rzlBatchHeading.Left  := STEP;
  rzlBatchHeading.Width := curWid - (STEP * 2);

  RzLabel1.Width := curWid - (RzLabel1.Left + STEP);
  RzGroupBox2.Width := RzLabel1.Width;

  rzlDeliveryManager.Width := curWid - (rzlDeliveryManager.Left + STEP);
  rzgDeliveryManager.Width := rzlDeliveryManager.Width;

  rzgDeliveryManager.Height := curHgt - rzgDeliveryManager.Top - STEP;

  rzpClinics.Height := rgbBatch.Height -  rzpClinics.Top - (STEP * 2);


end;

procedure TfrmeDRRoute.qryDRRouteScheduleBeforePost(DataSet: TDataSet);
var
  delRoute  : string;
  delDate   : string;
begin

  delRoute := qryDRRoute.FieldByName('routeName_str').AsString;

  with DataSet do
    begin
    delDate := FormatDateTime('yyyy/mm/dd a dddd', FieldByName('deliveryDate_dat').AsDateTime);

    FieldByName('deliveryDescription_str').AsString := delRoute + ' ON [' + deldate + ']';
    end;


end;

procedure TfrmeDRRoute.Refresh_DataSet(DataSet : TDataset ; PrimaryKeyField :
    String);
var
  curRecord :String;
begin

  try
  with DataSet do
    if Active then
      try
      DisableControls;
      curRecord := FieldByName(PrimaryKeyField).AsString;
      if State in [dsEdit, dsInsert] then Post;
      Close;
      Open;
      Last;
      while not BOF do
        begin
        if FieldByName(PrimaryKeyField).AsString = curRecord then Break;
        Prior;
        end;
      finally
      EnableControls;
      end;
  except 
  end;

end;

procedure TfrmeDRRoute.atnPrescription_RefreshExecute(Sender: TObject);
begin
  Refresh_DataSet(qryRouteScheduleDeliveries, 'prescription_ID');
  qryRouteScheduleClinicSummary.Close;
//  qryRouteScheduleSummary.Close;
  qryRouteScheduleClinicSummary.Open;
//  qryRouteScheduleSummary.Open;
end;

procedure TfrmeDRRoute.atnPrintBatch01PickingExecute(Sender: TObject);
begin
  ppBatch01Picking.Print;
end;

procedure TfrmeDRRoute.atnPrintBatch02PicklistExecute(Sender: TObject);
begin
  ppBatch02Picklist.Print;
end;

procedure TfrmeDRRoute.atnPrintBatch03DeliveryConfirmationExecute(
  Sender: TObject);
begin
  ppBatch03DeliveryConfirmation.Print;
end;

procedure TfrmeDRRoute.atnPrintBatch04CollectionConfirmationExecute(
  Sender: TObject);
begin
  ppBatch04CollectionConfirmation.Print;
end;

procedure TfrmeDRRoute.atnPrintBatch05ClinicSummaryInformationExecute(
  Sender: TObject);
begin
  ppBatch05ClinicSummary.Print;
end;

end.
