unit SystemGeneralMethods;

interface

uses
  SysUtils, Classes, ComObj, Dialogs,
  DB, ADODB, Variants;

function GetNextPrescriberDispenserNumber(const pType : string ; const
    connectionString : string): string;

function GetCurrentPositionNumber(tblPosition:TADOQuery; PersonArea:String):
    string;

function GetPersonFullName(tblPerson:TADOQuery): string;

function GetPersonTypeGUID(LookUpType : integer): string;

function GetCurrentRxLevel(tblPosition, tblRxLevels:TADOQuery; PersonArea:string): string;

function GetRxLevel(conStr: string; ID : String ;  areaType : integer ): string;

function GetNextSystemNumber(connStr :String ; area :integer): string;

function GetAbbreviationValue(conStr : string ; description :string): Double;

procedure GetProductPack(conStr : string; GenericName :string; var Description: 
    string; var PackSize :double; var Cost :currency; var Strength : double);

procedure GetListOfStrengthUnits(conStr :string; var listOfNames :TStringList);

procedure GetListOfAbbreviations(conStr :string; var listOfNames :TStringList;
    pType:string = '');

function GetGenericNameFromBrandName(conStr :String ; brandName :string):
    string;

procedure GetListOfBrandNames(conStr :string; var listOfNames :TStringList);

function GetAbbreviationInstruction(conStr : string ; description :string):
    string;

function GetMaxRepeatsPerScript(conStr, ID :string): Integer;

function GetMaxDurationPerScript(conStr, ID :string): Double;

function ConnectDataSource(ConnectStr:String; conObj:TADOConnection): Boolean;

procedure GetListOfRoutes(conStr :string; var listOfNames :TStringList);

procedure GetListOfIndications(conStr :string; var listOfNames :TStringList);
 //Sm
function GetCodeOfICD10Description(conStr, prmDescription: string): string;

procedure GetListOfInstructionsSpecial(conStr :string; var listOfNames
    :TStringList);

function GetClinLabValue(conStr : string ; lutype, srcUnit, retUnit :string ;
    srcVal :double): Double;

function GetDoseRatios(conStr : string ; prod, route, dunit :string; agePat :
    integer;  var doseRec :double; var doseLo :double ; var doseHi :double):
    Boolean;

function GetInteractions(conStr : string ; prod_1, prod_2 :string; var
    description :string): Integer;

function IsRxLevelOk(pConStr, pPrescRx, pDrugName :string): Boolean;

procedure Refresh_DataSet(DataSet : TDataset ; PrimaryKeyField : String);

function GetNextNumber(tblRecordNumbering:TADOQuery;pWhareHouse:double;
    pType:integer       ): string;

function GetDefaultRxLevel(const pConStr : string; const cPost : string):
    string;

procedure GetListOfGenericNames(conStr :string; var listOfNames :TStringList);

procedure GetListOfClinics(conStr :string; var listOfNames :TStringList);

 //Sm
procedure GetListOfICD10Codes(conStr :string; var listOfNames: TStringList);  //SM

 //Sm
function GetDecriptionOfICD10Code(conStr, prmICode: string): string;

implementation

uses SystemConstants;


function GetNextPrescriberDispenserNumber(const pType : string ; const
    connectionString : string): string;

const
  MaxAttempts = 5000;
  NumWidth    = 10;
  AdjustDate  = True;

var
  Attempts: Integer;
  i, vNum : Integer;
  vPre : string;
  qry : TADOQuery;
  con : TADOConnection;
  vNumStr: string;

