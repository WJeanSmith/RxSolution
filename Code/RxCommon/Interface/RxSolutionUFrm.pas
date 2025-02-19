unit RxSolutionUFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdActns, ActnList, ImgList, DB, StdCtrls,
  Registry, ADODB,ComCtrls,ExtCtrls, Grids,Buttons, ComObj,

  dmpDataObjectBaseModule, RxSolutionSecurityClass,Class_Database_Connections,
  Class_System_General, jpeg, DateUtils, Prescription_TLB,

  TB2Toolbar, RzStatus, TB2ExtItems, TB2Item, TB2Dock, RzBckgnd, RzBorder,
  RzButton, RzLabel, dxPageControl, RzCommon, RzPanel, RzLaunch,
  rxDispensing_Unt_Patient, IniFiles, Printers,PrjConst,
  LocOnFly, DBCtrls;

type
  TRxStoreManager = class;

  TModuleActions = record
    ActionIndex: Integer;
    AlwaysAvailable: Boolean;
    ModuleAction: TAction;
    ModuleAccess: Integer;
    ModuleAvailableAtLogOn: Boolean;
    ModuleFileName: string;
    ModuleID: Integer;
    ModuleName: string;
    NeedsConnection: Boolean;
  end;

  TRxSolutionFrm = class(TForm)
    img16x16: TImageList;
    alMain: TActionList;
    atnFile_PrintSetup: TFilePrintSetup;
    atnFile_Exit: TFileExit;
    atnFile_Connect: TAction;
    atnEdit_Cut: TEditCut;
    atnEdit_Copy: TEditCopy;
    atnEdit_Paste: TEditPaste;
    atnHelp_Contents: THelpContents;
    atnTools_UserAdministration: TAction;
    atnFile_LogOn: TAction;
    atnGeneral_SuppliersView: TAction;
    atnGeneral_DemandersView: TAction;
    atnCore_ProductsView: TAction;
    atnStore_RequisitionsView: TAction;
    atnStore_PurchaseOrdersView: TAction;
    atnStore_ReceiptsView: TAction;
    atnFile_ReportExplorer: TAction;
    atnTools_Options: TAction;
    atnFile_LogOff: TAction;
    atnTools_ProductStartup: TAction;
    atnFinancial_Budget: TAction;
    atnFinancial_ProductsMonthEnd: TAction;
    atnHelp_About: TAction;
    atnDispensing_Prescribers: TAction;
    atnDispensing_Dispensers: TAction;
    atnDispensing_Patients: TAction;
    atnDispensing_Batch: TAction;
    atnDispensing_Prescriptions: TAction;
    img24x24: TImageList;
    rzfMainFrameController: TRzFrameController;
    rzrRegistrySettings: TRzRegIniFile;
    atnTools_Configure: TAction;
    rzsStatusBar: TRzStatusBar;
    atnCore_HomePage: TAction;
    rzvFileVersionUtil: TRzVersionInfo;
    img32x32: TImageList;
    tb2Dock_Top: TTBDock;
    tb2Dock_Left: TTBDock;
    tb2Dock_Right: TTBDock;
    tb2Bar_Menu: TTBToolbar;
    mnuFile_: TTBSubmenuItem;
    tb2Bar_Core: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    mnuFile_Connect: TTBItem;
    mnuFile_LogOn: TTBItem;
    mnuFile_LogOff: TTBItem;
    mnuTools_UserAdministration: TTBItem;
    mnuFile_N1: TTBSeparatorItem;
    mnuFile_PrintSetup: TTBItem;
    mnuFile_N2: TTBSeparatorItem;
    mnuFile_Exit: TTBItem;
    mnuView_: TTBSubmenuItem;
    mnuView_Toolbars_: TTBSubmenuItem;
    mnuView_Toolbars_System: TTBVisibilityToggleItem;
    mnuTools_: TTBSubmenuItem;
    TBItem12: TTBItem;
    img32: TImageList;
    img24: TImageList;
    img16: TImageList;
    mnuEdit_: TTBSubmenuItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    mnuTools_Options: TTBItem;
    mnuTools_N1: TTBSeparatorItem;
    mnuFile_ReportExplorer: TTBItem;
    atnFile_ChangePassword: TAction;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBItem4: TTBItem;
    TBItem8: TTBItem;
    TBSubmenuItem4: TTBSubmenuItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem11: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem15: TTBItem;
    tb2_Core: TTBToolbar;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem20: TTBItem;
    mnuView_Toolbars_Core: TTBVisibilityToggleItem;
    tb2_Store: TTBToolbar;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem28: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem29: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem9: TTBItem;
    rzvFileLaunchUtil: TRzLauncher;
    dxpRxSolution: TdxPageControl;
    dxtbsHome: TdxTabSheet;
    pnl_title_left: TPanel;
    imgHome_LeftBottom: TImage;
    imgHome_LeftTop: TImage;
    pnl_body_client: TPanel;
    pnl_body_body_top: TPanel;
    imgHome_BodyTopLeft: TImage;
    imgHome_BodyTopRight: TImage;
    imgUser_LoggedRed: TImage;
    rzlUser_Heading: TRzLabel;
    rzlUser_AccessStatus: TRzLabel;
    imgUser_ConnectedNot: TImage;
    imgUser_Connected: TImage;
    rzlUser_ConnectionStatus: TRzLabel;
    imgUser_LoggedGreen: TImage;
    imgUser_LoggedAmber: TImage;
    rzlUser_Name: TRzLabel;
    imgUser_IconNot: TImage;
    RzLabel9: TRzLabel;
    RzLabel11: TRzLabel;
    imgUser_Icon: TImage;
    Image1: TImage;
    RzLabel6: TRzLabel;
    RzButton1: TRzButton;
    pnl_body_body_bottom: TPanel;
    imgHome_BodyBottomLeft: TImage;
    imgHome_BodyBottomRight: TImage;
    Panel1: TPanel;
    imgApp_Icon: TImage;
    RzLabel4: TRzLabel;
    imgDB_ConnectionAvailableNot: TImage;
    imgDB_ConnectionAvailable: TImage;
    rzlDB_Connection: TRzLabel;
    imgApp_ADO: TImage;
    rzlApp_ADO: TRzLabel;
    imgDB_ServerAvailable: TImage;
    rzlDB_Server: TRzLabel;
    imgApp_MachineConnectedNot: TImage;
    rzlApp_Machine: TRzLabel;
    RzSeparator1: TRzSeparator;
    imgDB_ServerAvailableNot: TImage;
    imgDB_SecurityAvailableNot: TImage;
    imgDB_SecurityAvailable: TImage;
    rzlDB_Security: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    imgApp_MachineConnected: TImage;
    Panel2: TPanel;
    stgSystemStatus: TStringGrid;
    Panel4: TPanel;
    Image3: TImage;
    RzLabel3: TRzLabel;
    RzSeparator3: TRzSeparator;
    Panel3: TPanel;
    Panel5: TPanel;
    Image12: TImage;
    RzLabel10: TRzLabel;
    RzSeparator2: TRzSeparator;
    pnl_body_title: TPanel;
    imgHome_TopLeft: TImage;
    imgHome_TopRight: TImage;
    RzLabel12: TRzLabel;
    dxtbsRequisition: TdxTabSheet;
    dxtbsProduct: TdxTabSheet;
    dxtbsDemander: TdxTabSheet;
    dxtbsSupplier: TdxTabSheet;
    dxtbsOrders: TdxTabSheet;
    dxtbsReceipts: TdxTabSheet;
    dxtbsBudget: TdxTabSheet;
    dxtbsPrescribers: TdxTabSheet;
    TBItem10: TTBItem;
    dxtbsDispensers: TdxTabSheet;
    TBItem18: TTBItem;
    dxtbsPatientManager: TdxTabSheet;
    atnGeneral_Protocols: TAction;
    dxtbsProtocols: TdxTabSheet;
    dxtbsPrescriptions: TdxTabSheet;
    TBItem19: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem21: TTBItem;
    TBItem31: TTBItem;
    atnGeneral_Allergies: TAction;
    atnGeneral_Evidence: TAction;
    tb2_Dispensing: TTBToolbar;
    TBItem32: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBSeparatorItem10: TTBSeparatorItem;
    dxtbsComplex: TdxTabSheet;
    dxtbsProductDosing: TdxTabSheet;
    dxtbsClinics: TdxTabSheet;
    dxtbsBatchDispensing: TdxTabSheet;
    atnCore_ComplexManager: TAction;
    atnCore_Clinics: TAction;
    atnDispensing_Dosing: TAction;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem38: TTBItem;
    TBItem39: TTBItem;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    mnuView_Toolbars_Dispensing: TTBVisibilityToggleItem;
    mnuView_Toolbars_Store: TTBVisibilityToggleItem;
    atnTools_ClinicalDrugInformation: TAction;
    TBItem30: TTBItem;
    dxtbsProductInteractions: TdxTabSheet;
    TBItem42: TTBItem;
    TBItem43: TTBItem;
    dxtbsStockTake: TdxTabSheet;
    atnStore_StocktakingView: TAction;
    Label1: TLabel;
    TBItem44: TTBItem;
    Image2: TImage;
    Image4: TImage;
    atnStore_ReturnsView: TAction;
    TBItem45: TTBItem;
    dxtbsReturns: TdxTabSheet;
    dxtbsCredit: TdxTabSheet;
    atnStore_CreditView: TAction;
    TBItem46: TTBItem;
    rzvFileLaunchUtil1: TRzLauncher;
    Timer1: TTimer;
    dxtbsPrepacking: TdxTabSheet;
    atnStore_PrepackingView: TAction;
    TBItem47: TTBItem;
    atnStore_QuotationView: TAction;
    dxtbsQuotation: TdxTabSheet;
    TBItem49: TTBItem;
    dsMain: TDataSource;
    tblSystemMain: TADOQuery;
    ADOSystemMain: TADOConnection;
    DBImage1: TDBImage;
    dxtbsDemanderTransfers: TdxTabSheet;
    atnStore_DemanderTransfersView: TAction;
    TBItem48: TTBItem;
    dxtbsDemanderStocktaking: TdxTabSheet;
    atnStore_DemanderStocktaking: TAction;
    TBItem50: TTBItem;
    TBItem3: TTBItem;
    atnTools_LocalSettings: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionExecute(Sender : TObject);
    procedure TBItem42Click(Sender: TObject);
    procedure TBItem14Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDatabase: TSQLConnection;
    FDatabaseSession: TSQLSession;
    FModuleActions: array of TModuleActions;
    FModuleForms: array of TForm;
    FPatient: TPatientInterface;
    FRX: IRX;
    FSecurity: TSecurity;
    FStartupPage: TdxTabSheet;
    FSystemInfo: TSystemInfo;
    procedure Action_Event_ConnectToSQLServer;
    procedure Action_Event_GotoPage_Home;
    procedure Action_Event_GotoPage_Products;
    procedure Action_Event_GotoPage_Demanders;
    procedure Action_Event_GotoPage_Suppliers;
    procedure Action_Event_GotoPage_Requisitions;
    procedure Action_Event_GotoPage_Orders;
    procedure Action_Event_GotoPage_Receipts;
    procedure Action_Event_GotoPage_Reports;
    procedure Action_Event_GotoPage_Budget;
    procedure Action_Event_GotoPage_SystemSettings;
    procedure Action_Event_GotoPage_Prepacking;
    procedure Action_Event_LogOff;
    procedure Action_Event_LogOn;
    procedure Action_Event_UserAdministration;
    procedure Action_Event_UserChangePassword;
    procedure Module_FormCreate(const prmModule : integer);
    procedure Default_ApplySettings;
    procedure ActionLoad;
    procedure Action_Event_GotoPage_Prescribers;
    procedure Action_Event_GotoPage_Dispensers;
    procedure Module_AddToArray(const prmIndex : integer ; const prmAtn : TAction ;
        const prmModuleID : integer = -1 ; prmAvailable : boolean = true ;
        prmMustBeConnected : boolean = true ; prmAlwaysAvailable : Boolean = false
        ; prmFileName : string = '');
    procedure Default_PositionImages;
    procedure Default_SettingsCreate;
    procedure Default_SettingsRemove;
    procedure Form_Display_ApplicationSettings(const prmState : integer);
    procedure Form_Display_SecuritySettings(const prmState : integer);
    procedure Form_Display_UserSettings(const prmState : integer);
    procedure Module_DisplayList;
    procedure Navigate_GoToPage(const prmPage : TdxTabSheet); overload;
    procedure Navigate_GoToPage(const prmPageIndex : Integer); overload;
    procedure Database_OpenDataModules;
    procedure Form_Display_SetCaption;
    procedure Form_UpdateHomePage;
    function ActionGetIndex(const prmAction : TAction): Integer;
    procedure Action_Event_GotoPage_PatientManager;
    procedure Action_Event_GotoPage_Protocols;
    procedure Action_Event_GotoPage_Presriptions;
    procedure Action_Event_GotoPage_ProductDosing;
    procedure Action_Event_GotoPage_ClinicManager;
    procedure Action_Event_GotoPage_ComplexManager;
    procedure Action_Event_GotoPage_BatchDispensing;
    procedure Action_Event_OpenPage_ClinicalDrugInformation;
    function GetRegistryMainPath: string;
    procedure Module_FormRemoveAll;
    function Module_FormFind(const prmModule : integer): Integer;
    procedure Module_SetSecurity;
    procedure SetPatient(const Value: TPatientInterface);
    procedure Action_Event_GotoPage_MonthEnd;
    procedure Action_Event_GotoPage_Stocktaking;
    procedure Action_Event_GotoPage_Returns;
    procedure Action_Event_GotoPage_Credits;
    procedure Action_event_GotoPage_Quotations;
    procedure Action_Event_GotoPage_DemanderTransfers;
    procedure Action_Event_Contents;
    procedure Action_Event_GotoPage_DemanderStocktaking;
    procedure Action_Event_GotoPage_LocalSettings;

    procedure restartTimer;
    procedure StartBioMetricMachine;

    { Private declarations }
  protected

  public
    LabelPrnt, ReportPrnt : String;
    CheckUsePrnt : Boolean;

    HaveBarcodeScanner : Boolean;
    FUseDelta9Integration: Boolean;
    FUsePAABIntegration: Boolean;

    FHaveBiometric : Boolean;
    FBiometriURL: string;
    FBiometricFingerNum: integer;
    FBioMachineWithScannerOnly: Boolean;
    FDefaultDemander: string;

    FPasswordLength : integer;

    GreenBoxBridge: OleVariant;
    PaabInterface : OleVariant;
    Paabusername : string;
    Paabuserpwd : string;
    Paabuserpracnumber : string;
    PaabUrl : string;

    property DatabaseSession: TSQLSession read FDatabaseSession write
        FDatabaseSession;
    property Patient: TPatientInterface read FPatient write SetPatient;
    property RegistryMainPath: string read GetRegistryMainPath;
    property RX: IRX read FRX write FRX;
    property Security: TSecurity read FSecurity write FSecurity;

    procedure LoadPrinterSettings;
    procedure LoadSystemMain;
    procedure CheckPasswordExpiry;

    { Public declarations }
  published
  end;

  TRxStoreManager = class(TObject)
  public
    class function ConnectToDatabase(const prmSession : TSQLSession): Boolean;
    class procedure DisconnectFromDatabase;
  end;

  TUtilities = class(TObject)
  public
    class function GetADOVer: String;
    class function GetFileVer(FileName: String): String;
  end;
