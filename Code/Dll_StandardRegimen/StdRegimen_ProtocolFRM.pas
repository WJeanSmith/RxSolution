unit StdRegimen_ProtocolFRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, DB, RzDlgBtn,
  RzLine, ElPopBtn, DBCtrls, ExtCtrls, StdCtrls, RzLabel, RzDBLbl, ActnList,
  PrescriptionUtilities, dxDBTLCl, dxGrClms, Menus;


  {, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, dxExEdtr, StdCtrls, Mask, RzEdit, RzDBEdit, cxContainer,
  cxCheckBox, cxDBEdit, RzBckgnd, dxDBTLCl, dxGrClms, dxDBGrid, dxDBCtrl,
  dxTL, dxCntner, cxGridLevel, cxGridCustomTableView, cxGridCardView,
  cxGridDBCardView, cxClasses, cxControls, cxGridCustomView, cxGrid, cxPC,
  ElPopBtn, DBCtrls, RzDBCmbo, RzButton, RzRadChk, RzDBChk, RzLine,
  ExtCtrls, RzLabel, RzDBLbl, RzDlgBtn;
  }


type
  TProtocol = class;
  TfrmProtocol = class(TForm)
    pnlRXBackground: TPanel;
    pnlForm_Footer: TPanel;
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
    btnSave: TElSpeedButton;
    btnCancel: TElSpeedButton;
    sep_02: TPanel;
    sep_01: TPanel;
    sep_03: TPanel;
    FRM_Protocol: TDataSource;
    pnlForm_Header: TPanel;
    lne_01: TRzLine;
    lblProtocolHeading: TLabel;
    rzdbMain: TRzDialogButtons;
    lblView_Standard: TLabel;
    dxgProtocolList: TdxDBGrid;
    dxgProtocolListCode_Str: TdxDBGridColumn;
    dxgProtocolListName_Str: TdxDBGridColumn;
    aclProtocol: TActionList;
    actData_First: TAction;
    actData_Prior: TAction;
    actData_Next: TAction;
    actData_Last: TAction;
    actData_Add: TAction;
    actData_Delete: TAction;
    actData_Refresh: TAction;
    actData_Print: TAction;
    actData_Edit: TAction;
    actData_Post: TAction;
    actData_Cancel: TAction;
    Timer1: TTimer;
    dxgProtocolListIndication_Str: TdxDBGridColumn;
    dxgProtocolListIndicationCode_Str: TdxDBGridColumn;
    dxgProtocolListGroupCode_Str: TdxDBGridColumn;
    btnView: TElSpeedButton;
    AtnColSelect: TAction;
    atnCopyProtocol: TAction;
    PopupMenu1: TPopupMenu;
    CopyProtocol1: TMenuItem;
    procedure pnlRXBackgroundResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actData_FirstExecute(Sender: TObject);
    procedure actData_PriorExecute(Sender: TObject);
    procedure actData_NextExecute(Sender: TObject);
    procedure actData_LastExecute(Sender: TObject);
    procedure actData_RefreshExecute(Sender: TObject);
    procedure actData_PostExecute(Sender: TObject);
    procedure actData_CancelExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actData_EditExecute(Sender: TObject);
    procedure actData_AddExecute(Sender: TObject);
    procedure actData_DeleteExecute(Sender: TObject);
    procedure AtnColSelectExecute(Sender: TObject);
    procedure atnCopyProtocolExecute(Sender: TObject);
  private
    FDataManager: TDataManager;
    procedure EnableButtons;
    { Private declarations }
  public
    { Public declarations }
  end;

  TProtocol = class(TObject)
  public
    class function Show(_selectBtnTxt: string = 'Select'; _showCancel: Boolean =
        True; _userRights: Boolean = True): Boolean;
  end;


implementation

uses StdRegimenDM, StdRegimen_ProtocolDetailFRM,
  DialogGridColumnSelectorUFrm;

{$R *.dfm}

procedure TfrmProtocol.pnlRXBackgroundResize(Sender: TObject);
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

end;

procedure TfrmProtocol.FormShow(Sender: TObject);
begin
  pnlRXBackground.Align := alClient;
end;
//MC - 11/04/2012
class function TProtocol.Show(_selectBtnTxt: string = 'Select'; _showCancel:
    Boolean = True; _userRights: Boolean = True): Boolean;
var
  frmProtocol: TfrmProtocol;    