begin
  Result    := '';
  //pSuccess  := False;

  con := TADOConnection.Create(nil);
  con.LoginPrompt := False;
  con.ConnectionString := connectionString;
  qry := TADOQuery.Create(nil);
  qry.Connection := con;
  qry.SQL.Add('select * from tblPersonPositionPost where (personPositionPostDescription_str = ''' + pType + ''')');
  with qry do
    try
    Active := False;
    Active := True;                                                             // do this to prevent can't locate record error

    if (active) and (RecordCount > 0) then

      begin
      Attempts := 0;
      while Attempts <= MaxAttempts do
        try
        Inc(Attempts);
        // If another user has the table in edit mode, an error occurs here.
        Edit;
        // If we reach the Break statement, we are successful. Break out of loop.
        Break;
        except
          on EDataBaseError do
              begin
                // Do some delay
              Continue;
              end;
        end;

        if State = dsEdit then
          begin
          vNum := FieldByName('lastNumber_int').AsInteger;
          vPre := FieldByName('numberPrefix_str').AsString;
          inc(vNum);
          FieldByName('lastNumber_int').AsInteger := vNum;
          Post;  // Close the rec so somone else can access

          vNumStr := IntToStr(vNum);

          for i:= Length(vNumStr) to NumWidth-1 do
            vNumStr := '0' + vNumStr;
                                                    {
          if vNum < 10 then vPre := vPre + '000'
          else if vNum < 100 then vPre := vPre + '00'
          else if vNum < 1000 then vPre := vPre + '0';
                                                   }
          Result := vPre + vNumStr;
          end; (* if State = dsEdit then *)
      end;
    finally
      qry.Free;
      con.Free;
    end;


end;

function GetCurrentPositionNumber(tblPosition:TADOQuery; PersonArea:String):
    string;
begin

  Result := 'Not Currently Active';
  with tblPosition do
    begin
    Active := False;
    Active := True;
    First;
    while not eof do
      begin
      if FieldByName('personType_ID').AsString = PersonArea then
        if FieldByName('personPositionCurrent_bol').AsBoolean then
          Result := FieldByName('personPositionNumberNo_Str').AsString;
      Next;
      end;
    end;
end;



function GetPersonFullName(tblPerson:TADOQuery): string;
begin

  Result := 'None Current';
  with tblPerson do
    if Active then
      begin
      Result := FieldByName('personFirstName_Str').AsString + ' ' +
              FieldByName('personLastName_Str').AsString;
      end;

end;

function GetPersonTypeGUID(LookUpType : integer): string;
begin

  Result := '';
  case LookUpType of
    AREA_PATIENT      :  Result := AREA_PATIENT_GUID;
    AREA_PRESCRIBER   :  Result := AREA_PRESCRIBER_GUID;
    AREA_DISPENSER    :  Result := AREA_DISPENSER_GUID;
    end;

end;

function GetCurrentRxLevel(tblPosition, tblRxLevels:TADOQuery; PersonArea:string): string;
var
  curGUID     :string;
begin

  curGUID := '';
  Result := 'None';
  with tblPosition do
    if Active then
      begin
      Active := False;
      Active := True;
      First;

      while not eof do
        begin
        if FieldByName('personType_ID').AsString = PersonArea then
          if FieldByName('personPositionCurrent_bol').AsBoolean then
            begin
            curGUID := FieldByName('rxLevel_ID').AsString;
            Break;
            end;
        Next;
        end;

      if curGUID <> '' then
      with tblRxLevels do
        begin
        Active := False;
        Active := True;
        First;
        while not eof do
          begin
          if FieldByName('rxLevel_ID').AsString = curGUID then
            begin
            Result := FieldByName('rxLevelCode_Str').AsString;
            Break;
            end;
          Next;
          end;
        end;

      end;

end;

function GetRxLevel(conStr: string; ID : String ;  areaType : integer ): string;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;
begin

  try
    bSTR   := 'SELECT tblRxLevel.rxLevelCode_Str FROM tblPersonPosition ' +
              'INNER JOIN tblRxLevel ON tblPersonPosition.rxLevel_ID = ' +
              'tblRxLevel.rxLevel_ID ' +
              'WHERE (tblPersonPosition.person_ID = ''' + ID + ''') ' +
              'ORDER BY tblPersonPosition.personPositionStart_Dat DESC';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('rxLevelCode_Str').AsString
        else
        Result := '-';
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
//  MessageDlg( Result, mtConfirmation, [mbOK], 0);

end;

function GetNextSystemNumber(connStr :String ; area :integer): string;
begin
  Result := '';
end;

function GetAbbreviationValue(conStr : string ; description :string): Double;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;
begin

  result := 0;

  try
    bSTR   := 'select abbreviationValue_dbl from tblAbbreviations where abbreviation_Str = ''' + description + '''';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('abbreviationValue_dbl').AsFloat
        else
        Result := 0;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

procedure GetProductPack(conStr : string; GenericName :string; var Description:
    string; var PackSize :double; var Cost :currency; var Strength : double);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;
begin

  //result := 0;

  try
    bSTR   := 'select * from tblProductPackSize where GenericName_str = ''' + GenericName + ''' ORDER BY PackSize_dbl';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;

      if RecordCount > 0 then
        while not EOF do
          begin
          if PackSize <= srchQry.FieldByName('PackSize_dbl').AsFloat then
            begin
            Description := srchQry.FieldByName('Description_str').AsString;
            Cost := srchQry.FieldByName('Cost_mon').AsCurrency / srchQry.FieldByName('PackSize_dbl').AsFloat;
            end;
          next;
          end;

      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

procedure GetListOfStrengthUnits(conStr :string; var listOfNames :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select distinct StrengthUnit_Str from tblProductPackSize where (StrengthUnit_Str <> '''')';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('StrengthUnit_Str').AsString);
          next;
          end;

      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

