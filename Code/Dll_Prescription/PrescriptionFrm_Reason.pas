unit PrescriptionFrm_Reason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzDlgBtn, DBCtrls, RzDBCmbo, RzLine, ExtCtrls, StdCtrls, DB;

type
  TfrmRxReason = class(TForm)
    pnlRXBackground: TPanel;
    pnlForm_Header: TPanel;
    lblDispenser: TLabel;
    rxReason: TRzDBLookupComboBox;
    rzdButtons: TRzDialogButtons;
    FRM_RX: TDataSource;
    dsRxReasons: TDataSource;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TRXReason = class(TObject)
  public
     class function Show: Boolean;
  end;

var
  frmRxReason: TfrmRxReason;

implementation

{$R *.dfm}

class function TRXReason.Show: Boolean;
var
  frmRxReason: TfrmRxReason;
begin

  Result := False;
  frmRxReason := TfrmRxReason.Create(nil);

  if frmRxReason.ShowModal = mrOK then Result := True;

  frmRxReason.Free;

end;

procedure TfrmRxReason.Timer1Timer(Sender: TObject);
begin
//


end;

end.
