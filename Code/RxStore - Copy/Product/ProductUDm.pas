unit ProductUDm;
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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComObj, Variants,
  ppModule, daDataModule, myChkBox, ppCtrls, ppBands, ppVar, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ADODB, DB, DBTables,ExtCtrls, PrjConst,
  ppParameter, Math, TXComp, TXRB, jpeg, ppBarCod, ppStrtch, RBTableGrid,
  ppEndUsr;

const
  HST_ADD     = 'ADDED';
  HST_DEL     = 'DELETED';
  HST_EDT     = 'EDITED';
  HST_OVR     = '*ADMIN OVERRIDE*';
  HST_ERR     = '*ERROR*';
  HST_PRN     = 'PRINTED';
  HST_CHG     = 'CHANGED DESCRIPTION';
  HST_LEV     = 'LEVELS';
  HST_PRC     = 'PRICE';
  HST_CNT     = 'CONTRACT';
  HST_ECN     = 'ECN';
  HST_ICN     = 'ICN';
  HST_BIN     = 'BIN LOCATION';
  HST_NSN     = 'NSN';
  HST_EDL     = 'INSTITUTIONAL';
  HST_ORD     = 'ORDER TYPE';
  HST_SHP     = 'SHIPPING PACK';
  HST_GR1     = 'GROUP 1';
  HST_GR2     = 'GROUP 2';

