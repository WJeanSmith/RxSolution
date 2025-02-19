unit PrescriptionFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  ExtCtrls, DBCtrls, DB, Menus, ActnList, ImgList, StdCtrls, Mask,

  PrescriptionUtilities,

  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  cxDBData, dxExEdtr, cxGridCardView, cxGridTableView, RzCommon, RzDlgBtn,
  RzEdit, RzDBEdit, cxContainer, cxCheckBox, cxDBEdit, RzBckgnd, dxDBTLCl,
  dxGrClms, dxDBGrid, dxDBCtrl, dxTL, dxCntner, cxGridLevel,
  cxGridCustomTableView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, ElPopBtn, RzDBCmbo, RzButton, RzRadChk,
  RzDBChk, RzLine, RzLabel, RzDBLbl, RzTabs, Grids, DBGrids, ComCtrls,
  RzDTP, RzDBDTP, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  wwdbdatetimepicker, RzBmpBtn, dxEdLib, dxDBELib;


type
  TfrmRX = class(TForm)
    pnlBehindTab: TPanel;
    pgcPrescription: TRzPageControl;
    pmnuRX_: TPopupMenu;
    pmnuRX_PrintLabels: TMenuItem;
    RzDialogButtons1: TRzDialogButtons;
    tbsPatient: TRzTabSheet;
    tbsRX: TRzTabSheet;
    pnlRXBackground: TPanel;
    FRM_RXItem: TDataSource;
    FRM_Formulation: TDataSource;
    FRM_ProductPacks: TDataSource;
    FRM_RegiminInterval: TDataSource;
    FRM_RegiminInstruction: TDataSource;
    FRM_Dispenser: TDataSource;
    FRM_Prescriber: TDataSource;
    FRM_ICD10: TDataSource;
    FRM_DRPOutcome: TDataSource;
    FRM_DRPProblem: TDataSource;
    FRM_RX: TDataSource;
    fcRXHeader: TRzFrameController;
    pnlForm_Header: TPanel;
    lblPatientLastName: TRzDBLabel;
    lblPatientFolderNumber: TRzDBLabel;
    lblRXNumber: TRzDBLabel;
    lblDemander: TLabel;
    lblPrescriber: TLabel;
    lblDispenser: TLabel;
    lblPrescriptionDetail: TLabel;
    Label5: TLabel;
    pnlForm_Header_Divider: TShape;
    rxNaive: TRzDBCheckBox;
    rxPregnant: TRzDBCheckBox;
    rxClinic: TRzDBLookupComboBox;
    rxDemander: TRzDBLookupComboBox;
    rxPrescriberCode: TRzDBLookupComboBox;
    rxDispenserCode: TRzDBLookupComboBox;
    rxPrescriber: TRzDBLookupComboBox;
    rxDispenser: TRzDBLookupComboBox;
    rxReferred: TRzDBCheckBox;
    pnlForm_Footer: TPanel;
    lblCost: TRzDBLabel;
    pnlForm_Footer_Divider: TShape;
    cxsrRegiminDetail: TcxStyleRepository;
    cxs01_Content: TcxStyle;
    cxs01_ContentEven: TcxStyle;
    cxs01_ContentOdd: TcxStyle;
    cxs01_Footer: TcxStyle;
    cxs01_Group: TcxStyle;
    cxs01_GroupByBox: TcxStyle;
    cxs01_Header: TcxStyle;
    cxs01_Inactive: TcxStyle;
    cxs01_Indicator: TcxStyle;
    cxs01_Preview: TcxStyle;
    cxs01_Selection: TcxStyle;
    cxsLbl_Background: TcxStyle;
    cxsLbl_CaptionRow: TcxStyle;
    cxsLbl_CardBorder: TcxStyle;
    cxsLbl_Content: TcxStyle;
    cxsLbl_ContentEven: TcxStyle;
    cxsLbl_ContentOdd: TcxStyle;
    cxsLbl_Inactive: TcxStyle;
    cxsLbl_IncSearch: TcxStyle;
    cxsLbl_RowCaption: TcxStyle;
    cxsLbl_Selection: TcxStyle;
    gtvsStandard: TcxGridTableViewStyleSheet;
    gcvsLabel: TcxGridCardViewStyleSheet;
    aclRegiminDetail: TActionList;
    actGridView_Standard: TAction;
    actGridView_Labels: TAction;
    actGridView_Detailed: TAction;
    actRepeats_ChangeAllRepeats: TAction;
    actRX_ProtocolAdd: TAction;
    actRX_StandardRegimen: TAction;
    pmnuRXDetailDisplay: TPopupMenu;
    pmnuRXDetailDisplay_Standard: TMenuItem;
    pmnuRXDetailDisplay_Labels: TMenuItem;
    pnlForm_Detail: TPanel;
    pnlToolbar: TPanel;
    btnLast: TElSpeedButton;
    btnFirst: TElSpeedButton;
    btnAdd: TElSpeedButton;
    shpToolber: TShape;
    btnRefresh: TElSpeedButton;
    btnPrior: TElSpeedButton;
    btnNext: TElSpeedButton;
    btnEdit: TElSpeedButton;
    btnDelete: TElSpeedButton;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    cxpRXItem: TcxPageControl;
    cxpRXItem_tsLabels: TcxTabSheet;
    cxgLabels: TcxGrid;
    cxgLabelsCv: TcxGridDBCardView;
    cxgLabelsCvlabel_Line01_str: TcxGridDBCardViewRow;
    cxgLabelsCvlabel_Line02_str: TcxGridDBCardViewRow;
    cxgLabelsCvlabel_Line03_str: TcxGridDBCardViewRow;
    cxgLabelsCvlabel_Line04_str: TcxGridDBCardViewRow;
    cxgLabelsCvlabel_Line05_str: TcxGridDBCardViewRow;
    cxgLabelsCvlabel_Line06_str: TcxGridDBCardViewRow;
    cxgLabelsTVLvl: TcxGridLevel;
    cxpRXItem_tsPrescribing: TcxTabSheet;
    cxpRXItem_tsDispensing: TcxTabSheet;
    cxpRXItem_tsCmbStandard: TcxTabSheet;
    cxpRXItem_tsCmbDetailed: TcxTabSheet;
    cxpRXItem_tsCmbStandardWithLabel: TcxTabSheet;
    dxgRXItemStandard: TdxDBGrid;
    dxgRXItemStandardFrmSKU_Dbl: TdxDBGridMaskColumn;
    dxgRXItemStandardFrmDuration_Dbl: TdxDBGridMaskColumn;
    dxgRXItemStandardFrmRepeat_Dbl: TdxDBGridMaskColumn;
    dxgRXItemStandardDspSKUActual_Dbl: TdxDBGridMaskColumn;
    dxgRXItemStandardDspProductBreakPack_Bol: TdxDBGridCheckColumn;
    actGridView_Prescribing: TAction;
    actGridView_Dispensing: TAction;
    actGridView_StandardWithLabels: TAction;
    lblView_Standard: TLabel;
    lblView_Labels: TLabel;
    lblView_Dispensing: TLabel;
    lblView_Detailed: TLabel;
    lblView_StandardWithLabel: TLabel;
    dxgRXItemStandardFrmFormulation_Str: TdxDBGridPickColumn;
    dxgRXItemStandardFrmInterval_Str: TdxDBGridPickColumn;
    dxgRXItemStandardFrmDirections_Str: TdxDBGridPickColumn;
    dxgRXItemStandardDspProduct_Str: TdxDBGridPickColumn;
    dxgRXItemStandardFrmSKUTotal_Dbl: TdxDBGridMaskColumn;
    pnlForm_DetailInformation: TPanel;
    lblItemCount: TRzLabel;
    rxItemCount: TDBText;
    btnView: TElSpeedButton;
    btnSave: TElSpeedButton;
    btnCancel: TElSpeedButton;
    dxgRXItemStandardFrmAdministrationUnit_Str: TdxDBGridColumn;
    dxgRXItemStandardDspProductCalc_Dbl: TdxDBGridColumn;
    actRXItem_ChangeDirections: TAction;
    FRM_Clinic: TDataSource;
    FRM_Demanders: TDataSource;
    actRXItem_ChangeIntervention: TAction;
    dxgRXItemStandardDspNotDispensed_Bol: TdxDBGridCheckColumn;
    actData_First: TAction;
    actData_Prior: TAction;
    actData_Next: TAction;
    actData_Last: TAction;
    actData_Add: TAction;
    actData_Delete: TAction;
    actData_Post: TAction;
    actData_Cancel: TAction;
    actData_Refresh: TAction;
    tmrRX: TTimer;
    RzLabel2: TRzLabel;
    regRegimin: TRzDBLabel;
    lblProductCost: TLabel;
    regProductCost: TRzDBLabel;
    regItemCost: TRzDBLabel;
    lne_01: TRzLine;
    RzSeparator1: TRzSeparator;
    GroupBox1: TGroupBox;
    regLabel_01: TRzDBLabel;
    regLabel_02: TRzDBLabel;
    regLabel_03: TRzDBLabel;
    regLabel_04: TRzDBLabel;
    regLabel_05: TRzDBLabel;
    regLabel_06: TRzDBLabel;
    regPackCount: TRzDBLabel;
    lbl_multiples: TLabel;
    lbl_Equals: TLabel;
    lblProductPacks: TLabel;
    lblFinalCost: TLabel;
    lblBatchNumber: TLabel;
    fcRXDetail: TRzFrameController;
    regBatchNumber: TRzDBEdit;
    actRX_Print: TAction;
    Directions1: TMenuItem;
    Intervention1: TMenuItem;
    N1: TMenuItem;
    actRX_PrintLabels: TAction;
    Labels1: TMenuItem;
    actRX_PrintAddressLabel: TAction;
    PrintAddressLabel1: TMenuItem;
    lblICD: TLabel;
    lblIntervention: TLabel;
    regInterventionProblem: TRzDBLookupComboBox;
    regInterventionOutcome: TRzDBLookupComboBox;
    N2: TMenuItem;
    actProtocolsSelect1: TMenuItem;
    actRegimenStandard1: TMenuItem;
    actRX_Post: TAction;
    actRX_PostAndCancel: TAction;
    N3: TMenuItem;
    CancelPosts1: TMenuItem;
    Post1: TMenuItem;
    lblRxRepeatStatus: TDBText;
    lblPosted: TDBText;
    regICDCode: TRzDBLookupComboBox;
    regICDDesc: TRzDBLookupComboBox;
    actRX_PostAndCancelCollection: TAction;
    CancelNotCollected1: TMenuItem;
    actRX_PostAndPrintAll: TAction;
    actRX_PostAndPrintLabel: TAction;
    PostRXandprintScriptandLabel1: TMenuItem;
    PostRXandprintScriptandLabel2: TMenuItem;
    N4: TMenuItem;
    dxgRXItemStandardFrmAdmin2_str: TdxDBGridColumn;
    lblProblem: TLabel;
    rxDate: TRzDBDateTimePicker;
    railerLabel1: TMenuItem;
    actRX_PrintTrailerLabel: TAction;
    actRX_PostPrintLabelAndTrailerLabel: TAction;
    PostRXandprintLabelsTrailerlabel1: TMenuItem;
    dxgRXItemStandardInputOrder_int: TdxDBGridColumn;
    rxLocation: TRzDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    dteNextVisit: TwwDBDateTimePicker;
    RzBmpButton1: TRzBmpButton;
    actRX_PrintAllergies: TAction;
    PrintPatientAllergies1: TMenuItem;
    DBText1: TDBText;
    PopUpAllergiesPrint: TPopupMenu;
    PrintPatientAllergies2: TMenuItem;
    actShowAllergiesDetails: TAction;
    rxPrescriberAll: TRzDBLookupComboBox;
    rxDispenserAll: TRzDBLookupComboBox;
    rxPrescriberCodeAll: TRzDBLookupComboBox;
    rxDispenserCodeAll: TRzDBLookupComboBox;
    FRM_ALL_Dispensers: TDataSource;
    FRM_ALL_Prescribers: TDataSource;
    actRX_PostPrintLabelAndTrailerLabelAddress: TAction;
    PostRXandprintItemsTrailerAddresslabels1: TMenuItem;
    atnEditRxLabel: TAction;
    atnEditAddressLabel: TAction;
    atnEditTrailerLabel: TAction;
    ppEditLabelsMenu: TPopupMenu;
    EditRxLabel1: TMenuItem;
    EditAddressLabel1: TMenuItem;
    EditTrailerLabel1: TMenuItem;
    DBText2: TDBText;
    Panel1: TPanel;
    Panel2: TPanel;
    atnCloseFrm: TAction;
    lblPrescriberSign: TLabel;
    dxDBGraphicEdit1: TdxDBGraphicEdit;
    dbQualification: TDBText;
    dxgRXItemStandardColumnSeperator: TdxDBGridGraphicColumn;
    DBText3: TDBText;
    Label3: TLabel;
    RzBmpButton2: TRzBmpButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pnlRXBackgroundResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGridView_StandardExecute(Sender: TObject);
    procedure actGridView_LabelsExecute(Sender: TObject);
    procedure actRXItem_ChangeDirectionsExecute(Sender: TObject);
    procedure actRXItem_ChangeInterventionExecute(Sender: TObject);
    procedure actData_FirstExecute(Sender: TObject);
    procedure actData_PriorExecute(Sender: TObject);
    procedure actData_NextExecute(Sender: TObject);
    procedure actData_LastExecute(Sender: TObject);
    procedure actData_AddExecute(Sender: TObject);
    procedure actData_DeleteExecute(Sender: TObject);
    procedure actData_PostExecute(Sender: TObject);
    procedure actData_CancelExecute(Sender: TObject);
    procedure actData_RefreshExecute(Sender: TObject);
    procedure tmrRXTimer(Sender: TObject);
    procedure actRX_PrintExecute(Sender: TObject);
    procedure actRX_PrintLabelsExecute(Sender: TObject);
    procedure actRX_PrintAddressLabelExecute(Sender: TObject);
    procedure actRX_ProtocolAddExecute(Sender: TObject);
    procedure actRX_StandardRegimenExecute(Sender: TObject);
    procedure actRX_PostExecute(Sender: TObject);
    procedure actRX_PostAndCancelExecute(Sender: TObject);
    procedure actRX_PostAndCancelCollectionExecute(Sender: TObject);
    procedure actRX_PostAndPrintAllExecute(Sender: TObject);
    procedure actRX_PostAndPrintLabelExecute(Sender: TObject);
    procedure actRX_PostPrintLabelAndTrailerLabelExecute(Sender: TObject);
    procedure actRX_PrintTrailerLabelExecute(Sender: TObject);
    procedure actRX_PrintAllergiesExecute(Sender: TObject);
    procedure actRX_PostPrintLabelAndTrailerLabelAddressExecute(
      Sender: TObject);
    procedure atnEditRxLabelExecute(Sender: TObject);
    procedure atnEditAddressLabelExecute(Sender: TObject);
    procedure atnEditTrailerLabelExecute(Sender: TObject);
    procedure DBText3DblClick(Sender: TObject);

  private
    FEnableDispenser: Boolean;
    procedure SetScreenFocus(_screenNo: Integer);
    procedure LoadPatientPages;
    procedure NotImplementetedInThisVersion;
    procedure SetButtons(_type: Integer = _EDIT_NORMAL);
    procedure SetScreenAvailablity(_type: Integer = _EDIT_NORMAL);
    procedure CheckIfFinalRepeatIsOverDue;

  public
    property EnableDispenser: Boolean read FEnableDispenser write FEnableDispenser;         
    //MC MANKGA ---13/08/2012
    procedure SetButtonRights(_userRights: Boolean);
    procedure SetScreenAvailablityRights(_userRights: Boolean; _editLabel: Boolean);
    function CanCloseForm: Boolean;
  end;