//New Stuff
const
  RegBasKey = 'Software\Korzh\RxSolution';

var
  RxSolutionFrm: TRxSolutionFrm;
  SYSTEMSTORE_DEF : double;    //From RxStore
  SYSTEMDEM_DEF   : double;    //From RxStore
  SYSTEMSUPP_DEF  : double;    //From RxStore

implementation

uses
  Class_Registry_ReadWrite,
  MainUDM,
  ProductUfrm,
  DemanderUFrm, SupplierUFrm, RequisitionUFrm, OrderUFrm, ReceiptUFrm,
  SystemUFrm, BudgetUFrm, PrescriberListUFrm, DispenserListUFrm,
  PatientManagerUFrm, PrescriptionListUFrm,
  BatchDispensingUFrm, ClinicManagerUFrm,
  PharmacyManagerUFrm, RxSolutionAboutUFrm,
  ClinicalDrugInformationUFrm, SystemMonthEndUFrm, StockTakeUFrm,
  ReturnsUFrm, CreditUFrm, PrepackingUFrm,
  ComplexManagerUFrm, QuotationUFrm, DemanderTranfersUFrm,
  DemanderStocktakingUFrm, LocalSettingsUFrm;

const

  DISPLAY_STATE_OFF           = 0;
  DISPLAY_STATE_INTERMEDIATE  = 1;
  DISPLAY_STATE_ON            = 2;

  DISPLAYCOLOR_STATE_OFF           = clRed;
  DISPLAYCOLOR_STATE_INTERMEDIATE  = $003CC7FF;
  DISPLAYCOLOR_STATE_ON            = clGreen;


//uses ;
{$R *.dfm}

procedure TRxSolutionFrm.ActionExecute(Sender : TObject);
var
  curAction: Integer;