procedure GetListOfAbbreviations(conStr :string; var listOfNames :TStringList;
    pType:string = '');
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    if pType = '' then pType := 'Interval';
    bSTR   := 'select abbreviation_Str from tblAbbreviations where abbreviationType_Str = ''' + pType +'''';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('abbreviation_Str').AsString);
          next;
          end;

      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

function GetGenericNameFromBrandName(conStr :String ; brandName :string): 
    string;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin
  result := 'No Generic Alternative Found';
  try
//    bSTR   := 'select genericName_Str from tblBrandName where brandName_Str = ''' + brandName + '''';
    bSTR   := 'select genericName_Str from tblBrandGenericLink where brandName_Str = ''' + brandName + '''';


    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
//    messageDlg('Here', mtWarning, [mbOK], 0);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('genericName_Str').AsString;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

procedure GetListOfBrandNames(conStr :string; var listOfNames :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select brandName_Str from tblBrandName order by brandName_Str';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('brandName_Str').AsString);
          next;
          end;

      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

function GetAbbreviationInstruction(conStr : string ; description :string):
    string;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;
begin

  result := 'Not Available';

  try
    bSTR   := 'select abbreviationInstruction_Str from tblAbbreviations where abbreviation_Str = ''' + description + '''';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('abbreviationInstruction_Str').AsString
        else
        Result := 'Not Available';
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

function GetMaxRepeatsPerScript(conStr, ID :string): Integer;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;
begin

  result := 1;

  try
    bSTR   := 'SELECT MAX(repeat_int) AS MaxRepeats FROM TblPrescriptionItem GROUP BY prescription_ID HAVING (prescription_ID = ''%s'')';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(Format(bSTR, [ID]));
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('MaxRepeats').AsInteger
        else
        Result := 1;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

function GetMaxDurationPerScript(conStr, ID :string): Double;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;
begin

  result := 28;

  try
    bSTR   := 'SELECT MAX(duration_dbl) AS MaxDuration FROM TblPrescriptionItem GROUP BY prescription_ID HAVING (prescription_ID = ''%s'')';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(Format(bSTR, [ID]));
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('MaxDuration').AsFloat
        else
        Result := 28;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;


function ConnectDataSource(ConnectStr:String; conObj:TADOConnection): Boolean;
(*.....................................................................*)(*end*)(*...........................................*)
                                                                                (*function:ConnectDataSource-----------------*)
                                                                                (*===========================================*)
                                                                   (*30.7.2002*)(* Orig::Deane Putzier                       *)
var (*.................................................................*)(*var*)(*...........................................*)
  i, j                : integer;
  aAllDataSetsOpened  : boolean;
  Connections         : array[0..0] of TADOConnection;

begin (*.............................................................*)(*begin*)(*...........................................*)

  aAllDataSetsOpened    := True;                                                // If datasets could not be opened, set this to false
  Connections[0]        := conObj;  // Maybe open more than one??

  for i:= low(Connections) to high(Connections) do
    with Connections[i] do
      try
      Connected         := False;                                               // Make sure it's not connected
      ConnectionString  := ConnectStr;


      for j := 0 to DataSetCount - 1 do
        if Datasets[j].Tag < 1 then
          if not DataSets[j].Active then
            DataSets[j].Open;                                           // Activate the datastores.
                                                                                // Connection is activated automatically.
      except
        on E: EDatabaseError do                                                 // Pick up any databse errors
          begin
          aAllDataSetsOpened := False;
          MessageDlg(e.Message, mtError, [mbOK], 0);
          end;
      end;

  Result := aAllDataSetsOpened;

end; (*................................................................*)(*end*)(*...........................................*)


procedure GetListOfRoutes(conStr :string; var listOfNames :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select Code_str from tlkRoute';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('Code_str').AsString);
          next;
          end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

procedure GetListOfIndications(conStr :string; var listOfNames :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select * from view_v01_ICD10_List_Active';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(Trim(srchQry.FieldByName('Description_str').AsString));
          next;
          end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

//SM
function GetCodeOfICD10Description(conStr, prmDescription: string): string;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    Result := '';
    bSTR   := 'select ICode_str from tblICD10 where Description_str = :paramCode';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      srchQry.Parameters.ParamByName('paramCode').Value := prmDescription;
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('ICode_str').AsString;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;
// end SM


procedure GetListOfInstructionsSpecial(conStr :string; var listOfNames
    :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select distinct dispInstructionSpecial_Str from TblPrescriptionItem';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('dispInstructionSpecial_Str').AsString);
          next;
          end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

function GetClinLabValue(conStr : string ; lutype, srcUnit, retUnit :string ;
    srcVal :double): Double;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

  unita, unitb  :string;
  retVal  :double;


begin

  result := 0;

{  clin_lab
  unit_a
  unit_b
  cf_cl
}

  try
    bSTR   := 'select * from tblClin_Lab where clin_lab = ''' + lutype + '''';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        begin
        unita   := UpperCase(srchQry.FieldByName('unit_a').AsString);
        unitb   := UpperCase(srchQry.FieldByName('unit_b').AsString);
        retVal  := srchQry.FieldByName('cf_cl').AsFloat;

        if (UpperCase(srcUnit) = unita) or (UpperCase(srcUnit) = unitb) then
          if (UpperCase(retUnit) = unita) or (UpperCase(retUnit) = unitb) then
          begin
          if UpperCase(srcUnit) = unita then
            Result := retVal * srcVal
          else
            Result := srcVal / retVal;
          end;
        end else
        Result := 1;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

function GetDoseRatios(conStr : string ; prod, route, dunit :string; agePat :
    integer;  var doseRec :double; var doseLo :double ; var doseHi :double):
    Boolean;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

const

  sqlStr = 'SELECT * FROM tblProductDose WHERE (Generic_str = ''%s'') AND ((AgeLo_dbl <= %d) AND (AgeHi_dbl >= %d)) AND (Route_Str = ''%s'') AND (DoseUnit_str = ''%s'')';

begin

  result  := False;
  doseRec := 0;
  doseLo  := 0;
  doseHi  := 0;

  try
    bSTR   := Format(sqlStr, [prod, agePat, agePat, route, dunit]) ;
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        begin
        doseRec   := srchQry.FieldByName('Dose_dbl').AsFloat;
        doseLo    := srchQry.FieldByName('DoseLo_dbl').AsFloat;
        doseHi    := srchQry.FieldByName('DoseHi_dbl').AsFloat;
        Result := true;
        end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

function GetInteractions(conStr : string ; prod_1, prod_2 :string; var
    description :string): Integer;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

const

  sqlStr = 'SELECT * FROM tblProductInteraction WHERE ((interaction_Generic_1_str = ''%s'') OR (interaction_Generic_1_str = ''%s'')) AND ((interaction_Generic_2_str = ''%s'') OR (interaction_Generic_2_str = ''%s''))';

begin

  result  := 0;

  try
    bSTR   := Format(sqlStr, [prod_1, prod_2, prod_1, prod_2]) ;
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      Result := RecordCount;

      while not EOF do
        begin
        if FieldByName('interaction_Generic_1_str').AsString = prod_1 then
          if FieldByName('interaction_Generic_2_str').AsString = prod_2 then
            description := srchQry.FieldByName('interaction_Description_str').AsString;
        if FieldByName('interaction_Generic_1_str').AsString = prod_2 then
          if FieldByName('interaction_Generic_2_str').AsString = prod_1 then
            description := srchQry.FieldByName('interaction_Description_str').AsString;
        Next;
        end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

function IsRxLevelOk(pConStr, pPrescRx, pDrugName :string): Boolean;
var
  i: Integer;
  srchQry     :TADOQuery;
  myConn      :TADOConnection;
  bSTR, drugRX        :string;
  arrRxList   :array of string;
  rxP, rxD    :integer;

begin

  rxP := 0;
  rxD := 0;

//  MessageDlg(pPrescRx + ', ' + pDrugName, mtWarning, [mbOK], 0);

  // First get list of rxLevels from DB
  try
    arrRxList := nil;
    bSTR   := 'SELECT * FROM tblRxLevel ORDER BY rxLevelOrder_int';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := pConStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          SetLength(arrRxList, Length(arrRxList) + 1);
          arrRxList[length(arrRxList)-1] := FieldByName('rxLevelCode_str').AsString;
          next;
          end;
      myConn.Close;
      finally
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

  // now get drug rxLevel
  try
    bSTR   := 'SELECT genericRxLevel_str FROM tblGenericName where genericName_Str = ''%s''';
    with srchQry do
      try
      myConn.Open;
      srchQry.SQL.Clear;
      srchQry.SQL.Add(Format(bSTR, [pDrugName]));
      Open;
      if RecordCount > 0 then