var
  frmRx : TfrmRX;  
implementation

uses PrescriptionDM, PrescriptionFRM_DirectionCapture,
  PrescriptionFRM_InterventionCapture, StdRegimenUNT,
  PrescriptionAllergiesUFrm, PrescriptionFRM_PasswordPin;

{$R *.dfm}

procedure TfrmRX.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 fPin: string; 
begin

  //********* 17 Feb 2014 SM
  //********* Password request after on close event
  if ModalResult = mrOK then
   begin

   if (not CanCloseForm) and (dmRX.GetPinBeforePost) and (not dmRX.qryRX.FieldByName('dispensingPosted_bol').AsBoolean) then
    begin
    MessageDlg('Cannot close prescription with no items added. Please cancel the prescription or add items.', mtWarning, [mbOk], 0);
    CanClose := False;
    end

   else if (dmRX.GetPinBeforePost) and (not dmRX.qryRX.FieldByName('dispensingPosted_bol').AsBoolean) then
    begin
    fPin := TRXPinBeforePost.Show;
    if (TRIM(fPin)=TRIM(dmRX.FUserPin)) then
    begin CanClose := True; end
    else
     begin
     MessageDlg('Password is incorrect. Unable to save and close the prescription', mtWarning, [mbOk], 0);
     CanClose := False;
     end;
    end;
   end;

  if ModalResult <> mrOK then
    if MessageDlg('Cancel and exit?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CanClose := True
      else
      CanClose := False;
end;

procedure TfrmRX.LoadPatientPages;
begin


  // Loads Patient data form
{  dmPatient                     := TdmPatient.Create(nil);
  dmPatient.Database            := dmRX.DatabaseConString;
  dmPatient.Security            := Security;
  dmPatient.Patient             := dmRX.PatientId;

  frmPatientDetail_             := TfrmPatientDetail_.Create(tbsPatient);
  frmPatientDetail_.Parent      := tbsPatient;
  frmPatientDetail_.Align       := alClient;
  frmPatientDetail_.BorderStyle := bsNone;
  frmPatientDetail_.Visible     := True;
 }

end;

procedure TfrmRX.NotImplementetedInThisVersion;
begin
  raise Exception.Create('Not implemented in this version.');
end;

procedure TfrmRX.FormCreate(Sender: TObject);
begin

  cxpRXItem_tsCmbStandard.TabVisible := False;
  cxpRXItem_tsLabels.TabVisible := False;
  cxpRXItem_tsPrescribing.TabVisible := False;
  cxpRXItem_tsDispensing.TabVisible := False;
  cxpRXItem_tsCmbDetailed.TabVisible := False;
  cxpRXItem_tsCmbStandardWithLabel.TabVisible := False;

  pgcPrescription.ActivePage := tbsRX;

  LoadPatientPages;     

end;

procedure TfrmRX.pnlRXBackgroundResize(Sender: TObject);
const
  FFrameWidth = 5;

var
  wid : integer;
  hgt : integer;
  halfForm : integer;
begin


  wid := (Sender as TPanel).Width;
  hgt := (Sender as TPanel).Height;

  halfForm := pnlForm_Header.Width div 2;
  pnlForm_Header.Left := (wid div 2) - halfForm;
  pnlForm_Header.Top := FFrameWidth;

  pnlForm_Footer.Left := (wid div 2) - halfForm;
  pnlForm_Footer.Top := hgt - pnlForm_Footer.Height - FFrameWidth ;

  pnlForm_Detail.Left   := (wid div 2) - halfForm;
  pnlForm_Detail.Top    := pnlForm_Header.Top + pnlForm_Header.Height + 1;
  pnlForm_Detail.Height := (pnlForm_Footer.Top - pnlForm_Detail.Top) -1 ;

 // if not (dmRX.qryRX.FieldByName('dispensingPosted_bol').AsBoolean) then
 //  dteNextVisit.MinDate := Now();

end;

procedure TfrmRX.FormShow(Sender: TObject);
begin   
//  dxgRXItemPrescribingOnlyFrmFormulation_Str.Items.Assign(dmRX.ListOfFormulation);
//  dxgRXItemPrescribingOnlyFrmInterval_Str.Items.Assign(dmRX.ListOfInterval);
//  dxgRXItemPrescribingOnlyFrmDirections_Str.Items.Assign(dmRX.ListOfDirections);
//  dxgRXItemPrescribingOnlyFrmICDCode_Str.Items.Assign(dmRX.ListOfICD);

  pgcPrescription.ActivePage := tbsRX;
  dxgRXItemStandardFrmFormulation_Str.Items.Assign(dmRX.ListOfFormulation);
  dxgRXItemStandardFrmInterval_Str.Items.Assign(dmRX.ListOfInterval);
  dxgRXItemStandardFrmDirections_Str.Items.Assign(dmRX.ListOfDirections);
  SetScreenFocus(0);


  //Check if there are any patient allergies
  //Bug Issue 699
  DBText3.Visible := dmRx.CheckPatientAllergies; 
  //END Bug Issue 699

  dmRX.LoadProtocolsDisplay;

 if (not dmRX.FCanEditRecord) then
  frmRx.Caption := 'Browse Only';      
   
 //******* Check if Final Repeat is Over Due
 CheckIfFinalRepeatIsOverDue;

 dmRX.LoadCustomReports;

end;

procedure TfrmRX.actGridView_StandardExecute(Sender: TObject);
begin

  SetScreenFocus(0);

end;

procedure TfrmRX.actGridView_LabelsExecute(Sender: TObject);
begin

  SetScreenFocus(1);

end;

procedure TfrmRX.actRXItem_ChangeDirectionsExecute(Sender: TObject);

begin
  SetScreenFocus(2);
end;

procedure TfrmRX.SetScreenFocus(_screenNo: Integer);
begin

  case _screenNo of
    0 :
      begin
      cxgLabelsCv.DataController.DataSource := nil;
      dxgRXItemStandard.DataSource := FRM_RXItem;
      dmRX.ListOfProducts := dxgRXItemStandardDspProduct_Str.Items;
      dmRX.ForceProductListUpdate;
      cxpRXItem.ActivePage := cxpRXItem_tsCmbStandard;
      dxgRXItemStandard.SetFocus;
      end;
    1 :
      begin
      cxgLabelsCv.DataController.DataSource := FRM_RXItem;
      cxpRXItem.ActivePage := cxpRXItem_tsLabels;
      dxgRXItemStandard.DataSource := nil;
      end;
    2 : TDirections.Edit;
    3 : TIntervention.Edit;
    end;

end;

procedure TfrmRX.actRXItem_ChangeInterventionExecute(Sender: TObject);
begin
  SetScreenFocus(3);
end;

procedure TfrmRX.actData_FirstExecute(Sender: TObject);
begin

  try
  if not dmRX.qryRXItem.Bof then dmRX.qryRXItem.First;
  except
  end;

end;

procedure TfrmRX.actData_PriorExecute(Sender: TObject);
begin
  try
  if not dmRX.qryRXItem.Bof then dmRX.qryRXItem.Prior;
  except
  end;
end;

procedure TfrmRX.actData_NextExecute(Sender: TObject);
begin

  try
  if not dmRX.qryRXItem.Eof then dmRX.qryRXItem.Next;
  except
  end;

end;

procedure TfrmRX.actData_LastExecute(Sender: TObject);
begin

  try
  if not dmRX.qryRXItem.Eof then dmRX.qryRXItem.Last;
  except
  end;

end;

procedure TfrmRX.actData_AddExecute(Sender: TObject);
begin

  try
  dmRX.qryRXItem.Append;
  except
  end;

end;

procedure TfrmRX.actData_DeleteExecute(Sender: TObject);
begin

  try
  if MessageDlg('Delete currently selected item?', mtWarning, [mbYes, mbNo, mbCancel],0) = mrYes
    then dmRX.qryRXItem.Delete;
  except
  end;

end;

procedure TfrmRX.actData_PostExecute(Sender: TObject);
begin

  try
  dmRX.qryRXItem.Post;
  except
  end;

end;

procedure TfrmRX.actData_CancelExecute(Sender: TObject);
begin

  try
  dmRX.qryRXItem.Cancel;
  except
  end;

end;

procedure TfrmRX.actData_RefreshExecute(Sender: TObject);
begin

  try
  dmRX.qryRXItem.Refresh;
  except
  end;

end;

procedure TfrmRX.tmrRXTimer(Sender: TObject);
begin
if Lowercase(lblPosted.Caption) = Lowercase(STATUSDESC_POSTALL) then
    begin
    lblPosted.Font.Color := clRed;
    lblPosted.Font.Size := 18;
    end else if Lowercase(lblPosted.Caption) = Lowercase(STATUSDESC_STATUS) then
    begin
    lblPosted.Font.Color := clBlue;
    lblPosted.Font.Size := 18;
    end else
    begin
    lblPosted.Font.Color := clGray;
    lblPosted.Font.Size := 18;
    DBText1.Font.Size := 15;
    DBText1.Font.Color := clGray;
    DBText1.Visible := True;
    end;

  with lblRxRepeatStatus do
    if LowerCase(Caption) = Lowercase('FINAL REPEAT') then
      begin
      Font.Color := clRed;
      Font.Size := 22;
      end
      else
      begin
      Font.Color := clGray;
      Font.Size := 18;
      end;
  SetButtons(dmRX.CurrentEditStatus);
  SetScreenAvailablity(dmRX.CurrentEditStatus);
 
end;

procedure TfrmRX.actRX_PrintExecute(Sender: TObject);
begin
 dmRX.Print;
end;

procedure TfrmRX.actRX_PrintLabelsExecute(Sender: TObject);
begin

 if (not dmRX.PostBeforPrint) then
  dmRX.PrintLabels
 else
  begin
  if (not dmRX.qryRXdispensingPosted_bol.AsBoolean) then
   MessageDlg('You cannot print labels before the the prescrition has been posted.', mtWarning, [mbOk], 0)
  else
   dmRX.PrintLabels
  end;

end;

procedure TfrmRX.actRX_PrintAddressLabelExecute(Sender: TObject);
begin
  dmRX.PrintAddress;
end;

procedure TfrmRX.SetButtons(_type: Integer = _EDIT_NORMAL);
begin
  if dmRX.qryRXItem.Active then
    begin
    if dmRX.qryRXItem.Eof then actData_Last.Enabled := False else actData_Last.Enabled := True;
    if dmRX.qryRXItem.Eof then actData_Next.Enabled := False else actData_Next.Enabled := True;
    if dmRX.qryRXItem.Bof then actData_First.Enabled := False else actData_First.Enabled := True;
    if dmRX.qryRXItem.Bof then actData_Prior.Enabled := False else actData_Prior.Enabled := True;
    if not (dmRX.qryRXItem.State in [dsEdit, dsInsert]) then actData_Post.Enabled := False else actData_Post.Enabled := True;
    if not (dmRX.qryRXItem.State in [dsEdit, dsInsert]) then actData_Cancel.Enabled := False else actData_Cancel.Enabled := True;
    actData_Refresh.Enabled := True;
    
    case _type of
      _EDIT_NORMAL: // normal new RX
        begin
        if dmRX.qryRXItem.RecordCount < 1 then actData_Delete.Enabled := False else actData_Delete.Enabled := True;
        actData_Add.Enabled := True;
        end;
      _EDIT_REPEAT: // normal new RX
        begin
        actData_Delete.Enabled := False;
        actData_Add.Enabled := False;
        end;
      _EDIT_POSTEDCOLLECTED: // normal new RX
        begin
        actData_Delete.Enabled := False;
        actData_Add.Enabled := False;
        end;
      _EDIT_POSTEDNOTCOLLECTED: // normal new RX
        begin
        actData_Delete.Enabled := False;
        actData_Add.Enabled := False;
        end;
      end;//case

    end else
    begin
    actData_Last.Enabled := False;
    actData_Next.Enabled := False;
    actData_First.Enabled := False;
    actData_Prior.Enabled := False;
    actData_Delete.Enabled := False;
    actData_Post.Enabled := False;
    actData_Cancel.Enabled := False;
    actData_Add.Enabled := False;
    actData_Refresh.Enabled := False; 
    end;  
end;

//MC MANKGA --13/08/2012
procedure TfrmRX.SetButtonRights(_userRights: Boolean);
begin
if (_userRights = False) then
begin
    actData_Delete.Enabled := False;
    actData_Add.Enabled := False;
    actData_Prior.Enabled := False;
    actData_Post.Enabled := False;
    actData_Cancel.Enabled := False;
    actData_Refresh.Enabled := False;

end else
      begin
         tmrRX.Interval := 1000;
      end;
end;

procedure TfrmRX.SetScreenAvailablityRights(_userRights: Boolean; _editLabel: Boolean);
begin

if (_editLabel = False) then
 begin
 atnEditRxLabel.Visible         := False;
 atnEditAddressLabel.Visible    := False;
 atnEditTrailerLabel.Visible    := False;
 end;

if (_userRights = False) then
begin
tmrRX.Interval := 1000000000;
    // form header
      rxClinic.Enabled := False;
      rxLocation.Enabled := False;
      rxNaive.Enabled := False;
      rxPregnant.Enabled := False;
      rxReferred.Enabled := False;
      rxDemander.Enabled := False;

      //rxPrescriberCode.Enabled := False;
      //rxPrescriber.Enabled := False;
      //rxDispenser.Enabled := False;
      //rxDispenserCode.Enabled := False;

      rxPrescriberCode.Visible := False;
      rxPrescriberCode.Enabled := False;
      rxPrescriber.Visible := False;
      rxPrescriber.Enabled := False;

      rxDispenserCode.Visible := False;
      //rxDispenserCode.Enabled := False;
      rxDispenser.Visible := False;
      //rxDispenser.Enabled := False;
      
      //MC - 28/03/2012
      rxPrescriberCodeAll.Visible := True;
      rxPrescriberCodeAll.Enabled := False;
      rxPrescriberAll.Enabled := False;
      rxPrescriberAll.Visible := True;

      rxDispenserCodeAll.Visible := True;
      rxDispenserAll.Visible := True;
      rxDispenserAll.Enabled := False;
      rxDispenserCodeAll.Enabled := False;

      regICDCode.Enabled := False;
      regICDDesc.Enabled := False;
      regInterventionProblem.Enabled := False;
      regInterventionOutcome.Enabled := False;
      regBatchNumber.Enabled := False;
      //regWithHeld.Enabled := False;

      // Grid main
      dxgRXItemStandard.OptionsView := dxgRXItemStandard.OptionsView + [edgoRowSelect];

      // Card View
      cxgLabelsCvlabel_Line03_str.Options.Editing := False;

      // Actions
      actRXItem_ChangeDirections.Enabled := False;
      actRXItem_ChangeIntervention.Enabled := False;
      actRX_Post.Enabled := False;
      actRX_PostAndPrintAll.Enabled := False;
      actRX_PostAndPrintLabel.Enabled := False;
      actRX_PostAndCancel.Enabled := False;
      actRX_PostAndCancelCollection.Enabled := True;
      actRX_ProtocolAdd.Enabled := False;
      actRX_StandardRegimen.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabel.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabelAddress.Enabled := False;
      end else
      begin
         tmrRX.Interval := 1000;
      end;
end;

procedure TfrmRX.SetScreenAvailablity(_type: Integer = _EDIT_NORMAL);
begin

  case _type of
    _EDIT_NORMAL:
      begin
      // form header
      rxClinic.Enabled := True;
      rxNaive.Enabled := True;
      rxPregnant.Enabled := True;
      rxReferred.Enabled := True;
      rxDemander.Enabled := True;
      
      rxDate.Enabled     := (not dmRX.NonEditableRxDate) and (not dmRX.qryRXdispensingPosted_bol.AsBoolean);

      rxPrescriberCode.Enabled := True;
      rxPrescriberCode.Visible := True;
      rxPrescriber.Visible := True;
      rxPrescriber.Enabled := True;
      rxDispenser.Visible := True;
      rxDispenser.Enabled := True;//FEnableDispenser;
      rxDispenserCode.Visible := True;
      rxDispenserCode.Enabled := True;// FEnableDispenser;
      rxLocation.Enabled := True;

      //MC - 28/03/2012
      rxPrescriberCodeAll.Visible := False;
      rxPrescriberAll.Visible := False;
      rxDispenserAll.Visible := False;
      rxDispenserCodeAll.Visible := False;

      regICDCode.Enabled := True;
      regICDDesc.Enabled := True;
      regInterventionProblem.Enabled := True;
      regInterventionOutcome.Enabled := True;
      regBatchNumber.Enabled := True;
      //regWithHeld.Enabled := True;

      // Grid main
      dxgRXItemStandard.OptionsDB := dxgRXItemStandard.OptionsDB + [edgoCanAppend, edgoCanDelete, edgoCanInsert];
      dxgRXItemStandard.OptionsView := dxgRXItemStandard.OptionsView - [edgoRowSelect];

      //Gridview
      dxgRXItemStandardFrmFormulation_Str.TabStop := True;
      dxgRXItemStandardFrmSKU_Dbl.TabStop := True;
      dxgRXItemStandardFrmInterval_Str.TabStop := True;
      dxgRXItemStandardFrmDuration_Dbl.TabStop := True;
      dxgRXItemStandardFrmRepeat_Dbl.TabStop := True;
      dxgRXItemStandardFrmDirections_Str.TabStop := True;
      dxgRXItemStandardDspProduct_Str.TabStop := True;
      dxgRXItemStandardDspSKUActual_Dbl.TabStop := True;
      dxgRXItemStandardDspProductBreakPack_Bol.TabStop := True;

      dxgRXItemStandardFrmFormulation_Str.DisableEditor := False;
      dxgRXItemStandardFrmSKU_Dbl.DisableEditor := False;
      dxgRXItemStandardFrmInterval_Str.DisableEditor := False;
      dxgRXItemStandardFrmDuration_Dbl.DisableEditor := False;
      dxgRXItemStandardFrmRepeat_Dbl.DisableEditor := False;
      dxgRXItemStandardFrmDirections_Str.DisableEditor := False;
      dxgRXItemStandardDspProduct_Str.DisableEditor := False;
      dxgRXItemStandardDspSKUActual_Dbl.DisableEditor := False;
      dxgRXItemStandardDspProductBreakPack_Bol.DisableEditor := False;
      dxgRXItemStandardDspNotDispensed_Bol.DisableEditor := False;

      // Card View
      cxgLabelsCvlabel_Line03_str.Options.Editing := True;

      // Actions
      actRXItem_ChangeDirections.Enabled := True;
      actRXItem_ChangeIntervention.Enabled := True;
      actRX_Post.Enabled := True;
      actRX_PostAndPrintAll.Enabled := True;
      actRX_PostAndPrintLabel.Enabled := True;
      actRX_PostAndCancel.Enabled := True;
      actRX_PostAndCancelCollection.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabel.Enabled := True;
      actRX_PostPrintLabelAndTrailerLabelAddress.Enabled := True;

      actRX_ProtocolAdd.Enabled := True;
      actRX_StandardRegimen.Enabled := True;

    //******** If user assigned to Dispenser only then dis-able formulation columns
    if dmRX.GetPinBeforePost then
      if (dmRX.FCanDispenseOnly) then
       begin
       dxgRXItemStandardFrmFormulation_Str.DisableEditor := True;
       dxgRXItemStandardFrmSKU_Dbl.DisableEditor := True;
       dxgRXItemStandardFrmInterval_Str.DisableEditor := True;
       dxgRXItemStandardFrmDuration_Dbl.DisableEditor := True;
       dxgRXItemStandardFrmRepeat_Dbl.DisableEditor := True;

       actData_Add.Enabled := False;
       actData_Delete.Enabled := False;
       actRX_ProtocolAdd.Enabled := False;
       actRX_StandardRegimen.Enabled := False;

       actRX_ProtocolAdd.Enabled := False;
       actRX_StandardRegimen.Enabled := False;
       end;

    //******** If user assigned to Prescriber only then dis-able dispensing columns
    if dmRX.GetPinBeforePost then
      if (dmRX.FCanPrescribeOnly) then
       begin
       dxgRXItemStandardDspProduct_Str.Visible := False;
       dxgRXItemStandardDspSKUActual_Dbl.Visible := False;
       dxgRXItemStandardDspProductCalc_Dbl.Visible := False;
       dxgRXItemStandardDspNotDispensed_Bol.Visible := False;
       dxgRXItemStandardDspProductBreakPack_Bol.Visible := False;
       dxgRXItemStandardFrmDirections_Str.Visible := False;
       dxgRXItemStandardFrmAdmin2_str.Visible := False;

       dxgRXItemStandardDspProduct_Str.DisableEditor := True;
       dxgRXItemStandardDspSKUActual_Dbl.DisableEditor := True;
       dxgRXItemStandardDspProductCalc_Dbl.DisableEditor := True;
       dxgRXItemStandardDspNotDispensed_Bol.DisableEditor := True;
       dxgRXItemStandardDspProductBreakPack_Bol.DisableEditor := True;
       dxgRXItemStandardFrmDirections_Str.DisableEditor := True;
       dxgRXItemStandardFrmAdmin2_str.DisableEditor := True;
       end;

      //Disable Drop downs if default prescriber selected //Disable Drop downs if Default Dispenser Selected
      if dmRX.NonEditableScriptDropDowns then
       if (dmRX.qryRX.FieldByName('Prescriber_ID').AsString <> '') or (dmRX.qryRX.FieldByName('Dispenser_ID').AsString <> '') then
       begin
       rxPrescriberCode.Enabled := False;
       rxPrescriberCode.Visible := True;
       rxPrescriber.Visible := True;
       rxPrescriber.Enabled := False;

       rxDispenser.Visible := True;
       rxDispenser.Enabled := False;//FEnableDispenser;
       rxDispenserCode.Visible := True;
       rxDispenserCode.Enabled := False;// FEnableDispenser;
       end;

      if dmRX.NonEditableScriptDropDowns then
       if (dmRX.qryRX.FieldByName('DemanderUnique_ID').AsString <> '') then
        begin
        rxDemander.Enabled := False;
        end;

      //******* If Prescriber Different from the original then User cannot edit Precribing
     if dmRX.GetPinBeforePost then
      if (dmRX.FNotSamePrescriber) then
        begin
        // Actions
        actRX_ProtocolAdd.Enabled := False;
        actRX_StandardRegimen.Enabled := False;
        actData_Add.Enabled := False;
        actData_Delete.Enabled  := False;

        dxgRXItemStandardFrmFormulation_Str.DisableEditor := True;
        dxgRXItemStandardFrmSKU_Dbl.DisableEditor := True;
        dxgRXItemStandardFrmInterval_Str.DisableEditor := True;
        dxgRXItemStandardFrmDuration_Dbl.DisableEditor := True;
        dxgRXItemStandardFrmRepeat_Dbl.DisableEditor := True;
        end;

      end;

    _EDIT_REPEAT:
      begin
      // form header
      rxClinic.Enabled := True;
      rxLocation.Enabled := True;
      rxNaive.Enabled := False;
      rxPregnant.Enabled := True;
      rxReferred.Enabled := True;
      rxDemander.Enabled := True;
      //MC - 28/03/2012
      rxPrescriberCode.Enabled := False;
      rxPrescriberCode.Visible := False;
      rxPrescriber.Enabled := False;
      rxPrescriber.Visible := False;

      rxDispenser.Visible := True;
      rxDispenser.Enabled := True;//FEnableDispenser;
      rxDispenserCode.Enabled := True;//FEnableDispenser;
      rxDispenserCode.Visible := True;

      rxPrescriberCodeAll.Visible := True;
      rxPrescriberCodeAll.Enabled := False;
      rxPrescriberAll.Visible := True;
      rxPrescriberAll.Enabled := False;

      rxDispenserAll.Visible := False;
      rxDispenserAll.Enabled := False;//FEnableDispenser;
      rxDispenserCodeAll.Enabled := False;//FEnableDispenser;
      rxDispenserCodeAll.Visible := False;

      regICDCode.Enabled := False;
      regICDDesc.Enabled := False;
      regInterventionProblem.Enabled := True;
      regInterventionOutcome.Enabled := True;
      regBatchNumber.Enabled := True;
      //regWithHeld.Enabled := True;

      // Grid main
      dxgRXItemStandard.OptionsDB := dxgRXItemStandard.OptionsDB - [edgoCanAppend, edgoCanDelete, edgoCanInsert];
      dxgRXItemStandard.OptionsView := dxgRXItemStandard.OptionsView - [edgoRowSelect];

      //Gridview
      dxgRXItemStandardFrmFormulation_Str.TabStop := False;
      dxgRXItemStandardFrmSKU_Dbl.TabStop := False;
      dxgRXItemStandardFrmInterval_Str.TabStop := False;
      dxgRXItemStandardFrmDuration_Dbl.TabStop := False;
      dxgRXItemStandardFrmRepeat_Dbl.TabStop := False;
      dxgRXItemStandardFrmDirections_Str.TabStop := True;
      dxgRXItemStandardDspProduct_Str.TabStop := True;
      dxgRXItemStandardDspSKUActual_Dbl.TabStop := True;
      dxgRXItemStandardDspProductBreakPack_Bol.TabStop := True;

      dxgRXItemStandardFrmFormulation_Str.DisableEditor := True;
      dxgRXItemStandardFrmSKU_Dbl.DisableEditor := True;
      dxgRXItemStandardFrmInterval_Str.DisableEditor := True;
      dxgRXItemStandardFrmDuration_Dbl.DisableEditor := True;
      dxgRXItemStandardFrmRepeat_Dbl.DisableEditor := True;
      dxgRXItemStandardFrmDirections_Str.DisableEditor := False;
      dxgRXItemStandardDspProduct_Str.DisableEditor := False;
      dxgRXItemStandardDspSKUActual_Dbl.DisableEditor := False;
      dxgRXItemStandardDspProductBreakPack_Bol.DisableEditor := False;
      dxgRXItemStandardDspNotDispensed_Bol.DisableEditor := False;
      // Card View
      cxgLabelsCvlabel_Line03_str.Options.Editing := True;
      // Actions
      actRXItem_ChangeDirections.Enabled := True;
      actRXItem_ChangeIntervention.Enabled := True;
      actRX_Post.Enabled := True;
      actRX_PostAndCancel.Enabled := True;
      actRX_PostAndPrintAll.Enabled := True;
      actRX_PostAndPrintLabel.Enabled := True;
      actRX_PostAndCancelCollection.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabel.Enabled := True;
      actRX_PostPrintLabelAndTrailerLabelAddress.Enabled := True;

      actRX_ProtocolAdd.Enabled := False;
      actRX_StandardRegimen.Enabled := False;

      //******** If user assigned to Dispenser only then dis-able formulation columns

      //Disable Drop downs if default prescriber selected //Disable Drop downs if Default Dispenser Selected
      if dmRX.GetPinBeforePost then
       if (dmRX.qryRX.FieldByName('Dispenser_ID').AsString <> '') then
       begin
       rxDispenser.Visible := True;
       rxDispenser.Enabled := False;//FEnableDispenser;
       rxDispenserCode.Visible := True;
       rxDispenserCode.Enabled := False;// FEnableDispenser;
       end;

      rxDate.Enabled     := True and (not dmRX.qryRXdispensingPosted_bol.AsBoolean);
      end;

    _EDIT_POSTEDCOLLECTED:
      begin
      // form header
      rxClinic.Enabled := False;
      rxLocation.Enabled := False;
      rxNaive.Enabled := False;
      rxPregnant.Enabled := False;
      rxReferred.Enabled := False;
      rxDemander.Enabled := False;


      //rxPrescriberCode.Enabled := False;
      //rxPrescriber.Enabled := False;
      //rxDispenser.Enabled := False;
      //rxDispenserCode.Enabled := False;

      rxPrescriberCode.Visible := False;
      rxPrescriberCode.Enabled := False;
      rxPrescriber.Visible := False;
      rxPrescriber.Enabled := False;

      rxDispenserCode.Visible := False;
      rxDispenserCode.Enabled := False;
      rxDispenser.Visible := False;
      rxDispenser.Enabled := False;
      
      //MC - 28/03/2012
      rxPrescriberCodeAll.Visible := True;
      rxPrescriberCodeAll.Enabled := False;
      rxPrescriberAll.Enabled := False;
      rxPrescriberAll.Visible := True;

      rxDispenserCodeAll.Visible := True;
      rxDispenserAll.Visible := True;
      rxDispenserAll.Enabled := False;
      rxDispenserCodeAll.Enabled := False;

      regICDCode.Enabled := False;
      regICDDesc.Enabled := False;
      regInterventionProblem.Enabled := False;
      regInterventionOutcome.Enabled := False;
      regBatchNumber.Enabled := False;
      //regWithHeld.Enabled := False;

      // Grid main
      dxgRXItemStandard.OptionsView := dxgRXItemStandard.OptionsView + [edgoRowSelect];

      // Card View
      cxgLabelsCvlabel_Line03_str.Options.Editing := False;

      // Actions
      actRXItem_ChangeDirections.Enabled := False;
      actRXItem_ChangeIntervention.Enabled := False;
      actRX_Post.Enabled := False;
      actRX_PostAndPrintAll.Enabled := False;
      actRX_PostAndPrintLabel.Enabled := False;
      actRX_PostAndCancel.Enabled := False;
      actRX_PostAndCancelCollection.Enabled := True;
      actRX_ProtocolAdd.Enabled := False;
      actRX_StandardRegimen.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabel.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabelAddress.Enabled := False;

      rxDate.Enabled     := False;
      end;

    _EDIT_POSTEDNOTCOLLECTED:
      begin
      // form header
      rxClinic.Enabled := False;
      rxLocation.Enabled := False;       
      rxNaive.Enabled := False;
      rxPregnant.Enabled := False;
      rxReferred.Enabled := False;
      rxDemander.Enabled := False;


    //  rxPrescriberCode.Enabled := False;
   //   rxPrescriber.Enabled := False;
     // rxDispenser.Enabled := False;
     // rxDispenserCode.Enabled := False;

      rxPrescriberCode.Enabled := False;
      rxPrescriberCode.Visible := False;
      rxPrescriber.Enabled := False;
      rxPrescriber.Visible := False;
      rxDispenserCode.Enabled := False;
      rxDispenserCode.Enabled := False;
      rxDispenser.Enabled := False;
      rxDispenser.Visible := False;

      //MC - 28/03/2012
      rxPrescriberCodeAll.Visible := True;
      rxPrescriberCodeAll.Enabled := False;
      rxPrescriberAll.Visible := True;
      rxPrescriberAll.Enabled := False;
      
      rxDispenserAll.Visible := True;
      rxDispenserAll.Enabled := False;
      rxDispenserCodeAll.Visible := True;
      rxDispenserCodeAll.Enabled := False;
      
      regICDCode.Enabled := False;
      regICDDesc.Enabled := False;
      regInterventionProblem.Enabled := False;
      regInterventionOutcome.Enabled := False;
      regBatchNumber.Enabled := True;
      //regWithHeld.Enabled := True;

      // Grid main
      dxgRXItemStandard.OptionsDB := dxgRXItemStandard.OptionsDB - [edgoCanAppend, edgoCanDelete, edgoCanInsert];
      dxgRXItemStandard.OptionsView := dxgRXItemStandard.OptionsView - [edgoRowSelect];

      //Gridview
      dxgRXItemStandardFrmFormulation_Str.TabStop := False;
      dxgRXItemStandardFrmSKU_Dbl.TabStop := False;
      dxgRXItemStandardFrmInterval_Str.TabStop := False;
      dxgRXItemStandardFrmDuration_Dbl.TabStop := False;
      dxgRXItemStandardFrmRepeat_Dbl.TabStop := False;
      dxgRXItemStandardFrmDirections_Str.TabStop := False;
      dxgRXItemStandardDspProduct_Str.TabStop := False;
      dxgRXItemStandardDspSKUActual_Dbl.TabStop := False;
      dxgRXItemStandardDspProductBreakPack_Bol.TabStop := False;

      dxgRXItemStandardFrmFormulation_Str.DisableEditor := True;
      dxgRXItemStandardFrmSKU_Dbl.DisableEditor := True;
      dxgRXItemStandardFrmInterval_Str.DisableEditor := True;
      dxgRXItemStandardFrmDuration_Dbl.DisableEditor := True;
      dxgRXItemStandardFrmRepeat_Dbl.DisableEditor := True;
      dxgRXItemStandardFrmDirections_Str.DisableEditor := True;
      dxgRXItemStandardDspProduct_Str.DisableEditor := True;
      dxgRXItemStandardDspSKUActual_Dbl.DisableEditor := True;
      dxgRXItemStandardDspProductBreakPack_Bol.DisableEditor := True;
      dxgRXItemStandardDspNotDispensed_Bol.DisableEditor := True;

      // Card View
      cxgLabelsCvlabel_Line03_str.Options.Editing := True;

      // Actions
      actRXItem_ChangeDirections.Enabled := False;
      actRXItem_ChangeIntervention.Enabled := False;
      actRX_Post.Enabled := False;
      actRX_PostAndPrintAll.Enabled := False;
      actRX_PostAndPrintLabel.Enabled := False;
      actRX_PostAndCancel.Enabled := False;
      actRX_PostAndCancelCollection.Enabled := False;
      actRX_ProtocolAdd.Enabled := False;
      actRX_StandardRegimen.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabel.Enabled := False;
      actRX_PostPrintLabelAndTrailerLabelAddress.Enabled := False;

      rxDate.Enabled     := False;
      end;   
    end;//case    
end;

procedure TfrmRX.actRX_ProtocolAddExecute(Sender: TObject);
var
  stdReg : TStdRegimen;
  retStr : string;
begin

  dmRx.SaveAll;//Bug Issue 708

  stdReg := TStdRegimen.Create(dmRX.conRX.ConnectionString);
  retStr  := stdReg.ProtocolListFromRX(dmRX.RXId);
  if retStr <> '' then
    begin
    dmRX.UpdateRX(retStr);
    end;// else MessageDlg(retStr, mtwarning, [mbok],0);
  stdReg.Free;

  //******* Refresh Protocol Display
  dmRX.LoadProtocolsDisplay; 

end;

procedure TfrmRX.actRX_StandardRegimenExecute(Sender: TObject);
var
  stdReg : TStdRegimen;
  retStr : string;
begin

  dmRx.SaveAll;//Bug Issue 708
  stdReg := TStdRegimen.Create(dmRX.conRX.ConnectionString);
  retStr  := stdReg.RegimenListFromRX(dmRX.RXId);
  if retStr <> '' then
    begin
    dmRX.UpdateRX(retStr);
    end;// else MessageDlg(retStr, mtwarning, [mbok],0);

  stdReg.Free;
end;


procedure TfrmRX.actRX_PostExecute(Sender: TObject);
begin

  if dmRX.qryRXItem.State in [dsEdit, dsInsert] then
   dmRX.qryRXItem.Post;

  if dmRX.qryRX.State in [dsEdit, dsInsert] then
   dmRX.qryRX.Post;

  dmRX.Post;

end;

//MC  MANKGA 31/08/2010
procedure TfrmRX.actRX_PostAndCancelExecute(Sender: TObject);
const
   PMSG = 'WARNING' + #13 +'Once you Cancel/Stop RX this record can no longer be edited.' + #13 + #13 + 'Continue to Cancel/Stop RX?';
begin
 if MessageDlg(PMSG , mtWarning, [mbYes, mbNo], 0) = mrYes then
 begin
  if dmRX.qryRXItem.State in [dsEdit, dsInsert] then dmRX.qryRXItem.Post;
   dmRX.PostAndCancel;
   end
 else
   Abort;
end;

procedure TfrmRX.actRX_PostAndCancelCollectionExecute(Sender: TObject);
begin

  if dmRX.qryRXItem.State in [dsEdit, dsInsert] then
   dmRX.qryRXItem.Post;

  if MessageDlg('Rx not collected - Cancel and remove stock?' + #13 + 'This cannot be reversed.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    dmRX.PostAndCancelCollection;
  
end;

procedure TfrmRX.actRX_PostAndPrintAllExecute(Sender: TObject);
begin

  if dmRX.qryRXItem.State in [dsEdit, dsInsert] then
   dmRX.qryRXItem.Post;
   
  if dmRX.Post then
    begin
    dmRX.Print(False);
    dmRX.PrintLabels(False);
    dmRX.PrintAddress(False);
 //   dmRX.PrintTrailerLabels(False);
    end;

end;

procedure TfrmRX.actRX_PostAndPrintLabelExecute(Sender: TObject);
begin
  if dmRX.qryRXItem.State in [dsEdit, dsInsert] then
   dmRX.qryRXItem.Post;
   
  if dmRX.Post then
    dmRX.PrintLabels(False);
end;

procedure TfrmRX.actRX_PostPrintLabelAndTrailerLabelExecute(Sender: TObject);
begin

  if dmRX.qryRXItem.State in [dsEdit, dsInsert] then
   dmRX.qryRXItem.Post;

  if dmRX.Post then
    begin
    dmRX.PrintLabels;
    dmRX.PrintTrailerLabels;
    end;
end;

procedure TfrmRX.actRX_PrintTrailerLabelExecute(Sender: TObject);
begin

  if dmRX.qryRXItem.State in [dsEdit, dsInsert] then
    dmRX.qryRXItem.Post;

  if (not dmRX.PostBeforPrint) then
    dmRX.PrintTrailerLabels
  else
   begin
   if (not dmRX.qryRXdispensingPosted_bol.AsBoolean) then
    MessageDlg('You cannot print labels before the the prescrition has been posted.', mtWarning, [mbOk], 0)
   else
    dmRX.PrintTrailerLabels;
   end;

end;

procedure TfrmRX.actRX_PrintAllergiesExecute(Sender: TObject);
begin
 dmRX.PrintAllergies;
end;

procedure TfrmRX.actRX_PostPrintLabelAndTrailerLabelAddressExecute(
  Sender: TObject);
begin

if dmRX.qryRXItem.State in [dsEdit, dsInsert] then
   dmRX.qryRXItem.Post;

  if dmRX.Post then
    begin
    dmRX.PrintLabels(False);
    dmRX.PrintTrailerLabels;
    dmRX.PrintAddress;
    end;
end;

procedure TfrmRX.atnEditRxLabelExecute(Sender: TObject);
begin
 dmRX.EditRxLabel(0);
end;

procedure TfrmRX.atnEditAddressLabelExecute(Sender: TObject);
begin
 dmRX.EditRxLabel(1);
end;

procedure TfrmRX.atnEditTrailerLabelExecute(Sender: TObject);
begin
 dmRX.EditRxLabel(2);
end;

procedure TfrmRX.CheckIfFinalRepeatIsOverDue;
begin
 if dmRX.IsRepeatRxOverDue then
  begin
  MessageDlg('Repeat is over-due for collection. Do you want to cancel the prescription?', mtWarning, [mbOk], 0);
  //******** Pop up Cancel Rx Form
  actRX_PostAndCancel.Execute;
  end;
end;

function TfrmRX.CanCloseForm: Boolean;
begin

 //******** Return True if number of items is more then 0 
 with dmRX.qryRXItem do
  begin
  if (RecordCount > 0) then Result := True
  else Result := False;
  end;

end;

procedure TfrmRX.DBText3DblClick(Sender: TObject);
begin
 dmRX.PrintAllergies(True);
end;

end.