begin
  curAction := ActionGetIndex(TAction(Sender));
  case curAction of
    0 : Action_Event_ConnectToSQLServer;
    1 : Action_Event_LogOn;
    2 : Action_Event_LogOff;
    3 : Action_Event_UserAdministration;
    4 : Action_Event_UserChangePassword;
    5 : Action_Event_GotoPage_Home;
    6 : Action_Event_GotoPage_Products;
    7 : Action_Event_GotoPage_Demanders;
    8 : Action_Event_GotoPage_Suppliers;
    9 : Action_Event_GotoPage_Requisitions;
    10: Action_Event_GotoPage_Orders;
    11: Action_Event_GotoPage_Receipts;
    12: Action_Event_GotoPage_Reports;
    13: Action_Event_GotoPage_SystemSettings;
    14: Action_Event_GotoPage_Budget;
    15: Action_Event_GotoPage_Prescribers;
    16: Action_Event_GotoPage_Dispensers;
    17: Action_Event_GotoPage_PatientManager;
    18: Action_Event_GotoPage_Presriptions;
    19: Action_Event_GotoPage_Protocols;
    20: Action_Event_GotoPage_ComplexManager;
    21: Action_Event_GotoPage_ClinicManager;
    22: Action_Event_GotoPage_BatchDispensing;
    23: Action_Event_GotoPage_ProductDosing;
    24: TAboutManager.ShowAboutDialog;
    25: Action_Event_OpenPage_ClinicalDrugInformation;
    26: Action_Event_GotoPage_MonthEnd;
    27: Action_Event_GotoPage_Stocktaking;
    28: Action_Event_GotoPage_Returns;
    29: Action_Event_GotoPage_Credits;
    30: Action_Event_GotoPage_Prepacking;
    31: Action_Event_GotoPage_Quotations;
    32: Action_Event_GotoPage_DemanderTransfers;
    33: Action_Event_Contents;
    34: Action_Event_GotoPage_DemanderStocktaking;
    35: Action_Event_GotoPage_LocalSettings;
    end
end;

procedure TRxSolutionFrm.Action_Event_LogOff;
begin
      if FSecurity.LogOff then
        begin
        Module_SetSecurity;
        Form_Display_UserSettings(DISPLAY_STATE_OFF);
        Module_DisplayList;
        Module_FormRemoveAll;  
        // Setup Default Page
        Navigate_GoToPage(FStartupPage);
        FRX.DispenserID := '';
        end;
end;

procedure TRxSolutionFrm.Action_Event_LogOn;
var
 Fversion, FUserName, FMachine, Flocation: string;
begin
  if FSecurity.LogOn then
    begin
    //Check Password Expiry Password here
    CheckPasswordExpiry;

    Form_Display_UserSettings(DISPLAY_STATE_ON);
    Module_SetSecurity;
    Module_DisplayList;
    FRX.DispenserID := FSecurity.User.DispenserID.Value;

    Fversion := rzvFileVersionUtil.FileVersion;

    FMachine := FSecurity.MachineName;

    with FSecurity.User do
     FUserName := LastName.Value + ', ' + FirstName.Value;

    Flocation := '';

    if (not VarIsNull(FDefaultDemander))then
     if (FDefaultDemander <> '') then
      Flocation := MainDm.GetDefaultDemanderName(FDefaultDemander);

    // Log Application Version
    //Check and compare Server/Client Dates
    if FDatabase.connectionReady then
     begin
     MainDm.CheckServerAndClientTimeDifference;
     MainDm.LogVersionDetails(FMachine, FUserName, Flocation, Fversion);
     end;

    end;
end;

procedure TRxSolutionFrm.Action_Event_UserAdministration;
begin
  FSecurity.Administration;
end;

procedure TRxSolutionFrm.Default_ApplySettings;
var
  i: Integer;
  FormsAvailable : Boolean;
begin

  //  Main Page Container setup.
  // Remove tabs from user view.
  with dxpRxSolution do
    for i := 0 to PageCount -1 do
      Pages[i].TabVisible := False;

  // Setup home page & primary form caption
  Form_UpdateHomePage;
  Form_Display_SetCaption;
  Module_DisplayList;

  // Setup Default Page
  Navigate_GoToPage(FStartupPage);

end;

procedure TRxSolutionFrm.Default_SettingsCreate;

begin

  // Create a system object for getting general settings
  FSystemInfo := TSystemInfo.Create;

  // Setup Registry Do this first
  SetApplicationRegistryDefaults;                                               // Save application data to registry

  // See if the db is connected
  FDatabase           := TSQLConnection.Create;
  FDatabase.folder    := 'DataConnection';
  FDatabase.autoOpen  := False;
  FDatabase.TestConnectivity;


  // The following two cannot exist if there is no db.
  // Create a db Session.  Used by the newer application components
  if FDatabase.connectionReady then
    FDatabaseSession := TSQLSession.Create( FDatabase.database,
                                            FDatabase.server,
                                            FDatabase.userName,
                                            FDatabase.password);

  // Create security manager
  if FDatabase.connectionReady then
    begin
    FSecurity := TSecurity.Create(FDatabaseSession);
    FSecurity.MachineName := FSystemInfo.systemComputer;
    end;

  // Load the MainDM from RxStore
  if FDatabase.connectionReady then
    begin
    Database_OpenDataModules;
    end;

  // Apply actions to modules
  ActionLoad;
  Module_SetSecurity;

  // Home page
  FStartupPage := dxtbsHome;
  
end;

procedure TRxSolutionFrm.Navigate_GoToPage(const prmPage : TdxTabSheet);
begin
  with dxpRxSolution do ActivePage := prmPage;
end;

procedure TRxSolutionFrm.FormCreate(Sender: TObject);
begin
// New Stuff
// Application.OnHint := ShowHint;
// FileName := '';
// LocalizerOnFly.OnMenuItemAdd := LocMenuItemAdd;
// LocalizerOnFly.PopulateMenu(miLanguage, 0, True);
  try
  // Setup startup settings
  Default_SettingsCreate;
  Default_PositionImages;

  // Now Apply then
  Default_ApplySettings;

  FPatient := TPatientInterface.Create(FDatabaseSession.ThisConnection.ConnectionString);

  // Create Com Objects
  FRX := CoRX.Create;
  FRX.Initialize(FDatabaseSession.ThisConnection.ConnectionString);

  //Load printer settings
  LoadPrinterSettings;
  LoadSystemMain;

  //Load Biometric Machine is available
  if FHaveBiometric then
   begin
   GreenBoxBridge := CreateOleObject('IDBridge.Bridge');
   StartBioMetricMachine;
   end;

  if FUsePAABIntegration then
   begin
   PaabInterface := CreateOleObject('RxPaabInterface.RxPaab');
   end;

  except
  end;
end;

procedure TRxSolutionFrm.FormDestroy(Sender: TObject);
begin

  // Free Com Objects
  FRX := nil;

//  FPatient.Free;
  Default_SettingsRemove;
  Inherited;
end;

procedure TRxSolutionFrm.Module_FormCreate(const prmModule : integer);
var
  i: Integer;
begin

  if Module_FormFind(prmModule) = -1 then
    begin
    i := Length(FModuleForms);
    Setlength(FModuleForms, i + 1);
    case prmModule of
      MODULE_CORE_PRODUCTS :
        begin
        FModuleForms[i] := TProductFrm.Create(dxtbsProduct);
        FModuleForms[i].Parent := dxtbsProduct;
        end;
      MODULE_CORE_DEMANDERS :
        begin
        FModuleForms[i] := TDemanderFrm.Create(dxtbsDemander);
        FModuleForms[i].Parent := dxtbsDemander;
        end;
      MODULE_CORE_SUPPLIERS :
        begin
        FModuleForms[i] := TSupplierFrm.Create(dxtbsSupplier);
        FModuleForms[i].Parent := dxtbsSupplier;
        end;
      MODULE_STORE_REQUISITION :
        begin
        FModuleForms[i] := TRequisitionFrm.Create(dxtbsRequisition);
        FModuleForms[i].Parent := dxtbsRequisition;
        end;
      MODULE_STORE_ORDERS :
        begin
        FModuleForms[i] := TOrderFrm.Create(dxtbsOrders);
        FModuleForms[i].Parent := dxtbsOrders;
        end;
      MODULE_STORE_RECEIPTS :
        begin
        FModuleForms[i] := TReceiptFrm.Create(dxtbsReceipts);
        FModuleForms[i].Parent := dxtbsReceipts;
        end;
      MODULE_STORE_BUDGET :
        begin
        FModuleForms[i] := TBudgetFrm.Create(dxtbsBudget);
        FModuleForms[i].Parent := dxtbsBudget;
        end;
      MODULE_DISPENSING_PRESCRIBERS :
        begin
        FModuleForms[i] := TPrescriberListFrm.Create(dxtbsPrescribers);
        FModuleForms[i].Parent := dxtbsPrescribers;
        end;
      MODULE_DISPENSING_DISPENSERS :
        begin
        FModuleForms[i] := TDispenserListFrm.Create(dxtbsDispensers);
        FModuleForms[i].Parent := dxtbsDispensers;
        end;
//      MODULE_CORE_PROTOCOLS :
//        begin
//        FModuleForms[i] := TProtocolsFrm.Create(dxtbsProtocols);
//        FModuleForms[i].Parent := dxtbsProtocols;
//        end;
      MODULE_DISPENSING_PATIENTS :
        begin
        FModuleForms[i] := TPatientManagerFrm.Create(dxtbsPatientManager);
        FModuleForms[i].Parent := dxtbsPatientManager;
        end;
      MODULE_DISPENSING_PRESCRIBING :
        begin
        FModuleForms[i] := TPrescriptionListFrm.Create(dxtbsPrescriptions);
        FModuleForms[i].Parent := dxtbsPrescriptions;
        end;