type
  TProductDm = class(TDataModule)
    ADOProductConnection: TADOConnection;
    dstblProductCatalog: TDataSource;
    dstblProductLedger: TDataSource;
    stpProductLedger: TADOStoredProc;
    stpProductVariance: TADOStoredProc;
    dsstpProductVariance: TDataSource;
    stpProductLeadTime: TADOStoredProc;
    stpProductConsumption: TADOStoredProc;
    stpProductConsumptionProductCode_ID: TIntegerField;
    stpProductConsumptionProductCode_str: TWideStringField;
    stpProductConsumptionDate_dat: TDateTimeField;
    stpProductConsumptionType_str: TWideStringField;
    stpProductConsumptionDayQuantity_int: TFloatField;
    stpProductConsumptionAccumDay_int: TFloatField;
    stpProductConsumptionAccumDayQuantity_int: TFloatField;
    qryADOBin: TADOQuery;
    stpProductFYTDExpenditures: TADOStoredProc;
    stpProductMonthlyExpenditures: TADOStoredProc;
    dsqryADOBin: TDataSource;
    dsstpProductFYTDExpenditures: TDataSource;
    dsSystem: TDataSource;
    dsstpProductMonthlyExpenditures: TDataSource;
    qryADOGenericName: TADOQuery;
    qryADOStrengthRange: TADOQuery;
    qryADOComparisonUnit: TADOQuery;
    qryADOFormRange: TADOQuery;
    qryADOTradeName: TADOQuery;
    qryADOContractCode: TADOQuery;
    stpProductContract: TADOStoredProc;
    dsstpProductContract: TDataSource;
    qryADOATC: TADOQuery;
    qryADOLevelOfUse: TADOQuery;
    stpProductVarianceTotals: TADOStoredProc;
    dsstpProductVarianceTotals: TDataSource;
    TlkProductPackSizeGroup2: TADOTable;
    TlkProductPackSizeGroup1: TADOTable;
    stpProductVarianceAPPEND: TADOStoredProc;
    stpProductConsumptionDayMinQOH_int: TIntegerField;
    dsGenericName: TDataSource;
    dsFormRange: TDataSource;
    dsStrengthRange: TDataSource;
    dsComparisonUnit: TDataSource;
    dsContractCode: TDataSource;
    dsATC: TDataSource;
    dsLevelOfUse: TDataSource;
    qryADORoute: TADOQuery;
    dsRoute: TDataSource;
    ppProductList: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppProductDetail: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppTitleBand2: TppTitleBand;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    ppLabel23: TppLabel;
    ppDBText22: TppDBText;
    ppLabel24: TppLabel;
    ppDBText23: TppDBText;
    ppLabel25: TppLabel;
    ppDBText24: TppDBText;
    ppLabel26: TppLabel;
    ppDBText25: TppDBText;
    ppLabel27: TppLabel;
    ppDBText26: TppDBText;
    ppLabel28: TppLabel;
    ppDBText27: TppDBText;
    ppLabel29: TppLabel;
    ppDBText31: TppDBText;
    ppLabel33: TppLabel;
    ppDBText32: TppDBText;
    ppLabel34: TppLabel;
    ppDBText33: TppDBText;
    ppLabel35: TppLabel;
    ppDBText34: TppDBText;
    ppLabel36: TppLabel;
    ppDBText35: TppDBText;
    ppLabel37: TppLabel;
    ppDBText36: TppDBText;
    ppLabel38: TppLabel;
    ppDBText37: TppDBText;
    ppLabel39: TppLabel;
    ppDBText38: TppDBText;
    ppLabel40: TppLabel;
    ppDBText39: TppDBText;
    ppLabel41: TppLabel;
    ppDBText40: TppDBText;
    ppLabel42: TppLabel;
    ppDBText41: TppDBText;
    ppLabel43: TppLabel;
    ppDBText42: TppDBText;
    ppLabel44: TppLabel;
    ppDBText43: TppDBText;
    ppLabel45: TppLabel;
    ppDBText44: TppDBText;
    ppLabel46: TppLabel;
    ppDBText45: TppDBText;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppDBText47: TppDBText;
    ppLabel49: TppLabel;
    ppDBText48: TppDBText;
    ppLabel50: TppLabel;
    ppDBText49: TppDBText;
    ppLabel51: TppLabel;
    ppDBText50: TppDBText;
    ppLabel52: TppLabel;
    ppDBText51: TppDBText;
    ppLabel53: TppLabel;
    ppDBText52: TppDBText;
    ppLabel54: TppLabel;
    ppDBText53: TppDBText;
    ppLabel55: TppLabel;
    ppDBText54: TppDBText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText57: TppDBText;
    ppLabel59: TppLabel;
    ppDBText58: TppDBText;
    ppLabel60: TppLabel;
    ppDBText59: TppDBText;
    ppLabel61: TppLabel;
    ppDBText60: TppDBText;
    ppLabel62: TppLabel;
    ppDBText61: TppDBText;
    ppLabel63: TppLabel;
    ppDBText62: TppDBText;
    ppLabel64: TppLabel;
    ppDBText63: TppDBText;
    ppLabel65: TppLabel;
    ppDBText64: TppDBText;
    ppLabel66: TppLabel;
    ppDBText65: TppDBText;
    ppLabel67: TppLabel;
    ppDBText66: TppDBText;
    ppLabel68: TppLabel;
    ppDBText67: TppDBText;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppDBText71: TppDBText;
    ppLabel73: TppLabel;
    ppDBText72: TppDBText;
    ppLabel74: TppLabel;
    ppDBText73: TppDBText;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppDBText75: TppDBText;
    ppLabel77: TppLabel;
    ppDBText76: TppDBText;
    ppLabel78: TppLabel;
    ppDBText77: TppDBText;
    ppLabel79: TppLabel;
    ppDBText79: TppDBText;
    ppLabel81: TppLabel;
    ppDBText80: TppDBText;
    ppLabel82: TppLabel;
    ppDBText81: TppDBText;
    ppLabel83: TppLabel;
    ppDBText82: TppDBText;
    ppLabel84: TppLabel;
    ppDBText83: TppDBText;
    ppLabel85: TppLabel;
    ppDBText84: TppDBText;
    ppLabel86: TppLabel;
    ppLabel90: TppLabel;
    ppDBText90: TppDBText;
    ppLabel92: TppLabel;
    ppDBText92: TppDBText;
    ppLabel94: TppLabel;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    myDBCheckBox3: TmyDBCheckBox;
    myDBCheckBox4: TmyDBCheckBox;
    myDBCheckBox5: TmyDBCheckBox;
    myDBCheckBox6: TmyDBCheckBox;
    myDBCheckBox7: TmyDBCheckBox;
    ppDBProductDetail: TppDBPipeline;
    stpProductStoreTotals: TADOStoredProc;
    dsstpProductStoreTotals: TDataSource;
    ppLine1: TppLine;
    tblProductCatalog: TADOQuery;
    daDataModule1: TdaDataModule;
    qryADOAbbreviationsUnits: TADOQuery;
    dsqryAbbreviations: TDataSource;
    vw_ProductDispensingledger: TADOQuery;
    dsvw_ProductDispensingledger: TDataSource;
    qryADOPackSizeRange: TADOQuery;
    dsPackSizeRange: TDataSource;
    qryADOPackSizeContainer: TADOQuery;
    dsPackSizeContainer: TDataSource;
    qryADOAdministrationUnits: TADOQuery;
    dsAdministrationUnits: TDataSource;
    qryProductBatch: TADOQuery;
    dsqryProductBatch: TDataSource;
    qryADOFormRangeCode_str: TWideStringField;
    qryADOFormRangeDescription_str: TWideStringField;
    qryADOFormRangeInjectable_bol: TBooleanField;
    qryADOFormRangedispensingForm_str: TWideStringField;
    qryADOFormRangeAdministration_str: TWideStringField;
    qryADOFormRangeAdministrationCode_str: TWideStringField;
    dsqryADOTradeName: TDataSource;
    qryProduct_Worker: TADOQuery;
    qryProductAddCopyItem: TADOQuery;
    qryLastProductAdded: TADOQuery;
    strdprc_ProductMonthly_Receipts: TADOStoredProc;
    strdprc_ProductMonthly_Issues: TADOStoredProc;
    dsMonthly_Issues: TDataSource;
    dsMotnhly_Receipts: TDataSource;
    ado_updateBatch: TADOQuery;
    ado_updateBatchExpiry_dat: TDateTimeField;
    ado_updateBatchBatchQty_int: TIntegerField;
    ado_updateBatchProductCode_ID: TIntegerField;
    ado_updateBatchBatchNumber_str: TStringField;
    CalcSiglSL: TADOQuery;
    CalcSiglSLIss: TIntegerField;
    CalcSiglSLPC: TIntegerField;
    CalcSiglSLICN: TWideStringField;
    CalcSiglSLMonth: TIntegerField;
    CalcSiglSLYear: TIntegerField;
    CalcSiglSLMonthCount: TIntegerField;
    CalcSiglSLAMU: TIntegerField;
    CalcSiglSLLT: TIntegerField;
    CalcSiglSLPP: TIntegerField;
    CalcSiglSLSS: TBCDField;
    CalcSiglSLSMin: TBCDField;
    CalcSiglSLSMax: TBCDField;
    CalcSiglSLProductCode_ID: TIntegerField;
    CheckItemIfUnposted: TADOQuery;
    tblProductCatalogproductPackSize_ID: TGuidField;
    tblProductCataloggenericName_ID: TGuidField;
    tblProductCatalogProductCode_ID: TAutoIncField;
    tblProductCatalogProductCode_str: TWideStringField;
    tblProductCatalogGenericName_str: TWideStringField;
    tblProductCatalogStrengthUnit_Str: TWideStringField;
    tblProductCatalogForm_str: TWideStringField;
    tblProductCatalogRoute_str: TWideStringField;
    tblProductCatalogPackSizeUnit_str: TWideStringField;
    tblProductCatalogDispensingUnit_str: TWideStringField;
    tblProductCatalogStrengthValue_dbl: TFloatField;
    tblProductCatalogInstitutionEDL_bol: TBooleanField;
    tblProductCatalogDescription_str: TStringField;
    tblProductCatalogPackSizeValue_dbl: TFloatField;
    tblProductCatalogDispensingValue_dbl: TFloatField;
    tblProductCatalogCombinations_int: TIntegerField;
    tblProductCatalogpackDescription_Str: TWideStringField;
    tblProductCatalogdispensingForm_str: TWideStringField;
    tblProductCatalogcanBreakUnit: TBooleanField;
    tblProductCatalogdispensedUnit_str: TWideStringField;
    tblProductCatalogdispensedValue_dbl: TFloatField;
    tblProductCatalogrxLevel_str: TWideStringField;
    tblProductCatalogstrengthExtraDescription_str: TWideStringField;
    tblProductCatalogICN_str: TWideStringField;
    tblProductCatalogECN_str: TWideStringField;
    tblProductCatalogNSN_str: TWideStringField;
    tblProductCatalogFMSCode_str: TWideStringField;
    tblProductCatalogStatus_str: TWideStringField;
    tblProductCatalogMinStockSet_int: TIntegerField;
    tblProductCatalogBin_str: TWideStringField;
    tblProductCatalogRefrigerated_bol: TBooleanField;
    tblProductCatalogStrengthValue_int: TIntegerField;
    tblProductCatalogTradeName_str: TWideStringField;
    tblProductCatalogStockLevel_int: TIntegerField;
    tblProductCatalogVEN_str: TWideStringField;
    tblProductCatalogSupplement_bol: TBooleanField;
    tblProductCatalogInjectable_bol: TBooleanField;
    tblProductCatalogLastUpdate_dat: TDateTimeField;
    tblProductCatalogLevelOfUse_str: TWideStringField;
    tblProductCatalogMinStockCalc_int: TIntegerField;
    tblProductCatalogLastReceipt_dat: TDateTimeField;
    tblProductCatalogDDDValue_int: TSmallintField;
    tblProductCatalogLastUpdateBy_str: TWideStringField;
    tblProductCatalogBarCode_str: TWideStringField;
    tblProductCatalogAvgDailyConsumption_int: TFloatField;
    tblProductCatalogInstLevelOfUse_str: TWideStringField;
    tblProductCatalogFormCode_str: TWideStringField;
    tblProductCatalogForecastingPeriod_str: TWideStringField;
    tblProductCatalogReOrderStatus_str: TWideStringField;
    tblProductCatalogGroup1_str: TWideStringField;
    tblProductCatalogPackSize_str: TWideStringField;
    tblProductCatalogReviewLevel_bol: TBooleanField;
    tblProductCatalogRecurrent_bol: TBooleanField;
    tblProductCatalogSchedule_int: TIntegerField;
    tblProductCatalogUseGenericNameInDescription_bol: TBooleanField;
    tblProductCatalogMaxStockSet_int: TIntegerField;
    tblProductCatalogShippingPack_int: TIntegerField;
    tblProductCatalogOrderType_str: TWideStringField;
    tblProductCatalogATC_str: TWideStringField;
    tblProductCatalogWHOClassification_str: TWideStringField;
    tblProductCatalogOldProductCode: TWideStringField;
    tblProductCatalogStrenghtUnit_str: TWideStringField;
    tblProductCatalogProcurementPeriod_str: TWideStringField;
    tblProductCatalogICD10Code_str: TWideStringField;
    tblProductCatalogSupplement_str: TWideStringField;
    tblProductCatalogOldICN_str: TWideStringField;
    tblProductCatalogPTCDeleted_dat: TDateTimeField;
    tblProductCatalogGenericCode_str: TWideStringField;
    tblProductCatalogStorageTemp_str: TWideStringField;
    tblProductCatalogPTCIncluded_dat: TDateTimeField;
    tblProductCatalogMaxStockCalc_int: TIntegerField;
    tblProductCatalogStorageConditions_str: TWideStringField;
    tblProductCatalogLeadTime_str: TWideStringField;
    tblProductCatalogSafetyStockSet_int: TIntegerField;
    tblProductCatalogATC3_str: TWideStringField;
    tblProductCatalogPTCDecision_mem: TMemoField;
    tblProductCatalogItemBugdet_mon: TBCDField;
    tblProductCatalogStrength_str: TWideStringField;
    tblProductCatalogLastUpdateBy_dbl: TFloatField;
    tblProductCatalogSafetyStockCalc_Int: TIntegerField;
    tblProductCatalogGroup2_str: TWideStringField;
    tblProductCatalogBasicUnit_int: TSmallintField;
    tblProductCatalogDDDUnit_str: TWideStringField;
    tblProductCatalogWHOLevel_str: TWideStringField;
    tblProductCatalogABC_str: TWideStringField;
    tblProductCatalogStockLevelPot_int: TIntegerField;
    tblProductCatalogProcurementPeriod_int: TIntegerField;
    tblProductCatalogProductCode7_str: TWideStringField;
    tblProductCatalogLastOrder_dat: TDateTimeField;
    tblProductCatalogLastIssue_dat: TDateTimeField;
    tblProductCatalogLeadTime_int: TIntegerField;
    tblProductCatalogDMO_str: TWideStringField;
    tblProductCatalogRestriction_str: TWideStringField;
    tblProductCatalogAutoOrder_bol: TBooleanField;
    tblProductCatalogProvincialEDL_bol: TBooleanField;
    tblProductCatalogContractCode_str: TWideStringField;
    tblProductCatalogMaxStockAvailableInBudget_int: TIntegerField;
    tblProductCatalogNationalEDL_bol: TBooleanField;
    tblProductCatalogPackSizeCode_str: TWideStringField;
    tblProductCatalogReviewedItemBudget_mon: TBCDField;
    tblProductCatalogEarliestExpiry_dat: TDateTimeField;
    tblProductCatalogLastReview_dat: TDateTimeField;
    tblProductCatalogPaediatric_bol: TBooleanField;
    tblProductCatalogStrengthCode_str: TWideStringField;
    tblProductCatalogUnitsOnHand_dbl: TFloatField;
    tblProductCatalogPackContainer_str: TWideStringField;
    tblProductCatalogPrescriberUnits_ID: TIntegerField;
    tblProductCatalogManageStockLevel_bol: TBooleanField;
    tblProductCatalogAdministration_str: TWideStringField;
    tblProductCatalogStrengthRangePackCoefficient_dbl: TFloatField;
    tblProductCatalogIsAvailableForDispensing_Bol: TBooleanField;
    tblProductCatalogAvg_Lag_dbl: TFloatField;
    tblProductCatalogCost_mon: TBCDField;
    tblProductCatalogStockValue_mon: TBCDField;
    tblProductCatalogQtyOrdered_int: TIntegerField;
    tblProductCatalogQtyRequest_int: TIntegerField;
    tblProductCatalogCalcQtyOnHand_int: TIntegerField;
    tblProductCatalogCalcQtyOnHold_int: TIntegerField;
    tblProductCatalogSellingPrice: TFloatField;
    tblProductCatalogPercMarkup_dbl: TFloatField;
    tblEditHistory: TADOQuery;
    ExtraOptions1: TExtraOptions;
    tblProductCatalogReturnsOnHold_int: TIntegerField;
    tblProductCatalogReqRetOnHold_int: TIntegerField;
    CheckItemifOnReturnsUnposted: TADOQuery;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    tblVariances: TADOQuery;
    stpProductVarianceProductVariance_ID: TAutoIncField;
    stpProductVarianceProductCode_ID: TIntegerField;
    stpProductVarianceType_str: TWideStringField;
    stpProductVarianceOldQty_int: TIntegerField;
    stpProductVarianceNewQty_int: TIntegerField;
    stpProductVariancePackCost_mon: TBCDField;
    stpProductVarianceExpiryDate_dat: TDateTimeField;
    stpProductVarianceDate_dat: TDateTimeField;
    stpProductVarianceUserName_str: TWideStringField;
    stpProductVarianceLastUpDated_dat: TDateTimeField;
    stpProductVarianceLastUpdatedBy_int: TIntegerField;
    stpProductVarianceReason_str: TWideStringField;
    stpProductVarianceBatchNumber_str: TWideStringField;
    stpProductVarianceAdjQty_int: TIntegerField;
    stpProductVarianceAdjCost_mon: TBCDField;
    stpProductVarianceUnitCost_mon: TBCDField;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel30: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel5: TppLabel;
    ppLabel15: TppLabel;
    ppLabel20: TppLabel;
    ppLabel31: TppLabel;
    ppLabel21: TppLabel;
    ppLabel7: TppLabel;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppDBText29: TppDBText;
    ppLine5: TppLine;
    ppImage2: TppImage;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine6: TppLine;
    stpUpdateBatchPrice: TADOQuery;
    qryProductCatalogBatches: TADOQuery;
    qryProductCatalogBatchesproductPackSize_ID: TGuidField;
    qryProductCatalogBatchesgenericName_ID: TGuidField;
    qryProductCatalogBatchesProductCode_ID: TAutoIncField;
    qryProductCatalogBatchesProductCode_str: TWideStringField;
    qryProductCatalogBatchesGenericName_str: TWideStringField;
    qryProductCatalogBatchesStrengthUnit_Str: TWideStringField;
    qryProductCatalogBatchesForm_str: TWideStringField;
    qryProductCatalogBatchesRoute_str: TWideStringField;
    qryProductCatalogBatchesPackSizeUnit_str: TWideStringField;
    qryProductCatalogBatchesDispensingUnit_str: TWideStringField;
    qryProductCatalogBatchesStrengthValue_dbl: TFloatField;
    qryProductCatalogBatchesInstitutionEDL_bol: TBooleanField;
    qryProductCatalogBatchesDescription_str: TStringField;
    qryProductCatalogBatchesPackSizeValue_dbl: TFloatField;
    qryProductCatalogBatchesDispensingValue_dbl: TFloatField;
    qryProductCatalogBatchesCombinations_int: TIntegerField;
    qryProductCatalogBatchespackDescription_Str: TWideStringField;
    qryProductCatalogBatchesdispensingForm_str: TWideStringField;
    qryProductCatalogBatchescanBreakUnit: TBooleanField;
    qryProductCatalogBatchesdispensedUnit_str: TWideStringField;
    qryProductCatalogBatchesdispensedValue_dbl: TFloatField;
    qryProductCatalogBatchesrxLevel_str: TWideStringField;
    qryProductCatalogBatchesstrengthExtraDescription_str: TWideStringField;
    qryProductCatalogBatchesICN_str: TWideStringField;
    qryProductCatalogBatchesECN_str: TWideStringField;
    qryProductCatalogBatchesNSN_str: TWideStringField;
    qryProductCatalogBatchesFMSCode_str: TWideStringField;
    qryProductCatalogBatchesStatus_str: TWideStringField;
    qryProductCatalogBatchesMinStockSet_int: TIntegerField;
    qryProductCatalogBatchesBin_str: TWideStringField;
    qryProductCatalogBatchesRefrigerated_bol: TBooleanField;
    qryProductCatalogBatchesStrengthValue_int: TIntegerField;
    qryProductCatalogBatchesTradeName_str: TWideStringField;
    qryProductCatalogBatchesStockLevel_int: TIntegerField;
    qryProductCatalogBatchesVEN_str: TWideStringField;
    qryProductCatalogBatchesSupplement_bol: TBooleanField;
    qryProductCatalogBatchesInjectable_bol: TBooleanField;
    qryProductCatalogBatchesLastUpdate_dat: TDateTimeField;
    qryProductCatalogBatchesLevelOfUse_str: TWideStringField;
    qryProductCatalogBatchesMinStockCalc_int: TIntegerField;
    qryProductCatalogBatchesLastReceipt_dat: TDateTimeField;
    qryProductCatalogBatchesDDDValue_int: TSmallintField;
    qryProductCatalogBatchesLastUpdateBy_str: TWideStringField;
    qryProductCatalogBatchesBarCode_str: TWideStringField;
    qryProductCatalogBatchesAvgDailyConsumption_int: TFloatField;
    qryProductCatalogBatchesInstLevelOfUse_str: TWideStringField;
    qryProductCatalogBatchesFormCode_str: TWideStringField;
    qryProductCatalogBatchesForecastingPeriod_str: TWideStringField;
    qryProductCatalogBatchesReOrderStatus_str: TWideStringField;
    qryProductCatalogBatchesGroup1_str: TWideStringField;
    qryProductCatalogBatchesPackSize_str: TWideStringField;
    qryProductCatalogBatchesReviewLevel_bol: TBooleanField;
    qryProductCatalogBatchesRecurrent_bol: TBooleanField;
    qryProductCatalogBatchesSchedule_int: TIntegerField;
    qryProductCatalogBatchesUseGenericNameInDescription_bol: TBooleanField;
    qryProductCatalogBatchesMaxStockSet_int: TIntegerField;
    qryProductCatalogBatchesShippingPack_int: TIntegerField;
    qryProductCatalogBatchesOrderType_str: TWideStringField;
    qryProductCatalogBatchesATC_str: TWideStringField;
    qryProductCatalogBatchesWHOClassification_str: TWideStringField;
    qryProductCatalogBatchesOldProductCode: TWideStringField;
    qryProductCatalogBatchesStrenghtUnit_str: TWideStringField;
    qryProductCatalogBatchesProcurementPeriod_str: TWideStringField;
    qryProductCatalogBatchesICD10Code_str: TWideStringField;
    qryProductCatalogBatchesSupplement_str: TWideStringField;
    qryProductCatalogBatchesOldICN_str: TWideStringField;
    qryProductCatalogBatchesPTCDeleted_dat: TDateTimeField;
    qryProductCatalogBatchesGenericCode_str: TWideStringField;
    qryProductCatalogBatchesStorageTemp_str: TWideStringField;
    qryProductCatalogBatchesPTCIncluded_dat: TDateTimeField;
    qryProductCatalogBatchesMaxStockCalc_int: TIntegerField;
    qryProductCatalogBatchesStorageConditions_str: TWideStringField;
    qryProductCatalogBatchesLeadTime_str: TWideStringField;
    qryProductCatalogBatchesSafetyStockSet_int: TIntegerField;
    qryProductCatalogBatchesATC3_str: TWideStringField;
    qryProductCatalogBatchesPTCDecision_mem: TMemoField;
    qryProductCatalogBatchesItemBugdet_mon: TBCDField;
    qryProductCatalogBatchesStrength_str: TWideStringField;
    qryProductCatalogBatchesLastUpdateBy_dbl: TFloatField;
    qryProductCatalogBatchesSafetyStockCalc_Int: TIntegerField;
    qryProductCatalogBatchesGroup2_str: TWideStringField;
    qryProductCatalogBatchesBasicUnit_int: TSmallintField;
    qryProductCatalogBatchesDDDUnit_str: TWideStringField;
    qryProductCatalogBatchesWHOLevel_str: TWideStringField;
    qryProductCatalogBatchesABC_str: TWideStringField;
    qryProductCatalogBatchesStockLevelPot_int: TIntegerField;
    qryProductCatalogBatchesProcurementPeriod_int: TIntegerField;
    qryProductCatalogBatchesProductCode7_str: TWideStringField;
    qryProductCatalogBatchesLastOrder_dat: TDateTimeField;
    qryProductCatalogBatchesLastIssue_dat: TDateTimeField;
    qryProductCatalogBatchesLeadTime_int: TIntegerField;
    qryProductCatalogBatchesDMO_str: TWideStringField;
    qryProductCatalogBatchesRestriction_str: TWideStringField;
    qryProductCatalogBatchesAutoOrder_bol: TBooleanField;
    qryProductCatalogBatchesProvincialEDL_bol: TBooleanField;
    qryProductCatalogBatchesContractCode_str: TWideStringField;
    qryProductCatalogBatchesMaxStockAvailableInBudget_int: TIntegerField;
    qryProductCatalogBatchesNationalEDL_bol: TBooleanField;
    qryProductCatalogBatchesPackSizeCode_str: TWideStringField;
    qryProductCatalogBatchesReviewedItemBudget_mon: TBCDField;
    qryProductCatalogBatchesEarliestExpiry_dat: TDateTimeField;
    qryProductCatalogBatchesLastReview_dat: TDateTimeField;
    qryProductCatalogBatchesPaediatric_bol: TBooleanField;
    qryProductCatalogBatchesStrengthCode_str: TWideStringField;
    qryProductCatalogBatchesUnitsOnHand_dbl: TFloatField;
    qryProductCatalogBatchesPackContainer_str: TWideStringField;
    qryProductCatalogBatchesPrescriberUnits_ID: TIntegerField;
    qryProductCatalogBatchesManageStockLevel_bol: TBooleanField;
    qryProductCatalogBatchesAdministration_str: TWideStringField;
    qryProductCatalogBatchesStrengthRangePackCoefficient_dbl: TFloatField;
    qryProductCatalogBatchesIsAvailableForDispensing_Bol: TBooleanField;
    qryProductCatalogBatchesAvg_Lag_dbl: TFloatField;
    qryProductCatalogBatchesCost_mon: TBCDField;
    qryProductCatalogBatchesPercMarkup_dbl: TFloatField;
    qryProductCatalogBatchesStockValue_mon: TBCDField;
    qryProductCatalogBatchesCalcQtyOnHand_int: TIntegerField;
    qryProductCatalogBatchesCalcQtyOnHold_int: TIntegerField;
    qryProductCatalogBatchesQtyOrdered_int: TIntegerField;
    qryProductCatalogBatchesQtyRequest_int: TIntegerField;
    qryProductCatalogBatchesSellingPrice: TFloatField;
    qryProductCatalogBatchesReturnsOnHold_int: TIntegerField;
    qryProductCatalogBatchesReqRetOnHold_int: TIntegerField;
    qryProductCatalogBatchesBatchNumber_str: TWideStringField;
    qryProductCatalogBatchesExpiry_Dat: TDateTimeField;
    qryProductCatalogBatchesPrice_mon: TBCDField;
    qryProductCatalogBatchesProductBatch_ID: TAutoIncField;
    dsProductCatalogBatches: TDataSource;
    DBProductList: TppDBPipeline;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText14: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText28: TppDBText;
    ppLine3: TppLine;
    ppDBText30: TppDBText;
    ppDBText46: TppDBText;
    ppDBText55: TppDBText;
    ppLabel32: TppLabel;
    stp_StockStatusReport: TADOStoredProc;
    ppReportStockStatus: TppReport;
    dsStockStatusReport: TDataSource;
    ppParameterList3: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppDBText56: TppDBText;
    ppDBText68: TppDBText;
    stp_StockStatusReportID: TIntegerField;
    stp_StockStatusReportProductName: TWideStringField;
    stp_StockStatusReportQtyStart: TFloatField;
    stp_StockStatusReportDateStart: TDateTimeField;
    stp_StockStatusReportQtyEnd: TFloatField;
    stp_StockStatusReportDateEnd: TDateTimeField;
    stp_StockStatusReportStockTake: TFloatField;
    stp_StockStatusReportStockTakeCount: TIntegerField;
    stp_StockStatusReportVariance: TFloatField;
    stp_StockStatusReportVarianceCount: TIntegerField;
    stp_StockStatusReportOrdered: TFloatField;
    stp_StockStatusReportOrderedCount: TIntegerField;
    stp_StockStatusReportRecieved: TFloatField;
    stp_StockStatusReportRecievedCount: TIntegerField;
    stp_StockStatusReportIssued: TFloatField;
    stp_StockStatusReportIssuedCount: TIntegerField;
    stp_StockStatusReportTotalTransactions: TIntegerField;
    ppDBPipelineStockStatus: TppDBPipeline;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText74: TppDBText;
    ppDBText78: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel80: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel91: TppLabel;
    ppLabel93: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    stp_StockStatusReportECN: TWideStringField;
    stp_StockStatusReportICN: TWideStringField;
    ppDBText88: TppDBText;
    ppDBPipelineSystem: TppDBPipeline;
    ppDBText89: TppDBText;
    ppDBText91: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppDBText96: TppDBText;
    stp_StockStatusReportVEN: TWideStringField;
    pplblDateFilter: TppLabel;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBImage2: TppDBImage;
    stpDeleteProduct: TADOQuery;
    ppProductBarCodes: TppReport;
    ppTitleBand3: TppTitleBand;
    ppLabel103: TppLabel;
    ppLine9: TppLine;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBImage3: TppDBImage;
    ppHeaderBand4: TppHeaderBand;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLine10: TppLine;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLine11: TppLine;
    ppLabel115: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppParameterList4: TppParameterList;
    DataSource1: TDataSource;
    qryProductBarcodes: TADOQuery;
    dsProductBarcodes: TDataSource;
    qryProductBarcodesNSN_str: TWideStringField;
    qryProductBarcodesECN_str: TWideStringField;
    qryProductBarcodesDescription_str: TStringField;
    qryProductBarcodesICN_str: TWideStringField;
    qryProductBarcodesbarCode_str: TWideStringField;
    qryProductBarcodesProductCode_ID: TAutoIncField;
    ppDBPipeline1: TppDBPipeline;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBBarCode1: TppDBBarCode;
    ppLine12: TppLine;
    ppReportProductDetailBartcode: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    daDataModule2: TdaDataModule;
    ppParameterList5: TppParameterList;
    ppDesigner1: TppDesigner;
    qryProductBarcode: TADOQuery;
    dsqryProductBarcode: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    ppDBBarCode2: TppDBBarCode;
    ppDBText111: TppDBText;
    stpRemoveNonEDLItemsFromDemanders: TADOQuery;
    dstblEditHistory: TDataSource;
    qryProductEditHistory: TADOQuery;
    qryBarcodes: TADOQuery;
    dsBarcodes: TDataSource;
    qryBarcodesBarCode_ID: TAutoIncField;
    qryBarcodesproductPackSize_ID: TGuidField;
    qryBarcodesProductCode_ID: TIntegerField;
    qryBarcodesbarCode_str: TWideStringField;
    qryBarcodesShipperPackBarCode_str: TWideStringField;
    qryBarcodesSupplier_str: TWideStringField;
    qryBarcodesCapturedBy_str: TWideStringField;
    qryBarcodesModified_dat: TDateTimeField;
    qryIsInStdRegimen: TADOQuery;
    qryIsInStdRegimenStdRegimen_ID: TGuidField;
    qryIsInStdRegimenFrmFormulation_Str: TWideStringField;
    qryIsInStdRegimenFrmAdministration_Str: TWideStringField;
    qryIsInStdRegimenFrmSKU_Dbl: TFloatField;
    qryIsInStdRegimenFrmInterval_Str: TWideStringField;
    qryIsInStdRegimenFrmAdministrationUnit_Str: TWideStringField;
    qryIsInStdRegimenFrmDailyDoseCalc_Dbl: TFloatField;
    qryIsInStdRegimenFrmDoseCalc_Dbl: TFloatField;
    qryIsInStdRegimenFrmSKUTotal_Dbl: TFloatField;
    qryIsInStdRegimenFrmDuration_Dbl: TFloatField;
    qryIsInStdRegimenFrmRepeat_Dbl: TFloatField;
    qryIsInStdRegimenFrmDirections_Str: TWideStringField;
    qryIsInStdRegimenFrmICDCode_Str: TWideStringField;
    qryIsInStdRegimenFrmDescription_Str: TWideStringField;
    qryIsInStdRegimenFrmProtocol_ID: TGuidField;
    qryIsInStdRegimenDspDescription_Str: TWideStringField;
    qryIsInStdRegimenDspProduct_ID: TGuidField;
    qryIsInStdRegimenDspProduct_Str: TWideStringField;
    qryIsInStdRegimenDspSKUActual_Dbl: TFloatField;
    qryIsInStdRegimenDspProductCalc_Dbl: TFloatField;
    qryIsInStdRegimenDspProductBreakPack_Bol: TBooleanField;
    qryIsInStdRegimenDspWarning_Str: TWideStringField;
    qryIsInStdRegimenDspDirections_Str: TWideStringField;
    qryIsInStdRegimenDspLabel01_Str: TWideStringField;
    qryIsInStdRegimenDspLabel02_Str: TWideStringField;
    qryIsInStdRegimenDspLabel03_Str: TWideStringField;
    qryIsInStdRegimenDspLabel04_Str: TWideStringField;
    qryIsInStdRegimenDspLabel05_Str: TWideStringField;
    qryIsInStdRegimenDspLabel06_Str: TWideStringField;
    qryIsInStdRegimenItemPreview_Str: TWideStringField;
    qryIsInStdRegimenDspDirectionsAuto_Bol: TBooleanField;
    dsIsInStdRegimen: TDataSource;
    ppDBProductRegimen: TppDBPipeline;
    ppReportProductRegimen: TppReport;
    ppParameterList6: TppParameterList;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLabel108: TppLabel;
    ppLine13: TppLine;
    ppLabel109: TppLabel;
    ppLine14: TppLine;
    ppDBText120: TppDBText;
    ppLine16: TppLine;
    ppLabel113: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppDBCalc2: TppDBCalc;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    qryDoesBarcodeExist: TADOQuery;