//        begin
        drugRX := FieldByName('genericRxLevel_str').AsString
        else
        drugRX := '0';
//        end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

  //now compare;
  for i := low(arrRxList) to high(arrRxList) do    // Iterate
    begin
//    MessageDlg(arrRxList[i], mtWarning, [mbOK], 0);
    if arrRxList[i] = pPrescRx then rxP := i;
    if arrRxList[i] = DrugRx then rxD := i;
    end;    // for

  Result := rxD <= rxP;

end;

procedure Refresh_DataSet(DataSet : TDataset ; PrimaryKeyField : String);
var
  curRecord :String;
begin

  try
  with DataSet do
    try
    DisableControls;
    curRecord := FieldByName(PrimaryKeyField).AsString;
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

function GetNextNumber(tblRecordNumbering:TADOQuery; pWhareHouse:double;
    pType:integer       ): string;

const
  MaxAttempts = 5000;
  NumWidth    = 4;
  AdjustDate  = True;

var
  Attempts: Integer;
  Year1, Month1, Day1 : Word;
  Year2, Month2, Day2 : Word;
  Present, LastSet: TDateTime;
  NextID,i : Integer;
  vNum, vPre, vYr, vMth, vTp, vDiv : string;

begin
  Result    := '';
  //pSuccess  := False;

  with tblRecordNumbering do
    begin
    Active := False;
    Active := True;                                                             // do this to prevent can't locate record error

    if active then
      if Locate(  'demanderStore_ID;Record_TypeID',
                  VarArrayOf([pWharehouse, pType]),
                  []) then
        begin
        Attempts := 0;
        while Attempts <= MaxAttempts do
          try
          Inc(Attempts);
          // If another user has the table in edit mode, an error occurs here.
          Edit;
          // If we reach the Break statement, we are successful. Break out of loop.
          Break;
          except
            on EDataBaseError do
              begin
                // Do some delay
              Continue;
              end;
          end;

        if State = dsEdit then
          begin
          Present := Now;
          LastSet := FieldByName('Record_DateSet').AsDateTime;           
          if Present > LastSet then
            begin
            DecodeDate(Present, Year1, Month1, Day1);
            DecodeDate(LastSet, Year2, Month2, Day2);
            if Month1 <> Month2 then
              begin
              if tblRecordNumbering.FieldByName('Record_bol').AsBoolean then
               begin
               FieldByName('Record_Month').AsInteger     := Month1;
               FieldByName('Record_Number').AsInteger    := 1;
               end;
              end;
            if Year1 <> Year2 then
              FieldByName('Record_Year').AsInteger      := Year1;
            end;

          NextID  := FieldByName('Record_Number').AsInteger;
          FieldByName('Record_Number').AsInteger := NextID + 1;
          FieldByName('Record_DateSet').AsDateTime  := Present;

          vYr     := Copy(FieldByName('Record_Year').AsString, 3 , 2);
          vMth    := FieldByName('Record_Month').AsString;
          vPre    := FieldByName('Record_StorePre').AsString;
          vTp     := FieldByName('Record_Type').AsString;
          vDiv    := FieldByName('Record_Divider').AsString;
          Post;  // Close the rec so somone else can access

          vNum := IntToStr(NextID);

          for i:= Length(vNum) to NumWidth-1 do
            vNum := '0' + VNum;
          if AdjustDate then
            if Length(vMth) = 1 then vMth := '0' + vMth;

            if vTp = '' then
            Result := vPre + '/' + vYr + vDiv + vMth + vDiv + vNum
            else
            Result := vPre + vDiv + vTp + '/' + vYr + vDiv + vMth + vDiv + vNum;

            //Result := vYr + vDiv + vMth + vDiv + vNum;

    //      pSuccess := True;
          end; (* if State = dsEdit then *)
      end;
    end;