//      MODULE_DISPENSING_DOSING :
//        begin
//        FModuleForms[i] := TDosingFrm.Create(dxtbsProductDosing);
//        FModuleForms[i].Parent := dxtbsProductDosing;
//        end;
      MODULE_CORE_CLINICS :
        begin
        FModuleForms[i] := TClinicManagerFrm.Create(dxtbsClinics);
        FModuleForms[i].Parent := dxtbsClinics;
        end;
      MODULE_DISPENSING_BATCHDISPENSING :
        begin
        FModuleForms[i] := TBatchDispensingFrm.Create(dxtbsBatchDispensing);
        FModuleForms[i].Parent := dxtbsBatchDispensing;
        end;
      MODULE_STOCKTAKING :
        begin
        FModuleForms[i] := TStockTakeFrm.Create(dxtbsStockTake);
        FModuleForms[i].Parent := dxtbsStockTake;
        end;
      MODULE_STORE_RETURNS :
        begin
        FModuleForms[i] := TReturnsFrm.Create(dxtbsReturns);
        FModuleForms[i].Parent := dxtbsReturns;
        end;
      MODULE_CREDITS :
        begin
        FModuleForms[i] := TCreditFrm.Create(dxtbsCredit);
        FModuleForms[i].Parent := dxtbsCredit;
        end;

       MODULE_PREPACKING :
        begin
        FModuleForms[i] := TPrepackingFrm.Create(dxtbsPrepacking);
        FModuleForms[i].Parent := dxtbsPrepacking;
        end;

       MODULE_CORE_COMPLEX :
        begin
        FModuleForms[i] := TComplexManagerFrm.Create(dxtbsComplex);
        FModuleForms[i].Parent := dxtbsComplex;
        end;

       MODULE_QUOTATION :
        begin
        FModuleForms[i] := TQuotationFrm.Create(dxtbsQuotation);
        FModuleForms[i].Parent := dxtbsQuotation;
        end;

       MODULE_DEMANDER_TRANSFERS :
        begin
        FModuleForms[i] := TDemanderTranfersFrm.Create(dxtbsDemanderTransfers);
        FModuleForms[i].Parent := dxtbsDemanderTransfers;
        end;

       MODULE_DEMANDERSTOCKTAKING :
        begin
        FModuleForms[i] := TDemanderStocktakingFrm.Create(dxtbsDemanderStocktaking);
        FModuleForms[i].Parent := dxtbsDemanderStocktaking;
        end;

      end;
    FModuleForms[i].Align       := alClient;
    FModuleForms[i].BorderStyle := bsNone;
    FModuleForms[i].Visible     := True;
    end;

end;

procedure TRxSolutionFrm.Module_DisplayList;
var
  prv04: Integer;
  prv03: Integer;
  i: Integer;
  prvFile: string;
  prv02: string;
  prv01: string;
  qry: TADOQuery;
  j: Integer;
begin     
    if FDatabase.connectionReady then
    begin
    qry := TADOQuery.Create(nil);
    qry.Connection := FDatabaseSession.ThisConnection;
    qry.SQL.Add('SELECT * FROM tblSystem_Access_Areas ORDER BY displayOrder_int');
    qry.Open;

    i := 1;
    while not qry.eof do
      begin
      prv01 := qry.FieldByName('accessAreaDescription_str').AsString;
      prv02 := qry.FieldByName('dllName_str').AsString;
      prv03 := qry.FieldByName('moduleNum_int').AsInteger;
      if prv02 = '-' then
        prvFile := Application.ExeName
        else
        prvFile := ExtractFilePath(Application.ExeName) + '\' + prv02;
      stgSystemStatus.RowCount := i;
      rzvFileVersionUtil.FilePath   := prvFile;
      prv02 := rzvFileVersionUtil.FileVersion;
      if prv02 = 'Value Not Available' then prv02 := 'NOT AVAILABLE';
      stgSystemStatus.Cells[0,i-1]  := prv01;
//      stgSystemStatus.Cells[1,i]  := ExtractFileName(prvFile);
      stgSystemStatus.Cells[1,i-1]  := '<' + prv02 + '>';
      
      if Assigned(FSecurity) then
        prv04 := FSecurity.GetUserAccessLevel(prv03)
        else
        prv04 := 11;
      stgSystemStatus.Cells[2,i-1]  := '{' + IntToStr(prv04) + '}';
      inc(i);
      qry.Next;
      end;
    qry.Free;
    end else
    stgSystemStatus.RowCount := 1;

end;

procedure TRxSolutionFrm.Navigate_GoToPage(const prmPageIndex : Integer);
begin
  with dxpRxSolution do ActivePageIndex := prmPageIndex;
end;

procedure TRxSolutionFrm.Database_OpenDataModules;
begin

  if FDatabase.connectionReady then
    begin
    TRxStoreManager.ConnectToDatabase(FDatabaseSession);

    // RxStore Defaults // maybe move it elsewhere later
    SYSTEMSTORE_DEF := MainDM.GetDefaultAccount;
    SYSTEMDEM_DEF   := MainDM.GetDefaultDemander;
    SYSTEMSUPP_DEF  := MainDM.GetDefaultSupplier;

    //********* Check whether system uses Delta9 Patient Integration
    //********* 27 August 2013
    FUseDelta9Integration := MainDm.tblMainSystem.FieldByName('delta9PatientIntegration_bol').AsBoolean;
    FUsePAABIntegration := MainDm.tblMainSystem.FieldByName('PAABPatientIntegration_bol').AsBoolean;

    //SN
    //atnStore_PurchaseOrdersView.Visible := not MainDm.IsRequisitionManagementOnly;
    //atnStore_ReceiptsView.Visible := not MainDm.IsRequisitionManagementOnly;
    end else
    begin
    SYSTEMSTORE_DEF := 0;
    SYSTEMDEM_DEF   := 0;
    SYSTEMSUPP_DEF  := 0;
    end;

end;

procedure TRxSolutionFrm.Form_Display_SetCaption;
var
  ad: string;
  fv: string;
  pv: string;
  ps: string;
const
  //APP_STR   = '%s %s [%s] (ADO[%s])';
  APP_STR   = '%s %s [%s]';

begin

  ps := FSystemInfo.versionProductName;
  pv := FSystemInfo.versionProductVersion;
  fv := FSystemInfo.versionFileVersion;
  //ad := TUtilities.GetADOVer;   //Task 2922
  //RxSolutionFrm.Caption := Format(APP_STR, [ps, pv, fv, ad])
  RxSolutionFrm.Caption := ps + ' [' + pv + ']';// Format(APP_STR, [ps, pv, pv]);
end;

procedure TRxSolutionFrm.Action_Event_ConnectToSQLServer;
var
  prvIsLogged: Boolean;
begin

  prvIsLogged := False;
  if Assigned(FSecurity) then prvIsLogged := FSecurity.IsLoggedOn;

  if not prvIsLogged then
    begin
    if FDatabase.EditConnectionProperties then
      begin
      Default_SettingsRemove;
      Default_SettingsCreate;
      Default_ApplySettings;
      
      end
    end else
    MessageDlg('Please log off before attempting to change the connection properties', mtWarning, [mbok],0);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Home;
begin
  Navigate_GoToPage(FStartupPage);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Products;
begin
  Module_FormCreate(MODULE_CORE_PRODUCTS);
  Navigate_GoToPage(dxtbsProduct);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Demanders;
begin
  Module_FormCreate(MODULE_CORE_DEMANDERS);
  Navigate_GoToPage(dxtbsDemander);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Suppliers;
begin
  Module_FormCreate(MODULE_CORE_SUPPLIERS);
  Navigate_GoToPage(dxtbsSupplier);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Requisitions;
begin
  Module_FormCreate(MODULE_STORE_REQUISITION);
  Navigate_GoToPage(dxtbsRequisition);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Orders;
begin
  Module_FormCreate(MODULE_STORE_ORDERS);
  Navigate_GoToPage(dxtbsOrders);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Stocktaking; //SM 30 Aug
begin
 Module_FormCreate(MODULE_STOCKTAKING);
 Navigate_GoToPage(dxtbsStockTake);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Prepacking; //SM 08 Aug 2009
begin
 Module_FormCreate(MODULE_PREPACKING);
 Navigate_GoToPage(dxtbsPrepacking);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Returns; //SM 30 Aug 08
begin
 Module_FormCreate(MODULE_STORE_RETURNS);
 Navigate_GoToPage(dxtbsReturns);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Credits; //SM 11 Sep 08
begin
 Module_FormCreate(MODULE_CREDITS);
 Navigate_GoToPage(dxtbsCredit);
end;

procedure TRxSolutionFrm.Action_event_GotoPage_Quotations; //SM 29 Sep 09
begin
 Module_FormCreate(MODULE_QUOTATION);
 Navigate_GoToPage(dxtbsQuotation);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_DemanderTransfers; //SM 15 Dec 09
begin
 Module_FormCreate(MODULE_DEMANDER_TRANSFERS);
 Navigate_GoToPage(dxtbsDemanderTransfers);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_DemanderStocktaking; //SM 29 Feb 2012
begin
 Module_FormCreate(MODULE_DEMANDERSTOCKTAKING);
 Navigate_GoToPage(dxtbsDemanderStocktaking);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_LocalSettings;
var
 localSettings : TLocalSettingsFrm;