begin

  Result := False;
  try
  frmProtocol := TfrmProtocol.Create(nil);
    try
    frmProtocol.rzdbMain.ShowCancelButton := _showCancel;
    frmProtocol.rzdbMain.CaptionOk := _selectBtnTxt;
    if (_userRights) then
    begin
     frmProtocol.btnEdit.Enabled        := True;
     frmProtocol.btnDelete.Enabled      := True;
     frmProtocol.btnAdd.Enabled         := True;
     frmProtocol.btnSave.Enabled        := True;
     frmProtocol.btnCancel.Enabled      := True;
     frmProtocol.atnCopyProtocol.Enabled:= True;
     end
    else
     begin
     frmProtocol.btnEdit.Enabled        := False;
     frmProtocol.btnDelete.Enabled      := False;
     frmProtocol.btnAdd.Enabled         := False;
     frmProtocol.btnSave.Enabled        := False;
     frmProtocol.btnCancel.Enabled      := False;
     frmProtocol.atnCopyProtocol.Enabled:= False;
     end;

    if frmProtocol.ShowModal = mrOK then Result := True;
    except
      on E:Exception do raise Exception.Create('TProtocol.Show' + #13 + E.Message);
    end;
  finally
  frmProtocol.Free;
  end;
end;

procedure TfrmProtocol.FormCreate(Sender: TObject);
begin
  FDataManager := TDataManager.Create(dmStdReg.qryProtocol, 'Protocol_ID');
  EnableButtons;
end;

procedure TfrmProtocol.actData_FirstExecute(Sender: TObject);
begin
  FDataManager.First;
  EnableButtons;
end;

procedure TfrmProtocol.actData_PriorExecute(Sender: TObject);
begin
  FDataManager.Prior;
  EnableButtons;
end;

procedure TfrmProtocol.actData_NextExecute(Sender: TObject);
begin
  FDataManager.Next;
  EnableButtons;
end;

procedure TfrmProtocol.actData_LastExecute(Sender: TObject);
begin
  FDataManager.Last;
  EnableButtons;
end;

procedure TfrmProtocol.actData_RefreshExecute(Sender: TObject);
begin
  FDataManager.Refresh;
  EnableButtons;
end;

procedure TfrmProtocol.actData_PostExecute(Sender: TObject);
begin
  FDataManager.Post;
  EnableButtons;
end;

procedure TfrmProtocol.actData_CancelExecute(Sender: TObject);
begin
  FDataManager.Cancel;
  EnableButtons;
end;

procedure TfrmProtocol.EnableButtons;
begin
  {
  actData_First.Enabled := FDataManager.ButtonEnabled(BTN_FIRST);
  actData_Prior.Enabled := FDataManager.ButtonEnabled(BTN_PRIOR);
  actData_Next.Enabled := FDataManager.ButtonEnabled(BTN_NEXT);
  actData_Last.Enabled := FDataManager.ButtonEnabled(BTN_LAST);
  actData_Add.Enabled := FDataManager.ButtonEnabled(BTN_ADD);
  actData_Delete.Enabled := FDataManager.ButtonEnabled(BTN_DELETE);
  actData_Refresh.Enabled := FDataManager.ButtonEnabled(BTN_REFRESH);
  actData_Post.Enabled := FDataManager.ButtonEnabled(BTN_POST);
  actData_Cancel.Enabled := FDataManager.ButtonEnabled(BTN_CANCEL);
  }
end;

procedure TfrmProtocol.Timer1Timer(Sender: TObject);
begin
  EnableButtons;
end;

procedure TfrmProtocol.actData_EditExecute(Sender: TObject);
begin

  dmStdReg.Protocol_Edit;

end;

procedure TfrmProtocol.actData_AddExecute(Sender: TObject);
var
  _id : string;
begin

  _id := dmStdReg.qryProtocol.FieldByName('Protocol_ID').AsString;
  if dmStdReg.Protocol_Add = '' then
    begin
    FDataManager.Refresh;
    end else
    begin
    //FDataManager.Move(_id);
    FDataManager.Refresh;
    end;

end;

procedure TfrmProtocol.actData_DeleteExecute(Sender: TObject);
begin

  if MessageDlg('Delete currently selected Protocol', mtWarning, [mbYes, mbCancel, mbNo], 0) = mrYes then
    begin
    dmStdReg.Protocol_Delete;
    FDataManager.Refresh;
    end;

    
end;

procedure TfrmProtocol.AtnColSelectExecute(Sender: TObject);
var
  SelectColumns : TColumnSelector;
  GridCols      : TDxDBGrid;
begin
  SelectColumns := TColumnSelector.Create;
  try
   GridCols := dxgProtocolList;
  if assigned(GridCols) then
    SelectColumns.SelectColumns(GridCols);
  finally
    SelectColumns.Free;
  end;

end;

procedure TfrmProtocol.atnCopyProtocolExecute(Sender: TObject);
begin
 try
 dmStdReg.CopyProtocol;
 MessageDlg('Protocol successfully copied.', mtInformation, [mbOk], 0);
 actData_Refresh.Execute;
 except
 end;
end;

end.
