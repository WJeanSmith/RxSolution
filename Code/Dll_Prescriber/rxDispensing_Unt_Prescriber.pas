unit rxDispensing_Unt_Prescriber;


interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, LocOnFly, LocUtils, {}

  SystemConstants;

procedure SwitchToFile(DLLFileName : PChar; var dllStruct : TDLLInfoStruct); stdcall;


procedure BackToModuleRes(Module : HINST); stdcall;
{}

procedure Edit_Prescriber(appHandle : THandle ; pDatabase:String; pID :SGUID;
    pAccessLevel : integer); stdcall;

procedure Add_Prescriber(appHandle : THandle ; pDatabase :string; pAccessLevel
    :integer); stdcall;

procedure Delete_Prescriber(appHandle : THandle ; pDatabase:String; pID :SGUID;
    pAccessLevel : integer); stdcall;

implementation

uses rxDispensing_Dm_Prescriber, rxDispensing_Frm_Prescriber;


procedure Edit_Prescriber(appHandle : THandle ; pDatabase:String; pID :SGUID;
    pAccessLevel : integer);
begin
//************ if pAccessLevel = 1 then User can make changes
//************ if pAccessLevel = 0 then User cannot make changes
  try
  Application.Handle  := appHandle;
  dmPerson            := TdmPerson.Create(Application);
  dmPerson.Database   := pDatabase;
  dmPerson.Person     := pID;

  frmPersonDetail_    := TfrmPersonDetail_.Create(Application);
  with frmPersonDetail_ do
    begin

    grpBoxMainDetails.Enabled           := (pAccessLevel > 0);
    lblBrowseOnly.Visible               := (pAccessLevel < 1);
    tbsAcademicQualifications.Enabled   := (pAccessLevel > 0);
    tbsClinicalRotationProfile.Enabled  := (pAccessLevel > 0);
    tbsContactDetails.Enabled           := (pAccessLevel > 0);
    tbsComments.Enabled                 := (pAccessLevel > 0);
    tbsSignaturePhoto.Enabled           := (pAccessLevel > 0);

    ShowModal;
    end;

  finally
  frmPersonDetail_.Free;
  dmPerson.Free;
  end;

end;

procedure Add_Prescriber(appHandle : THandle ; pDatabase :string; pAccessLevel
    :integer);
var
  addedID :String;
begin
  try
  Application.Handle  := appHandle;
  dmPerson := TdmPerson.Create(Application);
  dmPerson.Database := pDatabase;
  addedID := dmPerson.Add;

  frmPersonDetail_    := TfrmPersonDetail_.Create(Application);     
  frmPersonDetail_.RzDialogButtons1.EnableOk := False;
  
  with frmPersonDetail_ do
    if ShowModal <> mrOK then
      dmPerson.Delete(addedID, False);

  finally
  frmPersonDetail_.Free;
  dmPerson.Free;
  end;
end;


procedure Delete_Prescriber(appHandle : THandle ; pDatabase:String; pID :SGUID;
    pAccessLevel : integer);
begin
  try
  Application.Handle  := appHandle;
  dmPerson := TdmPerson.Create(Application);
  dmPerson.Database := pDatabase;
  dmPerson.Delete(pID);
  finally
  dmPerson.Free;
  end;
end;
         
procedure SwitchToFile(DLLFileName : PChar; var dllStruct : TDLLInfoStruct);
begin
  Localizer.DllSwitchToFile(DllFileName, dllStruct);
end;

procedure BackToModuleRes(Module : HINST);
begin
  Localizer.BackToModuleRes(Module);
end;
                           { }

end.