begin
 //******* Local Settings 10 Dec 2013
 localSettings := TLocalSettingsFrm.Create(nil);
 localSettings.ShowModal;
 localSettings.Free;     
end;


//MC 20/09/2010

procedure TRxSolutionFrm.Action_Event_Contents;
begin
    with rzvFileLaunchUtil1 do
    try
    FileName := ExtractFilePath(Application.ExeName)+'Help\Rxsolution.chm';
    //StartDir := ;
    Launch;
    except
      on E : Exception do MessageDlg(e.Message, mtWarning, [mbOK], 0);
    end;
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Receipts;
begin
  Module_FormCreate(MODULE_STORE_RECEIPTS);
  Navigate_GoToPage(dxtbsReceipts);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Reports;
begin

  with rzvFileLaunchUtil do
    try
    FileName :=  'RxDispensingReporter.exe';
    StartDir := ExtractFilePath(Application.ExeName);
    Launch;
    except
      on E : Exception do MessageDlg(e.Message, mtWarning, [mbOK], 0);
    end;

end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Budget;
begin
  Module_FormCreate(MODULE_STORE_BUDGET);
  Navigate_GoToPage(dxtbsBudget);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_MonthEnd;
var
 frmMonthEnd :  TSystemMonthEndFrm;
begin
// MOnthEnd
frmMonthEnd := TSystemMonthEndFrm.Create(Application);
frmMonthEnd.ShowModal;
frmMonthEnd.Free;
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_SystemSettings;
var
  frmSetting: TSystemFrm;
begin

  frmSetting := TSystemFrm.Create(Application);
  with frmSetting do
    begin
    ShowModal;
    Free;
    end;


end;

procedure TRxSolutionFrm.Action_Event_UserChangePassword;
begin
  FSecurity.ChangePassword;
end;

procedure TRxSolutionFrm.Default_SettingsRemove;
begin

  Form_Display_ApplicationSettings(DISPLAY_STATE_INTERMEDIATE);
  Form_Display_SecuritySettings(DISPLAY_STATE_INTERMEDIATE);
  Form_Display_UserSettings(DISPLAY_STATE_INTERMEDIATE);

  TRxStoreManager.DisconnectFromDatabase;
  FSystemInfo.Free;
  if Assigned(FDatabase) then FDatabase.Free;
  if Assigned(FSecurity) then FSecurity.Free;
  if Assigned(FDatabaseSession) then FDatabaseSession.Free;
  FDatabase := nil;
  FSecurity := nil;
  FDatabaseSession := nil;

end;

procedure TRxSolutionFrm.Default_PositionImages;
const
  LEFTALIGNHD = 20;
  LEFTALIGN   = 40;
begin
  // User Main heading
  imgUser_Icon.Left                 := LEFTALIGNHD;
  imgUser_IconNot.Left              := LEFTALIGNHD;
  imgApp_Icon.Left                  := LEFTALIGNHD;


  // User Logon Icons
  imgUser_LoggedRed.Left            := LEFTALIGN;
  imgUser_LoggedAmber.Left          := LEFTALIGN;
  imgUser_LoggedGreen.Left          := LEFTALIGN;
  imgUser_ConnectedNot.Left         := LEFTALIGN;
  imgUser_Connected.Left            := LEFTALIGN;

  // Application Settings icons
  imgDB_ConnectionAvailableNot.Left := LEFTALIGN;
  imgDB_ConnectionAvailable.Left    := LEFTALIGN;
  imgDB_ServerAvailableNot.Left     := LEFTALIGN;
  imgDB_ServerAvailable.Left        := LEFTALIGN;
  imgDB_SecurityAvailableNot.Left   := LEFTALIGN;
  imgDB_SecurityAvailable.Left      := LEFTALIGN;
  imgApp_MachineConnectedNot.Left   := LEFTALIGN;
  imgApp_MachineConnected.Left      := LEFTALIGN;
  imgApp_ADO.Left                   := LEFTALIGN;


end;

procedure TRxSolutionFrm.Form_Display_ApplicationSettings(const prmState :
    integer);
begin

  // These are constant
  rzlApp_Machine.Caption  := FSystemInfo.systemComputer;
  rzlApp_ADO.Caption      := 'ADO Ver-' + TUtilities.GetADOVer;

  case prmState of
    DISPLAY_STATE_OFF :
    begin
    imgDB_ConnectionAvailableNot.Visible  := True;
    imgDB_ConnectionAvailable.Visible     := False;
    rzlDB_Connection.Caption              := 'NOT CONNECTED';
    rzlDB_Connection.Font.Color           := DISPLAYCOLOR_STATE_OFF;
    imgDB_ServerAvailableNot.Visible      := True;
    imgDB_ServerAvailable.Visible         := False;
    rzlDB_Server.Caption                  := 'NOT AVAILABLE';
    rzlDB_Server.Font.Color               := DISPLAYCOLOR_STATE_OFF;
//    imgApp_MachineConnected.Visible       := False;
//    imgApp_MachineConnectedNot.Visible    := True;
    end;
    DISPLAY_STATE_INTERMEDIATE :
    begin
    imgDB_ConnectionAvailableNot.Visible  := True;
    imgDB_ConnectionAvailable.Visible     := False;
    rzlDB_Connection.Caption              := '<Unknown>';
    rzlDB_Connection.Font.Color           := DISPLAYCOLOR_STATE_INTERMEDIATE;
    imgDB_ServerAvailableNot.Visible      := True;
    imgDB_ServerAvailable.Visible         := False;
    rzlDB_Server.Caption                  := '<Unkhown>';
    rzlDB_Server.Font.Color               := DISPLAYCOLOR_STATE_INTERMEDIATE;
//    imgApp_MachineConnected.Visible       := False;
//    imgApp_MachineConnectedNot.Visible    := True;
    end;
    DISPLAY_STATE_ON :
    begin
    imgDB_ConnectionAvailableNot.Visible  := False;
    imgDB_ConnectionAvailable.Visible     := True;
    rzlDB_Connection.Caption              := 'Connected';
    rzlDB_Connection.Font.Color           := DISPLAYCOLOR_STATE_ON;
    imgDB_ServerAvailableNot.Visible      := False;
    imgDB_ServerAvailable.Visible         := True;
    rzlDB_Server.Caption                  := FDatabase.database + ' on ' + FDatabase.server;
    rzlDB_Server.Font.Color               := DISPLAYCOLOR_STATE_ON;
//    imgApp_MachineConnected.Visible       := True;
//    imgApp_MachineConnectedNot.Visible    := False;
    end;
  end;

end;

procedure TRxSolutionFrm.Form_Display_SecuritySettings(const prmState :
    integer);
var
  str: string;
begin

  case prmState of
    DISPLAY_STATE_OFF :
    begin
//    imgDB_SecurityAvailableNot.Visible  := True;
//    imgDB_SecurityAvailable.Visible     := False;
    rzlDB_Security.Caption              := 'NOT AVAILABLE';
    rzlDB_Security.Font.Color           := DISPLAYCOLOR_STATE_OFF;
    end;
    DISPLAY_STATE_INTERMEDIATE :
    begin
//    imgDB_SecurityAvailableNot.Visible  := True;
//    imgDB_SecurityAvailable.Visible     := False;
    rzlDB_Security.Caption              := '<Unknown>';
    rzlDB_Security.Font.Color           := DISPLAYCOLOR_STATE_INTERMEDIATE;
    end;
    DISPLAY_STATE_ON :
    begin
//    imgDB_SecurityAvailableNot.Visible  := False;
//    imgDB_SecurityAvailable.Visible     := True;
    if FSecurity.Encrypt then
      str := 'Secure - [Encryption enabled]'
      else
      str := 'Secure';
    rzlDB_Security.Caption              := str;
    rzlDB_Security.Font.Color           := DISPLAYCOLOR_STATE_ON;
    end;
  end;

end;

