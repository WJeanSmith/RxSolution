unit TMessageResultU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, ActiveX, AxCtrls,

  TPatientU, TResponseU;

type
  TMessageResult = class(TObject)
  private
    FPatient: TPatientDC;
    FResponse: TResponse;
  public
    constructor Create;
    destructor Destroy; override;
    property Patient: TPatientDC read FPatient write FPatient;
    property Response: TResponse read FResponse write FResponse;
  end;

implementation

constructor TMessageResult.Create;
begin

  inherited Create;
  Patient := TPatientDC.Create;
  Response  := TResponse.Create;
  
end;

destructor TMessageResult.Destroy;
begin

  if(Assigned(FPatient)) then FPatient.Free;
  if(Assigned(FResponse)) then FResponse.Free;

  inherited;

end;

end.