end;

function GetDefaultRxLevel(const pConStr : string; const cPost : string):
    string;
var
  i: Integer;
  srchQry     :TADOQuery;
  myConn      :TADOConnection;
begin
  Result        := '';
//  cRxLevelStr   := '';
  try
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := pConStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add('SELECT * FROM tblPersonPositionPost WHERE personPositionPost_ID = ''' + cPost + '''');
      Open;
      if RecordCount > 0 then
        begin
        Result := srchQry.FieldByName('defaultRxLevel_id').AsString;
        end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
  // TODO -cMM: GetDefaultRxLevel default body inserted
end;

procedure GetListOfGenericNames(conStr :string; var listOfNames :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select distinct GenericName_str from tblProductPackSize';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('GenericName_str').AsString);
          next;
          end;

      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

procedure GetListOfClinics(conStr :string; var listOfNames :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select distinct downRefferal_Str from tblPrescription';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      listOfNames.Add('<ALL>');
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('downRefferal_Str').AsString);
          next;
          end;

      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;

end;

//SM
procedure GetListOfICD10Codes(conStr :string; var listOfNames :TStringList);
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    listOfNames.Clear;
    bSTR   := 'select ICode_str from view_v01_ICD10_List_Active';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      Open;
      if RecordCount > 0 then
        while not EOF do
          begin
          listOfNames.Add(srchQry.FieldByName('ICode_str').AsString);
          next;
          end;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

//SM
function GetDecriptionOfICD10Code(conStr, prmICode: string): string;
var
  srchQry  :TADOQuery;
  myConn  :TADOConnection;
  bSTR  :string;

begin

  try
    Result := '';
    bSTR   := 'select Description_str from tblICD10 where ICode_str = :paramCode';
    myConn := TADOConnection.Create(nil);
    myConn.ConnectionString := conStr;
    myConn.LoginPrompt := False;
    srchQry := TADOQuery.Create(nil);
    with srchQry do
      try
      Connection := myConn;
      myConn.Open;
      srchQry.SQL.Add(bSTR);
      srchQry.Parameters.ParamByName('paramCode').Value := prmICode;
      Open;
      if RecordCount > 0 then
        Result := srchQry.FieldByName('Description_str').AsString;
      myConn.Close;
      finally
      srchQry.Free;
      myConn.Free;
      end;
  except
    on E:Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;




end.