procedure TRxSolutionFrm.Form_Display_UserSettings(const prmState : integer);
begin
  //Recall Form Caption Display function
  Form_Display_SetCaption();
  case prmState of
    DISPLAY_STATE_OFF :
    begin
    imgUser_IconNot.Visible             := True;
    imgUser_Icon.Visible                := False;

    imgUser_LoggedRed.Visible           := True;
    imgUser_LoggedAmber.Visible         := False;
    imgUser_LoggedGreen.Visible         := False;
    rzlUser_AccessStatus.Font.Color     := DISPLAYCOLOR_STATE_OFF;
    rzlUser_AccessStatus.Caption        := 'NO ACCESS - [Not Logged In]';

    imgUser_ConnectedNot.Visible        := True;
    imgUser_Connected.Visible           := False;
    rzlUser_ConnectionStatus.Font.Color := DISPLAYCOLOR_STATE_OFF;
    rzlUser_ConnectionStatus.Caption    := 'NO STATUS - [Not Logged In]';

    rzlUser_Name.Font.Color             := DISPLAYCOLOR_STATE_OFF;
    rzlUser_Name.Caption                := 'NO STATUS - [Not Logged In]';
    end;
    DISPLAY_STATE_INTERMEDIATE :
    begin
    imgUser_IconNot.Visible             := True;
    imgUser_Icon.Visible                := False;

    imgUser_LoggedRed.Visible           := False;
    imgUser_LoggedAmber.Visible         := True;
    imgUser_LoggedGreen.Visible         := False;
    rzlUser_AccessStatus.Font.Color     := DISPLAYCOLOR_STATE_INTERMEDIATE;
    rzlUser_AccessStatus.Caption        := 'NO ACCESS - [Status Unknown]';

    imgUser_ConnectedNot.Visible        := False;
    imgUser_Connected.Visible           := True;
    rzlUser_ConnectionStatus.Font.Color := DISPLAYCOLOR_STATE_INTERMEDIATE;
    rzlUser_AccessStatus.Caption        := 'NO STATUS - [Status Unknown]';

    rzlUser_Name.Font.Color             := DISPLAYCOLOR_STATE_INTERMEDIATE;
    rzlUser_Name.Caption                := 'NO STATUS - [Not Logged In]';
    end;
    DISPLAY_STATE_ON :
    begin
    imgUser_IconNot.Visible             := False;
    imgUser_Icon.Visible                := True;

    imgUser_LoggedRed.Visible           := False;
    imgUser_LoggedAmber.Visible         := False;
    imgUser_LoggedGreen.Visible         := True;
    rzlUser_AccessStatus.Font.Color     := DISPLAYCOLOR_STATE_ON;
    rzlUser_AccessStatus.Caption        := 'Access Granted';

    imgUser_ConnectedNot.Visible        := False;
    imgUser_Connected.Visible           := True;
    rzlUser_ConnectionStatus.Font.Color := DISPLAYCOLOR_STATE_ON;
    rzlUser_ConnectionStatus.Caption    := 'Logged On @ ' + FSecurity.UserSession.LogOnTime.ToString;

    rzlUser_Name.Font.Color             := DISPLAYCOLOR_STATE_ON;
    rzlUser_Name.Caption                := FSecurity.User.LastName.Value + ', ' + FSecurity.User.FirstName.Value;
    //Append Current user information on Form Caption   //Task 2922
    RxSolutionFrm.Caption := RxSolutionFrm.Caption +' Logged On As - '+ FSecurity.User.LastName.Value + ', ' + FSecurity.User.FirstName.Value; 
    end;
  end;

end;




procedure TRxSolutionFrm.Form_UpdateHomePage;
var
  prvDisplayState: integer;
begin

  prvDisplayState := DISPLAY_STATE_OFF;
  if Assigned(FDatabaseSession) then prvDisplayState := DISPLAY_STATE_ON;
  Form_Display_ApplicationSettings(prvDisplayState);

  prvDisplayState := DISPLAY_STATE_OFF;
  if Assigned(FSecurity) then prvDisplayState := DISPLAY_STATE_ON;
  Form_Display_SecuritySettings(prvDisplayState);

  prvDisplayState := DISPLAY_STATE_OFF;
  if Assigned(FSecurity) then
    if FSecurity.IsLoggedOn then
      prvDisplayState := DISPLAY_STATE_ON;
  Form_Display_UserSettings(prvDisplayState);

end;

procedure TRxSolutionFrm.ActionLoad;
var
  atConnNotReq: Boolean;
  atConnReq: Boolean;
  atLogOn: Boolean;
  atLogOff: Boolean;

begin
  atLogOn   := True;    // Only avaialbe when logged on
  atLogOff  := False;   // Available when logged off
  atConnNotReq := False;
  atConnReq := True;

  Module_AddToArray(0, atnFile_Connect, MODULE_CORE_OPEN, atLogOff, atConnNotReq);
  Module_AddToArray(1, atnFile_LogOn,   MODULE_CORE_OPEN, atLogOff);
  Module_AddToArray(2, atnFile_LogOff,  MODULE_CORE_OPEN, atLogOn);
  Module_AddToArray(4, atnFile_ChangePassword,  MODULE_CORE_OPEN, atLogOn);

  Module_AddToArray(3, atnTools_UserAdministration, MODULE_CORE_USERADMINISTRATION, atLogOn);

  Module_AddToArray(5, atnCore_HomePage, MODULE_CORE_OPEN, atLogOn, atConnNotReq, True);
  Module_AddToArray(6, atnCore_ProductsView, MODULE_CORE_PRODUCTS, atLogOn);
  Module_AddToArray(7, atnGeneral_DemandersView, MODULE_CORE_DEMANDERS, atLogOn);
  Module_AddToArray(8, atnGeneral_SuppliersView, MODULE_CORE_SUPPLIERS, atLogOn);

  Module_AddToArray(9, atnStore_RequisitionsView, MODULE_STORE_REQUISITION, atLogOn);
  Module_AddToArray(10,atnStore_PurchaseOrdersView, MODULE_STORE_ORDERS, atLogOn);
  Module_AddToArray(11,atnStore_ReceiptsView, MODULE_STORE_RECEIPTS, atLogOn);
  Module_AddToArray(12,atnFile_ReportExplorer, MODULE_CORE_REPORTS, atLogOn);
  Module_AddToArray(13,atnTools_Options, MODULE_CORE_SYSTEM, atLogOn);
  Module_AddToArray(14,atnFinancial_Budget, MODULE_STORE_BUDGET, atLogOn);

  Module_AddToArray(15,atnDispensing_Prescribers, MODULE_DISPENSING_PRESCRIBERS, atLogOn);
  Module_AddToArray(16,atnDispensing_Dispensers, MODULE_DISPENSING_DISPENSERS, atLogOn);

  Module_AddToArray(17,atnDispensing_Patients, MODULE_DISPENSING_PATIENTS, atLogOn);
  Module_AddToArray(18,atnDispensing_Prescriptions, MODULE_DISPENSING_PRESCRIBING, atLogOn);
  Module_AddToArray(19,atnGeneral_Protocols, MODULE_CORE_PROTOCOLS, atLogOn);

  Module_AddToArray(20,atnCore_ComplexManager, MODULE_CORE_COMPLEX, atLogOn);
  Module_AddToArray(21,atnCore_Clinics, MODULE_DISPENSING_CLINICS, atLogOn);
  Module_AddToArray(22,atnDispensing_Batch, MODULE_DISPENSING_BATCHDISPENSING, atLogOn);
  Module_AddToArray(23,atnDispensing_Dosing, MODULE_DISPENSING_DOSING, atLogOn);

  Module_AddToArray(24, atnHelp_About, MODULE_CORE_OPEN, atLogOn, atConnNotReq, True);
  Module_AddToArray(25, atnTools_ClinicalDrugInformation, MODULE_CORE_CLINICALINFO, atLogOn);
  Module_AddToArray(26, atnFinancial_ProductsMonthEnd, MODULE_CORE_OPEN, atLogOn);
  Module_AddToArray(27, atnStore_StocktakingView, MODULE_STOCKTAKING , atLogOn);
  Module_AddToArray(28, atnStore_ReturnsView, MODULE_STORE_RETURNS , atLogOn);
  Module_AddToArray(29, atnStore_CreditView, MODULE_CREDITS , atLogOn);
  Module_AddToArray(30, atnStore_PrepackingView, MODULE_PREPACKING , atLogOn);
  Module_AddToArray(31, atnStore_QuotationView, MODULE_QUOTATION , atLogOn);
  Module_AddToArray(32, atnStore_DemanderTransfersView, MODULE_DEMANDER_TRANSFERS , atLogOn);
  Module_AddToArray(33, atnHelp_Contents, MODULE_CORE_OPEN ,atLogOn, atConnNotReq, True);
  Module_AddToArray(34, atnStore_DemanderStocktaking, MODULE_DEMANDERSTOCKTAKING, atLogOn);
  Module_AddToArray(35, atnTools_LocalSettings, MODULE_LOCALSETTINGS, atLogOn);

end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Prescribers;
begin
  Module_FormCreate(MODULE_DISPENSING_PRESCRIBERS);
  Navigate_GoToPage(dxtbsPrescribers);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Dispensers;
begin
  Module_FormCreate(MODULE_DISPENSING_DISPENSERS);
  Navigate_GoToPage(dxtbsDispensers);
end;

function TRxSolutionFrm.ActionGetIndex(const prmAction : TAction): Integer;
var
  i: Integer;
begin

Result := -1;
for i := low(FModuleActions) to high(FModuleActions) do
  if prmAction.Name = (FModuleActions[i].ModuleAction as TAction).Name then
    begin
    Result := FModuleActions[i].ActionIndex;
    Exit;
    end;

end;

procedure TRxSolutionFrm.Action_Event_GotoPage_PatientManager;
begin
  Module_FormCreate(MODULE_DISPENSING_PATIENTS);
  Navigate_GoToPage(dxtbsPatientManager);
end;

//Pass User rights ----MC -- 11/04/2012
procedure TRxSolutionFrm.Action_Event_GotoPage_Protocols;
var
 atnBrowse: Boolean;
 _userName, _userPin: string;
begin

  with RxSolutionFrm.Security do
   begin
   atnBrowse := (GetUserAccessLevel(MODULE_CORE_PROTOCOLS) > USER_BROWSER);
   end;

//  Module_FormCreate(MODULE_CORE_PROTOCOLS);
//  Navigate_GoToPage(dxtbsProtocols);
  _userName:= Security.User.UserName.Value;
  _userPin := Security.User.Password.Value;

  FRX.Protocols(atnBrowse, _userName, _userPin);