(*---------------------------------------------------------------------------------------------------------------------------*)

    procedure DataModuleCreate(Sender: TObject);
    procedure tblProductCatalogAfterScroll(DataSet: TDataSet);
    procedure stpProductConsumptionCalcFields(DataSet: TDataSet);
    procedure tblProductCatalogBeforePost(DataSet: TDataSet);
    procedure tblProductCatalogNewRecord(DataSet: TDataSet);
    procedure tblProductCatalogFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblProductCatalogAfterPost(DataSet: TDataSet);
    procedure ppProductPrintPreviewFormCreate(Sender: TObject);
    procedure tblProductCatalogBeforeClose(DataSet: TDataSet);
    procedure qryADOGenericNameNewRecord(DataSet: TDataSet);
    procedure qryADOStrengthRangeNewRecord(DataSet: TDataSet);
    procedure qryADOAdministrationUnitsNewRecord(DataSet: TDataSet);
    procedure qryADOStrengthRangeBeforePost(DataSet: TDataSet);
    procedure qryProduct_WorkerBeforePost(DataSet: TDataSet);
    procedure qryProductBatchNewRecord(DataSet: TDataSet);
    procedure qryBarcodesNewRecord(DataSet: TDataSet);
    procedure qryBarcodesBeforePost(DataSet: TDataSet);
  private
(*---------------------------------------------------------------------------------------------------------------------------*)
    { Private declarations }

    Reg_Start         : TDate;                                                  // Variables for calculated days
    OS_Days           : Single;
    Tot_Con, Day      : Single;

    IsLoading :Boolean;

    FUserID           :double;                                                  // Stores ID of logged user
    FUserName         :string;
    FEditing: boolean;                                                  // Stores Name of logged user
    ModuleLoaded :boolean;
    CustomReportPATH : string;


    function ConnectDataSource: Boolean;                                        // Opens datatables
    function GetAccessLevel(vSecurityItem: double): integer;
    function GetCurrentProduct: double;
    procedure CloseDataLinks;
    procedure ProductDelete;
    procedure ProductValidate(DataSet: TDataSet);
    function CheckIfOnhold: boolean;
    procedure UpdateBatchPrice;
    procedure LoadCustomReports;
    procedure RemoveNonEDLItemsFromDeamnders;
    function BoolToString(b:Boolean): String;
    procedure LoadProductEditHistory;
    procedure IsItemUsedInRegimen(vType: integer);


  public
(*---------------------------------------------------------------------------------------------------------------------------*)
    { Public declarations }
    FUsesBatchManagement : Boolean;
    procedure ProductFirst;
    procedure ProductLast;
    procedure ProductPageDown(MoveAmount: integer);
    procedure ProductPageUp(MoveAmount: integer);
    procedure ProductNext;
    procedure ProductPrior;
    procedure ProductSave;

    procedure SetLedgerFilters( pRequest : integer; pDateSt, pDateEnd :TDateTime);
    procedure SetConsumptionFilter(pRequest: integer; pDateSt, pDateEnd: TDateTime);
    procedure FilterProducts(const vFilter: integer);
    procedure RefreshProductTable;
    procedure AddStockVariance;
    procedure SetVarianceFilters(pRequest: integer; pDateSt, pDateEnd: TDateTime);
    procedure SetLeadtimeFilter(pRequest: integer; pDateSt, pDateEnd: TDateTime);
    procedure SortByColumn(dspGrid: TdxDBGrid);
    procedure UpdateLTandPP;
    procedure ProductPrintList;
    procedure ProductPrintDetail;
    procedure UpdateDataLinks;

    function ProductAdd:boolean;
    function DeleteProduct: boolean;
    function GetProcurementPeriod:Integer;
    function GetLeadTime:Integer;
    procedure ManageGenericList;
    procedure ManageAdministrationUnits;
    procedure ManageStrengthRange;
    procedure ManageFormRange;
    procedure ProductCancel;
    procedure ManageTradeName;
    procedure ManagePackSizeRange;
    procedure ValidateForDispensing;
    procedure ProductAddCopy;
    procedure Managecontracts;
    procedure ManageComparisonUnits;
    procedure CalculateNewProcedure;
    procedure UnLockProductforIssuing;


    property Editing : boolean read FEditing write FEditing;

    procedure AddHistory(vType: String; vDescription : string; vProductID: integer);
    procedure PrintStockStatusForRange(pDateSt, pDateEnd :TDateTime; pEDL: Boolean);
    procedure PrintProductListBarCodes;
    procedure ConfigureLabelReport(vReport: TppReport);
    procedure EditBarcodeLabel(i : integer);
    procedure PrintProductDetailBarcodes;
    procedure ShowProductEditHistory;
    function DoesBarCodeExist(barcode: string): Boolean;


  end;