end;

procedure TRxSolutionFrm.Action_Event_GotoPage_Presriptions;
begin
  Module_FormCreate(MODULE_DISPENSING_PRESCRIBING);
  Navigate_GoToPage(dxtbsPrescriptions);
end;

//11/04/2012 - MC - Pass user rights information to the prescription.dll
procedure TRxSolutionFrm.Action_Event_GotoPage_ProductDosing;
var
//  Module_FormCreate(MODULE_DISPENSING_DOSING);
//  Navigate_GoToPage(dxtbsProductDosing);  
  atnBrowse: Boolean;
begin
  with RxSolutionFrm.Security do
  atnBrowse := (GetUserAccessLevel(MODULE_DISPENSING_DOSING) > USER_BROWSER);
  
  FRX.StandardDose(atnBrowse, Security.User.UserName.Value, Security.User.Password.Value);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_ClinicManager;
begin
  Module_FormCreate(MODULE_CORE_CLINICS);
  Navigate_GoToPage(dxtbsClinics);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_ComplexManager;
begin
  Module_FormCreate(MODULE_CORE_COMPLEX);
  Navigate_GoToPage(dxtbsComplex);
end;

procedure TRxSolutionFrm.Action_Event_GotoPage_BatchDispensing;
begin
  Module_FormCreate(MODULE_DISPENSING_BATCHDISPENSING);
  Navigate_GoToPage(dxtbsBatchDispensing);
end;

procedure TRxSolutionFrm.Action_Event_OpenPage_ClinicalDrugInformation;
begin

  TClinicalDrugInformation.Manage(FDatabase.connection.ConnectionString);

end;

function TRxSolutionFrm.GetRegistryMainPath: string;
begin
  Result := FSystemInfo.RegistryPath;
end;

procedure TRxSolutionFrm.Module_AddToArray(const prmIndex : integer ; const
    prmAtn : TAction ; const prmModuleID : integer = -1 ; prmAvailable :
    boolean = true ; prmMustBeConnected : boolean = true ; prmAlwaysAvailable :
    Boolean = false ; prmFileName : string = '');
var
  str: string;
  i: Integer;
begin

  i := Length(FModuleActions);
  inc(i);
  SetLength(FModuleActions, i);
  i := i - 1;

  with FModuleActions[i] do
    begin
    ActionIndex   := prmIndex;
    ModuleAction  := prmAtn;
    ModuleID      := prmModuleID;
    ModuleName    := '';

    if prmModuleID = MODULE_CORE_OPEN then
      ModuleAccess  := 0
      else
      ModuleAccess  := 4;

    if prmFileName = '' then
      str := ExtractFileName(Application.ExeName)
      else
      str := prmFileName;
    ModuleFileName:= str;
    ModuleAvailableAtLogOn := prmAvailable; //true says available only when logged on
    NeedsConnection   := prmMustBeConnected;
    AlwaysAvailable   := prmAlwaysAvailable;
    end;

end;

procedure TRxSolutionFrm.Module_FormRemoveAll;
var
  i: Integer;
begin

  for i := low(FModuleForms) to high(FModuleForms) do
    if Assigned(FModuleForms[i]) then
      begin
      FModuleForms[i].Free;
      FModuleForms[i] := Nil;
      end;
  FModuleForms := Nil;

end;

function TRxSolutionFrm.Module_FormFind(const prmModule : integer): Integer;
var
  i: Integer;
begin

  Result := -1;
  for i := low(FModuleForms) to high(FModuleForms) do
    if Assigned(FModuleForms[i]) then
      case prmModule of
        MODULE_CORE_PRODUCTS : if (FModuleForms[i] is TProductFrm) then Result := i;
        MODULE_CORE_DEMANDERS : if (FModuleForms[i] is TDemanderFrm) then Result := i;
        MODULE_CORE_SUPPLIERS : if (FModuleForms[i] is TSupplierFrm) then Result := i;
        MODULE_STORE_REQUISITION : if (FModuleForms[i] is TRequisitionFrm) then Result := i;
        MODULE_STORE_ORDERS : if (FModuleForms[i] is TOrderFrm) then Result := i;
        MODULE_STORE_RECEIPTS : if (FModuleForms[i] is TReceiptFrm) then Result := i;
        MODULE_STORE_BUDGET : if (FModuleForms[i] is TBudgetFrm) then Result := i;
        MODULE_DISPENSING_PRESCRIBERS : if (FModuleForms[i] is TPrescriberListFrm) then Result := i;
        MODULE_DISPENSING_DISPENSERS : if (FModuleForms[i] is TDispenserListFrm) then Result := i;
        MODULE_DISPENSING_PATIENTS : if (FModuleForms[i] is TPatientManagerFrm) then Result := i;
        MODULE_DISPENSING_PRESCRIBING : if (FModuleForms[i] is TPrescriptionListFrm) then Result := i;
//        MODULE_CORE_PROTOCOLS : if (FModuleForms[i] is TProtocolsFrm) then Result := i;
//        MODULE_DISPENSING_DOSING : if (FModuleForms[i] is TDosingFrm) then Result := i;
        MODULE_CORE_CLINICS : if (FModuleForms[i] is TClinicManagerFrm) then Result := i;
        MODULE_CORE_COMPLEX : if (FModuleForms[i] is TComplexManagerFrm) then Result := i;
        MODULE_DISPENSING_BATCHDISPENSING : if (FModuleForms[i] is TBatchDispensingFrm) then Result := i;
        MODULE_STOCKTAKING : if (FModuleForms[i] is TStockTakeFrm) then Result := i;
        MODULE_STORE_RETURNS : if (FModuleForms[i] is TReturnsFrm) then Result := i;
        MODULE_CREDITS : if (FModuleForms[i] is TCreditFrm) then Result := i;
        MODULE_PREPACKING : if (FModuleForms[i] is TPrepackingFrm) then Result := i;
        MODULE_QUOTATION : if (FModuleForms[i] is TQuotationFrm) then Result := i;
        MODULE_DEMANDER_TRANSFERS : if (FModuleForms[i] is TDemanderTranfersFrm) then Result := i;
        MODULE_DEMANDERSTOCKTAKING : if (FModuleForms[i] is TDemanderStocktakingFrm) then Result := i;
      end;

end;

procedure TRxSolutionFrm.Module_SetSecurity;
var
  i: Integer;
  LoggedOn: Boolean;
begin
  LoggedOn := False;
  if Assigned(FSecurity) then
    if FSecurity.IsLoggedOn then
      LoggedOn := True;
  for i := low(FModuleActions) to high(FModuleActions) do
    with FModuleActions[i] do
      if LoggedOn then
        begin
        // Get security levels here

        ModuleAction.Visible := ModuleAvailableAtLogOn;
        if AlwaysAvailable then
          ModuleAction.Visible := True
          else
          begin

          if ModuleID <> MODULE_CORE_OPEN then
            begin
            ModuleAction.Visible := False;
//            if ModuleAccess <= FSecurity.GetUserAccessLevel(ModuleID) then
              if FSecurity.GetUserAccessLevel(ModuleID) > 0 then
                ModuleAction.Visible := True
            end;
          end;

        end else
        // Logged off, so only show available. No need for security here because
        // access is switched off.
        begin
        ModuleAction.Visible := not ModuleAvailableAtLogOn;
        if NeedsConnection then
          if not FDatabase.connectionReady then
            ModuleAction.Visible := False;
        if AlwaysAvailable then ModuleAction.Visible := True;
        end;
end;



procedure TRxSolutionFrm.SetPatient(const Value: TPatientInterface);
begin
  FPatient := Value;
end;


class function TRxStoreManager.ConnectToDatabase(const prmSession :
    TSQLSession): Boolean;
const
MAX_TAG_COUNT = 40;

var

  CountAllDataStores,
  ErrorCount,
  OpenedDataSets    :integer;       // Incremental int for counting the processing of info
  i,j,k,m           :integer;       // Loop variables.
  Save_Cursor       :TCursor;