var
  ProductDm: TProductDm;
(*---------------------------------------------------------------------------------------------------------------------------*)

implementation

uses

  {$IFDEF RXSTOREBUILD}
  SystemSecurityUDM,
  RxStoreMainUFrm,
  SystemSecurityConstantsU,
  {$ELSE}
  RxSolutionUFrm, {Was RxStoreMainUFrm,}
  RxSolutionSecurityClass, {Was  SystemSecurityConstantsU,}
  {$ENDIF}

  ProductUfrm,
  MainUDM,
  MyApplicationUtilities,
  ProductVarianceUFrm,
  ProductAddUFrm,
  DialogProgressIndicatorUFrm,
  Generic_,
  ProductGenericEditFrm,
  ProductAdministrationUnitEditUFrm,
  ProductStrengthEditFrm,
  ProductFormUnitEditFrm,
  ProductTradeNameEdtFrm,
  ProductPackSizeRangeEdit, ProductContractEdtFrm,
  ProductComparisonUnitsEditFrm, ComCtrls, ProductEditHistroyUfrm;

{$R *.DFM}


(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.DataModuleCreate(Sender: TObject); (*::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:DataModuleCreate-----------------*)
                                                                                (*===========================================*)
                                                                    (*5.7.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  FEditing      := False;
  ModuleLoaded  := False;
  IsLoading     := True;                                                        // Indicate to all who want to know, were still loading


  ConnectDataSource;                                                            // Open up all data connections
  FilterProducts(1);                                                            // set the correct query str for products here
  ModuleLoaded  := True;
  IsLoading     := False;

  UpdateDataLinks;                                                              // Open all the child tables after loading

  {$IFDEF RXSTOREBUILD}
  if Assigned(MainForm) then
    with MainForm do
      with SystemSecurityDM do
        begin
        FUserID     :=  UserID;
        FUserName   :=  UserLName + ', ' + UserFName;
        end;
  {$ELSE}
  with RxSolutionFrm.Security.User do
    begin
    FUserID     :=  UserNumID.Value;
    FUserName   :=  LastName.Value + ', ' + FirstName.Value;
    end;
  {$ENDIF}

  //Check if batchmanagement system  
  FUsesBatchManagement := MainDm.tblMainSystem.FieldByName('batchManagement_bol').AsBoolean;

  //******** Load Custom Reports
  LoadCustomReports;


end; (*................................................................*)(*end*)(*...........................................*)


function TProductDm.ConnectDataSource: Boolean; (*::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*function:ConnectDataSource-----------------*)
                                                                                (*===========================================*)
                                                                    (*5.7.2002*)(* Orig::Deane Putzier                       *)
                                                                    (*7.1.2003*)(* Edit::Deane Putzier                       *)
                                                                                // (A)Adjusted code to accept SQL server string
var (*.................................................................*)(*var*)(*...........................................*)
  i, j                  : integer;
  vbAllDataSetsOpened   : boolean;
  vdbConnections        : array[0..0] of TADOConnection;                        // Easier to add connections this way.
  vsDatabaseConnection  : string;

begin (*.............................................................*)(*begin*)(*...........................................*)

  vbAllDataSetsOpened   := True;                                                // If datasets could not be opened, set this to false
  vdbConnections[0]     := ADOProductConnection;

  if Assigned(MainDM) then                                                      // Ask for complete connection string,
    with MainDM do                                                              // as it may be Access or SQL Server.
      vsDatabaseConnection     := ADOMainDBConnection.ConnectionString;

  for i:= low(vdbConnections) to high(vdbConnections) do
    with vdbConnections[i] do

      try

      Connected         := False;                                               // Make sure it's not connected
      ConnectionString  := vsDatabaseConnection;
      for j := 0 to DataSetCount - 1 do
        if Datasets[j].Tag < 1 then
          if not DataSets[j].Active then
            begin
            DataSets[j].Active := True;                                         // Activate the datastores.
            end;

                                                                                // Connection is activated automatically.
      except

        on E: EDatabaseError do                                                 // Pick up any databse errors
          begin
          vbAllDataSetsOpened  := False;
          Connected           := False;                                         // Make sure it's not connected
          end;

      end;

  Result := vbAllDataSetsOpened;

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.UpdateDataLinks; (*::::::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:SetupDataLinks-------------------*)
                                                                                (*===========================================*)
                                                                   (*10.6.2002*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)
  i               :Integer;
  LinkedQryList    :array[1..9] of TADOStoredProc;                              // List of Stored procs to update
  CurrentProductID  :double;
begin (*.............................................................*)(*begin*)(*...........................................*)


  if (not IsLoading) and (FEditing) then

    begin

    LinkedQryList[1] := stpProductLedger;
    LinkedQryList[2] := stpProductVariance;
    LinkedQryList[3] := stpProductFYTDExpenditures;
    LinkedQryList[4] := stpProductMonthlyExpenditures;
    LinkedQryList[5] := stpProductContract;
    LinkedQryList[6] := stpProductVarianceTotals;
    LinkedQryList[7] := stpProductStoreTotals;
    LinkedQryList[8] := strdprc_ProductMonthly_Receipts;
    LinkedQryList[9] := strdprc_ProductMonthly_Issues;

    CurrentProductID := GetCurrentProduct;                                      // Get the current productID

    for i := Low(LinkedQryList) to high(LinkedQryList) do
      with LinkedQryList[i] do
        begin

        if State in [dsEdit, dsInsert] then Post;                               // Always check if the dataset is in edit mode

        try
        Close;
        Parameters.ParamByName('ProductID').Value := CurrentProductID;          // All stored procs have same param name
        Active := True;                                                         // Now activate
        except
          on E:Exception do
            raise Exception.Create(E.Message + SOn + LinkedQryList[i].Name + ']');
        end;//try..except

        end;

    with vw_ProductDispensingledger do
        try
        Close;
        Parameters.ParamByName('ProductID').Value := CurrentProductID;          // All stored procs have same param name
        Active := True;                                                         // Now activate
        except
        end;//try..except

    with qryProductBatch do
        try
        Close;
        Parameters.ParamByName('ProductID').Value := CurrentProductID;          // All stored procs have same param name
        Active := True;                                                         // Now activate
        except
        end;//try..except


    TlkProductPackSizeGroup1.Close;
    TlkProductPackSizeGroup2.Close;
    TlkProductPackSizeGroup1.Open;
    TlkProductPackSizeGroup2.Open;

    end;

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.CloseDataLinks; (*:::::::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:CloseDataLinks-------------------*)
                                                                                (*===========================================*)
                                                                    (*8.9.2002*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  i               :Integer;
  LinkedQryList    :array[1..11] of TADOStoredProc;                              // List of Stored procs to update

begin (*.............................................................*)(*begin*)(*...........................................*)

  LinkedQryList[1] := stpProductLedger;
  LinkedQryList[2] := stpProductVariance;
  LinkedQryList[3] := stpProductLeadTime;
  LinkedQryList[4] := stpProductConsumption;
  LinkedQryList[5] := stpProductFYTDExpenditures;
  LinkedQryList[6] := stpProductMonthlyExpenditures;
  LinkedQryList[7] := stpProductContract;
  LinkedQryList[8] := stpProductVarianceTotals;
  LinkedQryList[9] := stpProductStoreTotals;
  LinkedQryList[10] := strdprc_ProductMonthly_Receipts;
  LinkedQryList[11] := strdprc_ProductMonthly_Issues;

  for i := Low(LinkedQryList) to high(LinkedQryList) do
    with LinkedQryList[i] do
      Close;

  TlkProductPackSizeGroup1.Close;
  TlkProductPackSizeGroup2.Close;


end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.SetLedgerFilters(pRequest: integer; pDateSt, (*::::START:*)(*===========================================*)
  pDateEnd: TDateTime);                                                         (*procedure:SetLedgerFilters-----------------*)
                                                                                (*===========================================*)
                                                                    (*8.9.2002*)(* Orig::Deane Putzier                       *)

const                                                                  (*const*)(*...........................................*)
  FMTSTR01 = '((Date_dat >= #%s#) and (Date_dat <= #%s#))';
  FMTSTR02 = '(Type_str = ''%s'')  and ((Date_dat >= #%s#) and (Date_dat <= #%s#))';

begin (*.............................................................*)(*begin*)(*...........................................*)

  with stpProductLedger do
    if Active then
      begin
      case pRequest of
        0: Filter := Format(FMTSTR01, [DateToStr(pDateSt), DateToStr(pDateEnd + 1)]);
        1: Filter := Format(FMTSTR02, ['O', DateToStr(pDateSt), DateToStr(pDateEnd + 1)]);
        2: Filter := Format(FMTSTR02, ['I', DateToStr(pDateSt), DateToStr(pDateEnd + 1)]);
        3: Filter := Format(FMTSTR02, ['R', DateToStr(pDateSt), DateToStr(pDateEnd + 1)]);
        4: Filter := Format(FMTSTR02, ['V', DateToStr(pDateSt), DateToStr(pDateEnd + 1)]);
        5: Filter := Format(FMTSTR02, ['S', DateToStr(pDateSt), DateToStr(pDateEnd + 1)]); // Stock take startup
        6: Filter := Format(FMTSTR02, ['D', DateToStr(pDateSt), DateToStr(pDateEnd + 1)]); // Dis[esning
        end;
      Filtered := True;
      end;

end; (*................................................................*)(*end*)(*...........................................*)


function TProductDm.GetCurrentProduct:double; (*::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*function:GetCurrentProduct-----------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  with tblProductCatalog do
    Result := tblProductCatalog.FieldByName('ProductCode_ID').AsFloat;          // Returns current ID

end; (*................................................................*)(*end*)(*...........................................*)


procedure TProductDm.stpProductConsumptionCalcFields(DataSet: TDataSet); (*:::*)(*===========================================*)
                                                                                (*procedure:stpProductConsumptionCalcFields--*)
                                                                                (*===========================================*)
                                                                    (*1.5.2002*)(* Orig::JP Sallet                           *)
                                                                    (*8.1.2003*)(* Edit::Deane Putzier                       *)
                                                                                // (A) See if it is possible to calc another way
                                                                                // to allow for no persistant fields in the DB
begin (*.............................................................*)(*begin*)(*...........................................*)

  with DataSet do
    begin

    if BOF then                                                                 // First day = 1 not 0
      begin                                                                     // Set defaults for first run
      Reg_Start := (FieldByName('Date_dat').AsDateTime  - 1);                   // Following (4) are private class level vars
      Tot_Con   := 0;
      OS_Days   := 0;
      Day       := 0;
      end;

    Day := FieldByName('Date_dat').AsDateTime - ( Reg_Start + OS_Days );        // Days from the start
    Tot_Con := Tot_Con + FieldByName('DayQuantity_Int').AsInteger;              // Accumulative consumption

    FieldByName('AccumDay_Int').AsFloat := Day;                                 // Set calc fields
    FieldByName('AccumDayQuantity_int').AsFloat := Tot_Con;
    end;

end; (*................................................................*)(*end*)(*...........................................*)


procedure TProductDm.SetConsumptionFilter(pRequest: integer; pDateSt, (*START:*)(*===========================================*)
  pDateEnd: TDateTime);                                                         (*procedure:SetConsumptionFilter-------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  CurrentProductID  :double;
  vsTypeB           :String;

begin (*.............................................................*)(*begin*)(*...........................................*)

  with stpProductConsumption do
    begin
    CurrentProductID := GetCurrentProduct;                                      // Current product
    vsTypeB := 'I';                                                             // Default value

    case pRequest of                                                            // Get request type values
      0:  begin
          pDateSt   := Date - 2000;
          pDateEnd  := Date + 45;
          end;
      2:  begin
          vsTypeB := 'R';
          end;
      end;

    Close;                                                                      // Now prepare and return query
    Prepared := False;
    Parameters.ParamByName('@ProductID').Value := CurrentProductID;
    Parameters.ParamByName('@DateA').Value     := pDateSt;
    Parameters.ParamByName('@DateB').Value     := pDateEnd;
    Parameters.ParamByName('@TypeA').Value     := 'I';
    Parameters.ParamByName('@TypeB').Value     := vsTypeB;
    Prepared := True;
    Open;
    end;

end; (*................................................................*)(*end*)(*...........................................*)


procedure TProductDm.SetLeadtimeFilter(pRequest: integer; pDateSt, (*:::START:*)(*===========================================*)
  pDateEnd: TDateTime);                                                         (*procedure:SetLeadtimeFilter----------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  CurrentProductID  :double;

const                                                                  (*const*)(*...........................................*)

  FMTSTR01 = '((Date_dat >= #%s#) and (Date_dat <= #%s#))';

begin (*.............................................................*)(*begin*)(*...........................................*)

  with stpProductLeadTime do
    begin
    CurrentProductID := GetCurrentProduct;                                      // Current product

    case pRequest of
      0:  begin
          pDateSt   := Date - 2000;
          pDateEnd  := Date + 45;
          end;
      end;

    Close;
    Prepared := False;
    Parameters.ParamByName('@ProductID').Value := CurrentProductID;
    Parameters.ParamByName('@DateA').Value     := pDateSt;
    Parameters.ParamByName('@DateB').Value     := pDateEnd;
    Prepared := True;
    Open;
    end;

end; (*................................................................*)(*end*)(*...........................................*)


function TProductDm.GetProcurementPeriod: Integer; (*:::::::::::::::::::START:*)(*===========================================*)
                                                                                (*function:GetProcurementPeriod--------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  vPeriodStr  : String;

begin (*.............................................................*)(*begin*)(*...........................................*)

 Result := -1;
 with tblProductCatalog, MainDM do
  if Active then
    begin
    vPeriodStr  := FieldByName('ProcurementPeriod_str').AsString;
    Result      := CurrentProcurementPeriod(vPeriodStr);                        // Called from MainDM
    end;

end; (*................................................................*)(*end*)(*...........................................*)


function TProductDm.GetLeadTime: Integer; (*::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*function:GetLeadTime-----------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  vPeriodStr  : String;

begin (*.............................................................*)(*begin*)(*...........................................*)

 Result := -1;
 with tblProductCatalog, MainDM do
  if Active then
    begin
    vPeriodStr  := FieldByName('LeadTime_str').AsString;
    Result      := CurrentLeadTime(vPeriodStr);                                 // Called from MainDM
    end;

end; (*................................................................*)(*end*)(*...........................................*)


function TProductDm.GetAccessLevel(vSecurityItem: double): integer; (*::START:*)(*===========================================*)
                                                                                (*function:GetAccessLevel--------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
                                                                   (*6.25.2005*)(* Chng::Deane Putzier                       *)
                                                                                (*       Mainform, SystemSecurityDM have been*)
                                                                                (*      removed. Now need to adjust for new  *)
                                                                                (*      security.                            *)
begin (*.............................................................*)(*begin*)(*...........................................*)


  {$IFDEF RXSTOREBUILD}
  Result := USER_NONE;
  if Assigned(MainForm) then
    with MainForm, SystemSecurityDM do
      Result  := GetUserRights(SYSTEM_PRODUCTS, vSecurityItem);
  {$ELSE}
  Result := USER_NONE;
  Result := RxSolutionFrm.Security.GetUserAccessLevel(MODULE_CORE_PRODUCTS, vSecurityItem )
  {$ENDIF}

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.FilterProducts(const vFilter:integer); (*::::::::::START:*)(*===========================================*)
                                                                                (*procedure:FilterProducts-------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
const
  SQLSTRFLT = 'SELECT * FROM view_ProductCatalog %s ORDER BY Description_str';


 {SQLSTRFLT =  'SELECT TblProductPackSize.*, ' +
              'TblProductPackSize.QtyOnHand_int * TblProductPackSize.Cost_mon AS StockValue_mon, ' +
              'TblProductPackSize.QtyOnHand_int AS QtyAvailable_int, ' +
              'TblProductPackSize.QtyOnOrder_int AS QtyOrdered_int, ' +
              'TblProductPackSize.QtyOnRequest_int AS QtyRequest_int ' +
              'FROM TblProductPackSize %s ORDER BY TblProductPackSize.Description_str';   }
var
  LoadingStatus :boolean;

begin (*.............................................................*)(*begin*)(*...........................................*)

                                                                   (*22.5.2003*)(* Edit::Deane Putzier                       *)
                                                                                // (A)  Changed from using filter prop to qry's
  LoadingStatus := IsLoading;
  if not IsLoading then ProductSave; // needed to stop saving before tables are open
  IsLoading := True;
  with tblProductCatalog do
    begin
    Active := False;
    SQL.Clear;
    case vFilter of
      0: SQL.Add(Format(SQLSTRFLT,['']));
      1: SQL.Add(Format(SQLSTRFLT,['WHERE InstitutionEDL_bol = 1']));
      2: SQL.Add(Format(SQLSTRFLT,['WHERE ProvincialEDL_bol = 1']));
      3: SQL.Add(Format(SQLSTRFLT,['WHERE NationalEDL_bol = 1']));
      end;
    if ModuleLoaded then Active := True;
    end;
  IsLoading := LoadingStatus;
  if not IsLoading then UpdateDataLinks;                                        //IsLoading is checked at update proc


end; (*................................................................*)(*end*)(*...........................................*)


procedure TProductDm.RefreshProductTable; (*::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:RefreshProductTable--------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  vCurrentProductID :double;
  vCurrSortStr      :string;
  vBmk              :TBookMark;
  vOldCurs          :TCursor;

begin (*.............................................................*)(*begin*)(*...........................................*)

  IsLoading := True;
  vOldCurs := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  ProductSave;
  with tblProductCatalog do
    if Active then
      if not (State in [dsEdit, dsInsert]) then
        begin
        vCurrentProductID := GetCurrentProduct;                                 // Current product
        DisableControls;
          try
          Close;
          Open;
          Locate('ProductCode_ID', vCurrentProductID, []);
          finally
          EnableControls;
          end;
        end;
  IsLoading := False;
  FEditing := True;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc
  Screen.Cursor := vOldCurs;

end; (*................................................................*)(*end*)(*...........................................*)


procedure TProductDm.SetVarianceFilters(pRequest: integer; pDateSt, (*::START:*)(*===========================================*)
  pDateEnd: TDateTime);                                                         (*procedure:SetVarianceFilters---------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
const                                                                  (*const*)(*...........................................*)

  FMTSTR00 = '(Type_str = ''%s'')';

begin (*.............................................................*)(*begin*)(*...........................................*)

  with stpProductVariance do
//    if Active then
      begin
      case pRequest of
        0: Filter := '';
        1: Filter := Format(FMTSTR00, ['E']);
        2: Filter := Format(FMTSTR00, ['T']);
        3: Filter := Format(FMTSTR00, ['B']);
        4: Filter := Format(FMTSTR00, ['L']);
        5: Filter := Format(FMTSTR00, ['U']);
        6: Filter := Format(FMTSTR00, ['R']);   //SM extra option R-Returned to Supplier
        end;
      Filtered := True;
      end;

end; (*................................................................*)(*end*)(*...........................................*)


function TProductDm.CheckIfOnhold: boolean;
begin
//SM 09 April 2008
//This function returns true if the current item is sitting on hold in at least one requisition
//Used to check item before doing a variance
 with CheckItemIfUnposted do
  begin
  Close;
  ParamCheck:= True;
  Parameters.ParamByName('ProductCodeID').Value := tblProductCatalog.FieldByName('ProductCode_ID').AsInteger;
  Open;
  if RecordCount > 0 then
   Result := True
  else
   Result := False;
  Close; 
 end;

end;

procedure TProductDm.AddStockVariance; (*:::::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:AddStockVariance-----------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)
  vRecITemId  :integer; //SM
  vProductID  :double;
  vProdDet    :RProductDetails;
  vType       :String;
  vNewQty     :integer;
  vOldQty     :integer;
  vCost       :Currency;
  vExpiryDate :TDateTime;
  vDate       :TDateTime;
  vReason     :String;
  vAdjQty     :integer;
  vBatchQty   :integer;
  i           :integer;
  vBatchnumber : string;
  vItemID     : integer;

  vNONBatchExpDate:TDateTime;

  Attempts        :Integer;
  SubmitVariance  :Boolean;
  vAuditData                  : RProductAuditDetails;

  S :string;

  sql_str : string;
  item_id : integer;
const
  MaxAttempts = 500;

begin (*.............................................................*)(*begin*)(*...........................................*)
  vItemID := 0;
//Check if product onhold or not first before doing variance, if not on hold do not carry on.
 if CheckIfOnhold then
  Messagedlg(SYouCannotDoAVarianceRightN+#13+SPleaseMakeSureThatItemIsNo, mtInformation, [mbOk],0);

  ProductVarianceFrm := TProductVarianceFrm.Create(Application);
  try
    with ProductVarianceFrm do
      if ShowModal = mrOK then
        begin
        S := speAdjustedQty.Text;
        if S = '' then vAdjQty := 0 else vAdjQty := StrToInt(S);
        vProductID  := tblProductCatalog.FieldByName('ProductCode_ID').AsFloat;
        vProdDet    := MainDM.GetProductData(vProductID);
        vType       := Copy(cmbAdjustmentType.Text,1,1);
        vOldQty     := tblProductCatalog.FieldByName('CalcQtyOnHand_int').AsInteger;
        vNewQty     := tblProductCatalog.FieldByName('CalcQtyOnHand_int').AsInteger + vAdjQty;
        if qryProductBatch.RecordCount > 0 then
         vCost       := qryProductBatch.FieldByName('Price_mon').AsCurrency
        else
         vCost       := tblProductCatalog.FieldByName('Cost_mon').AsCurrency;
        //vExpiryDate := dtpExpiryDate.DateTime;
        vDate       := dtpAdjustmentDate.DateTime;
        vReason     := edtReason.Text;
        vBatchnumber:= qryProductBatch.FieldByName('BatchNumber_str').AsString;
        vExpiryDate := qryProductBatch.FieldByName('Expiry_dat').AsDateTime;

        if not FUsesBatchManagement then
         vNONBatchExpDate := dtpExpiryDate.DateTime;

        if vNewQty < 0 then
          begin
          vAdjQty := vAdjQty - ( 0 - vNewQty);
          vNewQty := 0;
          end;

        i := vAdjQty;
        end;

  finally
    ProductVarianceFrm.Free;                                                    // Finished with user interface
  end;
  if vAdjQty <> 0 then                                                          // Add the record to the variance table
    begin

    SubmitVariance := False;
    with ProductDm.qryProductBatch do                                                   // Update the productpacksize table
      try
      if not (State in [dsEdit, dsInsert]) then
       Edit;
      FieldByName('QtyOnHand_int').AsInteger := FieldByName('QtyOnHand_int').AsInteger + vAdjQty;                        // Only get here if in edit or insert mode
      if FieldByName('QtyOnHand_int').AsInteger = 0 then
       ProductDm.qryProductBatch.Delete;
      if (State in [dsEdit, dsInsert]) then
       Post;
      SubmitVariance := True;
      finally
      end;


    if SubmitVariance then
      begin
     //BUG Issue After Test 461
    //Refresh Batch table and get the latest data 04 Nov 2008 SM
    ProductDm.qryProductBatch.Close;
    ProductDm.qryProductBatch.Parameters.ParamByName('ProductID').Value := ProductDm.tblProductCatalog.fieldByName('ProductCode_ID').Value;
    ProductDm.qryProductBatch.Open;
    //Refresh end;


      with tblVariances do
       begin
       Close;
       Open;
       Append;
       FieldByName('ProductCode_ID').Value      := vProductID;
       FieldByName('Type_str').Value            := vType;
       FieldByName('OldQty_int').Value          := vOldQty;//vProdDet.QtyOnHand; //SM Check the value on this one. Not sure what value it will return
       FieldByName('NewQty_int').Value          := vNewQty;
       FieldByName('PackCost_mon').Value        := vCost;
       //SM
       if FUsesBatchManagement then
        FieldByName('ExpiryDate_dat').Value     := vExpiryDate
       else
        FieldByName('ExpiryDate_dat').Value     := vNONBatchExpDate;
       FieldByName('BatchNumber_str').Value     := vBatchnumber;
       FieldByName('Date_dat').Value            := vDate;
       FieldByName('Reason_str').Value          := vReason;
       FieldByName('UserName_str').Value        := FUserName;
       FieldByName('LastUpdatedBy_int').Value   := FUserID;
       FieldByName('LastUpDated_dat').Value     := Now();
       Post;   //Bug Issue 442
       vItemID := FieldByName('ProductVariance_ID').AsInteger;
       Close;
       end;


      vAuditData.Quantity_int     := vNewQty - vOldQty;
      vAuditData.ProductCode_ID   := vProductID;
      vAuditData.Item_ID          := vItemID; // should be id of variance
      vAuditData.Value_mon        := vCost * vAuditData.Quantity_int;

      vAuditData.SystemStore_ID   := MainDm.tblMainSystem.FieldByName('SystemStore_ID').AsInteger; //SM  13/08/2007
      vAuditData.Demander_ID      := 0;
      vAuditData.Supplier_ID      := 0;
      vAuditData.Type_str         := 'V';
      vAuditData.Reference_str    := FloatToStr(vProductID) + '_' + DateToStr(Date);
      vAuditData.DemanderSupplier_str := 'V';

      vAuditData.ProductCode_str  := tblProductCatalog.FieldByName('ProductCode_Str').AsString;;
      vAuditData.VoucherNo_str    := 'Variance Order (' + vType + ')';
      vAuditData.Date_dat         := Now;
      vAuditData.QuantityOnHand_int := vNewQty;
      vAuditData.User_str         := FUserName;
      vAuditData.NSN_Str          := vProdDet.NSN;
      vAuditData.ECN_str          := vProdDet.ECN;
      vAuditData.ICN_str          := vProdDet.ICN;
      vAuditData.BatchNumber_str  := vBatchNumber;
      //SM
      if FUsesBatchManagement then
       vAuditData.ExpiryDate_dat   := vExpiryDate
      else
       vAuditData.ExpiryDate_dat   := vNONBatchExpDate;
       
      MainDM.WriteAuditData(vAuditData);
      end;


    RefreshProductTable;

    stpProductVariance.Close;                                                   // Update the variance display table
    stpProductVariance.Open;
    stpProductLedger.Close;
    stpProductLedger.Open;
    stpProductStoreTotals.Close;
    stpProductStoreTotals.Open;
    end;
end; (*................................................................*)(*end*)(*...........................................*)


procedure TProductDm.tblProductCatalogBeforePost(DataSet: TDataSet); (*:START:*)(*===========================================*)
var
 vCheckRegimen: boolean;
 vChangeType: integer;
begin (*.............................................................*)(*begin*)(*...........................................*)

    UpdateBatchPrice;
    ProductValidate(Dataset);
    vChangeType := 0;

    vCheckRegimen := False;

    with tblProductCatalog do
     begin
     //*********** Price change log
     if (not VarIsNULL(FieldByName('Cost_mon').OldValue)) then
      if (FieldByName('Cost_mon').OldValue <> FieldByName('Cost_mon').NewValue) then
       AddHistory(HST_PRC, FloatToStr(FieldByName('Cost_mon').OldValue) + ' to ' + FloatToStr(FieldByName('Cost_mon').NewValue), FieldByName('ProductCode_ID').AsInteger);
     //*********** Product description change log
     if (not VarIsNULL(FieldByName('Description_str').OldValue)) then
      if (FieldByName('Description_str').OldValue <> FieldByName('Description_str').NewValue) then
       begin
       vCheckRegimen    := True;
       vChangeType      := 1;
       AddHistory(HST_EDT, FieldByName('Description_str').OldValue +' to '+FieldByName('Description_str').NewValue, FieldByName('ProductCode_ID').AsInteger);
       end;
     //*********** Contract Change log
     if (not VarIsNULL(FieldByName('ContractCode_str').OldValue)) then
      if (FieldByName('ContractCode_str').OldValue <> FieldByName('ContractCode_str').NewValue) then
       AddHistory(HST_CNT, FieldByName('ContractCode_str').OldValue +' to '+FieldByName('ContractCode_str').NewValue, FieldByName('ProductCode_ID').AsInteger);
     //*********** Bin Location Change log
     if (not VarIsNULL(FieldByName('Bin_str').OldValue)) then
      if (FieldByName('Bin_str').OldValue <> FieldByName('Bin_str').NewValue) then
       AddHistory(HST_BIN, FieldByName('Bin_str').OldValue +' to '+FieldByName('Bin_str').NewValue, FieldByName('ProductCode_ID').AsInteger);
     //*********** ECN Change log
     if (not VarIsNULL(FieldByName('ECN_str').OldValue)) then
      if (FieldByName('ECN_str').OldValue <> FieldByName('ECN_str').NewValue) then
       AddHistory(HST_ECN, FieldByName('ECN_str').OldValue +' to '+FieldByName('ECN_str').NewValue, FieldByName('ProductCode_ID').AsInteger);
     //*********** ICN Change log
     if (not VarIsNULL(FieldByName('ICN_str').OldValue)) then
      if (FieldByName('ICN_str').OldValue <> FieldByName('ICN_str').NewValue) then
       AddHistory(HST_ICN, FieldByName('ICN_str').OldValue +' to '+FieldByName('ICN_str').NewValue, FieldByName('ProductCode_ID').AsInteger);
     //*********** NSN Change log
     if (not VarIsNULL(FieldByName('NSN_str').OldValue)) then
      if (FieldByName('NSN_str').OldValue <> FieldByName('NSN_str').NewValue) then
       AddHistory(HST_NSN, FieldByName('NSN_str').OldValue +' to '+FieldByName('NSN_str').NewValue, FieldByName('ProductCode_ID').AsInteger);

    //*********** ORDER TYPE Change log
     if (not VarIsNULL(FieldByName('OrderType_str').OldValue)) then
      if (FieldByName('OrderType_str').OldValue <> FieldByName('OrderType_str').NewValue) then
       AddHistory(HST_ORD, FieldByName('OrderType_str').OldValue +' to '+FieldByName('OrderType_str').NewValue, FieldByName('ProductCode_ID').AsInteger);

    //*********** shipping Change log
     if (not VarIsNULL(FieldByName('ShippingPack_int').OldValue)) then
      if (FieldByName('ShippingPack_int').OldValue <> FieldByName('ShippingPack_int').NewValue) then
       AddHistory(HST_SHP, IntToStr(FieldByName('ShippingPack_int').OldValue) +' to '+ IntToStr(FieldByName('ShippingPack_int').NewValue), FieldByName('ProductCode_ID').AsInteger);

     //*********** GROUP 1 Change log
     if (not VarIsNULL(FieldByName('Group1_str').OldValue)) then
      if (FieldByName('Group1_str').OldValue <> FieldByName('Group1_str').NewValue) then
       AddHistory(HST_GR1, FieldByName('Group1_str').OldValue +' to '+FieldByName('Group1_str').NewValue, FieldByName('ProductCode_ID').AsInteger);

     //*********** GROUP 2 Change log
     if (not VarIsNULL(FieldByName('Group2_str').OldValue)) then
      if (FieldByName('Group2_str').OldValue <> FieldByName('Group2_str').NewValue) then
       AddHistory(HST_GR2, FieldByName('Group2_str').OldValue +' to '+FieldByName('Group2_str').NewValue, FieldByName('ProductCode_ID').AsInteger);  

     //********** Institutional Change Log
     if (not VarIsNULL(FieldByName('InstitutionEDL_bol').OldValue)) then
      if (FieldByName('InstitutionEDL_bol').OldValue <> FieldByName('InstitutionEDL_bol').NewValue) then
       begin
       vCheckRegimen    := True;
       vChangeType      := 2;
       AddHistory(HST_EDL, BoolToString(FieldByName('InstitutionEDL_bol').OldValue) +' to '+ BoolToString(FieldByName('InstitutionEDL_bol').NewValue), FieldByName('ProductCode_ID').AsInteger);
       //******** If Value has been set to False then remove from demander Items
       if (not FieldByName('InstitutionEDL_bol').AsBoolean) then
        begin RemoveNonEDLItemsFromDeamnders end;
       end;

     end;

     if vCheckRegimen then
      IsItemUsedInRegimen(vChangeType);

end; (*................................................................*)(*end*)(*...........................................*)


function TProductDm.ProductAdd:boolean; (*::::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*function:ProductAdd------------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  vAddProduct   : TProductAddFrm;
  vCurrProd     : TBookmark;

begin (*.............................................................*)(*begin*)(*...........................................*)

  Result := False;
  vAddProduct := TProductAddFrm.Create(Self);

  tblProductCatalog.Insert;

  with vAddProduct do
    try
    if ShowModal = mrOK then
      begin
      ProductSave;
      AddHistory(HST_ADD, tblProductCatalog.FieldByName('Description_str').Asstring, tblProductCatalog.FieldByName('ProductCode_ID').Asinteger);
      IsLoading := True;
      try
      vCurrProd := tblProductCatalog.GetBookmark;
      tblProductCatalog.Close;
      tblProductCatalog.Open;
      if tblProductCatalog.BookmarkValid(vCurrProd) then
        tblProductCatalog.GotoBookmark(vCurrProd);
      except
      end;

      IsLoading := False;
      UpdateDataLinks;
      Result := True;
      end else
      begin
      ProductCancel;
      end;

    finally
    Free;
    end;

end; (*................................................................*)(*end*)(*...........................................*)

procedure TProductDm.ProductAddCopy;
begin (*.............................................................*)(*begin*)(*...........................................*)

              
end; (*................................................................*)(*end*)(*...........................................*)



procedure TProductDm.tblProductCatalogNewRecord(DataSet: TDataSet); (*::START:*)(*===========================================*)
                                                                                (*procedure:tblProductCatalogNewRecord-------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  with DataSet do
    begin
    FieldByName('InstitutionEDL_bol').AsBoolean := True;
    FieldByName('GenericCode_str').AsString     := '';
    FieldByName('PackSizeCode_str').AsString    := '0';
    FieldByName('PackSize_str').AsString        := '1';
    FieldByName('StrengthCode_str').AsString    := '0';
    FieldByName('FormCode_str').AsString    := '';

    end;

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.tblProductCatalogFilterRecord(DataSet: TDataSet; (*START:*)(*===========================================*)
  var Accept: Boolean);                                                         (*procedure:tblProductCatalogFilterRecord----*)
                                                                                (*===========================================*)
                                                                  (*28.10.2002*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)
  vCurProduct  :double;

begin (*.............................................................*)(*begin*)(*...........................................*)

  with Dataset do
    begin
    vCurProduct := FieldByName('ProductCode_ID').AsFloat;
    Accept  := GetAccessLevel(vCurProduct) > USER_NONE;
    end;

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

function TProductDm.DeleteProduct:boolean; (*:::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*function:DeleteProduct---------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)

  vCanDelete    :boolean;
  vDescription  :string;
  vCodes        :string;
  CurrentProductID  :double;

begin (*.............................................................*)(*begin*)(*...........................................*)

  {TODO: Maybe check against contracts}

  vCanDelete  := True;                                                          // assume that you can, then check against tables

  with tblProductCatalog do
    begin
    CurrentProductID  :=  FieldByName('ProductCode_ID').AsFloat;
    vDescription      :=  FieldByName('Description_str').AsString;
    vCodes            :=  'Product CODE-[' +
                          FieldByName('ProductCode_str').AsString + '] ' +
                          'NSN-[' + FieldByName('NSN_str').AsString + '] ' +
                          'ECN-[' + FieldByName('ECN_str').AsString + '] ' +
                          'ICN-[' + FieldByName('ICN_str').AsString + ']';
    end;

  with stpProductLedger do                                                      // first check if this can be deleted by checking audit table
    begin
    Close;
    Prepared := False;
    Parameters.ParamByName('ProductID').Value := CurrentProductID;              // All stored procs have same param name
    Prepared := True;                                                           // Need to prepare for the qry to return result set
    Open;
    if RecordCount > 0 then vCanDelete := False;
    end;

  if vCanDelete then
    begin
    if  MessageDlg(SDELETEPRODUCT + #13 + vCodes + #13 + vDescription,
        mtWarning, [mbYes, mbNo],0)= mrYes then
        begin
        ProductDelete;
        AddHistory(HST_DEL, vDescription, Floor(CurrentProductID));
        tblProductCatalog.Close; tblProductCatalog.Open;
        end;
    end else
    MessageDlg(SCannotDeleteProduct + #13 + vCodes + #13 + vDescription ,
      mtError	, [mbOK],0);



end; (*................................................................*)(*end*)(*...........................................*)

procedure TProductDm.ManageGenericList;
begin
  TGenericAddEdit.Manage;
end;

procedure TProductDm.ManageAdministrationUnits;
begin
  TAdministrationUnitManage.Manage;
end;

procedure TProductDm.ManageStrengthRange;
begin
  TStrengthRangeManage.Manage;
end;

procedure TProductDm.ManageFormRange;
begin
  TFormRangeEdit.Manage;
end;

procedure TProductDm.ManageTradeName;
begin
  TTradeNameAddEdit.Manage;
end;

procedure TProductDm.ManagePackSizeRange;
begin
  TPackSizeRangeEdit.Manage;
end;

procedure TProductDm.ManageContracts;
begin
 TContractsEdit.Manage;
end;
   
procedure TProductDm.ManageComparisonUnits;
begin
TComparisonUnitsEdit.Manage; 
end;
(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.tblProductCatalogAfterScroll(DataSet: TDataSet); (*START:*)(*===========================================*)
                                                                                (*procedure:tblProductCatalogAfterScroll-----*)
                                                                                (*===========================================*)
                                                                    (*5.7.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  UpdateDataLinks;                                                              //IsLoading is checked at update proc

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.ProductLast; (*::::::::::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:ProductLast----------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  ProductSave;
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      Last;
  IsLoading := False;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc


end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.ProductFirst; (*:::::::::::::::::::::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:ProductFirst---------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  ProductSave;
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      First;
  IsLoading := False;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.ProductPageUp(MoveAmount:integer); (*::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:ProductPageUp--------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  ProductSave;
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      MoveBy(-MoveAmount);
  IsLoading := False;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc

end; (*................................................................*)(*end*)(*...........................................*)

(*---------------------------------------------------------------------------------------------------------------------------*)

procedure TProductDm.ProductPageDown(MoveAmount:integer); (*::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:ProductPageDown------------------*)
                                                                                (*===========================================*)
                                                                    (*8.1.2003*)(* Orig::Deane Putzier                       *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  ProductSave;
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      MoveBy(MoveAmount);
  IsLoading := False;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc

end; (*................................................................*)(*end*)(*...........................................*)


procedure TProductDm.SortByColumn(dspGrid: TdxDBGrid); (*:::::::::::::::::START:*)(*===========================================*)
                                                                                (*procedure:SortByColumn---------------------*)
                                                                                (*===========================================*)
                                                                    (*9.1.2003*)(* Orig::Deane Putzier                       *)
                                                                                (*  This is necessary to allow correct movement
                                                                                    navigation buttons *)
begin (*.............................................................*)(*begin*)(*...........................................*)

  IsLoading := True;                                                            // Prevent child tables from cascading
  DBdxSortDataSet(dspGrid);
  IsLoading := False;
  UpdateDataLinks;                                                              // IsLoading is checked at update proc

end; (*................................................................*)(*end*)(*...........................................*)

procedure TProductDm.ProductNext;
begin
  ProductSave;
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      if not EOF then
        Next;
  IsLoading := False;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc

end;

procedure TProductDm.ProductPrior;
begin
  ProductSave;
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      if not BOF then
        Prior;
  IsLoading := False;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc

end;

procedure TProductDm.ProductSave;
begin
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      begin
      if State in [dsEdit, dsInsert] then Post;
      try
      UpDateBatch(arAll);
      except
      end;
      end;
  IsLoading := False;
end;

procedure TProductDm.tblProductCatalogAfterPost(DataSet: TDataSet);
begin
  IsLoading := False;

  
end;

procedure TProductDm.UpdateLTandPP;
begin

  with tblProductCatalog do
    begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    FieldByName('ProcurementPeriod_int').AsInteger  := GetProcurementPeriod;
    FieldByName('LeadTime_int').AsInteger  := GetLeadTime;
    end;

end;

procedure TProductDm.ProductCancel;
begin
  IsLoading := True;
  with tblProductCatalog do
    if Active then
      if State in [dsEdit, dsInsert] then
        begin
        Cancel;
        CancelBatch(arAll);
        end;
  IsLoading := False;
//  UpdateDataLinks;                                                              //IsLoading is checked at update proc
end;


procedure TProductDm.ProductDelete;
begin
  IsLoading := True;
{
  with tblProductCatalog do
    if Active then
      begin
      Delete;
      UpDateBatch(arAll);
      end;
      }


  with stpDeleteProduct do
   begin
   Parameters.ParamByName('ProductCode_ID').Value := tblProductCatalog.FieldByName('ProductCode_ID').Value;
   ExecSQL;
   end;

  IsLoading := False;
  UpdateDataLinks;                                                              //IsLoading is checked at update proc

end;

procedure TProductDm.ProductPrintList;
var
  vCurrProd     : TBookmark;

begin
                             {  // SM 24 Jan 2013
                                // Data source has been updated
  IsLoading := True;
  with tblProductCatalog do
    try
    DisableControls;
    vCurrProd := tblProductCatalog.GetBookmark;
    ppProductList.Print;
    if tblProductCatalog.BookmarkValid(vCurrProd) then
      tblProductCatalog.GotoBookmark(vCurrProd);
    finally
    EnableControls;
    end;
  IsLoading := False;       }

  with qryProductCatalogBatches do
   begin
   Close;
   Open;
   //*********** SM - 24 Jan 2013
   //*********** Do not show Batch Details if not in Batch Management Mode
   if (not FUsesBatchManagement) then
    ppProductList.Detail.Visible := False;
   ppProductList.Print;
   Close;
   end;

end;




procedure TProductDm.ProductPrintDetail;
begin
  IsLoading := True;
  with tblProductCatalog do
    try
    ppProductdetail.Print;
    except
    end;
  IsLoading := False;
end;

procedure TProductDm.ppProductPrintPreviewFormCreate(Sender: TObject);
begin

  with (Sender as TppReport).PreviewForm do
    WindowState         := wsMaximized;

end;



procedure TProductDm.tblProductCatalogBeforeClose(DataSet: TDataSet);
begin 
(DataSet as TADOQuery).UpdateBatch(arAll);

end;

procedure TProductDm.qryADOGenericNameNewRecord(DataSet: TDataSet);
begin

  with Dataset do
    begin
    FieldByName('genericName_ID').AsString  := CreateClassID;
    FieldByName('genericNameCode_str').AsString  := '';
    FieldByName('genericName_Str').AsString  := '';
    FieldByName('genericNameSupplement_Str').AsString  := '';
    FieldByName('genericRxLevel_str').AsString  := '';
    FieldByName('genericActive_Bol').AsBoolean  := True;
    FieldByName('Supplement_str').AsString  := '';
    FieldByName('Description_str').AsString  := '';
    FieldByName('Code_str').AsString  := '';
    end;

end;

procedure TProductDm.qryADOStrengthRangeNewRecord(DataSet: TDataSet);


begin

  with Dataset do
    begin
    FieldByName('StrengthRangeValue_dbl').AsFloat  := 1;
    FieldByName('StrengthRangeDispensingValue_dbl').AsFloat  := 1;
    FieldByName('Description_str').AsString  := '';
    FieldByName('StrengthRangeCode_str').AsString  := '';
    FieldByName('StrengthRangeUnit_str').AsString  := '';
    FieldByName('Original_str').AsString  := '';
   end;

end;

procedure TProductDm.qryADOAdministrationUnitsNewRecord(DataSet: TDataSet);
begin

  with Dataset do
    begin
    FieldByName('AdminUnit_Qty').AsFloat  := 0;
    FieldByName('AdminUnit_Unit').AsString  := '';
    FieldByName('AdminUnit_Type').AsString  := '';
    end;

end;

procedure TProductDm.qryADOStrengthRangeBeforePost(DataSet: TDataSet);
begin
  with DataSet do
    begin
    if FieldByName('StrengthRange_ID').AsFloat < 1000 then
      FieldByName('StrengthRangeCode_str').AsString  := '0' +
      FieldByName('StrengthRange_ID').AsString
      else
      FieldByName('StrengthRangeCode_str').AsString  :=
      FieldByName('StrengthRange_ID').AsString;
    end;

end;

procedure TProductDm.ProductValidate(DataSet: TDataSet);
var (*.................................................................*)(*var*)(*...........................................*)
  vAdminUnitVal: Double;
  vDispensedUnit: string;
  vDispensingForm: string;
  PackDescription: string;
  vRxLevel: string;
  vPackSizeUnit: string;
  vPackSizeVal: Double;
  vStrengthUnit: string;
  vDispensingVal: Double;
  vStrengthVal: Double;
  _isAvailableForDispensing : boolean;

  vGenericCode,vFormCode :Variant;
  vGenericName,vFormName, vStrengthCode, vPackSizeCode,
  vStrengthName, vPackSizeName,vStrength_str, vForm_str, vPackSize_str, vPackSizeUnit_str,
  vRoute_str, vSupplement_str,vAdministration:string;
  vSupplement_bol, vExcludeGenericNameInDescription_bol :boolean;
  vDispensingCoEffVal: Double;


begin (*.............................................................*)(*begin*)(*...........................................*)

  IsLoading := True;
  with DataSet do
    try

    // Reset these values to remove any residual lookups
    FieldByName('StrengthValue_dbl').AsFloat := 0;
    FieldByName('PackSizeValue_dbl').AsFloat := 0;
    FieldByName('DispensingValue_dbl').AsFloat := 0;
    FieldByName('dispensedValue_dbl').AsFloat := 0;
    FieldByName('StrengthRangePackCoefficient_dbl').AsFloat := 0;

    FieldByName('ProcurementPeriod_int').AsInteger  := GetProcurementPeriod;
    FieldByName('LeadTime_int').AsInteger  := GetLeadTime;

    FieldByName('LastUpdate_dat').AsDateTime  := Now;
    FieldByName('LastUpdateBy_str').AsString  := FUserName;
//    FieldByName('LastUpdateBy_dbl').AsFloat   := FUserID;

    //Description_str
    vGenericName := Trim(FieldByName('GenericName_str').AsString);
    vStrength_str := trim(FieldByName('Strength_str').AsString);
    vForm_str := Trim(FieldByName('Form_str').AsString);
    vPackSize_str := Trim(FieldByName('PackSize_str').AsString);
    vPackSizeUnit_str := Trim(FieldByName('PackSizeUnit_str').AsString);

    vRoute_str := Trim(FieldByName('Route_str').AsString);
    if vRoute_str <> '' then vRoute_str := ' [' + vRoute_str + ']';


    vSupplement_bol := FieldByName('Supplement_bol').AsBoolean;
    vExcludeGenericNameInDescription_bol := FieldByName('UseGenericNameInDescription_bol').AsBoolean;

    //Codes
    vGenericName  := FieldByName('GenericName_str').AsString;                   // get data values first
    vFormName     := FieldByName('Form_str').AsString;
    vStrengthName := FieldByName('Strength_str').AsString;
    vPackSizeName := FieldByName('PackSize_str').AsString;
    vDispensedUnit:= FieldByName('dispensedUnit_str').AsString;

    if vSupplement_bol then
    begin
        if not vExcludeGenericNameInDescription_bol then
        Begin
        vSupplement_str := '(' + FieldByName('Supplement_str').AsString + ') ';
        PackDescription := vGenericName +' '+ vStrength_str + ' (' + vFormName + ') [' +  vPackSize_str + ' '+vPackSizeUnit_str + ']';
        FieldByName('packDescription_Str').AsString := PackDescription;
        End
        else
        Begin
        vSupplement_str := FieldByName('Supplement_str').AsString + ' ';
        PackDescription := vSupplement_str + vStrength_str + ' (' + vFormName + ') [' +  vPackSize_str + ' '+vPackSizeUnit_str + ']';
        FieldByName('packDescription_Str').AsString := PackDescription;
        End;
     end else
       Begin
       vSupplement_str := '';
       PackDescription := vGenericName +' '+ vStrength_str + ' (' + vFormName + ') [' +  vPackSize_str + ' '+vPackSizeUnit_str + ']';
       FieldByName('packDescription_Str').AsString := PackDescription;
       End;



    if not vExcludeGenericNameInDescription_bol then
       Begin
       vGenericName := FieldByName('GenericName_str').AsString + ' ';
       End
       else
       Begin
       vGenericName := '';
       End;

       FieldByName('Description_str').AsString   :=
       vGenericName + vSupplement_str + vStrength_str + ' ' +
       vForm_str + '; ' + vPackSize_str + ' ' + vPackSizeUnit_str + vRoute_str;
       FieldByName('StrengthExtraDescription_str').AsString   :=
       vGenericName + vSupplement_str + vStrength_str + ' ' +
       vForm_str +  vRoute_str;  //SM Formulation Change

    //lookup from tables
    vFormCode       := VarToStrDef(qryADOFormRange.Lookup('Description_str', vFormName, 'Code_Str'), '');
    vDispensingForm := VarToStrDef(qryADOFormRange.Lookup('Description_str', vFormName, 'dispensingForm_str'), '');
    vGenericCode    := VarToStrDef(qryADOGenericName.Lookup('genericName_str', vGenericName, 'genericNameCode_str'), '');
    vStrengthCode   := VarToStrDef(qryADOStrengthRange.Lookup('Description_str', vStrengthName, 'StrengthRangeCode_str'), '');
    vPackSizeCode   := VarToStrDef(qryADOPackSizeRange.Lookup('Description_str', vPackSizeName, 'Code_Str'), '');
    vPackSizeUnit   := VarToStrDef(qryADOPackSizeRange.Lookup('Description_str', vPackSizeName, 'PackSizeUnit_str'), '');
    vAdministration := VarToStrDef(qryADOFormRange.Lookup('Description_str', vFormName, 'Administration_str'), '');

    if (vPackSizeUnit = '-') or (vPackSizeUnit = '') then
        vPackSizeUnit := FieldByName('PackSizeUnit_str').AsString;

     vRxLevel      := FieldByName('InstLevelOfUse_str').AsString;

    // Dispensing Values
    vStrengthUnit := VarToStrDef(qryADOStrengthRange.Lookup('Description_str', vStrengthName, 'StrengthRangeUnit_str'), '');
    try
    vStrengthVal  := VarAsType(qryADOStrengthRange.Lookup('Description_str', vStrengthName, 'StrengthRangeValue_dbl'), varDouble);
    except
      on E:EVariantError do vStrengthVal := 1;
    end;
    try
    vDispensingVal:= VarAsType(qryADOStrengthRange.Lookup('Description_str', vStrengthName, 'StrengthRangeDispensingValue_dbl'), varDouble);
    except
      on E:EVariantError do vDispensingVal := 1;
    end;

    try
    vDispensingCoEffVal:= VarAsType(qryADOStrengthRange.Lookup('Description_str', vStrengthName, 'StrengthRangePackCoefficient_dbl'), varDouble);
    except
      on E:EVariantError do vDispensingVal := 1;
    end;                    


    try
    vPackSizeVal:= VarAsType(qryADOPackSizeRange.Lookup('Description_str', vPackSizeName, 'PackSizeValue_dbl'), varDouble);
    except
      on E:EVariantError do vPackSizeVal := 1;
    end;
    try
    vAdminUnitVal:= VarAsType(qryADOAdministrationUnits.Lookup('AdminUnit_Unit', vDispensedUnit, 'AdminUnit_Qty'), varDouble);
    except
      on E:EVariantError do vAdminUnitVal := 1;
    end;


    FieldByName('ProductCode_str').AsString     := vFormCode + vGenericCode + vStrengthCode + vPackSizeCode;
    FieldByName('ProductCode7_str').AsString    := vFormCode + vGenericCode + vStrengthCode;
    FieldByName('GenericCode_str').AsString     := vGenericCode;
    FieldByName('FormCode_str').AsString        := vFormCode;
    FieldByName('StrengthCode_str').AsString    := vStrengthCode;
    FieldByName('PackSizeCode_str').AsString    := vPackSizeCode;
    FieldByName('StrengthValue_dbl').AsFloat    := vStrengthVal;
    FieldByName('StrengthUnit_Str').AsString    := vStrengthUnit;
    FieldByName('DispensingValue_dbl').AsFloat  := vDispensingVal;
    FieldByName('DispensingUnit_str').AsString  := vPackSizeUnit;
    FieldByName('Administration_str').AsString  := vAdministration;
    FieldByName('rxLevel_str').AsString         := vRxLevel;
    FieldByName('PackSizeValue_dbl').AsFloat    := vPackSizeVal;
    FieldByName('dispensingForm_str').AsString  := vDispensingForm;
    FieldByName('dispensedValue_dbl').AsFloat   := vAdminUnitVal;
    FieldByName('StrengthRangePackCoefficient_dbl').AsFloat   := vDispensingCoEffVal;

    //check dispensing values.

    _isAvailableForDispensing := True;
    if FieldByName('StrengthValue_dbl').IsNull then _isAvailableForDispensing := False;
    if FieldByName('PackSizeValue_dbl').IsNull then _isAvailableForDispensing := False;
    if FieldByName('StrengthUnit_Str').IsNull then _isAvailableForDispensing := False;
    if FieldByName('DispensingUnit_str').IsNull then _isAvailableForDispensing := False;
    if FieldByName('DispensingValue_dbl').IsNull then _isAvailableForDispensing := False;
    if FieldByName('StrengthRangePackCoefficient_dbl').IsNull then _isAvailableForDispensing := False;
    if FieldByName('dispensedValue_dbl').IsNull then _isAvailableForDispensing := False;
    if FieldByName('dispensingForm_str').IsNull then _isAvailableForDispensing := False;
    if FieldByName('Administration_str').IsNull then _isAvailableForDispensing := False;
    //BUG/task 346
    if FieldByName('Route_str').IsNull then _isAvailableForDispensing := False;
    if FieldByName('dispensedUnit_str').IsNull then _isAvailableForDispensing := False;

    if FieldByName('StrengthValue_dbl').AsFloat = 0 then _isAvailableForDispensing := False;
    if FieldByName('PackSizeValue_dbl').AsFloat = 0 then _isAvailableForDispensing := False;
    if FieldByName('DispensingValue_dbl').AsFloat = 0 then _isAvailableForDispensing := False;
    if FieldByName('dispensedValue_dbl').AsFloat = 0 then _isAvailableForDispensing := False;
    if FieldByName('StrengthRangePackCoefficient_dbl').AsFloat = 0 then _isAvailableForDispensing := False;  
    if Trim(FieldByName('StrengthUnit_Str').AsString) = '' then _isAvailableForDispensing := False;
    if Trim(FieldByName('DispensingUnit_str').AsString) = '' then _isAvailableForDispensing := False;
    if Trim(FieldByName('dispensingForm_str').AsString) = '' then _isAvailableForDispensing := False;
    if Trim(FieldByName('Administration_str').AsString) = '' then _isAvailableForDispensing := False;
    //BUG/task 346
    if Trim(FieldByName('Route_str').AsString) = '' then _isAvailableForDispensing := False;
    if Trim(FieldByName('dispensedUnit_str').AsString) = '' then _isAvailableForDispensing := False;


    FieldByName('IsAvailableForDispensing_Bol').AsBoolean := _isAvailableForDispensing;

    except

    end;

end; (*................................................................*)(*end*)(*...........................................*)

procedure TProductDm.ValidateForDispensing;
var
  curPos : string;
  pgDlg : TProgressIndicatorFrm;
begin

  pgDlg := TProgressIndicatorFrm.Create(Application);
  with qryProduct_Worker do
    begin
    Close;
    Open;
    pgDlg.MaxProgress := RecordCount;
    pgDlg.CurrentProgress := 0;
    pgDlg.MainCaption := SValidatingProductsForDispensi;


    curPos := FieldByName('productPackSize_ID').AsString;

    First;

    while not Eof do
      begin
      Edit;
      pgDlg.UpdateCaption := FieldByName('Description_str').AsString;
      pgDlg.CurrentProgress := pgDlg.CurrentProgress + 1;
      FieldByName('IsAvailableForDispensing_Bol').AsBoolean := False;
      Next;
      Application.ProcessMessages;
      end;

    if curPos <> '' then
      Locate('productPackSize_ID', curPos, []);

    Close;
    end;
  pgDlg.Free;

end;

procedure TProductDm.qryProduct_WorkerBeforePost(DataSet: TDataSet);
begin
  ProductValidate(Dataset);
end;

procedure TProductDm.CalculateNewProcedure;
var
 vOverallProgress            : TProgressIndicatorFrm;
 vCount : integer;
 StrVal : string;
begin
vOverallProgress := TProgressIndicatorFrm.Create(Self);
vOverallProgress.MainCaption := SAutoLevelingProductStockSigl;
vCount := 0;
 with tblProductCatalog, vOverallProgress do
  begin
  First;
  MaxProgress := tblProductCatalog.RecordCount;
  while not Eof do
   begin
   CurrentProgress  := vCount;
   //run the stored procedure...
   StrVal := tblProductCatalog.FieldByName('ICN_str').AsString + ', ' +
                tblProductCatalog.FieldByName('Description_str').AsString;

   CalcSiglSL.Parameters.ParamByName('@ProductCode_ID').Value := tblProductCatalog.FieldByName('ProductCode_id').Value;
   CalcSiglSL.Open;
   //update product table...
   if CalcSiglSL.RecordCount > 0 then
    begin
    tblProductCatalog.Edit;
    tblProductCatalog.FieldByName('MinStockSet_int').Value := CalcSiglSLSMin.Value;
    tblProductCatalog.FieldByName('MaxStockSet_int').Value := CalcSiglSLSMax.Value;
    tblProductCatalog.FieldByName('SafetyStockSet_int').Value := CalcSiglSLSS.Value;
    tblProductCatalog.FieldByName('LastReview_dat').Value := Now();
    tblProductCatalog.Post;
    end;

   CalcSiglSL.Close;

   vCount := vCount+1;
   UpdateCaption := StrVal;
   tblProductCatalog.Next;
   end;
   //Close;
  MaxProgress := 0;
  Free;
  end;

AddHistory(HST_LEV, 'Product levels re-calculated. '+IntToStr(vCount)+' Processed.', 0);
end;

procedure TProductDm.qryProductBatchNewRecord(DataSet: TDataSet);
begin

  with qryProductBatch do
   begin
   FieldByName('ProductCode_ID').AsInteger      := tblProductCatalog.fieldByName('ProductCode_ID').AsInteger;
   FieldByName('Bin_str').AsString              := tblProductCatalog.fieldByName('Bin_str').AsString;
   if FUsesBatchManagement then
    FieldByName('Expiry_dat').AsDateTime        := Date;
   FieldByName('ShippingPack_int').AsInteger    := tblProductCatalog.fieldByName('ShippingPack_int').AsInteger;
   FieldByName('Price_mon').AsCurrency          := tblProductCatalog.fieldByName('Cost_mon').AsCurrency;
   end;

end;

procedure TProductDm.UnLockProductforIssuing;
var
 ProductCode: integer;
begin
 ProductCode := tblProductCatalog.fieldByName('ProductCode_ID').AsInteger;
 MainDm.UnLockProduct(ProductCode);
end;

procedure TProductDm.AddHistory(vType: string; vDescription: string; vProductID: integer);
begin

 //********
 with tblEditHistory do
  begin
  if not Active then Open;
  Append;
  FieldByName('Type_str').AsString              := vType;
  FieldByName('ChangeDescription_str').AsString := vDescription;
  FieldByName('ProductCode_ID').AsInteger       := vProductID;
  FieldByName('ChangeDate_dat').AsDateTime      := Now();
  FieldByName('UserName_str').AsString          := RxSolutionFrm.Security.User.LastName.Value + ','+RxSolutionFrm.Security.User.FirstName.Value ;
  FieldByName('User_ID').AsFloat                := RxSolutionFrm.Security.User.UserNumID.Value;
  Post;
  end;

end;

procedure TProductDm.UpdateBatchPrice;
begin 
 //********* Update Batch Price if in non-batch management mode
 if not FUsesBatchManagement then
  begin
  with stpUpdateBatchPrice do
   begin
   Parameters.ParamByName('ProductCodeID').Value := tblProductCatalog.FieldByName('ProductCode_ID').AsInteger;
   ExecSQL;
   //********* MessageDlg('Price updated!', mtInformation, [mbOk], 0);
   end;
  end;

end;

procedure TProductDm.PrintStockStatusForRange(pDateSt, pDateEnd :TDateTime; pEDL: Boolean);
var
 pFilterDescrip: string;

begin

 //********** Set the Filter String to display within the report
 pFilterDescrip := 'Showing data between ' + DateToStr(pDateSt) + ' and ' + DateToStr(pDateEnd);

 //********** Task 4207 SM Create a "Stock Status Report" for products that can filter a period(start date, end date), VEN, EDL,
 //********** Tracer & contain the following columns (Stock balance at Start and End, Out of stock, all transcation in that period for "S-V-I-O-R)
 with stp_StockStatusReport do
  begin
  Close;
  Parameters.ParamByName('@DateFrom').Value     := pDateSt;
  Parameters.ParamByName('@DateTo').Value       := pDateEnd;
  Parameters.ParamByName('@EDL').Value          := pEDL;
  Open;
  end;

  with ppReportStockStatus do
   begin
   pplblDateFilter.Caption := pFilterDescrip;
   Print;
   end;

end;

procedure TProductDm.PrintProductListBarCodes;
begin

 with qryProductBarcodes do
  begin
  Close;
  Open;
  end;

 with ppProductBarCodes do
  begin
  Print;
  end;

end;

procedure TProductDm.LoadCustomReports;
begin

  CustomReportPATH := Application.GetNamePath();

   //Load Path if Label found
  if (FileExists(CustomReportPATH + 'labels\rx_barcode.rtm')) then
     begin
     ppReportProductDetailBartcode.Template.FileName := CustomReportPATH + 'labels\rx_barcode.rtm';
     ppReportProductDetailBartcode.Template.LoadFromFile;
     end;

end;

procedure TProductDm.ConfigureLabelReport(vReport: TppReport);
begin

 try
  LoadCustomReports;

  with ppDesigner1 do
   begin
   Report := vReport;
   Show;
   end;
 except
  on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

procedure TProductDm.EditBarcodeLabel(i: integer);
begin

  case i of
  0: ConfigureLabelReport(ppReportProductDetailBartcode);
  end; 

end;

procedure TProductDm.PrintProductDetailBarcodes;
begin

 //******** Refresh and load report data
 with qryProductBarcode do
  begin
  Close;
  Open;
  end;

 with ppReportProductDetailBartcode do
  begin
  Print;
  end;
  
end;

procedure TProductDm.RemoveNonEDLItemsFromDeamnders;
var
 msgDLG: string;
begin

 msgDLG := 'Product has been set to non-institutional. Remove from Demander Items?';

 if (MessageDlg(msgDLG, mtWarning, [mbYes, mbNo], 0) = mrYes) then
  begin
  with stpRemoveNonEDLItemsFromDemanders do
   begin
   ExecSQL;
   end;
  end;       
end;

function TProductDm.BoolToString(b:Boolean):String;
begin
 if B then
    Result := 'True'
 else
    Result := 'False';
end;

procedure TProductDm.LoadProductEditHistory;
begin
 //****** Load Current Product Edit History
 with qryProductEditHistory do
  begin
  Close;
  Open;
  end;

end;

procedure TProductDm.ShowProductEditHistory;
begin
 //******* Open edit table
 LoadProductEditHistory;
 //******* Show Product History Form
 ProductEditHistroyfrm.ShowModal;
end;

procedure TProductDm.qryBarcodesNewRecord(DataSet: TDataSet);
begin

 with qryBarcodes do
  begin
  FieldByName('ProductCode_ID').AsInteger       := tblProductCatalog.FieldByName('ProductCode_ID').AsInteger;
  FieldByName('productPackSize_ID').AsString    := tblProductCatalog.FieldByName('productPackSize_ID').AsString;
  end;

end;

procedure TProductDm.qryBarcodesBeforePost(DataSet: TDataSet);
var
 vBarCode, vErrMSG: string;
begin

 vErrMSG := 'Barcode already exist.';

 with qryBarcodes do
  begin

  vBarCode := FieldByName('Barcode_str').AsString;

  if DoesBarCodeExist(vBarCode) then
   begin
   MessageDlg(vErrMSG, mtError, [mbOk], 0);
   Abort;
   end;

  FieldByName('CapturedBy_str').AsString := FUserName;
  FieldByName('Modified_dat').AsDateTime := Now();
  end;
  
end;

procedure TProductDm.IsItemUsedInRegimen(vType: integer);
var
 MSG: string;
begin

 if vType = 1 then
  MSG := 'The product description has been updated. This will affect one or more standard regmimen.'
 else
  MSG := 'The product has been removed from the Institutional EDL. This will affect one or more standard regmimen.';

 //****** SM 30 Sep 2014
 //****** Is item used in any of the std regimen; if so then warn user and show the regimen in a report
 with qryIsInStdRegimen do
  begin
  Close;
  Open;

  if RecordCount > 0 then
   begin
   MessageDlg(MSG, mtWarning, [mbOk], 0);
   ppReportProductRegimen.Print;
   end;
  end;


end;

//********** SM 12 December 2014
//********** This function checks if the given bar code is already used in the database.
//********** It returns a value of true if it has been used.
function TProductDm.DoesBarCodeExist(barcode: string): Boolean;
begin

 with qryDoesBarcodeExist do
  begin
  Close;
  Parameters.ParamByName('barcode').Value := barcode;
  Open;

  if RecordCount > 0 then
   Result := True
  else
   Result := False;

  Close;
  end;


end;









end.