begin

  (*..........................................................................*)// Default return Value
  Result := False;

  (*..........................................................................*)// Show user that the program is busy
  Save_Cursor   := Screen.Cursor;                                               // First get current cursor.
  Screen.Cursor := crHourGlass;                                                 // Now Show hourglass cursor

  ErrorCount          := 0;                                                     // Set initial values for default variables
  OpenedDataSets      := 0;                                                     // Total datasets opened for use.
  CountAllDataStores  := 0;

  (*..........................................................................*)// Try..Finally
  try

  for m := 0 to Screen.DataModuleCount-1 do
   for i := 0 to Screen.DataModules[m].ComponentCount -1 do
    if Screen.DataModules[m].Components[i] is TADOConnection then
      with Screen.DataModules[m].Components[i] as TADOConnection do

        (*....................................................................*)// Place the open procedure in a try..except
        try

        ConnectionString      := prmSession.ThisConnection.ConnectionString;
        Connected             := True;

        for j := 1 to MAX_TAG_COUNT do                                          // If tag value is > Max_Tag_Count, won't open
          for k := 0 to DataSetCount -1 do
            begin

            try

            if DataSets[k].Tag = j then                                         // Make sure of the sequence
              begin
              DataSets[k].Active := True;                                       // Activate the datastore
              inc(OpenedDataSets);
              end;

            except

              on E: EDatabaseError do                                           // Pick up any databse errors and send to log
                begin
                inc(ErrorCount);                                                // Increase error count.
                end; (*E: EDatabaseError*)

            end; (*Try..Except*)
            (*................................................................*)// END OF NESTED TRY..EXCEPT

            end; (*for k := 0 to DataSetCount -1 do*)



        except

          on E: EDatabaseError do
            begin
            inc(ErrorCount);
            MessageDlg( E.Message , mtError , [mbOk], 0);
            end;

          on E: EVariantError do
            begin
            inc(ErrorCount);
            MessageDlg( E.Message , mtError , [mbOk], 0);
            end;

          on E: EOleException do
            begin
            inc(ErrorCount);
            MessageDlg( E.Message , mtError , [mbOk], 0);
            end;

        end; (*try.. except*)

//      end; (*with Screen.DataModules[m].Components[i] as TADOConnection do*)

  finally
    if ErrorCount = 0 then Result := True;
    Screen.Cursor := Save_Cursor;  // Always restore to normal
  end;

end;

class procedure TRxStoreManager.DisconnectFromDatabase;
var
  i: Integer;
  m: Integer;

begin


  for m := 0 to Screen.DataModuleCount-1 do
   for i := 0 to Screen.DataModules[m].ComponentCount -1 do
    if Screen.DataModules[m].Components[i] is TADOConnection then
      with Screen.DataModules[m].Components[i] as TADOConnection do
        Connected := False;

end;

class function TUtilities.GetADOVer: String;
var
  Reg   : TRegistry;
  List  : TStringList;
  I     : Integer;
  CLSID : String;
begin

  try
  Reg  := TRegistry.Create;
  List := TStringList.Create;
  with Reg do
    begin
    RootKey := HKEY_CLASSES_ROOT;
//    OpenKeyReadOnly('', False);
    OpenKeyReadOnly('');
    GetKeyNames(List);
    for I := 0 to List.Count - 1 do
      if Pos('ADODB.Connection', List[I]) <> 0 then
        begin
//        OpenKeyReadOnly(List[I]+'\CLSID', False);
        OpenKeyReadOnly(List[I]+'\CLSID');
        CLSID := ReadString('');
        end;
    CloseKey;
//    OpenKeyReadOnly('\CLSID\'+CLSID + '\InprocServer32', False);
    OpenKeyReadOnly('\CLSID\'+CLSID + '\InprocServer32');
    GetADOVer := GetFileVer(ReadString(''));
    end;

  finally
    List.Free;
    Reg.Free;
  end;

end;

class function TUtilities.GetFileVer(FileName: String): String;
var
  VerSize : DWORD;
  Zero    : THandle;
  PBlock  : Pointer;
  PS      : Pointer;
  Size    : UINT;
begin

  {** Get size of Version resource **}
  VerSize := GetFileVersionInfoSize(PChar(FileName), Zero);
  if VerSize = 0 Then
    begin
    GetFileVer := 'Not found';
    Exit;
    End;

  {** Allocate memory **}
  GetMem(PBlock, VerSize);
  {** Get Version resource **}
  GetFileVersionInfo(PChar(FileName), 0, VerSize,PBlock);
  if VerQueryValue(PBlock, '\\StringFileInfo\\000004E4\\ProductVersion',PS,Size) Then
    GetFileVer := StrPas(PS)
  else if VerQueryValue(PBlock, '\\StringFileInfo\\000004B0\\ProductVersion',PS,Size) Then
    GetFileVer := StrPas(PS)
  else GetFileVer := '?.?';

  {** Release memory **}
  FreeMem(PBlock, VerSize);

end;


procedure TRxSolutionFrm.TBItem42Click(Sender: TObject);
var frmMonthEnd : TSystemMonthEndFrm;
begin

end;

procedure TRxSolutionFrm.TBItem14Click(Sender: TObject);
begin
    with rzvFileLaunchUtil1 do
    try
    FileName := ExtractFilePath(Application.ExeName)+'Help\Rxsolution.chm';
    //StartDir := ;
    Launch;
    except
      on E : Exception do MessageDlg(e.Message, mtWarning, [mbOK], 0);
    end;

end;


procedure TRxSolutionFrm.LoadPrinterSettings;
var
  ini : TIniFile;
begin

  Ini := TIniFile.Create('RxPrinters.ini');
  try
  LabelPrnt := ini.ReadString('Rx','LabelPrinter','');
  ReportPrnt := ini.ReadString('Rx','ReportPrinter','');
  CheckUsePrnt := ini.ReadBool('Rx','UsePrinters_bol', False);
  HaveBarcodeScanner := ini.ReadBool('Rx', 'HaveBarcodeScanner', False);
  FHaveBiometric      := ini.ReadBool('Rx', 'HaveBiometricMachine', False);
  FBiometriURL        := ini.ReadString('Rx', 'BioMetricURL', '');
  FBiometricFingerNum := ini.ReadInteger('Rx', 'BioMetricFingerNum', 10);
  FBioMachineWithScannerOnly := ini.ReadBool('Rx', 'BioMachineScannerOnly', False);
  FDefaultDemander             := ini.ReadString('Rx','DefaultDemander','');

  Paabusername := ini.ReadString('Rx', 'PaabUser', '');
  Paabuserpwd := ini.ReadString('Rx', 'PaabPwd', '');
  Paabuserpracnumber := ini.ReadString('Rx', 'PaabPrac', '');
  PaabUrl := ini.ReadString('Rx', 'PaabUrl', '');

  finally
  ini.Free;
  end;
end;

procedure TRxSolutionFrm.restartTimer;
begin
 {
 with Timer1 do
  begin
  Enabled       := False;
  Interval      := 1200000;
  Enabled       := True;
  end;
  }
end;


procedure TRxSolutionFrm.Timer1Timer(Sender: TObject);
begin
// Close;
end;

procedure TRxSolutionFrm.FormShow(Sender: TObject);
begin
// restartTimer;
end;

procedure TRxSolutionFrm.FormClick(Sender: TObject);
begin
// restartTimer;
end;

procedure TRxSolutionFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
// restartTimer;
end;

procedure TRxSolutionFrm.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
// restartTimer;
end;

procedure TRxSolutionFrm.LoadSystemMain;
begin

 ADOSystemMain.ConnectionString := MainDM.ADOMainDBConnection.ConnectionString;
 with tblSystemMain do
  begin
  Close;
  Open;
  end;
end;

procedure TRxSolutionFrm.StartBioMetricMachine;
begin

 //******** If a scanner that is bein used is not the 4001 GreenBox machine machine
 //******** then don't start controller in the usual manner
 //******** SM 18 Mar 2014
 if (not FBioMachineWithScannerOnly) then
  begin
  GreenBoxBridge.StartController;
 // GreenBoxBridge.WaitForControllerStartUp(10); // need to remove this... not require anymore. bridge will handle this
 // GreenBoxBridge.PowerUpFingerprintDevice;     // need to remove this... not required anymore. bridge will handle this
  GreenBoxBridge.PowerUpSignaturePadDevice;
  end;
  
end;    

procedure TRxSolutionFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 //******** If a scanner that is bein used is not the 4001 GreenBox machine machine
 //******** then don't stop controller in the usual manner
 //******** SM 18 Mar 2014
 if (FHaveBiometric) and (not FBioMachineWithScannerOnly)  then
   begin
   GreenBoxBridge.StopController;  
   end;

 
 if FUsePAABIntegration then
   begin

   end;   
   
end;

procedure TRxSolutionFrm.CheckPasswordExpiry;
var
 UserLastSetDate: TDateTime;
 MSG_PWDToExpire, MSG_PWDExpired : string;
 daysDiff : integer;
begin

 MSG_PWDToExpire := 'Password will expire soon in ';
 MSG_PWDExpired := 'Password has expired. Would you like to reset the password?';

 FPasswordLength := MainDm.tblMainSystem.FieldByName('PasswordLength_int').AsInteger;

 if (MainDm.tblMainSystem.FieldByName('ExpiringPassword_bol').AsBoolean) then
  begin
  with RxSolutionFrm.Security.User do
   UserLastSetDate := MainDm.GetUserExpiryDateLastSet(UserNumID.Value);

  daysDiff := DaysBetween(Now(), UserLastSetDate);

  if(IncDay(UserLastSetDate, MainDm.GetNumberofDaysPssExpires) < Now()) then
   begin
   if MessageDlg(MSG_PWDExpired, mtWarning, [mbYes, mbNo], 0) = mrYes then
    FSecurity.ChangePassword;
   end;

  if(DaysBetween(IncDay( UserLastSetDate, MainDm.GetNumberofDaysPssExpires), Now()) < 10) then
   MessageDlg(MSG_PWDToExpire + inttoStr(MainDm.GetNumberofDaysPssExpires - daysDiff) + ' days', mtWarning, [mbOk], 0);  
  end; 

end;

end.


