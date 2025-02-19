object dmRX: TdmRX
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 382
  Top = 162
  Height = 794
  Width = 1143
  object conRx: TADOConnection
    CommandTimeout = 180
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=rxsolution;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=RxBarCoding;Data Source=.\sqlexpre' +
      'ss;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4' +
      '096;Workstation ID=ZA-CMMANKGA;Use Encryption for Data=False;Tag' +
      ' with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 88
    Top = 32
  end
  object qryRX: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    BeforePost = qryRXBeforePost
    OnNewRecord = qryRXNewRecord
    Parameters = <
      item
        Name = 'prescription_ID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = '{a367061e-53e9-42cf-9e29-88f045182c1d}'
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM tblPrescription where (prescription_ID = :prescription_ID)'
      ''
      '')
    Left = 88
    Top = 136
    object qryRXprescription_ID_Original: TGuidField
      FieldName = 'prescription_ID_Original'
      FixedChar = True
      Size = 38
    end
    object qryRXrepeatDate_dat: TDateTimeField
      FieldName = 'repeatDate_dat'
    end
    object qryRXcompleted_bol: TBooleanField
      FieldName = 'completed_bol'
    end
    object qryRXdownRefferal_Str: TWideStringField
      FieldName = 'downRefferal_Str'
      Size = 50
    end
    object qryRXissuedOrCollected_Bol: TBooleanField
      FieldName = 'issuedOrCollected_Bol'
    end
    object qryRXdispensed_Bol: TBooleanField
      FieldName = 'dispensed_Bol'
    end
    object qryRXisReferred_bol: TBooleanField
      FieldName = 'isReferred_bol'
    end
    object qryRXactive_bol: TBooleanField
      FieldName = 'active_bol'
    end
    object qryRXclinic_ID: TGuidField
      FieldName = 'clinic_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXprescription_ID: TGuidField
      FieldName = 'prescription_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXprescriptionLastEdited_dat: TDateTimeField
      FieldName = 'prescriptionLastEdited_dat'
    end
    object qryRXprescriptionLastEdited_ID: TGuidField
      FieldName = 'prescriptionLastEdited_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXprescriptionLastEdited_Str: TWideStringField
      FieldName = 'prescriptionLastEdited_Str'
      Size = 100
    end
    object qryRXprescriptionNumber_Str: TWideStringField
      FieldName = 'prescriptionNumber_Str'
      Size = 50
    end
    object qryRXdate_Dat: TDateTimeField
      FieldName = 'date_Dat'
    end
    object qryRXpatient_ID: TGuidField
      FieldName = 'patient_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXpatientName_Str: TWideStringField
      FieldName = 'patientName_Str'
      Size = 50
    end
    object qryRXfolderNumber_Str: TWideStringField
      FieldName = 'folderNumber_Str'
      Size = 50
    end
    object qryRXadmissionNo_Str: TWideStringField
      FieldName = 'admissionNo_Str'
      Size = 50
    end
    object qryRXprescriber_ID: TGuidField
      FieldName = 'prescriber_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXprescriberName_Str: TWideStringField
      FieldName = 'prescriberName_Str'
      Size = 50
    end
    object qryRXprescriberRXLevel_Str: TWideStringField
      FieldName = 'prescriberRXLevel_Str'
      Size = 50
    end
    object qryRXprescriberAlert_mem: TMemoField
      FieldName = 'prescriberAlert_mem'
      BlobType = ftMemo
    end
    object qryRXprescribedAuthorisedBy_Str: TWideStringField
      FieldName = 'prescribedAuthorisedBy_Str'
      Size = 120
    end
    object qryRXdispenser_ID: TGuidField
      FieldName = 'dispenser_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXdispenserName_Str: TWideStringField
      FieldName = 'dispenserName_Str'
      Size = 50
    end
    object qryRXdispenserRxLevel_Str: TWideStringField
      FieldName = 'dispenserRxLevel_Str'
      Size = 50
    end
    object qryRXdispensedAuthorisedBy_Str: TWideStringField
      FieldName = 'dispensedAuthorisedBy_Str'
      Size = 120
    end
    object qryRXrepeats_Int: TIntegerField
      FieldName = 'repeats_Int'
    end
    object qryRXrepeatNo_Int: TIntegerField
      FieldName = 'repeatNo_Int'
    end
    object qryRXprescriptionCost_Mon: TBCDField
      FieldName = 'prescriptionCost_Mon'
      DisplayFormat = 'R# ##0.00;-R# ##0.00'
      Precision = 19
    end
    object qryRXprescriptionItemsCount_Int: TIntegerField
      FieldName = 'prescriptionItemsCount_Int'
    end
    object qryRXclinic_str: TWideStringField
      FieldName = 'clinic_str'
      Size = 200
    end
    object qryRXprescriptionActive_bol: TBooleanField
      FieldName = 'prescriptionActive_bol'
    end
    object qryRXprescriptionStatus_Str: TWideStringField
      FieldName = 'prescriptionStatus_Str'
      Size = 100
    end
    object qryRXprescriptionStatus_ID: TGuidField
      FieldName = 'prescriptionStatus_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXdownRefRouteSchedule_ID: TGuidField
      FieldName = 'downRefRouteSchedule_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXbatchIsBatched_bol: TBooleanField
      FieldName = 'batchIsBatched_bol'
    end
    object qryRXprescriptionAuthorised_bol: TBooleanField
      FieldName = 'prescriptionAuthorised_bol'
    end
    object qryRXdispensingAuthorised_bol: TBooleanField
      FieldName = 'dispensingAuthorised_bol'
    end
    object qryRXdispensingCollected_bol: TBooleanField
      FieldName = 'dispensingCollected_bol'
    end
    object qryRXdispensingPicked_bol: TBooleanField
      FieldName = 'dispensingPicked_bol'
    end
    object qryRXbatchIsCollated_bol: TBooleanField
      FieldName = 'batchIsCollated_bol'
    end
    object qryRXbatchIsShipped_bol: TBooleanField
      FieldName = 'batchIsShipped_bol'
    end
    object qryRXprotocolID: TGuidField
      FieldName = 'protocolID'
      FixedChar = True
      Size = 38
    end
    object qryRXdispensingPosted_bol: TBooleanField
      FieldName = 'dispensingPosted_bol'
      DisplayValues = 'Posted;Active'
    end
    object qryRXnaive_bol: TBooleanField
      FieldName = 'naive_bol'
    end
    object qryRXDemanderUnique_ID: TGuidField
      FieldName = 'DemanderUnique_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXDemanderName_Str: TWideStringField
      FieldName = 'DemanderName_Str'
      Size = 150
    end
    object qryRXRepeatStatus_str: TWideStringField
      FieldName = 'RepeatStatus_str'
      Size = 250
    end
    object qryRXRepeatDuration_Int: TIntegerField
      FieldName = 'RepeatDuration_Int'
    end
    object qryRXpersonpregnant_bol: TBooleanField
      FieldName = 'personpregnant_bol'
    end
    object qryRXcomplexSiteDepartment_ID: TGuidField
      FieldName = 'complexSiteDepartment_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXcomplexSiteDepartment_str: TWideStringField
      FieldName = 'complexSiteDepartment_str'
      Size = 50
    end
    object qryRXvstNextVisit_dat: TDateTimeField
      FieldName = 'vstNextVisit_dat'
    end
    object qryRXPersonAge_int: TIntegerField
      FieldName = 'PersonAge_int'
    end
    object qryRXRxCancelReasonsAfterPosting_str: TWideStringField
      FieldName = 'RxCancelReasonsAfterPosting_str'
      FixedChar = True
      Size = 50
    end
    object qryRXPosted_dat: TDateTimeField
      FieldName = 'Posted_dat'
    end
    object qryRXPostedBy_str: TWideStringField
      FieldName = 'PostedBy_str'
      Size = 30
    end
  end
  object qryPrescriber: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select tblPerson.*, tblPersonSignature.personSignatureImage_Img,' +
        ' tblPersonQualification.personQualificationName_Str'
      'from tblPerson '
      
        'left outer join tblPersonSignature on tblPersonSignature.person_' +
        'ID = tblPerson.person_ID'
      
        'left outer join tblPersonQualification on tblPersonQualification' +
        '.person_ID = tblPerson.person_ID'
      
        'where (tblPerson.personPrescriber_bol = 1) and (tblPerson.person' +
        'Active_Bol = 1) '
      
        'order by tblPerson.personLastName_Str, tblPerson.personFirstName' +
        '_Str')
    Left = 240
    Top = 136
    object qryPrescriberperson_ID: TGuidField
      FieldName = 'person_ID'
      FixedChar = True
      Size = 38
    end
    object qryPrescriberpersonLastName_Str: TWideStringField
      FieldName = 'personLastName_Str'
      Size = 30
    end
    object qryPrescriberpersonFirstName_Str: TWideStringField
      FieldName = 'personFirstName_Str'
      Size = 30
    end
    object qryPrescriberpersonKnownName_Str: TWideStringField
      FieldName = 'personKnownName_Str'
      Size = 50
    end
    object qryPrescriberpersonInitials_Str: TWideStringField
      FieldName = 'personInitials_Str'
      Size = 10
    end
    object qryPrescriberpersonDOB_Dat: TDateTimeField
      FieldName = 'personDOB_Dat'
    end
    object qryPrescriberpersonGender_Str: TWideStringField
      FieldName = 'personGender_Str'
      Size = 1
    end
    object qryPrescriberpersonReviewed_Dat: TDateTimeField
      FieldName = 'personReviewed_Dat'
    end
    object qryPrescriberpersonActive_Bol: TBooleanField
      FieldName = 'personActive_Bol'
    end
    object qryPrescriberpersonRace_Str: TWideStringField
      FieldName = 'personRace_Str'
      Size = 50
    end
    object qryPrescriberpersonLanguageNarrative_Str: TWideStringField
      FieldName = 'personLanguageNarrative_Str'
      Size = 30
    end
    object qryPrescriberpersonLanguageWritten_Str: TWideStringField
      FieldName = 'personLanguageWritten_Str'
      Size = 30
    end
    object qryPrescriberpersonAgeYears_int: TIntegerField
      FieldName = 'personAgeYears_int'
    end
    object qryPrescriberpersonAgeMonths_int: TIntegerField
      FieldName = 'personAgeMonths_int'
    end
    object qryPrescriberpersonDescription_str: TWideStringField
      FieldName = 'personDescription_str'
      Size = 150
    end
    object qryPrescriberpersonRefNoCurrent_str: TWideStringField
      FieldName = 'personRefNoCurrent_str'
    end
    object qryPrescriberpersonTelNoCurrent_str: TWideStringField
      FieldName = 'personTelNoCurrent_str'
    end
    object qryPrescriberpersonCelNoCurrent_str: TWideStringField
      FieldName = 'personCelNoCurrent_str'
    end
    object qryPrescriberpersonAddressCurrent_str: TWideStringField
      FieldName = 'personAddressCurrent_str'
      Size = 255
    end
    object qryPrescriberpersonRegistrationNo_str: TWideStringField
      FieldName = 'personRegistrationNo_str'
    end
    object qryPrescriberpersonInstitution_str: TWideStringField
      FieldName = 'personInstitution_str'
      Size = 200
    end
    object qryPrescriberpersonPatient_bol: TBooleanField
      FieldName = 'personPatient_bol'
    end
    object qryPrescriberpersonPrescriber_bol: TBooleanField
      FieldName = 'personPrescriber_bol'
    end
    object qryPrescriberpersonDispenser_bol: TBooleanField
      FieldName = 'personDispenser_bol'
    end
    object qryPrescriberpersonOther_bol: TBooleanField
      FieldName = 'personOther_bol'
    end
    object qryPrescribersysLastEdited_dat: TDateTimeField
      FieldName = 'sysLastEdited_dat'
    end
    object qryPrescribersysLastEditedBy_ID: TGuidField
      FieldName = 'sysLastEditedBy_ID'
      FixedChar = True
      Size = 38
    end
    object qryPrescribersysLastEditedBy_str: TWideStringField
      FieldName = 'sysLastEditedBy_str'
      Size = 30
    end
    object qryPrescribersysDeleted_bol: TBooleanField
      FieldName = 'sysDeleted_bol'
    end
    object qryPrescriberpersonDateDeceased_dat: TDateTimeField
      FieldName = 'personDateDeceased_dat'
    end
    object qryPrescriberpersonStatus_Str: TWideStringField
      FieldName = 'personStatus_Str'
      Size = 50
    end
    object qryPrescriberpersonIDNumber_Str: TWideStringField
      FieldName = 'personIDNumber_Str'
    end
    object qryPrescriberpersonStatusChangeDate_dat: TDateTimeField
      FieldName = 'personStatusChangeDate_dat'
    end
    object qryPrescriberpersonPead_bol: TBooleanField
      FieldName = 'personPead_bol'
    end
    object qryPrescriberpersonDateJoined_dat: TDateTimeField
      FieldName = 'personDateJoined_dat'
    end
    object qryPrescriberpersonStatusDesc_str: TWideStringField
      FieldName = 'personStatusDesc_str'
      Size = 150
    end
    object qryPrescriberpersonPAS_str: TWideStringField
      FieldName = 'personPAS_str'
    end
    object qryPrescriberpersonInstitution_ID: TGuidField
      FieldName = 'personInstitution_ID'
      FixedChar = True
      Size = 38
    end
    object qryPrescriberpersonNaive_Bol: TBooleanField
      FieldName = 'personNaive_Bol'
    end
    object qryPrescriberpersonNaiveDate_Dat: TDateTimeField
      FieldName = 'personNaiveDate_Dat'
    end
    object qryPrescriberpersonTransferredOutTo_str: TWideStringField
      FieldName = 'personTransferredOutTo_str'
      Size = 50
    end
    object qryPrescriberpersonTransferredOut_bol: TBooleanField
      FieldName = 'personTransferredOut_bol'
    end
    object qryPrescriberpersonClintech_ID: TIntegerField
      FieldName = 'personClintech_ID'
    end
    object qryPrescriberpersonTransferredInDate_dat: TDateTimeField
      FieldName = 'personTransferredInDate_dat'
    end
    object qryPrescriberpersonDefaulted_dat: TDateTimeField
      FieldName = 'personDefaulted_dat'
    end
    object qryPrescriberpersonMaritalStatus_str: TWideStringField
      FieldName = 'personMaritalStatus_str'
      Size = 10
    end
    object qryPrescriberpersonDeceased_bol: TBooleanField
      FieldName = 'personDeceased_bol'
    end
    object qryPrescriberpersonTransferredOutDate_dat: TDateTimeField
      FieldName = 'personTransferredOutDate_dat'
    end
    object qryPrescriberpersonTransferredInFrom_str: TWideStringField
      FieldName = 'personTransferredInFrom_str'
      Size = 50
    end
    object qryPrescriberpersonRegisteredInSys_bol: TBooleanField
      FieldName = 'personRegisteredInSys_bol'
    end
    object qryPrescriberpersonTransferredIn_bol: TBooleanField
      FieldName = 'personTransferredIn_bol'
    end
    object qryPrescriberpersonPAAB_ID: TWideStringField
      FieldName = 'personPAAB_ID'
      Size = 25
    end
    object qryPrescriberpersonRegisteredInSys_dat: TDateTimeField
      FieldName = 'personRegisteredInSys_dat'
    end
    object qryPrescriberpersonDefaulted_bol: TBooleanField
      FieldName = 'personDefaulted_bol'
    end
    object qryPrescribervstPregnancyDeliveryDate_dat: TDateTimeField
      FieldName = 'vstPregnancyDeliveryDate_dat'
    end
    object qryPrescribervstFunctionalStatus_str: TWideStringField
      FieldName = 'vstFunctionalStatus_str'
      FixedChar = True
      Size = 10
    end
    object qryPrescribervstClinicalStage_str: TWideStringField
      FieldName = 'vstClinicalStage_str'
      FixedChar = True
      Size = 10
    end
    object qryPrescribervstRegimenChange_From_str: TWideStringField
      FieldName = 'vstRegimenChange_From_str'
      Size = 50
    end
    object qryPrescribervstRegimenChange_To_str: TWideStringField
      FieldName = 'vstRegimenChange_To_str'
      Size = 50
    end
    object qryPrescribervstRegimenChange_Reason_str: TWideStringField
      FieldName = 'vstRegimenChange_Reason_str'
      Size = 50
    end
    object qryPrescribervstVisitDate_dat: TDateTimeField
      FieldName = 'vstVisitDate_dat'
    end
    object qryPrescribervstNextVisit_dat: TDateTimeField
      FieldName = 'vstNextVisit_dat'
    end
    object qryPrescribervstScheduledVisit_dat: TDateTimeField
      FieldName = 'vstScheduledVisit_dat'
    end
    object qryPrescriberpersonpregnant_bol: TBooleanField
      FieldName = 'personpregnant_bol'
    end
    object qryPrescribervstSupporterName_str: TWideStringField
      FieldName = 'vstSupporterName_str'
      Size = 30
    end
    object qryPrescribervstSupporterAddress_str: TWideStringField
      FieldName = 'vstSupporterAddress_str'
      Size = 255
    end
    object qryPrescribervstUpporterPhone_str: TWideStringField
      FieldName = 'vstUpporterPhone_str'
      Size = 50
    end
    object qryPrescribervstSupporterRelationship_str: TWideStringField
      FieldName = 'vstSupporterRelationship_str'
    end
    object qryPrescribervstCohort_str: TWideStringField
      FieldName = 'vstCohort_str'
      FixedChar = True
      Size = 10
    end
    object qryPrescribervstHeight_dbl: TFloatField
      FieldName = 'vstHeight_dbl'
    end
    object qryPrescribervstLostToFollowUpDate_dat: TDateTimeField
      FieldName = 'vstLostToFollowUpDate_dat'
    end
    object qryPrescribervstRegimenStart_str: TWideStringField
      FieldName = 'vstRegimenStart_str'
      Size = 50
    end
    object qryPrescribervstRegimenStartDate_dat: TDateTimeField
      FieldName = 'vstRegimenStartDate_dat'
    end
    object qryPrescribervstTreatmentEligibility_str: TWideStringField
      FieldName = 'vstTreatmentEligibility_str'
      Size = 50
    end
    object qryPrescribervstTreatmentStopped_date_dat: TDateTimeField
      FieldName = 'vstTreatmentStopped_date_dat'
    end
    object qryPrescribervstWeight_dbl: TFloatField
      FieldName = 'vstWeight_dbl'
    end
    object qryPrescribervstTempPatient_bol: TBooleanField
      FieldName = 'vstTempPatient_bol'
    end
    object qryPrescriberReasonForEligibility_Str: TWideStringField
      FieldName = 'ReasonForEligibility_Str'
      Size = 50
    end
    object qryPrescriberClassification_ID: TIntegerField
      FieldName = 'Classification_ID'
    end
    object qryPrescribervstIsOnSite_bol: TBooleanField
      FieldName = 'vstIsOnSite_bol'
    end
    object qryPrescribervstOnSiteDate_dat: TDateTimeField
      FieldName = 'vstOnSiteDate_dat'
    end
    object qryPrescriberDiagnosis_dat: TDateTimeField
      FieldName = 'Diagnosis_dat'
    end
    object qryPrescriberARTStart_dat: TDateTimeField
      FieldName = 'ARTStart_dat'
    end
    object qryPrescriberEntryPoint_str: TWideStringField
      FieldName = 'EntryPoint_str'
    end
    object qryPrescriberpersonReligion_str: TWideStringField
      FieldName = 'personReligion_str'
    end
    object qryPrescriberClassification_str: TWideStringField
      FieldName = 'Classification_str'
    end
    object qryPrescribereligibilityCD4Count_str: TWideStringField
      FieldName = 'eligibilityCD4Count_str'
      Size = 4
    end
    object qryPrescribereligibilityWHOStaging_str: TWideStringField
      FieldName = 'eligibilityWHOStaging_str'
      Size = 10
    end
    object qryPrescriberNationality_str: TWideStringField
      FieldName = 'Nationality_str'
      Size = 50
    end
    object qryPrescriberReferredTo_str: TWideStringField
      FieldName = 'ReferredTo_str'
      Size = 50
    end
    object qryPrescriberReferredBy_str: TWideStringField
      FieldName = 'ReferredBy_str'
      Size = 50
    end
    object qryPrescriberpersonEducation_str: TWideStringField
      FieldName = 'personEducation_str'
    end
    object qryPrescriberpersonEmployed_bol: TBooleanField
      FieldName = 'personEmployed_bol'
    end
    object qryPrescriberpersonEmployeeNumber_str: TWideStringField
      FieldName = 'personEmployeeNumber_str'
      Size = 15
    end
    object qryPrescriberPatientNumberType: TWideStringField
      FieldName = 'PatientNumberType'
      Size = 1
    end
    object qryPrescriberSouthAfricanID_bol: TBooleanField
      FieldName = 'SouthAfricanID_bol'
    end
    object qryPrescriberForeigner_bol: TBooleanField
      FieldName = 'Foreigner_bol'
    end
    object qryPrescriberpersonGreenBox_ID: TGuidField
      FieldName = 'personGreenBox_ID'
      FixedChar = True
      Size = 38
    end
    object qryPrescriberpersonSignatureImage_Img: TBlobField
      FieldName = 'personSignatureImage_Img'
    end
    object qryPrescriberpersonQualificationName_Str: TWideStringField
      FieldName = 'personQualificationName_Str'
      Size = 50
    end
  end
  object qryDispenser: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from tblPerson where (personDispenser_bol = 1) and (per' +
        'sonActive_Bol = 1) order by personLastName_Str, personFirstName_' +
        'Str')
    Left = 240
    Top = 192
  end
  object qryDemanders: TADOQuery
    Connection = conRx
    Parameters = <>
    SQL.Strings = (
      
        'select * from tblDemander where  (CanDispense_bol = 1) order by ' +
        'Name_str')
    Left = 240
    Top = 256
  end
  object qryProductFormulation: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT DISTINCT GenericName_str, strengthExtraDescription_str, r' +
        'oute_str, StrengthValue_dbl, DispensingValue_dbl, DispensingUnit' +
        '_str, Administration_str, StrengthUnit_Str'
      'FROM  tblProductPackSize '
      
        'WHERE ((InstitutionEDL_bol = 1) and (IsAvailableForDispensing_Bo' +
        'l = 1))'
      'ORDER BY strengthExtraDescription_str')
    Left = 240
    Top = 312
  end
  object dsqryProductFormulation: TDataSource
    DataSet = qryProductFormulation
    Left = 368
    Top = 312
  end
  object qryRegiminInterval: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from TblAbbreviations where (abbreviationType_str = '#39'In' +
        'terval'#39')')
    Left = 528
    Top = 320
    object qryRegiminIntervalabbreviation_Str: TWideStringField
      FieldName = 'abbreviation_Str'
      Size = 50
    end
    object qryRegiminIntervalabbreviationDescription_Str: TWideStringField
      FieldName = 'abbreviationDescription_Str'
      Size = 255
    end
    object qryRegiminIntervalabbreviationValue_dbl: TFloatField
      FieldName = 'abbreviationValue_dbl'
    end
    object qryRegiminIntervalabbreviationValueUnit_Str: TWideStringField
      FieldName = 'abbreviationValueUnit_Str'
      Size = 15
    end
    object qryRegiminIntervalabbreviationValueRatio_dbl: TFloatField
      FieldName = 'abbreviationValueRatio_dbl'
    end
    object qryRegiminIntervalabbreviationType_Str: TWideStringField
      FieldName = 'abbreviationType_Str'
      Size = 50
    end
    object qryRegiminIntervalabbreviationValueRatioUnit_Str: TWideStringField
      FieldName = 'abbreviationValueRatioUnit_Str'
      Size = 15
    end
    object qryRegiminIntervalabbreviationInstruction_Str: TWideStringField
      FieldName = 'abbreviationInstruction_Str'
      Size = 255
    end
    object qryRegiminIntervalabbreviationLanguage_str: TWideStringField
      FieldName = 'abbreviationLanguage_str'
      Size = 75
    end
  end
  object qryRegiminInstruction: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from TblAbbreviations where (abbreviationType_str = '#39'Ad' +
        'ditional Directions'#39')')
    Left = 528
    Top = 376
  end
  object qryInterventionProblem: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tblDRPProblem')
    Left = 240
    Top = 432
  end
  object qryInterventionOutcome: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tblDRPOutcome')
    Left = 240
    Top = 488
  end
  object qryICD10: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tblICD10 where (active_bol = 1)')
    Left = 240
    Top = 544
  end
  object qryClinic: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tblClinic order by clinicName_str')
    Left = 304
    Top = 592
  end
  object qryHospital: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from tblsystem ')
    Left = 472
    Top = 136
  end
  object qryRXItem: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    BeforePost = qryRXItemBeforePost
    AfterPost = qryRXItemAfterPost
    AfterCancel = qryRXItemAfterCancel
    BeforeDelete = qryRXItemBeforeDelete
    AfterDelete = qryRXItemAfterDelete
    AfterScroll = qryRXItemAfterScroll
    OnNewRecord = qryRXItemNewRecord
    Parameters = <
      item
        Name = 'PRx_ID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = '{0266D5CC-2CCC-4C6F-9E16-E263DF1AADB7}'
      end>
    SQL.Strings = (
      'Select * from TblRXItem where (RX_ID = :PRx_ID) '
      'Order by InputOrder_int')
    Left = 88
    Top = 184
    object qryRXItemRXItem_ID: TGuidField
      FieldName = 'RXItem_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXItemRX_ID: TGuidField
      FieldName = 'RX_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXItemFrmFormulation_Str: TWideStringField
      DisplayLabel = 'Formulation'
      FieldName = 'FrmFormulation_Str'
      OnChange = RXItemFieldsChanged
      Size = 250
    end
    object qryRXItemFrmAdministration_Str: TWideStringField
      DisplayLabel = 'Admin.'
      FieldName = 'FrmAdministration_Str'
      Size = 35
    end
    object qryRXItemFrmSKU_Dbl: TFloatField
      DisplayLabel = 'Qty.'
      FieldName = 'FrmSKU_Dbl'
      OnChange = RXItemFieldsChanged
    end
    object qryRXItemFrmInterval_Str: TWideStringField
      DisplayLabel = 'Int.'
      FieldName = 'FrmInterval_Str'
      OnChange = RXItemFieldsChanged
    end
    object qryRXItemFrmDoseCalc_Dbl: TFloatField
      DisplayLabel = 'Dose'
      FieldName = 'FrmDoseCalc_Dbl'
    end
    object qryRXItemFrmDuration_Dbl: TFloatField
      DisplayLabel = 'Dur.'
      FieldName = 'FrmDuration_Dbl'
      OnChange = RXItemFieldsChanged
    end
    object qryRXItemFrmRepeat_Dbl: TFloatField
      DisplayLabel = 'Rep.'
      FieldName = 'FrmRepeat_Dbl'
      OnChange = RXItemFieldsChanged
    end
    object qryRXItemFrmDirections_Str: TWideStringField
      DisplayLabel = 'Dir.'
      FieldName = 'FrmDirections_Str'
      OnChange = RXItemFieldsChanged
      Size = 30
    end
    object qryRXItemFrmICDCode_Str: TWideStringField
      DisplayLabel = 'ICD'
      FieldName = 'FrmICDCode_Str'
      Size = 30
    end
    object qryRXItemFrmDescription_Str: TWideStringField
      DisplayLabel = 'Desc. (Formulation)'
      FieldName = 'FrmDescription_Str'
      Size = 500
    end
    object qryRXItemFrmProtocol_ID: TGuidField
      DisplayLabel = 'ProtocolID'
      FieldName = 'FrmProtocol_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXItemDspProduct_ID: TGuidField
      DisplayLabel = 'ProductID'
      FieldName = 'DspProduct_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXItemDspProduct_Str: TWideStringField
      DisplayLabel = 'Product'
      FieldName = 'DspProduct_Str'
      OnChange = RXItemFieldsChanged
      Size = 250
    end
    object qryRXItemDspSKUActual_Dbl: TFloatField
      DisplayLabel = 'Qty Act.'
      FieldName = 'DspSKUActual_Dbl'
      OnChange = RXItemFieldsChanged
    end
    object qryRXItemDspProductCalc_Dbl: TFloatField
      DisplayLabel = 'Packs Calc.'
      FieldName = 'DspProductCalc_Dbl'
      DisplayFormat = '# ##0.###'
    end
    object qryRXItemDspProductCost_Mny: TBCDField
      DisplayLabel = 'Pack Cost'
      FieldName = 'DspProductCost_Mny'
      DisplayFormat = 'R# ##0.00;-R# ##0.00'
      Precision = 19
    end
    object qryRXItemDspProductBreakPack_Bol: TBooleanField
      DisplayLabel = 'Brk'
      FieldName = 'DspProductBreakPack_Bol'
      OnChange = RXItemFieldsChanged
    end
    object qryRXItemDspItemCost_Mny: TBCDField
      DisplayLabel = 'Cost'
      FieldName = 'DspItemCost_Mny'
      DisplayFormat = 'R# ##0.00;-R# ##0.00'
      Precision = 19
    end
    object qryRXItemDspProductBatch_Str: TWideStringField
      DisplayLabel = 'Batch'
      FieldName = 'DspProductBatch_Str'
      Size = 50
    end
    object qryRXItemDspWarning_Str: TWideStringField
      DisplayLabel = 'Warning'
      FieldName = 'DspWarning_Str'
      OnChange = RXItemFieldsChanged
      Size = 150
    end
    object qryRXItemDspDirections_Str: TWideStringField
      DisplayLabel = 'Directions'
      FieldName = 'DspDirections_Str'
      OnChange = RXItemFieldsChanged
      Size = 250
    end
    object qryRXItemDspNotDispensed_Bol: TBooleanField
      DisplayLabel = 'Not Disp.'
      FieldName = 'DspNotDispensed_Bol'
      OnChange = RXItemFieldsChanged
    end
    object qryRXItemDspInterventionProblem_Str: TWideStringField
      DisplayLabel = 'Intervention Problem'
      FieldName = 'DspInterventionProblem_Str'
      Size = 350
    end
    object qryRXItemDspInterventionOutcome_Str: TWideStringField
      DisplayLabel = 'Intervention Outcome'
      FieldName = 'DspInterventionOutcome_Str'
      Size = 350
    end
    object qryRXItemDspLabel01_Str: TWideStringField
      FieldName = 'DspLabel01_Str'
      Size = 350
    end
    object qryRXItemDspLabel02_Str: TWideStringField
      FieldName = 'DspLabel02_Str'
      Size = 350
    end
    object qryRXItemDspLabel03_Str: TWideStringField
      FieldName = 'DspLabel03_Str'
      Size = 350
    end
    object qryRXItemDspLabel04_Str: TWideStringField
      FieldName = 'DspLabel04_Str'
      Size = 350
    end
    object qryRXItemDspLabel05_Str: TWideStringField
      FieldName = 'DspLabel05_Str'
      Size = 350
    end
    object qryRXItemDspLabel06_Str: TWideStringField
      FieldName = 'DspLabel06_Str'
      Size = 350
    end
    object qryRXItemItemPreview_Str: TWideStringField
      DisplayLabel = 'Item'
      FieldName = 'ItemPreview_Str'
      Size = 650
    end
    object qryRXItemFrmAdministrationUnit_Str: TWideStringField
      DisplayLabel = 'Unit'
      FieldName = 'FrmAdministrationUnit_Str'
      Size = 35
    end
    object qryRXItemFrmDailyDoseCalc_Dbl: TFloatField
      DisplayLabel = 'D. Dose'
      FieldName = 'FrmDailyDoseCalc_Dbl'
    end
    object qryRXItemFrmSKUTotal_Dbl: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'FrmSKUTotal_Dbl'
    end
    object qryRXItemDspDirectionsAuto_Bol: TBooleanField
      FieldName = 'DspDirectionsAuto_Bol'
      OnChange = RXItemFieldsChanged
      DisplayValues = ';Manual  Directions'
    end
    object qryRXItemDspDescription_Str: TWideStringField
      DisplayLabel = 'Description'
      FieldName = 'DspDescription_Str'
      Size = 500
    end
    object qryRXItemInputOrder_int: TIntegerField
      DisplayLabel = 'No'
      FieldName = 'InputOrder_int'
    end
  end
  object qryNumbering: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tblSystemRecordNumbering')
    Left = 472
    Top = 184
  end
  object qryPatient: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    DataSource = dsqryRX
    Parameters = <
      item
        Name = 'patient_ID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from tblPerson where (person_ID = :patient_ID) ')
    Left = 88
    Top = 240
  end
  object ppRX: TppReport
    AutoStop = False
    DataPipeline = ppDBRX
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 8000
    PrinterSetup.mmMarginLeft = 14000
    PrinterSetup.mmMarginRight = 14000
    PrinterSetup.mmMarginTop = 8000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'L:\My Programming\RxProjects\RxSolution\RxSolution Project\1.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 904
    Top = 20
    Version = '11.03'
    mmColumnWidth = 182000
    DataPipelineName = 'ppDBRX'
    object ppHeaderBand3: TppHeaderBand
      Save = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Style = bsClear
        Pen.Color = clSilver
        StretchWithParent = True
        mmHeight = 21431
        mmLeft = 0
        mmTop = 0
        mmWidth = 182827
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = clSilver
        DataField = 'clinic_str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 7366
        mmLeft = 180330
        mmTop = 12965
        mmWidth = 1439
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personLastName_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 8043
        mmLeft = 23813
        mmTop = 794
        mmWidth = 1609
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Color = clSilver
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 265
        mmLeft = 23548
        mmTop = 12171
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clAppWorkSpace
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'prescriptionNumber_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial Narrow'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 6519
        mmLeft = 180235
        mmTop = 265
        mmWidth = 1270
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personFirstName_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Name = 'Arial Narrow'
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 8043
        mmLeft = 24077
        mmTop = 12965
        mmWidth = 1609
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText12'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personRefNoCurrent_str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 5673
        mmLeft = 83608
        mmTop = 12965
        mmWidth = 1143
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label301'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ID/Passport:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 265
        mmTop = 529
        mmWidth = 14023
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personIDNumber_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 3387
        mmLeft = 265
        mmTop = 4763
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText15'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'RepeatStatus_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 4149
        mmLeft = 150813
        mmTop = 7673
        mmWidth = 30692
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Style = bsClear
        Pen.Color = clSilver
        mmHeight = 14023
        mmLeft = 0
        mmTop = 0
        mmWidth = 182034
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspDescription_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 8731
        mmLeft = 12965
        mmTop = 529
        mmWidth = 133879
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText27'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = clGray
        DataField = 'DspSKUActual_Dbl'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 4868
        mmLeft = 147109
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Pen.Color = clSilver
        mmHeight = 7144
        mmLeft = 161132
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText39'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspProductCalc_Dbl'
        DataPipeline = ppDBRX
        DisplayFormat = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 529
        mmWidth = 11642
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Pen.Color = clSilver
        mmHeight = 5556
        mmLeft = 161132
        mmTop = 7938
        mmWidth = 10319
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Color = clSilver
        mmHeight = 5556
        mmLeft = 171980
        mmTop = 7938
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText28'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'FrmDescription_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 4233
        mmLeft = 32808
        mmTop = 9525
        mmWidth = 91546
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText38'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = clRed
        DataField = 'DspItemCost_Mny'
        DataPipeline = ppDBRX
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 4233
        mmLeft = 147109
        mmTop = 5292
        mmWidth = 13758
        BandType = 4
      end
      object ppVariable6: TppVariable
        UserName = 'Variable6'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 9525
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspLabel03_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 3260
        mmLeft = 159967
        mmTop = 10054
        mmWidth = 635
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Color = clSilver
        Weight = 1
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 182000
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        SaveOrder = 4
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Printed On : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5000
        mmLeft = 0
        mmTop = 2117
        mmWidth = 21431
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        SaveOrder = 6
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd dd mmmm yyyy @ [hh:nn]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 21696
        mmTop = 2117
        mmWidth = 53711
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkColor = clBlue
        SaveOrder = 7
        Save = True
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 153723
        mmTop = 265
        mmWidth = 27781
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        SaveOrder = 5
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Report Version'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 7673
        mmWidth = 14288
        BandType = 8
      end
      object ppDBText20: TppDBText
        UserName = 'DBText6'
        HyperlinkColor = clBlue
        SaveOrder = 0
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Major'
        DisplayFormat = '#"."'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 14288
        mmTop = 7673
        mmWidth = 2646
        BandType = 8
      end
      object ppDBText25: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        SaveOrder = 1
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Minor'
        DisplayFormat = '0"."'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 16669
        mmTop = 7673
        mmWidth = 2381
        BandType = 8
      end
      object ppDBText31: TppDBText
        UserName = 'DBText8'
        HyperlinkColor = clBlue
        SaveOrder = 2
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Hi'
        DisplayFormat = '0"."'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 19050
        mmTop = 7673
        mmWidth = 2381
        BandType = 8
      end
      object ppDBText34: TppDBText
        UserName = 'DBText9'
        HyperlinkColor = clBlue
        SaveOrder = 3
        Save = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Lo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 21431
        mmTop = 7673
        mmWidth = 2910
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'prescriptionNumber_Str'
      OutlineSettings.CreateNode = True
      NewPage = True
      NewFile = False
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Save = True
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 60590
        mmPrintPosition = 0
        object ppRegion3: TppRegion
          UserName = 'Region3'
          Caption = 'Region3'
          Pen.Color = clSilver
          mmHeight = 33602
          mmLeft = 0
          mmTop = 16140
          mmWidth = 104511
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel9: TppLabel
            UserName = 'Label9'
            HyperlinkColor = clBlue
            SaveOrder = 32
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Patient Details'
            Color = 13695177
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 14
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 5786
            mmLeft = 1588
            mmTop = 17463
            mmWidth = 73554
            BandType = 3
            GroupNo = 0
          end
          object ppLabel16: TppLabel
            UserName = 'Label3'
            HyperlinkColor = clBlue
            SaveOrder = 23
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Language Narrative:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            WordWrap = True
            mmHeight = 5556
            mmLeft = 1323
            mmTop = 24871
            mmWidth = 22754
            BandType = 3
            GroupNo = 0
          end
          object ppDBText37: TppDBText
            UserName = 'DBText2'
            HyperlinkColor = clBlue
            SaveOrder = 5
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personLanguageNarrative_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5556
            mmLeft = 24871
            mmTop = 24871
            mmWidth = 33073
            BandType = 3
            GroupNo = 0
          end
          object ppDBText43: TppDBText
            UserName = 'DBText3'
            HyperlinkColor = clBlue
            SaveOrder = 8
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personLanguageWritten_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5556
            mmLeft = 71173
            mmTop = 24871
            mmWidth = 32015
            BandType = 3
            GroupNo = 0
          end
          object ppLabel18: TppLabel
            UserName = 'Label4'
            HyperlinkColor = clBlue
            SaveOrder = 28
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Written :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 58208
            mmTop = 24871
            mmWidth = 12965
            BandType = 3
            GroupNo = 0
          end
          object ppLabel19: TppLabel
            UserName = 'Label2'
            HyperlinkColor = clBlue
            SaveOrder = 18
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Date of Birth :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 1323
            mmTop = 30692
            mmWidth = 22754
            BandType = 3
            GroupNo = 0
          end
          object ppDBText46: TppDBText
            UserName = 'DBText1'
            HyperlinkColor = clBlue
            SaveOrder = 0
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personDOB_Dat'
            DataPipeline = ppDBRX
            DisplayFormat = 'mmmm d, yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5556
            mmLeft = 24871
            mmTop = 30692
            mmWidth = 33073
            BandType = 3
            GroupNo = 0
          end
          object ppLine8: TppLine
            UserName = 'Line8'
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Pen.Color = clSilver
            Weight = 0.75
            mmHeight = 1058
            mmLeft = 1588
            mmTop = 24077
            mmWidth = 101600
            BandType = 3
            GroupNo = 0
          end
          object ppDBText49: TppDBText
            UserName = 'DBText201'
            HyperlinkColor = clBlue
            SaveOrder = 6
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personGender_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5556
            mmLeft = 71173
            mmTop = 30692
            mmWidth = 10319
            BandType = 3
            GroupNo = 0
          end
          object ppLabel23: TppLabel
            UserName = 'Label23'
            HyperlinkColor = clBlue
            SaveOrder = 20
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Gender :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 58208
            mmTop = 30692
            mmWidth = 12965
            BandType = 3
            GroupNo = 0
          end
          object ppLabel20: TppLabel
            UserName = 'Label29'
            HyperlinkColor = clBlue
            SaveOrder = 22
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Cell Phone :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 1323
            mmTop = 36513
            mmWidth = 22754
            BandType = 3
            GroupNo = 0
          end
          object ppDBText50: TppDBText
            UserName = 'DBText36'
            HyperlinkColor = clBlue
            SaveOrder = 9
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personCelNoCurrent_str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5556
            mmLeft = 24871
            mmTop = 36513
            mmWidth = 33073
            BandType = 3
            GroupNo = 0
          end
          object ppLabel30: TppLabel
            UserName = 'Label30'
            HyperlinkColor = clBlue
            SaveOrder = 24
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Phone(H) :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 58208
            mmTop = 36513
            mmWidth = 12965
            BandType = 3
            GroupNo = 0
          end
          object ppDBText52: TppDBText
            UserName = 'DBText37'
            HyperlinkColor = clBlue
            SaveOrder = 10
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personTelNoCurrent_str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5556
            mmLeft = 71173
            mmTop = 36513
            mmWidth = 32015
            BandType = 3
            GroupNo = 0
          end
          object ppLabel43: TppLabel
            UserName = 'Label43'
            HyperlinkColor = clBlue
            SaveOrder = 29
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Address :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 1323
            mmTop = 43127
            mmWidth = 22754
            BandType = 3
            GroupNo = 0
          end
          object ppDBText92: TppDBText
            UserName = 'DBText92'
            HyperlinkColor = clBlue
            SaveOrder = 12
            Save = True
            AutoSize = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personAddressCurrent_str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 4106
            mmLeft = 24871
            mmTop = 43127
            mmWidth = 804
            BandType = 3
            GroupNo = 0
          end
          object ppDBText47: TppDBText
            UserName = 'DBText16'
            HyperlinkColor = clBlue
            SaveOrder = 4
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personWeight_int'
            DataPipeline = ppDBPipeline1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            ParentDataPipeline = False
            Transparent = True
            DataPipelineName = 'ppDBPipeline1'
            mmHeight = 5556
            mmLeft = 95515
            mmTop = 30692
            mmWidth = 7673
            BandType = 3
            GroupNo = 0
          end
          object ppLabel21: TppLabel
            UserName = 'Label21'
            HyperlinkColor = clBlue
            SaveOrder = 19
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Weight :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 81756
            mmTop = 30692
            mmWidth = 12965
            BandType = 3
            GroupNo = 0
          end
        end
        object ppRegion1: TppRegion
          UserName = 'Region1'
          Pen.Color = clSilver
          mmHeight = 33867
          mmLeft = 104246
          mmTop = 16140
          mmWidth = 78052
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLine9: TppLine
            UserName = 'Line9'
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Pen.Color = clSilver
            Weight = 0.75
            mmHeight = 1058
            mmLeft = 105304
            mmTop = 24077
            mmWidth = 76200
            BandType = 3
            GroupNo = 0
          end
          object ppLabel31: TppLabel
            UserName = 'Label5'
            HyperlinkColor = clBlue
            SaveOrder = 30
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Information'
            Color = 13695177
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 14
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 5786
            mmLeft = 105304
            mmTop = 17463
            mmWidth = 67469
            BandType = 3
            GroupNo = 0
          end
          object ppDBText3: TppDBText
            UserName = 'DBText5'
            HyperlinkColor = clBlue
            SaveOrder = 11
            Save = True
            AutoSize = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Color = clSilver
            DataField = 'prescriptionStatus_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Name = 'Arial Narrow'
            Font.Size = 18
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 7366
            mmLeft = 179272
            mmTop = 25135
            mmWidth = 1439
            BandType = 3
            GroupNo = 0
          end
          object ppDBBarCode1: TppDBBarCode
            UserName = 'DBBarCode1'
            AlignBarCode = ahLeft
            BarCodeType = bcCode39
            BarColor = clWindowText
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personRefNoCurrent_str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Courier New'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5292
            mmLeft = 119327
            mmTop = 33073
            mmWidth = 61119
            BandType = 3
            GroupNo = 0
            mmBarWidth = 254
            mmWideBarRatio = 76200
          end
        end
        object ppRegion5: TppRegion
          UserName = 'Region5'
          Brush.Color = clSilver
          Caption = 'Region5'
          Pen.Style = psClear
          StretchWithParent = True
          mmHeight = 11377
          mmLeft = 0
          mmTop = 49477
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel55: TppLabel
            UserName = 'Label102'
            HyperlinkColor = clBlue
            SaveOrder = 14
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Product'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4498
            mmLeft = 12700
            mmTop = 50800
            mmWidth = 146315
            BandType = 3
            GroupNo = 0
          end
          object ppLabel56: TppLabel
            UserName = 'Label32'
            HyperlinkColor = clBlue
            SaveOrder = 25
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Packs'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4022
            mmLeft = 1058
            mmTop = 50800
            mmWidth = 10848
            BandType = 3
            GroupNo = 0
          end
          object ppLabel57: TppLabel
            UserName = 'Label33'
            HyperlinkColor = clBlue
            SaveOrder = 26
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Units'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4498
            mmLeft = 146315
            mmTop = 55298
            mmWidth = 10848
            BandType = 3
            GroupNo = 0
          end
          object ppLabel58: TppLabel
            UserName = 'Label11'
            HyperlinkColor = clBlue
            SaveOrder = 15
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Quantity'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3969
            mmLeft = 161132
            mmTop = 50800
            mmWidth = 20902
            BandType = 3
            GroupNo = 0
          end
          object ppLabel59: TppLabel
            UserName = 'Label34'
            HyperlinkColor = clBlue
            SaveOrder = 27
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Label'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4498
            mmLeft = 160602
            mmTop = 55562
            mmWidth = 9790
            BandType = 3
            GroupNo = 0
          end
          object ppLabel60: TppLabel
            UserName = 'Label26'
            HyperlinkColor = clBlue
            SaveOrder = 21
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Product'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4498
            mmLeft = 171186
            mmTop = 55562
            mmWidth = 11642
            BandType = 3
            GroupNo = 0
          end
          object ppLabel14: TppLabel
            UserName = 'Label14'
            HyperlinkColor = clBlue
            SaveOrder = 17
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'ICN|ECN'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 1058
            mmTop = 55297
            mmWidth = 13758
            BandType = 3
            GroupNo = 0
          end
        end
        object ppRegion2: TppRegion
          UserName = 'Region2'
          Caption = 'Region2'
          Pen.Color = clSilver
          mmHeight = 16140
          mmLeft = 0
          mmTop = 529
          mmWidth = 182298
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel50: TppLabel
            UserName = 'Label12'
            HyperlinkColor = clBlue
            SaveOrder = 16
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Prescription Pick List'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            mmHeight = 4106
            mmLeft = 1323
            mmTop = 1058
            mmWidth = 180182
            BandType = 3
            GroupNo = 0
          end
          object ppLine15: TppLine
            UserName = 'Line6'
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Pen.Color = clSilver
            Weight = 0.75
            mmHeight = 1058
            mmLeft = 1323
            mmTop = 1058
            mmWidth = 82550
            BandType = 3
            GroupNo = 0
          end
          object ppDBText72: TppDBText
            UserName = 'DBText202'
            HyperlinkColor = clBlue
            SaveOrder = 7
            Save = True
            AutoSize = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'date_Dat'
            DataPipeline = ppDBRX
            DisplayFormat = 'mmmm d, yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 4911
            mmLeft = 180001
            mmTop = 6085
            mmWidth = 974
            BandType = 3
            GroupNo = 0
          end
          object ppLine16: TppLine
            UserName = 'Line7'
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Pen.Color = clSilver
            Weight = 0.75
            mmHeight = 1058
            mmLeft = 99219
            mmTop = 1058
            mmWidth = 82550
            BandType = 3
            GroupNo = 0
          end
          object ppDBText4: TppDBText
            UserName = 'DBText10'
            HyperlinkColor = clBlue
            SaveOrder = 1
            Save = True
            AutoSize = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Color = clSilver
            DataField = 'DemanderName_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 4911
            mmLeft = 98425
            mmTop = 5556
            mmWidth = 974
            BandType = 3
            GroupNo = 0
          end
          object ppLabel1: TppLabel
            UserName = 'Label8'
            HyperlinkColor = clBlue
            SaveOrder = 31
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Dispenser :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 1058
            mmTop = 5556
            mmWidth = 12965
            BandType = 3
            GroupNo = 0
          end
          object ppDBText5: TppDBText
            UserName = 'DBText11'
            HyperlinkColor = clBlue
            SaveOrder = 2
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'dispenserName_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 5292
            mmLeft = 14023
            mmTop = 5556
            mmWidth = 60854
            BandType = 3
            GroupNo = 0
          end
          object ppLabel2: TppLabel
            UserName = 'Label10'
            HyperlinkColor = clBlue
            SaveOrder = 13
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Dispensed From :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            mmHeight = 3969
            mmLeft = 77788
            mmTop = 5556
            mmWidth = 20108
            BandType = 3
            GroupNo = 0
          end
          object ppDBText44: TppDBText
            UserName = 'DBText14'
            HyperlinkColor = clBlue
            SaveOrder = 3
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'DemanderAddress'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 4149
            mmLeft = 1323
            mmTop = 11377
            mmWidth = 179652
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Save = True
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 104775
        mmPrintPosition = 0
        object ppRegion4: TppRegion
          UserName = 'Region4'
          Brush.Color = clSilver
          Caption = 'Region4'
          Pen.Color = clBlue
          Pen.Style = psClear
          mmHeight = 8996
          mmLeft = 0
          mmTop = 265
          mmWidth = 182034
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBCalc1: TppDBCalc
            UserName = 'DBCalc1'
            HyperlinkColor = clBlue
            SaveOrder = 0
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'date_Dat'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            TextAlignment = taCentered
            DBCalcType = dcCount
            DataPipelineName = 'ppDBRX'
            mmHeight = 6615
            mmLeft = 2117
            mmTop = 1852
            mmWidth = 7408
            BandType = 5
            GroupNo = 0
          end
          object ppLabel72: TppLabel
            UserName = 'Label17'
            HyperlinkColor = clBlue
            SaveOrder = 9
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Items'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 6615
            mmLeft = 10583
            mmTop = 1852
            mmWidth = 8996
            BandType = 5
            GroupNo = 0
          end
          object ppLabel73: TppLabel
            UserName = 'Label18'
            HyperlinkColor = clBlue
            SaveOrder = 10
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'TOTAL Cost'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 6615
            mmLeft = 113506
            mmTop = 1852
            mmWidth = 20373
            BandType = 5
            GroupNo = 0
          end
          object ppDBText2: TppDBText
            UserName = 'DBText4'
            HyperlinkColor = clBlue
            SaveOrder = 3
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'prescriptionCost_Mon'
            DataPipeline = ppDBRX
            DisplayFormat = '$#,0.00;($#,0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 16
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 6615
            mmLeft = 137319
            mmTop = 1852
            mmWidth = 44186
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion6: TppRegion
          UserName = 'Region6'
          Caption = 'Region6'
          Pen.Color = clSilver
          mmHeight = 29633
          mmLeft = 0
          mmTop = 8996
          mmWidth = 182034
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppShape8: TppShape
            UserName = 'Shape8'
            Pen.Color = clSilver
            mmHeight = 7938
            mmLeft = 121973
            mmTop = 20108
            mmWidth = 59267
            BandType = 5
            GroupNo = 0
          end
          object ppShape5: TppShape
            UserName = 'Shape5'
            Pen.Color = clSilver
            mmHeight = 7938
            mmLeft = 1323
            mmTop = 20108
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppShape7: TppShape
            UserName = 'Shape7'
            Pen.Color = clSilver
            mmHeight = 7938
            mmLeft = 61913
            mmTop = 20108
            mmWidth = 58738
            BandType = 5
            GroupNo = 0
          end
          object ppShape15: TppShape
            UserName = 'Shape15'
            Pen.Color = clSilver
            mmHeight = 7938
            mmLeft = 101600
            mmTop = 28575
            mmWidth = 19050
            BandType = 5
            GroupNo = 0
          end
          object ppShape12: TppShape
            UserName = 'Shape12'
            Pen.Color = clSilver
            mmHeight = 8731
            mmLeft = 25400
            mmTop = 28575
            mmWidth = 34396
            BandType = 5
            GroupNo = 0
          end
          object ppShape13: TppShape
            UserName = 'Shape13'
            Pen.Color = clSilver
            mmHeight = 7938
            mmLeft = 121973
            mmTop = 28575
            mmWidth = 18785
            BandType = 5
            GroupNo = 0
          end
          object ppLabel75: TppLabel
            UserName = 'Label19'
            HyperlinkColor = clBlue
            SaveOrder = 11
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Pharmacy Information'
            Color = 13695177
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4868
            mmLeft = 0
            mmTop = 9261
            mmWidth = 73554
            BandType = 5
            GroupNo = 0
          end
          object ppLabel76: TppLabel
            UserName = 'Label35'
            HyperlinkColor = clBlue
            SaveOrder = 16
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Show and Tell'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            WordWrap = True
            mmHeight = 5556
            mmLeft = 1323
            mmTop = 28840
            mmWidth = 22754
            BandType = 5
            GroupNo = 0
          end
          object ppLabel77: TppLabel
            UserName = 'Label37'
            HyperlinkColor = clBlue
            SaveOrder = 18
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Patient Counseled :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 5556
            mmLeft = 61913
            mmTop = 28840
            mmWidth = 38629
            BandType = 5
            GroupNo = 0
          end
          object ppLine18: TppLine
            UserName = 'Line4'
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Pen.Color = clSilver
            Weight = 0.75
            mmHeight = 1058
            mmLeft = 0
            mmTop = 14817
            mmWidth = 181240
            BandType = 5
            GroupNo = 0
          end
          object ppLabel78: TppLabel
            UserName = 'Label38'
            HyperlinkColor = clBlue
            SaveOrder = 19
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Regimen'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 5292
            mmLeft = 104246
            mmTop = 28575
            mmWidth = 14023
            BandType = 5
            GroupNo = 0
          end
          object ppLabel79: TppLabel
            UserName = 'Label39'
            HyperlinkColor = clBlue
            SaveOrder = 20
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Picked :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 4233
            mmLeft = 1323
            mmTop = 14817
            mmWidth = 10319
            BandType = 5
            GroupNo = 0
          end
          object ppLabel81: TppLabel
            UserName = 'Label42'
            HyperlinkColor = clBlue
            SaveOrder = 21
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Authorised :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 4233
            mmLeft = 61913
            mmTop = 14817
            mmWidth = 13758
            BandType = 5
            GroupNo = 0
          end
          object ppLabel82: TppLabel
            UserName = 'Label44'
            HyperlinkColor = clBlue
            SaveOrder = 22
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Counselled :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 4233
            mmLeft = 122502
            mmTop = 14817
            mmWidth = 14817
            BandType = 5
            GroupNo = 0
          end
          object ppShape14: TppShape
            UserName = 'Shape14'
            Pen.Color = clSilver
            mmHeight = 7938
            mmLeft = 162190
            mmTop = 28575
            mmWidth = 19050
            BandType = 5
            GroupNo = 0
          end
          object ppShape16: TppShape
            UserName = 'Shape16'
            Pen.Color = clSilver
            mmHeight = 7938
            mmLeft = 141817
            mmTop = 28575
            mmWidth = 19050
            BandType = 5
            GroupNo = 0
          end
          object ppLabel84: TppLabel
            UserName = 'Label36'
            HyperlinkColor = clBlue
            SaveOrder = 17
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Use'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 5292
            mmLeft = 124354
            mmTop = 28575
            mmWidth = 14023
            BandType = 5
            GroupNo = 0
          end
          object ppLabel85: TppLabel
            UserName = 'Label46'
            HyperlinkColor = clBlue
            SaveOrder = 23
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Safety'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 5292
            mmLeft = 144463
            mmTop = 28575
            mmWidth = 14023
            BandType = 5
            GroupNo = 0
          end
          object ppLabel86: TppLabel
            UserName = 'Label47'
            HyperlinkColor = clBlue
            SaveOrder = 24
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Full Adherence'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 5292
            mmLeft = 163248
            mmTop = 28575
            mmWidth = 16933
            BandType = 5
            GroupNo = 0
          end
          object ppDBText78: TppDBText
            UserName = 'DBText47'
            HyperlinkColor = clBlue
            SaveOrder = 4
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'date_Dat'
            DisplayFormat = 'mmmm d, yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clSilver
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 150813
            mmTop = 10319
            mmWidth = 30427
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion8: TppRegion
          UserName = 'Region8'
          Caption = 'Region8'
          Pen.Color = clSilver
          mmHeight = 19315
          mmLeft = 0
          mmTop = 38894
          mmWidth = 182034
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel87: TppLabel
            UserName = 'Label48'
            HyperlinkColor = clBlue
            SaveOrder = 25
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Interventions'
            Color = 13695177
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4868
            mmLeft = 265
            mmTop = 39423
            mmWidth = 73554
            BandType = 5
            GroupNo = 0
          end
          object ppLine19: TppLine
            UserName = 'Line11'
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Pen.Color = clSilver
            Weight = 0.75
            mmHeight = 1058
            mmLeft = 265
            mmTop = 43656
            mmWidth = 181240
            BandType = 5
            GroupNo = 0
          end
          object ppLabel88: TppLabel
            UserName = 'Label49'
            HyperlinkColor = clBlue
            SaveOrder = 26
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = '(   /    /     ) @      h   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = []
            Transparent = True
            mmHeight = 5027
            mmLeft = 1588
            mmTop = 44186
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppShape17: TppShape
            UserName = 'Shape17'
            Pen.Color = clSilver
            mmHeight = 7673
            mmLeft = 1588
            mmTop = 49478
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppLabel89: TppLabel
            UserName = 'Label50'
            HyperlinkColor = clBlue
            SaveOrder = 27
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = '(   /    /     ) @      h   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = []
            Transparent = True
            mmHeight = 5027
            mmLeft = 62177
            mmTop = 44186
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppShape18: TppShape
            UserName = 'Shape101'
            Pen.Color = clSilver
            mmHeight = 7673
            mmLeft = 62177
            mmTop = 49478
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppLabel90: TppLabel
            UserName = 'Label52'
            HyperlinkColor = clBlue
            SaveOrder = 28
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = '(   /    /     ) @      h   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = []
            Transparent = True
            mmHeight = 5027
            mmLeft = 122767
            mmTop = 44186
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppShape19: TppShape
            UserName = 'Shape19'
            Pen.Color = clSilver
            mmHeight = 7673
            mmLeft = 122767
            mmTop = 49478
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion9: TppRegion
          UserName = 'Region9'
          Caption = 'Region9'
          Pen.Color = clSilver
          mmHeight = 15346
          mmLeft = 0
          mmTop = 57415
          mmWidth = 182034
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel22: TppLabel
            UserName = 'Label22'
            HyperlinkColor = clBlue
            SaveOrder = 12
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Protocols/Diagnosis :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            mmHeight = 4233
            mmLeft = 1058
            mmTop = 63765
            mmWidth = 23283
            BandType = 5
            GroupNo = 0
          end
          object ppDBText51: TppDBText
            UserName = 'DBText51'
            HyperlinkColor = clBlue
            SaveOrder = 5
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'Allergies'
            DataPipeline = ppDBAllergiesDisplay
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            ParentDataPipeline = False
            Transparent = True
            WordWrap = True
            DataPipelineName = 'ppDBAllergiesDisplay'
            mmHeight = 5027
            mmLeft = 26723
            mmTop = 58473
            mmWidth = 153723
            BandType = 5
            GroupNo = 0
          end
          object ppDBText53: TppDBText
            UserName = 'DBText53'
            HyperlinkColor = clBlue
            SaveOrder = 6
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'Protocols'
            DataPipeline = ppDBProtocolsDisplay
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            ParentDataPipeline = False
            Transparent = True
            WordWrap = True
            DataPipelineName = 'ppDBProtocolsDisplay'
            mmHeight = 8202
            mmLeft = 26723
            mmTop = 63765
            mmWidth = 153723
            BandType = 5
            GroupNo = 0
          end
          object ppLabel24: TppLabel
            UserName = 'Label24'
            HyperlinkColor = clBlue
            SaveOrder = 13
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Allergies :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 1058
            mmTop = 58473
            mmWidth = 22754
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion10: TppRegion
          UserName = 'Region10'
          Caption = 'Region10'
          Pen.Color = clSilver
          mmHeight = 32544
          mmLeft = 0
          mmTop = 72231
          mmWidth = 182034
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel54: TppLabel
            UserName = 'Label31'
            HyperlinkColor = clBlue
            SaveOrder = 15
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Prescriber :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 1058
            mmTop = 73289
            mmWidth = 15346
            BandType = 5
            GroupNo = 0
          end
          object ppDBText76: TppDBText
            UserName = 'DBText18'
            HyperlinkColor = clBlue
            SaveOrder = 2
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'prescriberName_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 12
            Font.Style = [fsBold]
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 6085
            mmLeft = 17992
            mmTop = 73289
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppDBText33: TppDBText
            UserName = 'DBText13'
            HyperlinkColor = clBlue
            SaveOrder = 1
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personQualificationName_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 4233
            mmLeft = 17992
            mmTop = 84138
            mmWidth = 52123
            BandType = 5
            GroupNo = 0
          end
          object ppLabel15: TppLabel
            UserName = 'Label15'
            HyperlinkColor = clBlue
            SaveOrder = 8
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Signature :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 78846
            mmTop = 73289
            mmWidth = 12435
            BandType = 5
            GroupNo = 0
          end
          object ppDBImage1: TppDBImage
            UserName = 'DBImage1'
            AlignHorizontal = ahCenter
            AlignVertical = avCenter
            MaintainAspectRatio = False
            Stretch = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personSignatureImage_Img'
            DataPipeline = ppDBRX
            GraphicType = 'Bitmap'
            DataPipelineName = 'ppDBRX'
            mmHeight = 30427
            mmLeft = 91546
            mmTop = 73289
            mmWidth = 88900
            BandType = 5
            GroupNo = 0
          end
          object ppDBText54: TppDBText
            UserName = 'DBText54'
            HyperlinkColor = clBlue
            SaveOrder = 7
            Save = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'personRegistrationNo_str'
            DataPipeline = ppDBPrescriberNumber
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            ParentDataPipeline = False
            Transparent = True
            DataPipelineName = 'ppDBPrescriberNumber'
            mmHeight = 4233
            mmLeft = 17992
            mmTop = 79640
            mmWidth = 52123
            BandType = 5
            GroupNo = 0
          end
          object ppLabel25: TppLabel
            UserName = 'Label25'
            HyperlinkColor = clBlue
            SaveOrder = 14
            Save = True
            AutoSize = False
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Prof. Number : '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Name = 'Arial Narrow'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            mmHeight = 4233
            mmLeft = 1058
            mmTop = 79640
            mmWidth = 15875
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65364F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365067970726F636564757265205661726961
        626C65364F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D2020444252585B2749434E5F
        737472275D202B2027207C2027202B2020444252585B2745434E5F737472275D
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609566172696162
        6C6536094576656E744E616D6506064F6E43616C63074576656E744944022100
        00}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppRXLabel: TppReport
    AutoStop = False
    DataPipeline = ppDBRXLabels
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default tray'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 1000
    PrinterSetup.mmMarginLeft = 1000
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 1000
    PrinterSetup.mmPaperHeight = 50000
    PrinterSetup.mmPaperWidth = 70000
    PrinterSetup.PaperSize = 256
    Template.FileName = 
      'C:\Users\mmankga\MyWorks\RxSolution 1.2.6.0001\Documentation\Lab' +
      'el.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 905
    Top = 90
    Version = '11.03'
    mmColumnWidth = 68000
    DataPipelineName = 'ppDBRXLabels'
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object ppDBText36: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspLabel03_Str'
        DataPipeline = ppDBRXLabels
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBRXLabels'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17992
        mmWidth = 74083
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspLabel04_Str'
        DataPipeline = ppDBRXLabels
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBRXLabels'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 21696
        mmWidth = 67733
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText5'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspLabel06_Str'
        DataPipeline = ppDBRXLabels
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBRXLabels'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 31750
        mmWidth = 67733
        BandType = 4
      end
      object ppRegion12: TppRegion
        UserName = 'Region12'
        Caption = 'Region12'
        Pen.Color = clSilver
        mmHeight = 8000
        mmLeft = 0
        mmTop = 0
        mmWidth = 67998
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText32: TppDBText
          UserName = 'DBText32'
          HyperlinkColor = clBlue
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Color = clBlack
          DataField = 'DspLabel01_Str'
          DataPipeline = ppDBRXLabels
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial Narrow'
          Font.Size = 7
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          DataPipelineName = 'ppDBRXLabels'
          mmHeight = 7144
          mmLeft = 794
          mmTop = 265
          mmWidth = 66146
          BandType = 4
        end
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 0
        mmTop = 24606
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspLabel02_Str'
        DataPipeline = ppDBRXLabels
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBRXLabels'
        mmHeight = 8467
        mmLeft = 794
        mmTop = 8996
        mmWidth = 65881
        BandType = 4
      end
      object ppVariable5: TppVariable
        UserName = 'Variable5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        BlankWhenZero = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 0
        mmTop = 28046
        mmWidth = 8467
        BandType = 4
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066A70726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D20444252584C6162656C735B
        274473704C6162656C30355F537472275D0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D6506095661726961626C6531094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060F5661726961626C65354F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        067A70726F636564757265205661726961626C65354F6E43616C632876617220
        56616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C
        7565203A3D20202027205B272B44617465546F53747228444252584C6162656C
        735B27646174655F446174275D292B275D270D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D6506095661726961626C6535094576656E744E616D6506
        064F6E43616C63074576656E74494402210000}
    end
    object ppParameterList3: TppParameterList
    end
  end
  object ppRXAddress: TppReport
    AutoStop = False
    DataPipeline = ppDBRXAddress
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 3000
    PrinterSetup.mmMarginLeft = 3000
    PrinterSetup.mmMarginRight = 3000
    PrinterSetup.mmMarginTop = 3000
    PrinterSetup.mmPaperHeight = 45000
    PrinterSetup.mmPaperWidth = 70000
    PrinterSetup.PaperSize = 256
    Template.FileName = 
      'C:\Users\mmankga\MyWorks\RxSolution 1.2.6.0001\Documentation\add' +
      'ress_Label.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 905
    Top = 160
    Version = '11.03'
    mmColumnWidth = 52300
    DataPipelineName = 'ppDBRXAddress'
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
      object ppDBText80: TppDBText
        UserName = 'DBText80'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personLastName_Str'
        DataPipeline = ppDBRXAddress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRXAddress'
        mmHeight = 4191
        mmLeft = 265
        mmTop = 0
        mmWidth = 63765
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText84'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'clinic_str'
        DataPipeline = ppDBRXAddress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRXAddress'
        mmHeight = 5842
        mmLeft = 265
        mmTop = 32279
        mmWidth = 63000
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personAddressCurrent_str'
        DataPipeline = ppDBRXAddress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBRXAddress'
        mmHeight = 10054
        mmLeft = 265
        mmTop = 17463
        mmWidth = 64029
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personFirstName_Str'
        DataPipeline = ppDBRXAddress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRXAddress'
        mmHeight = 4149
        mmLeft = 265
        mmTop = 3969
        mmWidth = 63765
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 12435
        mmWidth = 64029
        BandType = 4
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        CheckBoxColor = clWindowText
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDBRXAddress
        DataField = 'batchIsBatched_bol'
        DataPipelineName = 'ppDBRXAddress'
        mmHeight = 5821
        mmLeft = 59267
        mmTop = 27781
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Referred'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 46302
        mmTop = 28840
        mmWidth = 13716
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personRefNoCurrent_str'
        DataPipeline = ppDBRXAddress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRXAddress'
        mmHeight = 4149
        mmLeft = 265
        mmTop = 8202
        mmWidth = 63765
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'complexSiteDepartment_str'
        DataPipeline = ppDBRXAddress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRXAddress'
        mmHeight = 5027
        mmLeft = 265
        mmTop = 12435
        mmWidth = 63236
        BandType = 4
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object qryRXItem_BackgroundWorker: TADOQuery
    Connection = conRx
    DataSource = dsqryRX
    Parameters = <
      item
        Name = 'prescription_ID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'Select * from TblRXItem where  (RX_ID = :prescription_ID)')
    Left = 88
    Top = 304
  end
  object qryAppendRX: TADOQuery
    Connection = conRx
    Parameters = <
      item
        Name = 'rxId'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end
      item
        Name = 'patId'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end
      item
        Name = 'rxNum'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'INSERT INTO tblPrescription (prescription_ID,  patient_ID, presc' +
        'riptionNumber_Str) values (:rxId,  :patId, :rxNum)')
    Left = 88
    Top = 376
  end
  object qryRXPrint: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'prescription_id'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  tblPrescription.*, tblRXItem.*, tblPerson.*, tblProductP' +
        'ackSize.ICN_str, tblProductPackSize.ECN_str, tblDemander.Name_st' +
        'r +'#39' T:('#39'+ISNULL(tblDemander.Phone_str, '#39'N'#39') +'#39')'#39' AS DemanderNam' +
        'e, '
      
        #9#9'ISNULL(tblDemander.Address1_str, '#39#39') +'#39', '#39'+ ISNULL(tblDemander' +
        '.Address2_str, '#39#39') +'#39', '#39'+ ISNULL(tblDemander.Address3_str, '#39#39') +' +
        ' '#39' Tel: '#39' + ISNULL(tblDemander.Phone_str, '#39#39')   AS DemanderAddre' +
        'ss,'
      
        #9#9'tblPersonSignature.personSignatureImage_Img, tblPersonQualific' +
        'ation.personQualificationName_Str, tblProductPackSize.StorageCon' +
        'ditions_str, tblProductPackSize.StorageTemp_str, tblProductPackS' +
        'ize.Refrigerated_bol,'
      
        #9#9'ISNULL(tblClinic.clinicAddress01_str, '#39#39') +'#39', '#39' +  ISNULL(tblC' +
        'linic.clinicAddress02_str, '#39#39') +'#39', '#39' + ISNULL(tblClinic.clinicAd' +
        'dress03_str, '#39#39') +'#39', '#39' + ISNULL(tblClinic.clinicAddress04_str, '#39 +
        #39') AS ClinicAddress, '
      
        '                                tblPrescription.clinic_str + '#39'Te' +
        'l: '#39'+ ISNULL(tblclinic.clinicTelephone_str, '#39#39') AS Clinic'
      ''
      'FROM tblPrescription'
      
        'LEFT OUTER JOIN tblDemander ON tblDemander.DemanderUnique_ID = t' +
        'blPrescription.DemanderUnique_ID'
      
        'LEFT OUTER JOIN tblPersonSignature ON tblPersonSignature.person_' +
        'ID = tblPrescription.prescriber_ID '
      
        'LEFT OUTER JOIN tblPersonQualification ON tblPersonQualification' +
        '.person_ID = tblPrescription.prescriber_ID '
      
        'LEFT OUTER JOIN tblClinic ON tblClinic.Clinic_ID = tblPrescripti' +
        'on.clinic_ID'
      ', tblRXItem, tblPerson, tblProductPackSize'
      ''
      
        'WHERE ((tblPrescription.prescription_id = tblRXItem.RX_ID) and (' +
        'tblPrescription.patient_id = tblPerson.person_id) and (tblPrescr' +
        'iption.prescription_id = :prescription_id) and (tblRXItem.DspNot' +
        'Dispensed_Bol <> 1) and (tblProductPackSize.productPackSize_ID=t' +
        'blRxItem.DspProduct_ID))'
      'ORDER BY tblRXItem.InputOrder_int')
    Left = 656
    Top = 16
    object qryRXPrintprescription_ID_Original: TGuidField
      FieldName = 'prescription_ID_Original'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintrepeatDate_dat: TDateTimeField
      FieldName = 'repeatDate_dat'
    end
    object qryRXPrintcompleted_bol: TBooleanField
      FieldName = 'completed_bol'
    end
    object qryRXPrintdownRefferal_Str: TWideStringField
      FieldName = 'downRefferal_Str'
      Size = 50
    end
    object qryRXPrintissuedOrCollected_Bol: TBooleanField
      FieldName = 'issuedOrCollected_Bol'
    end
    object qryRXPrintdispensed_Bol: TBooleanField
      FieldName = 'dispensed_Bol'
    end
    object qryRXPrintisReferred_bol: TBooleanField
      FieldName = 'isReferred_bol'
    end
    object qryRXPrintactive_bol: TBooleanField
      FieldName = 'active_bol'
    end
    object qryRXPrintclinic_ID: TGuidField
      FieldName = 'clinic_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintprescription_ID: TGuidField
      FieldName = 'prescription_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintprescriptionLastEdited_dat: TDateTimeField
      FieldName = 'prescriptionLastEdited_dat'
    end
    object qryRXPrintprescriptionLastEdited_ID: TGuidField
      FieldName = 'prescriptionLastEdited_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintprescriptionLastEdited_Str: TWideStringField
      FieldName = 'prescriptionLastEdited_Str'
      Size = 30
    end
    object qryRXPrintprescriptionNumber_Str: TWideStringField
      FieldName = 'prescriptionNumber_Str'
      Size = 50
    end
    object qryRXPrintdate_Dat: TDateTimeField
      FieldName = 'date_Dat'
    end
    object qryRXPrintpatient_ID: TGuidField
      FieldName = 'patient_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintpatientName_Str: TWideStringField
      FieldName = 'patientName_Str'
      Size = 50
    end
    object qryRXPrintfolderNumber_Str: TWideStringField
      FieldName = 'folderNumber_Str'
      Size = 30
    end
    object qryRXPrintadmissionNo_Str: TWideStringField
      FieldName = 'admissionNo_Str'
      Size = 30
    end
    object qryRXPrintprescriber_ID: TGuidField
      FieldName = 'prescriber_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintprescriberName_Str: TWideStringField
      FieldName = 'prescriberName_Str'
      Size = 50
    end
    object qryRXPrintprescriberRXLevel_Str: TWideStringField
      FieldName = 'prescriberRXLevel_Str'
      Size = 50
    end
    object qryRXPrintprescriberAlert_mem: TMemoField
      FieldName = 'prescriberAlert_mem'
      BlobType = ftMemo
    end
    object qryRXPrintprescribedAuthorisedBy_Str: TWideStringField
      FieldName = 'prescribedAuthorisedBy_Str'
      Size = 50
    end
    object qryRXPrintdispenser_ID: TGuidField
      FieldName = 'dispenser_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintdispenserName_Str: TWideStringField
      FieldName = 'dispenserName_Str'
      Size = 50
    end
    object qryRXPrintdispenserRxLevel_Str: TWideStringField
      FieldName = 'dispenserRxLevel_Str'
      Size = 50
    end
    object qryRXPrintdispensedAuthorisedBy_Str: TWideStringField
      FieldName = 'dispensedAuthorisedBy_Str'
      Size = 50
    end
    object qryRXPrintrepeats_Int: TIntegerField
      FieldName = 'repeats_Int'
    end
    object qryRXPrintrepeatNo_Int: TIntegerField
      FieldName = 'repeatNo_Int'
    end
    object qryRXPrintprescriptionCost_Mon: TBCDField
      FieldName = 'prescriptionCost_Mon'
      Precision = 19
    end
    object qryRXPrintprescriptionItemsCount_Int: TIntegerField
      FieldName = 'prescriptionItemsCount_Int'
    end
    object qryRXPrintclinic_str: TWideStringField
      FieldName = 'clinic_str'
      Size = 50
    end
    object qryRXPrintcomplexDept_str: TWideStringField
      FieldName = 'complexDept_str'
      Size = 30
    end
    object qryRXPrintprescriptionActive_bol: TBooleanField
      FieldName = 'prescriptionActive_bol'
    end
    object qryRXPrintprescriptionStatus_Str: TWideStringField
      FieldName = 'prescriptionStatus_Str'
      Size = 50
    end
    object qryRXPrintprescriptionStatus_ID: TGuidField
      FieldName = 'prescriptionStatus_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintdownRefRouteSchedule_ID: TGuidField
      FieldName = 'downRefRouteSchedule_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintbatchIsBatched_bol: TBooleanField
      FieldName = 'batchIsBatched_bol'
    end
    object qryRXPrintprescriptionAuthorised_bol: TBooleanField
      FieldName = 'prescriptionAuthorised_bol'
    end
    object qryRXPrintdispensingAuthorised_bol: TBooleanField
      FieldName = 'dispensingAuthorised_bol'
    end
    object qryRXPrintdispensingCollected_bol: TBooleanField
      FieldName = 'dispensingCollected_bol'
    end
    object qryRXPrintdispensingPicked_bol: TBooleanField
      FieldName = 'dispensingPicked_bol'
    end
    object qryRXPrintbatchIsCollated_bol: TBooleanField
      FieldName = 'batchIsCollated_bol'
    end
    object qryRXPrintbatchIsShipped_bol: TBooleanField
      FieldName = 'batchIsShipped_bol'
    end
    object qryRXPrintprotocolID: TGuidField
      FieldName = 'protocolID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintdispensingPosted_bol: TBooleanField
      FieldName = 'dispensingPosted_bol'
    end
    object qryRXPrintnaive_bol: TBooleanField
      FieldName = 'naive_bol'
    end
    object qryRXPrintDemanderUnique_ID: TGuidField
      FieldName = 'DemanderUnique_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintDemanderName_Str: TWideStringField
      FieldName = 'DemanderName_Str'
      Size = 50
    end
    object qryRXPrintRepeatStatus_Str: TWideStringField
      FieldName = 'RepeatStatus_Str'
      Size = 50
    end
    object qryRXPrintRepeatDuration_Int: TIntegerField
      FieldName = 'RepeatDuration_Int'
    end
    object qryRXPrintpersonpregnant_bol: TBooleanField
      FieldName = 'personpregnant_bol'
    end
    object qryRXPrintvstTreamentPrescribed_bol: TBooleanField
      FieldName = 'vstTreamentPrescribed_bol'
    end
    object qryRXPrintvstPregnancyDeliveryDate_dat: TDateTimeField
      FieldName = 'vstPregnancyDeliveryDate_dat'
    end
    object qryRXPrintvstFunctionalStatus_str: TWideStringField
      FieldName = 'vstFunctionalStatus_str'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintvstClinicalStage_str: TWideStringField
      FieldName = 'vstClinicalStage_str'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintvstOI_none_bol: TBooleanField
      FieldName = 'vstOI_none_bol'
    end
    object qryRXPrintvstOI_TB_bol: TBooleanField
      FieldName = 'vstOI_TB_bol'
    end
    object qryRXPrintvstOI_Pneumocystis_Carinii_bol: TBooleanField
      FieldName = 'vstOI_Pneumocystis_Carinii_bol'
    end
    object qryRXPrintvstOI_Herpes_bit: TBooleanField
      FieldName = 'vstOI_Herpes_bit'
    end
    object qryRXPrintvstOI_Cytomegalovirus_bol: TBooleanField
      FieldName = 'vstOI_Cytomegalovirus_bol'
    end
    object qryRXPrintvstOI_Cryptococcal_Meningitis_bol: TBooleanField
      FieldName = 'vstOI_Cryptococcal_Meningitis_bol'
    end
    object qryRXPrintvstOI_Toxoplasmosis_bol: TBooleanField
      FieldName = 'vstOI_Toxoplasmosis_bol'
    end
    object qryRXPrintvstOI_Kaposi_Sarcoma_bol: TBooleanField
      FieldName = 'vstOI_Kaposi_Sarcoma_bol'
    end
    object qryRXPrintvstOI_Oropharyngial_bol: TBooleanField
      FieldName = 'vstOI_Oropharyngial_bol'
    end
    object qryRXPrintvstOI_Other_str: TWideStringField
      FieldName = 'vstOI_Other_str'
      Size = 50
    end
    object qryRXPrintvstPropo_CoTri_Start_dat: TDateTimeField
      FieldName = 'vstPropo_CoTri_Start_dat'
    end
    object qryRXPrintvstPropo_CoTri_Stopped_dat: TDateTimeField
      FieldName = 'vstPropo_CoTri_Stopped_dat'
    end
    object qryRXPrintvstPropo_Fluconazole_Start_dat: TDateTimeField
      FieldName = 'vstPropo_Fluconazole_Start_dat'
    end
    object qryRXPrintvstPropo_Fluconazole_Stopped_dat: TDateTimeField
      FieldName = 'vstPropo_Fluconazole_Stopped_dat'
    end
    object qryRXPrintvstPropo_INH_Start_dat: TDateTimeField
      FieldName = 'vstPropo_INH_Start_dat'
    end
    object qryRXPrintvstPropo_INH_Stopped_dat: TDateTimeField
      FieldName = 'vstPropo_INH_Stopped_dat'
    end
    object qryRXPrintvstPropo_TBTreatment_Start_dat: TDateTimeField
      FieldName = 'vstPropo_TBTreatment_Start_dat'
    end
    object qryRXPrintvstPropo_TBTreatment_Stopped_dat: TDateTimeField
      FieldName = 'vstPropo_TBTreatment_Stopped_dat'
    end
    object qryRXPrintvstRegimenChange_From_str: TWideStringField
      FieldName = 'vstRegimenChange_From_str'
      Size = 50
    end
    object qryRXPrintvstRegimenChange_To_str: TWideStringField
      FieldName = 'vstRegimenChange_To_str'
      Size = 50
    end
    object qryRXPrintvstRegimenChange_Reason_str: TWideStringField
      FieldName = 'vstRegimenChange_Reason_str'
      Size = 50
    end
    object qryRXPrintvstVisitDate_dat: TDateTimeField
      FieldName = 'vstVisitDate_dat'
    end
    object qryRXPrintvstNextVisit_dat: TDateTimeField
      FieldName = 'vstNextVisit_dat'
    end
    object qryRXPrintvstScheduledVisit_dat: TDateTimeField
      FieldName = 'vstScheduledVisit_dat'
    end
    object qryRXPrintvstRegimenStart_str: TWideStringField
      FieldName = 'vstRegimenStart_str'
      Size = 50
    end
    object qryRXPrintvstLostToFollowUpDate_dat: TDateTimeField
      FieldName = 'vstLostToFollowUpDate_dat'
    end
    object qryRXPrintvstTreatmentStopped_date_dat: TDateTimeField
      FieldName = 'vstTreatmentStopped_date_dat'
    end
    object qryRXPrintvstRegimenStartDate_dat: TDateTimeField
      FieldName = 'vstRegimenStartDate_dat'
    end
    object qryRXPrintuser_id: TGuidField
      FieldName = 'user_id'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintcomplexSiteDepartment_ID: TGuidField
      FieldName = 'complexSiteDepartment_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintcomplexSiteDepartment_str: TWideStringField
      FieldName = 'complexSiteDepartment_str'
      Size = 50
    end
    object qryRXPrintPersonAge_int: TIntegerField
      FieldName = 'PersonAge_int'
    end
    object qryRXPrintRxCancelReasonsAfterPosting_str: TWideStringField
      FieldName = 'RxCancelReasonsAfterPosting_str'
      Size = 50
    end
    object qryRXPrintRXItem_ID: TGuidField
      FieldName = 'RXItem_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintRX_ID: TGuidField
      FieldName = 'RX_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintFrmFormulation_Str: TWideStringField
      FieldName = 'FrmFormulation_Str'
      Size = 200
    end
    object qryRXPrintFrmAdministration_Str: TWideStringField
      FieldName = 'FrmAdministration_Str'
      Size = 35
    end
    object qryRXPrintFrmSKU_Dbl: TFloatField
      FieldName = 'FrmSKU_Dbl'
    end
    object qryRXPrintFrmInterval_Str: TWideStringField
      FieldName = 'FrmInterval_Str'
    end
    object qryRXPrintFrmAdministrationUnit_Str: TWideStringField
      FieldName = 'FrmAdministrationUnit_Str'
      Size = 35
    end
    object qryRXPrintFrmDailyDoseCalc_Dbl: TFloatField
      FieldName = 'FrmDailyDoseCalc_Dbl'
    end
    object qryRXPrintFrmDoseCalc_Dbl: TFloatField
      FieldName = 'FrmDoseCalc_Dbl'
    end
    object qryRXPrintFrmSKUTotal_Dbl: TFloatField
      FieldName = 'FrmSKUTotal_Dbl'
    end
    object qryRXPrintFrmDuration_Dbl: TFloatField
      FieldName = 'FrmDuration_Dbl'
    end
    object qryRXPrintFrmRepeat_Dbl: TFloatField
      FieldName = 'FrmRepeat_Dbl'
    end
    object qryRXPrintFrmDirections_Str: TWideStringField
      FieldName = 'FrmDirections_Str'
      Size = 30
    end
    object qryRXPrintFrmICDCode_Str: TWideStringField
      FieldName = 'FrmICDCode_Str'
    end
    object qryRXPrintFrmDescription_Str: TWideStringField
      FieldName = 'FrmDescription_Str'
      Size = 300
    end
    object qryRXPrintFrmProtocol_ID: TGuidField
      FieldName = 'FrmProtocol_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintDspDescription_Str: TWideStringField
      FieldName = 'DspDescription_Str'
      Size = 300
    end
    object qryRXPrintDspProduct_ID: TGuidField
      FieldName = 'DspProduct_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintDspProduct_Str: TWideStringField
      FieldName = 'DspProduct_Str'
      Size = 250
    end
    object qryRXPrintDspSKUActual_Dbl: TFloatField
      FieldName = 'DspSKUActual_Dbl'
    end
    object qryRXPrintDspProductCalc_Dbl: TFloatField
      FieldName = 'DspProductCalc_Dbl'
    end
    object qryRXPrintDspProductCost_Mny: TBCDField
      FieldName = 'DspProductCost_Mny'
      Precision = 19
    end
    object qryRXPrintDspProductBreakPack_Bol: TBooleanField
      FieldName = 'DspProductBreakPack_Bol'
    end
    object qryRXPrintDspItemCost_Mny: TBCDField
      FieldName = 'DspItemCost_Mny'
      Precision = 19
    end
    object qryRXPrintDspProductBatch_Str: TWideStringField
      FieldName = 'DspProductBatch_Str'
    end
    object qryRXPrintDspWarning_Str: TWideStringField
      FieldName = 'DspWarning_Str'
      Size = 100
    end
    object qryRXPrintDspDirections_Str: TWideStringField
      FieldName = 'DspDirections_Str'
      Size = 200
    end
    object qryRXPrintDspNotDispensed_Bol: TBooleanField
      FieldName = 'DspNotDispensed_Bol'
    end
    object qryRXPrintDspInterventionProblem_Str: TWideStringField
      FieldName = 'DspInterventionProblem_Str'
      Size = 100
    end
    object qryRXPrintDspInterventionOutcome_Str: TWideStringField
      FieldName = 'DspInterventionOutcome_Str'
      Size = 100
    end
    object qryRXPrintDspLabel01_Str: TWideStringField
      FieldName = 'DspLabel01_Str'
      Size = 150
    end
    object qryRXPrintDspLabel02_Str: TWideStringField
      FieldName = 'DspLabel02_Str'
      Size = 150
    end
    object qryRXPrintDspLabel03_Str: TWideStringField
      FieldName = 'DspLabel03_Str'
      Size = 150
    end
    object qryRXPrintDspLabel04_Str: TWideStringField
      FieldName = 'DspLabel04_Str'
      Size = 150
    end
    object qryRXPrintDspLabel05_Str: TWideStringField
      FieldName = 'DspLabel05_Str'
      Size = 150
    end
    object qryRXPrintDspLabel06_Str: TWideStringField
      FieldName = 'DspLabel06_Str'
      Size = 150
    end
    object qryRXPrintItemPreview_Str: TWideStringField
      FieldName = 'ItemPreview_Str'
      Size = 300
    end
    object qryRXPrintDspDirectionsAuto_Bol: TBooleanField
      FieldName = 'DspDirectionsAuto_Bol'
    end
    object qryRXPrintInputOrder_int: TIntegerField
      FieldName = 'InputOrder_int'
    end
    object qryRXPrintperson_ID: TGuidField
      FieldName = 'person_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintpersonLastName_Str: TWideStringField
      FieldName = 'personLastName_Str'
      Size = 30
    end
    object qryRXPrintpersonFirstName_Str: TWideStringField
      FieldName = 'personFirstName_Str'
      Size = 30
    end
    object qryRXPrintpersonKnownName_Str: TWideStringField
      FieldName = 'personKnownName_Str'
      Size = 50
    end
    object qryRXPrintpersonInitials_Str: TWideStringField
      FieldName = 'personInitials_Str'
      Size = 10
    end
    object qryRXPrintpersonDOB_Dat: TDateTimeField
      FieldName = 'personDOB_Dat'
    end
    object qryRXPrintpersonGender_Str: TWideStringField
      FieldName = 'personGender_Str'
      Size = 1
    end
    object qryRXPrintpersonReviewed_Dat: TDateTimeField
      FieldName = 'personReviewed_Dat'
    end
    object qryRXPrintpersonActive_Bol: TBooleanField
      FieldName = 'personActive_Bol'
    end
    object qryRXPrintpersonRace_Str: TWideStringField
      FieldName = 'personRace_Str'
      Size = 50
    end
    object qryRXPrintpersonLanguageNarrative_Str: TWideStringField
      FieldName = 'personLanguageNarrative_Str'
      Size = 30
    end
    object qryRXPrintpersonLanguageWritten_Str: TWideStringField
      FieldName = 'personLanguageWritten_Str'
      Size = 30
    end
    object qryRXPrintpersonAgeYears_int: TIntegerField
      FieldName = 'personAgeYears_int'
    end
    object qryRXPrintpersonAgeMonths_int: TIntegerField
      FieldName = 'personAgeMonths_int'
    end
    object qryRXPrintpersonDescription_str: TWideStringField
      FieldName = 'personDescription_str'
      Size = 150
    end
    object qryRXPrintpersonRefNoCurrent_str: TWideStringField
      FieldName = 'personRefNoCurrent_str'
    end
    object qryRXPrintpersonTelNoCurrent_str: TWideStringField
      FieldName = 'personTelNoCurrent_str'
    end
    object qryRXPrintpersonCelNoCurrent_str: TWideStringField
      FieldName = 'personCelNoCurrent_str'
    end
    object qryRXPrintpersonAddressCurrent_str: TWideStringField
      FieldName = 'personAddressCurrent_str'
      Size = 255
    end
    object qryRXPrintpersonRegistrationNo_str: TWideStringField
      FieldName = 'personRegistrationNo_str'
    end
    object qryRXPrintpersonInstitution_str: TWideStringField
      FieldName = 'personInstitution_str'
      Size = 200
    end
    object qryRXPrintpersonPatient_bol: TBooleanField
      FieldName = 'personPatient_bol'
    end
    object qryRXPrintpersonPrescriber_bol: TBooleanField
      FieldName = 'personPrescriber_bol'
    end
    object qryRXPrintpersonDispenser_bol: TBooleanField
      FieldName = 'personDispenser_bol'
    end
    object qryRXPrintpersonOther_bol: TBooleanField
      FieldName = 'personOther_bol'
    end
    object qryRXPrintsysLastEdited_dat: TDateTimeField
      FieldName = 'sysLastEdited_dat'
    end
    object qryRXPrintsysLastEditedBy_ID: TGuidField
      FieldName = 'sysLastEditedBy_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintsysLastEditedBy_str: TWideStringField
      FieldName = 'sysLastEditedBy_str'
      Size = 30
    end
    object qryRXPrintsysDeleted_bol: TBooleanField
      FieldName = 'sysDeleted_bol'
    end
    object qryRXPrintpersonDateDeceased_dat: TDateTimeField
      FieldName = 'personDateDeceased_dat'
    end
    object qryRXPrintpersonStatus_Str: TWideStringField
      FieldName = 'personStatus_Str'
      Size = 50
    end
    object qryRXPrintpersonIDNumber_Str: TWideStringField
      FieldName = 'personIDNumber_Str'
    end
    object qryRXPrintpersonStatusChangeDate_dat: TDateTimeField
      FieldName = 'personStatusChangeDate_dat'
    end
    object qryRXPrintpersonPead_bol: TBooleanField
      FieldName = 'personPead_bol'
    end
    object qryRXPrintpersonDateJoined_dat: TDateTimeField
      FieldName = 'personDateJoined_dat'
    end
    object qryRXPrintpersonStatusDesc_str: TWideStringField
      FieldName = 'personStatusDesc_str'
      Size = 150
    end
    object qryRXPrintpersonPAS_str: TWideStringField
      FieldName = 'personPAS_str'
    end
    object qryRXPrintpersonInstitution_ID: TGuidField
      FieldName = 'personInstitution_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintpersonNaive_Bol: TBooleanField
      FieldName = 'personNaive_Bol'
    end
    object qryRXPrintpersonNaiveDate_Dat: TDateTimeField
      FieldName = 'personNaiveDate_Dat'
    end
    object qryRXPrintpersonTransferredOutTo_str: TWideStringField
      FieldName = 'personTransferredOutTo_str'
      Size = 50
    end
    object qryRXPrintpersonTransferredOut_bol: TBooleanField
      FieldName = 'personTransferredOut_bol'
    end
    object qryRXPrintpersonClintech_ID: TIntegerField
      FieldName = 'personClintech_ID'
    end
    object qryRXPrintpersonTransferredInDate_dat: TDateTimeField
      FieldName = 'personTransferredInDate_dat'
    end
    object qryRXPrintpersonDefaulted_dat: TDateTimeField
      FieldName = 'personDefaulted_dat'
    end
    object qryRXPrintpersonMaritalStatus_str: TWideStringField
      FieldName = 'personMaritalStatus_str'
      Size = 10
    end
    object qryRXPrintpersonDeceased_bol: TBooleanField
      FieldName = 'personDeceased_bol'
    end
    object qryRXPrintpersonTransferredOutDate_dat: TDateTimeField
      FieldName = 'personTransferredOutDate_dat'
    end
    object qryRXPrintpersonTransferredInFrom_str: TWideStringField
      FieldName = 'personTransferredInFrom_str'
      Size = 50
    end
    object qryRXPrintpersonRegisteredInSys_bol: TBooleanField
      FieldName = 'personRegisteredInSys_bol'
    end
    object qryRXPrintpersonTransferredIn_bol: TBooleanField
      FieldName = 'personTransferredIn_bol'
    end
    object qryRXPrintpersonPAAB_ID: TWideStringField
      FieldName = 'personPAAB_ID'
      Size = 25
    end
    object qryRXPrintpersonRegisteredInSys_dat: TDateTimeField
      FieldName = 'personRegisteredInSys_dat'
    end
    object qryRXPrintpersonDefaulted_bol: TBooleanField
      FieldName = 'personDefaulted_bol'
    end
    object qryRXPrintvstPregnancyDeliveryDate_dat_1: TDateTimeField
      FieldName = 'vstPregnancyDeliveryDate_dat_1'
    end
    object qryRXPrintvstFunctionalStatus_str_1: TWideStringField
      FieldName = 'vstFunctionalStatus_str_1'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintvstClinicalStage_str_1: TWideStringField
      FieldName = 'vstClinicalStage_str_1'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintvstRegimenChange_From_str_1: TWideStringField
      FieldName = 'vstRegimenChange_From_str_1'
      Size = 50
    end
    object qryRXPrintvstRegimenChange_To_str_1: TWideStringField
      FieldName = 'vstRegimenChange_To_str_1'
      Size = 50
    end
    object qryRXPrintvstRegimenChange_Reason_str_1: TWideStringField
      FieldName = 'vstRegimenChange_Reason_str_1'
      Size = 50
    end
    object qryRXPrintvstVisitDate_dat_1: TDateTimeField
      FieldName = 'vstVisitDate_dat_1'
    end
    object qryRXPrintvstNextVisit_dat_1: TDateTimeField
      FieldName = 'vstNextVisit_dat_1'
    end
    object qryRXPrintvstScheduledVisit_dat_1: TDateTimeField
      FieldName = 'vstScheduledVisit_dat_1'
    end
    object qryRXPrintpersonpregnant_bol_1: TBooleanField
      FieldName = 'personpregnant_bol_1'
    end
    object qryRXPrintvstSupporterName_str: TWideStringField
      FieldName = 'vstSupporterName_str'
      Size = 30
    end
    object qryRXPrintvstSupporterAddress_str: TWideStringField
      FieldName = 'vstSupporterAddress_str'
      Size = 50
    end
    object qryRXPrintvstUpporterPhone_str: TWideStringField
      FieldName = 'vstUpporterPhone_str'
      Size = 50
    end
    object qryRXPrintvstSupporterRelationship_str: TWideStringField
      FieldName = 'vstSupporterRelationship_str'
    end
    object qryRXPrintvstCohort_str: TWideStringField
      FieldName = 'vstCohort_str'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintvstHeight_dbl: TFloatField
      FieldName = 'vstHeight_dbl'
    end
    object qryRXPrintvstLostToFollowUpDate_dat_1: TDateTimeField
      FieldName = 'vstLostToFollowUpDate_dat_1'
    end
    object qryRXPrintvstRegimenStart_str_1: TWideStringField
      FieldName = 'vstRegimenStart_str_1'
      Size = 50
    end
    object qryRXPrintvstRegimenStartDate_dat_1: TDateTimeField
      FieldName = 'vstRegimenStartDate_dat_1'
    end
    object qryRXPrintvstTreatmentEligibility_str: TWideStringField
      FieldName = 'vstTreatmentEligibility_str'
      Size = 50
    end
    object qryRXPrintvstTreatmentStopped_date_dat_1: TDateTimeField
      FieldName = 'vstTreatmentStopped_date_dat_1'
    end
    object qryRXPrintvstWeight_dbl: TFloatField
      FieldName = 'vstWeight_dbl'
    end
    object qryRXPrintvstTempPatient_bol: TBooleanField
      FieldName = 'vstTempPatient_bol'
    end
    object qryRXPrintReasonForEligibility_Str: TWideStringField
      FieldName = 'ReasonForEligibility_Str'
      Size = 50
    end
    object qryRXPrintClassification_ID: TIntegerField
      FieldName = 'Classification_ID'
    end
    object qryRXPrintvstIsOnSite_bol: TBooleanField
      FieldName = 'vstIsOnSite_bol'
    end
    object qryRXPrintvstOnSiteDate_dat: TDateTimeField
      FieldName = 'vstOnSiteDate_dat'
    end
    object qryRXPrintDiagnosis_dat: TDateTimeField
      FieldName = 'Diagnosis_dat'
    end
    object qryRXPrintARTStart_dat: TDateTimeField
      FieldName = 'ARTStart_dat'
    end
    object qryRXPrintEntryPoint_str: TWideStringField
      FieldName = 'EntryPoint_str'
    end
    object qryRXPrintpersonReligion_str: TWideStringField
      FieldName = 'personReligion_str'
    end
    object qryRXPrintClassification_str: TWideStringField
      FieldName = 'Classification_str'
    end
    object qryRXPrinteligibilityCD4Count_str: TWideStringField
      FieldName = 'eligibilityCD4Count_str'
      Size = 4
    end
    object qryRXPrinteligibilityWHOStaging_str: TWideStringField
      FieldName = 'eligibilityWHOStaging_str'
      Size = 10
    end
    object qryRXPrintNationality_str: TWideStringField
      FieldName = 'Nationality_str'
      Size = 50
    end
    object qryRXPrintReferredTo_str: TWideStringField
      FieldName = 'ReferredTo_str'
      Size = 50
    end
    object qryRXPrintReferredBy_str: TWideStringField
      FieldName = 'ReferredBy_str'
      Size = 50
    end
    object qryRXPrintpersonEducation_str: TWideStringField
      FieldName = 'personEducation_str'
    end
    object qryRXPrintpersonEmployed_bol: TBooleanField
      FieldName = 'personEmployed_bol'
    end
    object qryRXPrintPatientNumberType: TWideStringField
      FieldName = 'PatientNumberType'
      Size = 1
    end
    object qryRXPrintICN_str: TWideStringField
      FieldName = 'ICN_str'
      Size = 13
    end
    object qryRXPrintECN_str: TWideStringField
      FieldName = 'ECN_str'
      Size = 13
    end
    object qryRXPrintDemanderName: TWideStringField
      FieldName = 'DemanderName'
      ReadOnly = True
      Size = 105
    end
    object qryRXPrintDemanderAddress: TWideStringField
      FieldName = 'DemanderAddress'
      ReadOnly = True
      Size = 154
    end
    object qryRXPrintpersonSignatureImage_Img: TBlobField
      FieldName = 'personSignatureImage_Img'
    end
    object qryRXPrintpersonQualificationName_Str: TWideStringField
      FieldName = 'personQualificationName_Str'
      Size = 50
    end
    object qryRXPrintStorageConditions_str: TWideStringField
      FieldName = 'StorageConditions_str'
      Size = 255
    end
    object qryRXPrintStorageTemp_str: TWideStringField
      FieldName = 'StorageTemp_str'
      Size = 2
    end
    object qryRXPrintRefrigerated_bol: TBooleanField
      FieldName = 'Refrigerated_bol'
    end
    object qryRXPrintClinicAddress: TWideStringField
      FieldName = 'ClinicAddress'
      ReadOnly = True
      Size = 206
    end
    object qryRXPrintClinic: TWideStringField
      FieldName = 'Clinic'
      ReadOnly = True
      Size = 75
    end
  end
  object dsqryRXPrint: TDataSource
    DataSet = qryRXPrint
    Left = 736
    Top = 16
  end
  object qryRXPrintLabels: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'prescription_id'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT tblRXItem.*, tblPrescription.date_Dat, tblDemander.Name_s' +
        'tr +'#39' T:('#39'+ISNULL(tblDemander.Phone_str, '#39'N'#39') +'#39')'#39' AS DemanderNa' +
        'me, '
      
        #9#9'ISNULL(tblDemander.Address1_str, '#39#39') +'#39', '#39'+ ISNULL(tblDemander' +
        '.Address2_str, '#39#39') +'#39', '#39'+ ISNULL(tblDemander.Address3_str, '#39#39') +' +
        ' '#39' Tel: '#39' + ISNULL(tblDemander.Phone_str, '#39#39') AS DemanderAddress' +
        ','#9#9
      
        #9#9'tblPrescription.prescriberName_Str, tblPrescription.dispenserN' +
        'ame_Str, tblProductPackSize.StorageConditions_str, tblProductPac' +
        'kSize.StorageTemp_str, tblProductPackSize.Refrigerated_bol, '
      
        #9#9'ISNULL(tblClinic.clinicAddress01_str, '#39#39') +'#39', '#39' +  ISNULL(tblC' +
        'linic.clinicAddress02_str, '#39#39') +'#39', '#39' + ISNULL(tblClinic.clinicAd' +
        'dress03_str, '#39#39') +'#39', '#39' + ISNULL(tblClinic.clinicAddress04_str, '#39 +
        #39') AS ClinicAddress, '
      
        'tblPrescription.clinic_str + '#39'Tel: '#39'+ ISNULL(tblclinic.clinicTel' +
        'ephone_str, '#39#39') AS Clinic,  tblProductPackSize.Schedule_int'
      
        'FROM tblRXItem INNER JOIN tblPrescription ON tblRxItem.RX_ID = t' +
        'blPrescription.Prescription_ID  '
      
        'LEFT OUTER JOIN tblDemander ON tblDemander.DemanderUnique_ID = t' +
        'blPrescription.DemanderUnique_ID'
      
        'LEFT OUTER JOIN tblProductPackSize ON tblProductPackSize.product' +
        'PackSize_ID = tblRXItem.DspProduct_ID '
      
        'LEFT OUTER JOIN tblClinic ON tblClinic.Clinic_ID = tblPrescripti' +
        'on.clinic_ID'
      
        'WHERE ((tblRXItem.RX_ID = :prescription_id) and (tblRXItem.DspNo' +
        'tDispensed_Bol <> 1))'
      'ORDER BY InputOrder_int')
    Left = 648
    Top = 88
    object qryRXPrintLabelsRXItem_ID: TGuidField
      FieldName = 'RXItem_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintLabelsRX_ID: TGuidField
      FieldName = 'RX_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintLabelsFrmFormulation_Str: TWideStringField
      FieldName = 'FrmFormulation_Str'
      Size = 200
    end
    object qryRXPrintLabelsFrmAdministration_Str: TWideStringField
      FieldName = 'FrmAdministration_Str'
      Size = 35
    end
    object qryRXPrintLabelsFrmSKU_Dbl: TFloatField
      FieldName = 'FrmSKU_Dbl'
    end
    object qryRXPrintLabelsFrmInterval_Str: TWideStringField
      FieldName = 'FrmInterval_Str'
    end
    object qryRXPrintLabelsFrmAdministrationUnit_Str: TWideStringField
      FieldName = 'FrmAdministrationUnit_Str'
      Size = 35
    end
    object qryRXPrintLabelsFrmDailyDoseCalc_Dbl: TFloatField
      FieldName = 'FrmDailyDoseCalc_Dbl'
    end
    object qryRXPrintLabelsFrmDoseCalc_Dbl: TFloatField
      FieldName = 'FrmDoseCalc_Dbl'
    end
    object qryRXPrintLabelsFrmSKUTotal_Dbl: TFloatField
      FieldName = 'FrmSKUTotal_Dbl'
    end
    object qryRXPrintLabelsFrmDuration_Dbl: TFloatField
      FieldName = 'FrmDuration_Dbl'
    end
    object qryRXPrintLabelsFrmRepeat_Dbl: TFloatField
      FieldName = 'FrmRepeat_Dbl'
    end
    object qryRXPrintLabelsFrmDirections_Str: TWideStringField
      FieldName = 'FrmDirections_Str'
      Size = 30
    end
    object qryRXPrintLabelsFrmICDCode_Str: TWideStringField
      FieldName = 'FrmICDCode_Str'
    end
    object qryRXPrintLabelsFrmDescription_Str: TWideStringField
      FieldName = 'FrmDescription_Str'
      Size = 300
    end
    object qryRXPrintLabelsFrmProtocol_ID: TGuidField
      FieldName = 'FrmProtocol_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintLabelsDspDescription_Str: TWideStringField
      FieldName = 'DspDescription_Str'
      Size = 300
    end
    object qryRXPrintLabelsDspProduct_ID: TGuidField
      FieldName = 'DspProduct_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintLabelsDspProduct_Str: TWideStringField
      FieldName = 'DspProduct_Str'
      Size = 250
    end
    object qryRXPrintLabelsDspSKUActual_Dbl: TFloatField
      FieldName = 'DspSKUActual_Dbl'
    end
    object qryRXPrintLabelsDspProductCalc_Dbl: TFloatField
      FieldName = 'DspProductCalc_Dbl'
    end
    object qryRXPrintLabelsDspProductCost_Mny: TBCDField
      FieldName = 'DspProductCost_Mny'
      Precision = 19
    end
    object qryRXPrintLabelsDspProductBreakPack_Bol: TBooleanField
      FieldName = 'DspProductBreakPack_Bol'
    end
    object qryRXPrintLabelsDspItemCost_Mny: TBCDField
      FieldName = 'DspItemCost_Mny'
      Precision = 19
    end
    object qryRXPrintLabelsDspProductBatch_Str: TWideStringField
      FieldName = 'DspProductBatch_Str'
    end
    object qryRXPrintLabelsDspWarning_Str: TWideStringField
      FieldName = 'DspWarning_Str'
      Size = 100
    end
    object qryRXPrintLabelsDspDirections_Str: TWideStringField
      FieldName = 'DspDirections_Str'
      Size = 200
    end
    object qryRXPrintLabelsDspNotDispensed_Bol: TBooleanField
      FieldName = 'DspNotDispensed_Bol'
    end
    object qryRXPrintLabelsDspInterventionProblem_Str: TWideStringField
      FieldName = 'DspInterventionProblem_Str'
      Size = 100
    end
    object qryRXPrintLabelsDspInterventionOutcome_Str: TWideStringField
      FieldName = 'DspInterventionOutcome_Str'
      Size = 100
    end
    object qryRXPrintLabelsDspLabel01_Str: TWideStringField
      FieldName = 'DspLabel01_Str'
      Size = 150
    end
    object qryRXPrintLabelsDspLabel02_Str: TWideStringField
      FieldName = 'DspLabel02_Str'
      Size = 150
    end
    object qryRXPrintLabelsDspLabel03_Str: TWideStringField
      FieldName = 'DspLabel03_Str'
      Size = 150
    end
    object qryRXPrintLabelsDspLabel04_Str: TWideStringField
      FieldName = 'DspLabel04_Str'
      Size = 150
    end
    object qryRXPrintLabelsDspLabel05_Str: TWideStringField
      FieldName = 'DspLabel05_Str'
      Size = 150
    end
    object qryRXPrintLabelsDspLabel06_Str: TWideStringField
      FieldName = 'DspLabel06_Str'
      Size = 150
    end
    object qryRXPrintLabelsItemPreview_Str: TWideStringField
      FieldName = 'ItemPreview_Str'
      Size = 500
    end
    object qryRXPrintLabelsDspDirectionsAuto_Bol: TBooleanField
      FieldName = 'DspDirectionsAuto_Bol'
    end
    object qryRXPrintLabelsInputOrder_int: TIntegerField
      FieldName = 'InputOrder_int'
    end
    object qryRXPrintLabelsdate_Dat: TDateTimeField
      FieldName = 'date_Dat'
    end
    object qryRXPrintLabelsDemanderName: TWideStringField
      FieldName = 'DemanderName'
      ReadOnly = True
      Size = 105
    end
    object qryRXPrintLabelsDemanderAddress: TWideStringField
      FieldName = 'DemanderAddress'
      ReadOnly = True
      Size = 210
    end
    object qryRXPrintLabelsprescriberName_Str: TWideStringField
      FieldName = 'prescriberName_Str'
      Size = 50
    end
    object qryRXPrintLabelsdispenserName_Str: TWideStringField
      FieldName = 'dispenserName_Str'
      Size = 50
    end
    object qryRXPrintLabelsStorageConditions_str: TWideStringField
      FieldName = 'StorageConditions_str'
      Size = 255
    end
    object qryRXPrintLabelsStorageTemp_str: TWideStringField
      FieldName = 'StorageTemp_str'
      Size = 2
    end
    object qryRXPrintLabelsRefrigerated_bol: TBooleanField
      FieldName = 'Refrigerated_bol'
    end
    object qryRXPrintLabelsClinicAddress: TWideStringField
      FieldName = 'ClinicAddress'
      ReadOnly = True
      Size = 206
    end
    object qryRXPrintLabelsClinic: TWideStringField
      FieldName = 'Clinic'
      ReadOnly = True
      Size = 75
    end
    object qryRXPrintLabelsSchedule_int: TIntegerField
      FieldName = 'Schedule_int'
    end
  end
  object dsqryRXPrintLabels: TDataSource
    DataSet = qryRXPrintLabels
    Left = 736
    Top = 88
  end
  object qryRXPrintAddress: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'prescription_ID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT TblPrescription.clinic_str, TblPrescription.complexSiteDe' +
        'partment_str,  tblPerson.*,  TblPrescription.batchIsBatched_bol,' +
        ' TblPrescription.vstNextVisit_dat AS RxNextVisit'
      
        'FROM TblPrescription INNER JOIN tblPerson ON TblPrescription.pat' +
        'ient_ID = tblPerson.person_ID'
      'where (TblPrescription.prescription_ID = :prescription_ID) ')
    Left = 640
    Top = 152
    object qryRXPrintAddressclinic_str: TWideStringField
      FieldName = 'clinic_str'
      Size = 50
    end
    object qryRXPrintAddresscomplexSiteDepartment_str: TWideStringField
      FieldName = 'complexSiteDepartment_str'
      Size = 50
    end
    object qryRXPrintAddressperson_ID: TGuidField
      FieldName = 'person_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintAddresspersonLastName_Str: TWideStringField
      FieldName = 'personLastName_Str'
      Size = 30
    end
    object qryRXPrintAddresspersonFirstName_Str: TWideStringField
      FieldName = 'personFirstName_Str'
      Size = 30
    end
    object qryRXPrintAddresspersonKnownName_Str: TWideStringField
      FieldName = 'personKnownName_Str'
      Size = 50
    end
    object qryRXPrintAddresspersonInitials_Str: TWideStringField
      FieldName = 'personInitials_Str'
      Size = 10
    end
    object qryRXPrintAddresspersonDOB_Dat: TDateTimeField
      FieldName = 'personDOB_Dat'
    end
    object qryRXPrintAddresspersonGender_Str: TWideStringField
      FieldName = 'personGender_Str'
      Size = 1
    end
    object qryRXPrintAddresspersonReviewed_Dat: TDateTimeField
      FieldName = 'personReviewed_Dat'
    end
    object qryRXPrintAddresspersonActive_Bol: TBooleanField
      FieldName = 'personActive_Bol'
    end
    object qryRXPrintAddresspersonRace_Str: TWideStringField
      FieldName = 'personRace_Str'
      Size = 50
    end
    object qryRXPrintAddresspersonLanguageNarrative_Str: TWideStringField
      FieldName = 'personLanguageNarrative_Str'
      Size = 30
    end
    object qryRXPrintAddresspersonLanguageWritten_Str: TWideStringField
      FieldName = 'personLanguageWritten_Str'
      Size = 30
    end
    object qryRXPrintAddresspersonAgeYears_int: TIntegerField
      FieldName = 'personAgeYears_int'
    end
    object qryRXPrintAddresspersonAgeMonths_int: TIntegerField
      FieldName = 'personAgeMonths_int'
    end
    object qryRXPrintAddresspersonDescription_str: TWideStringField
      FieldName = 'personDescription_str'
      Size = 150
    end
    object qryRXPrintAddresspersonRefNoCurrent_str: TWideStringField
      FieldName = 'personRefNoCurrent_str'
    end
    object qryRXPrintAddresspersonTelNoCurrent_str: TWideStringField
      FieldName = 'personTelNoCurrent_str'
    end
    object qryRXPrintAddresspersonCelNoCurrent_str: TWideStringField
      FieldName = 'personCelNoCurrent_str'
    end
    object qryRXPrintAddresspersonAddressCurrent_str: TWideStringField
      FieldName = 'personAddressCurrent_str'
      Size = 255
    end
    object qryRXPrintAddresspersonRegistrationNo_str: TWideStringField
      FieldName = 'personRegistrationNo_str'
    end
    object qryRXPrintAddresspersonInstitution_str: TWideStringField
      FieldName = 'personInstitution_str'
      Size = 200
    end
    object qryRXPrintAddresspersonPatient_bol: TBooleanField
      FieldName = 'personPatient_bol'
    end
    object qryRXPrintAddresspersonPrescriber_bol: TBooleanField
      FieldName = 'personPrescriber_bol'
    end
    object qryRXPrintAddresspersonDispenser_bol: TBooleanField
      FieldName = 'personDispenser_bol'
    end
    object qryRXPrintAddresspersonOther_bol: TBooleanField
      FieldName = 'personOther_bol'
    end
    object qryRXPrintAddresssysLastEdited_dat: TDateTimeField
      FieldName = 'sysLastEdited_dat'
    end
    object qryRXPrintAddresssysLastEditedBy_ID: TGuidField
      FieldName = 'sysLastEditedBy_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintAddresssysLastEditedBy_str: TWideStringField
      FieldName = 'sysLastEditedBy_str'
      Size = 30
    end
    object qryRXPrintAddresssysDeleted_bol: TBooleanField
      FieldName = 'sysDeleted_bol'
    end
    object qryRXPrintAddresspersonDateDeceased_dat: TDateTimeField
      FieldName = 'personDateDeceased_dat'
    end
    object qryRXPrintAddresspersonStatus_Str: TWideStringField
      FieldName = 'personStatus_Str'
      Size = 50
    end
    object qryRXPrintAddresspersonIDNumber_Str: TWideStringField
      FieldName = 'personIDNumber_Str'
    end
    object qryRXPrintAddresspersonStatusChangeDate_dat: TDateTimeField
      FieldName = 'personStatusChangeDate_dat'
    end
    object qryRXPrintAddresspersonPead_bol: TBooleanField
      FieldName = 'personPead_bol'
    end
    object qryRXPrintAddresspersonDateJoined_dat: TDateTimeField
      FieldName = 'personDateJoined_dat'
    end
    object qryRXPrintAddresspersonStatusDesc_str: TWideStringField
      FieldName = 'personStatusDesc_str'
      Size = 150
    end
    object qryRXPrintAddresspersonPAS_str: TWideStringField
      FieldName = 'personPAS_str'
    end
    object qryRXPrintAddresspersonInstitution_ID: TGuidField
      FieldName = 'personInstitution_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintAddresspersonNaive_Bol: TBooleanField
      FieldName = 'personNaive_Bol'
    end
    object qryRXPrintAddresspersonNaiveDate_Dat: TDateTimeField
      FieldName = 'personNaiveDate_Dat'
    end
    object qryRXPrintAddresspersonTransferredOutTo_str: TWideStringField
      FieldName = 'personTransferredOutTo_str'
      Size = 50
    end
    object qryRXPrintAddresspersonTransferredOut_bol: TBooleanField
      FieldName = 'personTransferredOut_bol'
    end
    object qryRXPrintAddresspersonClintech_ID: TIntegerField
      FieldName = 'personClintech_ID'
    end
    object qryRXPrintAddresspersonTransferredInDate_dat: TDateTimeField
      FieldName = 'personTransferredInDate_dat'
    end
    object qryRXPrintAddresspersonDefaulted_dat: TDateTimeField
      FieldName = 'personDefaulted_dat'
    end
    object qryRXPrintAddresspersonMaritalStatus_str: TWideStringField
      FieldName = 'personMaritalStatus_str'
      Size = 10
    end
    object qryRXPrintAddresspersonDeceased_bol: TBooleanField
      FieldName = 'personDeceased_bol'
    end
    object qryRXPrintAddresspersonTransferredOutDate_dat: TDateTimeField
      FieldName = 'personTransferredOutDate_dat'
    end
    object qryRXPrintAddresspersonTransferredInFrom_str: TWideStringField
      FieldName = 'personTransferredInFrom_str'
      Size = 50
    end
    object qryRXPrintAddresspersonRegisteredInSys_bol: TBooleanField
      FieldName = 'personRegisteredInSys_bol'
    end
    object qryRXPrintAddresspersonTransferredIn_bol: TBooleanField
      FieldName = 'personTransferredIn_bol'
    end
    object qryRXPrintAddresspersonPAAB_ID: TWideStringField
      FieldName = 'personPAAB_ID'
      Size = 25
    end
    object qryRXPrintAddresspersonRegisteredInSys_dat: TDateTimeField
      FieldName = 'personRegisteredInSys_dat'
    end
    object qryRXPrintAddresspersonDefaulted_bol: TBooleanField
      FieldName = 'personDefaulted_bol'
    end
    object qryRXPrintAddressvstPregnancyDeliveryDate_dat: TDateTimeField
      FieldName = 'vstPregnancyDeliveryDate_dat'
    end
    object qryRXPrintAddressvstFunctionalStatus_str: TWideStringField
      FieldName = 'vstFunctionalStatus_str'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintAddressvstClinicalStage_str: TWideStringField
      FieldName = 'vstClinicalStage_str'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintAddressvstRegimenChange_From_str: TWideStringField
      FieldName = 'vstRegimenChange_From_str'
      Size = 50
    end
    object qryRXPrintAddressvstRegimenChange_To_str: TWideStringField
      FieldName = 'vstRegimenChange_To_str'
      Size = 50
    end
    object qryRXPrintAddressvstRegimenChange_Reason_str: TWideStringField
      FieldName = 'vstRegimenChange_Reason_str'
      Size = 50
    end
    object qryRXPrintAddressvstVisitDate_dat: TDateTimeField
      FieldName = 'vstVisitDate_dat'
    end
    object qryRXPrintAddressvstNextVisit_dat: TDateTimeField
      FieldName = 'vstNextVisit_dat'
    end
    object qryRXPrintAddressvstScheduledVisit_dat: TDateTimeField
      FieldName = 'vstScheduledVisit_dat'
    end
    object qryRXPrintAddresspersonpregnant_bol: TBooleanField
      FieldName = 'personpregnant_bol'
    end
    object qryRXPrintAddressvstSupporterName_str: TWideStringField
      FieldName = 'vstSupporterName_str'
      Size = 30
    end
    object qryRXPrintAddressvstSupporterAddress_str: TWideStringField
      FieldName = 'vstSupporterAddress_str'
      Size = 255
    end
    object qryRXPrintAddressvstUpporterPhone_str: TWideStringField
      FieldName = 'vstUpporterPhone_str'
      Size = 50
    end
    object qryRXPrintAddressvstSupporterRelationship_str: TWideStringField
      FieldName = 'vstSupporterRelationship_str'
    end
    object qryRXPrintAddressvstCohort_str: TWideStringField
      FieldName = 'vstCohort_str'
      FixedChar = True
      Size = 10
    end
    object qryRXPrintAddressvstHeight_dbl: TFloatField
      FieldName = 'vstHeight_dbl'
    end
    object qryRXPrintAddressvstLostToFollowUpDate_dat: TDateTimeField
      FieldName = 'vstLostToFollowUpDate_dat'
    end
    object qryRXPrintAddressvstRegimenStart_str: TWideStringField
      FieldName = 'vstRegimenStart_str'
      Size = 50
    end
    object qryRXPrintAddressvstRegimenStartDate_dat: TDateTimeField
      FieldName = 'vstRegimenStartDate_dat'
    end
    object qryRXPrintAddressvstTreatmentEligibility_str: TWideStringField
      FieldName = 'vstTreatmentEligibility_str'
      Size = 50
    end
    object qryRXPrintAddressvstTreatmentStopped_date_dat: TDateTimeField
      FieldName = 'vstTreatmentStopped_date_dat'
    end
    object qryRXPrintAddressvstWeight_dbl: TFloatField
      FieldName = 'vstWeight_dbl'
    end
    object qryRXPrintAddressvstTempPatient_bol: TBooleanField
      FieldName = 'vstTempPatient_bol'
    end
    object qryRXPrintAddressReasonForEligibility_Str: TWideStringField
      FieldName = 'ReasonForEligibility_Str'
      Size = 50
    end
    object qryRXPrintAddressClassification_ID: TIntegerField
      FieldName = 'Classification_ID'
    end
    object qryRXPrintAddressvstIsOnSite_bol: TBooleanField
      FieldName = 'vstIsOnSite_bol'
    end
    object qryRXPrintAddressvstOnSiteDate_dat: TDateTimeField
      FieldName = 'vstOnSiteDate_dat'
    end
    object qryRXPrintAddressDiagnosis_dat: TDateTimeField
      FieldName = 'Diagnosis_dat'
    end
    object qryRXPrintAddressARTStart_dat: TDateTimeField
      FieldName = 'ARTStart_dat'
    end
    object qryRXPrintAddressEntryPoint_str: TWideStringField
      FieldName = 'EntryPoint_str'
    end
    object qryRXPrintAddresspersonReligion_str: TWideStringField
      FieldName = 'personReligion_str'
    end
    object qryRXPrintAddressClassification_str: TWideStringField
      FieldName = 'Classification_str'
    end
    object qryRXPrintAddresseligibilityCD4Count_str: TWideStringField
      FieldName = 'eligibilityCD4Count_str'
      Size = 4
    end
    object qryRXPrintAddresseligibilityWHOStaging_str: TWideStringField
      FieldName = 'eligibilityWHOStaging_str'
      Size = 10
    end
    object qryRXPrintAddressNationality_str: TWideStringField
      FieldName = 'Nationality_str'
      Size = 50
    end
    object qryRXPrintAddressReferredTo_str: TWideStringField
      FieldName = 'ReferredTo_str'
      Size = 50
    end
    object qryRXPrintAddressReferredBy_str: TWideStringField
      FieldName = 'ReferredBy_str'
      Size = 50
    end
    object qryRXPrintAddresspersonEducation_str: TWideStringField
      FieldName = 'personEducation_str'
    end
    object qryRXPrintAddresspersonEmployed_bol: TBooleanField
      FieldName = 'personEmployed_bol'
    end
    object qryRXPrintAddresspersonEmployeeNumber_str: TWideStringField
      FieldName = 'personEmployeeNumber_str'
      Size = 15
    end
    object qryRXPrintAddressPatientNumberType: TWideStringField
      FieldName = 'PatientNumberType'
      Size = 1
    end
    object qryRXPrintAddressSouthAfricanID_bol: TBooleanField
      FieldName = 'SouthAfricanID_bol'
    end
    object qryRXPrintAddressForeigner_bol: TBooleanField
      FieldName = 'Foreigner_bol'
    end
    object qryRXPrintAddresspersonGreenBox_ID: TGuidField
      FieldName = 'personGreenBox_ID'
      FixedChar = True
      Size = 38
    end
    object qryRXPrintAddressbatchIsBatched_bol: TBooleanField
      FieldName = 'batchIsBatched_bol'
    end
    object qryRXPrintAddressRxNextVisit: TDateTimeField
      FieldName = 'RxNextVisit'
    end
  end
  object dsqryRXPrintAddress: TDataSource
    DataSet = qryRXPrintAddress
    Left = 728
    Top = 152
  end
  object ppDBRXAddress: TppDBPipeline
    DataSource = dsqryRXPrintAddress
    UserName = 'DBRXAddress'
    Left = 816
    Top = 152
  end
  object qryAppendAudit: TADOStoredProc
    Connection = conRx
    ProcedureName = 'strdprc_AuditAPPENDDispensing;1'
    Parameters = <
      item
        Name = '@ProductID'
        Attributes = [paNullable]
        DataType = ftGuid
        Value = Null
      end
      item
        Name = '@DemanderUniqueID'
        Attributes = [paNullable]
        DataType = ftGuid
        Value = Null
      end
      item
        Name = '@Quantity'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@QtyUnits'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Reference'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 225
        Value = Null
      end
      item
        Name = '@User'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 200
        Value = Null
      end
      item
        Name = '@UserID'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@VoucherNo'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 225
        Value = Null
      end
      item
        Name = '@Age'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 88
    Top = 464
  end
  object qryRX_Worker: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'prescription_ID'
        DataType = ftGuid
        Size = -1
        Value = '{a367061e-53e9-42cf-9e29-88f045182c1d}'
      end>
    SQL.Strings = (
      
        'select * from tblPrescription where (prescription_ID = :prescrip' +
        'tion_ID)')
    Left = 696
    Top = 552
  end
  object qryRXItem_Worker: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    OnNewRecord = qryRXItem_WorkerNewRecord
    DataSource = dsqryRX_Worker
    Parameters = <
      item
        Name = 'prescription_ID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'Select * from TblRXItem where (RX_ID = :prescription_ID) ')
    Left = 696
    Top = 616
  end
  object dsqryRX_Worker: TDataSource
    DataSet = qryRX_Worker
    Left = 856
    Top = 552
  end
  object ExtraOptions1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 992
    Top = 64
  end
  object pRxTrailerLabel: TppReport
    AutoStop = False
    DataPipeline = ppDBRX
    PrinterSetup.BinName = 'Default tray'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 1000
    PrinterSetup.mmMarginLeft = 1000
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 1000
    PrinterSetup.mmPaperHeight = 50000
    PrinterSetup.mmPaperWidth = 70000
    PrinterSetup.PaperSize = 256
    Template.FileName = 
      'C:\Users\mmankga\MyWorks\RxSolution 1.2.6.0001\Documentation\pRx' +
      'TrailerLabel.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 1009
    Top = 154
    Version = '11.03'
    mmColumnWidth = 68000
    DataPipelineName = 'ppDBRX'
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DBText5'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'DspLabel01_Str'
        DataPipeline = ppDBRX
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRX'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object myDBCheckBox2: TmyDBCheckBox
        UserName = 'DBCheckBox2'
        CheckBoxColor = clWindowText
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDBRX
        DataField = 'DspNotDispensed_Bol'
        DataPipelineName = 'ppDBRX'
        mmHeight = 2910
        mmLeft = 64823
        mmTop = 265
        mmWidth = 1852
        BandType = 4
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'prescriptionNumber_Str'
      DataPipeline = ppDBRX
      OutlineSettings.CreateNode = True
      NewPage = True
      NewFile = False
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBRX'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppRegion7: TppRegion
          UserName = 'Region12'
          Caption = 'Region12'
          Pen.Color = clSilver
          mmHeight = 11377
          mmLeft = 0
          mmTop = 0
          mmWidth = 67469
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppVariable2: TppVariable
            UserName = 'Variable2'
            HyperlinkColor = clBlue
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            BlankWhenZero = False
            CalcOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3302
            mmLeft = 1323
            mmTop = 794
            mmWidth = 9906
            BandType = 3
            GroupNo = 0
          end
          object ppLabel3: TppLabel
            UserName = 'Label1'
            HyperlinkColor = clBlue
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            Caption = 'Dispenser:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3440
            mmLeft = 1323
            mmTop = 4233
            mmWidth = 11642
            BandType = 3
            GroupNo = 0
          end
          object ppDBText17: TppDBText
            UserName = 'DBText17'
            HyperlinkColor = clBlue
            AutoSize = True
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            DataField = 'dispenserName_Str'
            DataPipeline = ppDBRX
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            Transparent = True
            DataPipelineName = 'ppDBRX'
            mmHeight = 3302
            mmLeft = 12965
            mmTop = 4233
            mmWidth = 508
            BandType = 3
            GroupNo = 0
          end
          object ppVariable3: TppVariable
            UserName = 'Variable3'
            HyperlinkColor = clBlue
            Border.BorderPositions = []
            Border.Color = clBlack
            Border.Style = psSolid
            Border.Visible = False
            BlankWhenZero = False
            CalcOrder = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial Narrow'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3302
            mmLeft = 1323
            mmTop = 7408
            mmWidth = 9906
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText7: TppDBText
          UserName = 'DBText1'
          HyperlinkColor = clBlue
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          DataField = 'DspLabel06_Str'
          DataPipeline = ppDBRX
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial Narrow'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          WordWrap = True
          DataPipelineName = 'ppDBRX'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3969
          mmWidth = 67733
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line1'
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 265
          mmWidth = 67998
          BandType = 5
          GroupNo = 0
        end
        object ppVariable4: TppVariable
          UserName = 'Variable4'
          HyperlinkColor = clBlue
          Border.BorderPositions = []
          Border.Color = clBlack
          Border.Style = psSolid
          Border.Visible = False
          BlankWhenZero = False
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial Narrow'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 0
          mmTop = 265
          mmWidth = 9906
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65324F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506B770726F636564757265205661726961
        626C65324F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D20444252585B277061746965
        6E744E616D655F537472275D202B2027202D5B272B20444252585B27666F6C64
        65724E756D6265725F537472275D2B275D272B202720444F423A20272B204461
        7465546F53747228444252585B27706572736F6E444F425F646174275D290D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C65
        32094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F5661
        726961626C65334F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F75726365069870726F636564757265205661726961626C
        65334F6E43616C63287661722056616C75653A2056617269616E74293B0D0A62
        6567696E0D0A0D0A202056616C7565203A3D205452494D28444252585B277072
        65736372697074696F6E4E756D6265725F537472275D29202B2027202D202720
        2B2044617465546F53747228444252585B27646174655F446174275D290D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C6533
        094576656E744E616D6506064F6E43616C63074576656E74494402210001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060F566172
        6961626C65344F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F75726365066670726F636564757265205661726961626C65
        344F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A56616C7565203A3D205452494D28444252585B274473704C616265
        6C30355F537472275D290D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D6506095661726961626C6534094576656E744E616D6506064F6E43616C6307
        4576656E74494402210000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsqryRX: TDataSource
    DataSet = qryRX
    Left = 144
    Top = 136
  end
  object ADOQuery1: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    ExecuteOptions = [eoAsyncFetch]
    Parameters = <
      item
        Name = 'PRx_ID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = '{ad0b79c6-8db2-490a-96f4-b3db0ded1940}'
      end>
    SQL.Strings = (
      'Select * from TblRXItem where (RX_ID = :PRx_ID)')
    Left = 368
    Top = 128
  end
  object qryIsDispenserValid: TADOQuery
    Connection = conRx
    Parameters = <
      item
        Name = 'person_id'
        DataType = ftGuid
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'IF EXISTS('
      'SELECT person_id from tblPerson'
      'WHERE person_id=:person_id'
      ')'
      'SELECT 1 AS Result'
      'ELSE '
      'SELECT 0 AS Result'
      '')
    Left = 864
    Top = 664
  end
  object qryComplexDeptName: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'complexSiteDepartmentID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT departmentName_str'
      'FROM tblComplexSiteDepartment'
      'WHERE complexSiteDepartment_ID=:complexSiteDepartmentID')
    Left = 528
    Top = 448
  end
  object qryComplexDepts: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT complexSiteDepartment_ID, departmentName_str'
      'FROM tblComplexSiteDepartment'
      'ORDER BY departmentName_str'
      '')
    Left = 696
    Top = 504
    object qryComplexDeptscomplexSiteDepartment_ID: TGuidField
      FieldName = 'complexSiteDepartment_ID'
      FixedChar = True
      Size = 38
    end
    object qryComplexDeptsdepartmentName_str: TWideStringField
      FieldName = 'departmentName_str'
      Size = 50
    end
  end
  object dsqryComplexDepts: TDataSource
    DataSet = qryComplexDepts
    Left = 856
    Top = 504
  end
  object qryRxReasons: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tlkReason order by reason_str')
    Left = 80
    Top = 560
  end
  object qryAllergies: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'person_ID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tblPersonAllergy.*, tblPerson.*, TblAllergy.*'
      
        'FROM tblPerson LEFT OUTER JOIN tblPersonAllergy ON tblPerson.Per' +
        'son_ID = tblPersonAllergy.Person_ID'
      
        'LEFT OUTER JOIN TblAllergy ON tblAllergy.allergyCode_Str = tblPe' +
        'rsonAllergy.personAllergyDescription_Str'
      'WHERE tblPerson.person_ID=:person_ID')
    Left = 640
    Top = 216
  end
  object dsAllergies: TDataSource
    DataSet = qryAllergies
    Left = 720
    Top = 216
  end
  object ppDBAllergies: TppDBPipeline
    DataSource = dsAllergies
    UserName = 'DBAllergies'
    Left = 808
    Top = 216
  end
  object ppPersonAllergies: TppReport
    AutoStop = False
    DataPipeline = ppDBAllergies
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 8000
    PrinterSetup.mmMarginLeft = 14000
    PrinterSetup.mmMarginRight = 14000
    PrinterSetup.mmMarginTop = 8000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'L:\My Programming\RxProjects\RxSolution\RxSolution Project\1.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PDFSettings.EmbedFontOptions = []
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 904
    Top = 220
    Version = '11.03'
    mmColumnWidth = 182000
    DataPipelineName = 'ppDBAllergies'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'Shape2'
        Brush.Style = bsClear
        Pen.Color = clSilver
        StretchWithParent = True
        mmHeight = 20902
        mmLeft = 0
        mmTop = 265
        mmWidth = 182827
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText26'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Color = clSilver
        DataField = 'personInstitution_str'
        DataPipeline = ppDBAllergies
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Name = 'Arial Narrow'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 7281
        mmLeft = 178478
        mmTop = 11906
        mmWidth = 1439
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText19'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personLastName_Str'
        DataPipeline = ppDBAllergies
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 8086
        mmLeft = 794
        mmTop = 1058
        mmWidth = 1609
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Color = clSilver
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 265
        mmLeft = 23548
        mmTop = 9790
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText22'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personFirstName_Str'
        DataPipeline = ppDBAllergies
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Name = 'Arial Narrow'
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 8086
        mmLeft = 1058
        mmTop = 11113
        mmWidth = 1609
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText12'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personRefNoCurrent_str'
        DataPipeline = ppDBAllergies
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 5630
        mmLeft = 69586
        mmTop = 11113
        mmWidth = 1122
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Patient Allergies'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8086
        mmLeft = 794
        mmTop = 21431
        mmWidth = 45318
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape6'
        Brush.Style = bsClear
        Pen.Color = clSilver
        mmHeight = 10583
        mmLeft = 0
        mmTop = 0
        mmWidth = 182827
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText21'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'allergyName_Str'
        DataPipeline = ppDBAllergies
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 1058
        mmWidth = 159279
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText28'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personAllergySource_Str'
        DataPipeline = ppDBAllergies
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 5292
        mmWidth = 106098
        BandType = 4
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataPipeline = ppDBAllergies
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Source:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 1058
        mmTop = 5292
        mmWidth = 9970
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        AutoSize = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'personAllergyDateEntered_Dat'
        DataPipeline = ppDBAllergies
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBAllergies'
        mmHeight = 4064
        mmLeft = 142082
        mmTop = 5292
        mmWidth = 635
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Recorded:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial Narrow'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 127784
        mmTop = 5292
        mmWidth = 13356
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppImage2: TppImage
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = True
        Stretch = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Picture.Data = {
          0A544A504547496D6167652A1B0000FFD8FFE000104A46494600010101006400
          640000FFDB0043000302020302020303030304030304050805050404050A0707
          06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
          1816141812141514FFDB00430103040405040509050509140D0B0D1414141414
          1414141414141414141414141414141414141414141414141414141414141414
          14141414141414141414141414FFC00011080048013A03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00A3E2
          0BEB9F801FB6DEB3E24D0EE6E2CFC37A678A6DF49BBB57B89248921BDB50C4B6
          E63C072ED9EC71EC2AB7C3BD4EF7E2BFED97A078D2EEEEE24B5F126A57DAB69D
          1BCD204860B79C456A7686009022079E0E464115F54F897FE09FF61E28D6FC76
          752F146BFAAE9FE2E547BC92FAF2169A39A3911E29232210015118419CFC8587
          7CD55F0E7EC067C27E26F06788B4EF14EAF1EA3E1B10C305AADD442D8C1195CA
          15F2B71F336FCFF30CE4E3151665DD16BF6A2FDB2BC47F043C7D71E1DD120F0C
          5C2D8696B7D32EA52CF3DDDCB9049411DB83E40DA061A5E0E73D39AEAFC43FB5
          6EA77DFB26C9F17BC2BA4587DBED6CE1BDBCD2F5495CA22B01BD519002C41618
          27008EB8AADF1ABF627D37E28F8F356F175A6BDAC68D77E21B38ECB5EB0B1BC1
          1417CA91F9684E509042E0601C1C74E5B2CD03F632169F01357F85179E26D613
          42B96063BAB5B9885D3C63A42EC622BE5F4E0283C0E69EA2D0E5BC01FB6C78CA
          FBE27FC3ED27C5FE16D1F4EF0DF8DED2692C27D3A79A4B8B69628C3B094B80AC
          3951851C6EFBC71CDDFDA9BF6CCF10FC14F88171E1FD06DFC312C767A60D4245
          D4A59EE2EA76393E588ADC1F246D030F2F073D31CD5587F60EBC8E7F026A2FE3
          1D72E353F07C8469F1CB770983CA2D970C042092EA023608F954743CD751F19B
          F627D3FE27F8E752F16DAEBDABE8D7BAF58C763AF58D85E08A0BE448FCB52728
          48C2E06010081D3939350D093C47FB68DBE9FF00B29DBFC59D3F41F3F54BB8ED
          618747966C46975395501A4C7DC5249CE0120638CE471DE1DFDAFF00E2745F1B
          3C1FE01F12F85FC370A6AF65FDA136A1A74B70C25877B21F255C6436548F9B20
          E33919C0D4D43F64CD47C25FB2AF8BBE1AD85BC1E3149235934EB7D62E8C6E4A
          48AC0096355DACA149438C6400DC135E1FFB3E7C12F1BBFC77F0AF8A35CD2751
          D3D74AB11A730D5F583A9DE4C77E73B87C91C4832028C72738CB1C1A8F43D3BE
          3CFEDFFAB7C3EF8A9E29F0A786F4AD0DD3C311C3F695D69EE3CFD4A578FCC68A
          DC44A55368C2EE73CB11C6391DA7C5BFDB0B54F0F7ECCDA47C5CF08689637314
          B25B0BFD2B577904B089B0BB10A632CAEC01270300FD2AFF00C6EFD8BB4DF891
          E39D43C5FA1788359F0B6ADABC51C1AC47A55DAC297EA8BB558E518ABEDC2EE5
          C71EE49AB9F103F642D3FE237C1283C0377ABEA5A45AC12C7304D2AE5544E630
          046B33CA92170080D9E092324D1A8B43CB17F6CFF8B73FC4997C091782BC2EBA
          DEA5A62EB1A3DC35EDC982280BB214986CDD236E52A0A0419E7A57A57C2AFDB1
          ADFC63FB2B6ADF16B59D1BEC97BA2DB5C3DF697692655E58999556366E81C85E
          B9DBB8F5C73CA41FB0F6A9178DF45F177FC271E201AF59695FD8CD70B790FEEE
          01195063FDC6436E632E4923CC39C63E5AED3E05FEC8BA6FC29F879E2EF006A1
          7775AFF84B5E1223C1A84CAF22A48A43A828898CE49C8E41E4628570763CAFE0
          77FC141B54F1CFC49F0E681E26D2F443A6F88A17682EB427B82FA6CA13788AE7
          CD50AD91F2EE4206E078239AE93E237ED51F143C3DF1F7C45F0CBC3FE1AF0CEA
          13C1A726A5A6DEDDCF70AA637236ACAAA096727230B803AEEE306EFC3AFD887F
          E15E78C34FBE1E29D635ED2F4C062D3ECF55BC0F0DAC678E234450ED8180589C
          0F700D69F8EBF6387D77E34DCFC44D2BC67E22B2D4EFADDAD2709770AA411142
          AAB08F2495D84EE5DC5B0C067238A350D0CBD0BF6A1F11FC67FD8B7C4FF107C3
          16D65A0F8C6CB48BC9E68E677314061F304924470496DA8590302376D0C71935
          B5FB0BFC55F1A7C49F849A64BE33115EDC2DB426DF5289A479274280EE9D9FFE
          5A13CFCBC55AF815FB24597C20F0278B3C0526A57DAAF84B5B827B6D979708D3
          C714A855D5591100CEE63D3A9357BF670FD9967FD9D6EB52B3D3B5FBED5F47B9
          31AA9D4A61248B144A5628D42AAAA850C7903273CF6C1A83B1F177ED2BA36A1A
          1FC7FF00891E24F1B58EB3E2AF0ADC936FA7F89BC2BA8196E3C38AB1E0C5E4AC
          8A10A6416562A0ED279DCD5F445B7C7F6F801FB22781754F0EDD41E3A9B54B9B
          3D0340B8BC66851DA446D8F71D5976AC6DB875CF191D6AF78F3F615975BF11F8
          DAEF45F1BF88B4AD2FC5F772DEEADA7417B1A473B4BF7D00311DAB8C8C8F9882
          4124631DA9FD8E7C2DAB7C058FE19EA6D3C5636F2C77363716531596C678F3E5
          C91B907E6196049073B8FAD161DD0EF843F193E26F8AB5ED6346F17F8434ED25
          858C72691ABD8B4AD677F332B972777CE88BFBB18C67EF7278AF2AFD8E7E2E58
          F85FE13FC51D66EF4A8B48B3F0EDF6A9A8DF69DA7CD2CE923C2BBA5746958B7C
          DB08038038E057AC7C15FD9B755F85F77AFCD79E2CD5759BBD622586E355BDBA
          12DD0088522F2BE509184049185E4F5CE00143E07FEC8B65F06EE7C63A5B6A97
          FE24F0BF895255BBB7D6A7495DFCC0C25FF571A0F9F71DDF4146A2D0F1DF84BF
          F051BD53C59E3BF0C59EBFA2E88741F11398D468D25C35D692C4663170644092
          03C02531824FA60FA07C5DFDA8BE227833F6871F0D3C3BE1FF000DEA716A7A1C
          7AC6937D793DC298D59CC67CF5453BBE78E40153B3212C30C2A0F097EC250781
          7C57617163E27D6754D034D663A7693A95EE6DAD55B8C14445326D1C2EF240FD
          6BA1F897FB20378BBE34D8FC47D37C5BAF586AD159269DE4C5750AC16D6EAB8D
          90A984B2FCC5A4E58FCEC4F4E28D43413E0C7ED85FF09CFECF3E2AF881E22D15
          2C357F0AC57ADA969D62E4C72B5B86388CB648DD8039CE0E7935CFFC1BFDA87E
          2C78E2FBC13A96B7E04D247833C441E79B53D1E599DF4F8DA12F02481F82ECC6
          3059723961818C9EA7E05FEC8B63F08B4AF1A786EE750BDF11785BC4D1C91DCD
          BEAD3A48E448184A328898DFB8E7FA5647C2DFD8C66F84FE35D1F50B0F176B3A
          B691A28963D26C755BCF321B08A4187091AAAE58AFCA0B13818F4041A868703F
          1B7FE0A13ABF817E2878BBC39E1BD1F439ED3C2B2243710EAD25C0BBD4E4DBBA
          45B7F294A47B7EE82F9C9C7183C777F1C3F6CABFF05FC0AF067C42F09787D6EE
          DBC4171047753EA71CB243A446F1EF669D61F9891D3031C83DF00D8F8C9FB136
          9FE3DF1EEABE2BD03C45ACF866EB5C545D66D34BBC5822BD28BB43728C558800
          12A4679EE49ADAF885FB27DBF8E3E1D786F428B58BFD0EF34199A7B57D2EE7CB
          52C63F2FF785D58BE073CF523E6C8241350D0D1FD94BF685BFF8FF00E16D5751
          D4AD74A866B6BE78609745B933DBCB0844DAC4B7CC8E58B1D8C1481B7239C9F9
          73C25A37897C73FF00051AF1B5C7896DB4EBDBAD024B35825B7799CE9F11B6DD
          17D98370A5B83267BB3E3AF3F4F7ECBDFB3245FB39DA6AF6F6DA85C5E26A33B5
          CCEF7120779666C6E73B55547400000565F81BF654BAF87DFB43EB1F12ACFC53
          ACEAB26B1917D0EA97513ACA02ED4184894E1170ABCF00739A034D4E0FE217ED
          A1E38B5F177C4787C11E15D1B51F0F7C3E6913546D56E265BBBD30A17B830EC1
          B630815802FBB3807BE0745F187F6C5D47C39FB35683F17BC17A458DFD95DC96
          DF6CD3B557712C4B360054D9C160C7072718E9537C5EFD88B4CF1C78D3C41E21
          D0B5FD67C3B1F89D0278834AD3AF161B6D440182581462BB870DB48DC09EE493
          6FE217EC7FA2F8DBE0C587C3C7D6F51D12D6DE54B88AD34899228A4F2C011A3E
          F8DC954C02318391D68D4343BBFD9EFE2578C7E24E87A85EF8C345D3B4891E73
          258C7A5C92C88B6C5576A4AEE06E9436EC941B718C57C1BE06FB07C3AFDA63E3
          46856DE07D6BC5BA145712696969A75F85FB3DAC8877C5BA69D4FCDC720961B7
          822BF48FE17785AF3C15E02D1F42BEB8377716102C06E5882F36D18DEC4000B1
          EA700735F3E7837F62493C13F127C53E20B5F1B7896ED3C456F2C37975797903
          DCF98EA544EA440009533F292081DC1A0133CB3FE09AD7D6DA0780BE2378AAEC
          DCC3059DE5CBDCC72C8D2C82080332A72C465033F4EB9EA78A9BE1EFFC14AF54
          F1278C3C34DAA683A28F0CEBD7E2C7ECBA74B70FA8E981D8AC524ECC82275E9B
          B6E31B87D2BDBFF66CFD9457F67DBAF14D945ABDF6B9E1FD749325AEAD3C7360
          9DDB8E1634197DD86CF5C0AE3F43FD822CFC1DE2AB29748F12EB371E17B0B96B
          AB1D06F2FB36B6EC49382AA81A40B9F943311EB9A351E84FFB51FED89AEFC1BF
          1ADAE87E1C8FC312C6749FED376D5659EE2E2662C711AC36E0B463033E649C1C
          9C74E60F885F16F4CFDA53F60FF17F8A64D3DF4EBC5D064BF6B549DBFD1EE635
          2CACAEB824065C8CF518C8AE93E33FEC59A5FC48F19B78AF4DD7757D0F51BDD3
          D34BD5AD74FBB10C37F6EA30A1BE4254E38F948E00E8724D4F04FEC5C9E1DF82
          DE22F85D3F89F588FC3BA9AEC5BAB6B9885D88FBC258C45761E411B338279A35
          168790F8EFE2C7C43F0B7FC138B41F117867588F4EBDB3B1D32D6E751F31D6EE
          3818431AF924023792C012C47CA58839C57A57C53F10EB7F143F61CF1CDF78CE
          C6DEDB5CB4D2AE2ED64D2E4952012459689D1890C48C2939E339EA2BACD0FF00
          648B2BBFD9B750F837E24D4EFAF343942A417C932FDAE35491648BE6D817E528
          800DBF7460D41A2FEC9B771FC10F107C33D4BC59AC3E99AA348F35FC1729F6C9
          CBB02E199A36508C0052A1471EFCD017478BFECFDFB5A78EBC1E9F057C35E2FD
          0F4C93C21E28D3858D8EA36F34AD7B1BC104786977008436E4E072371C9E39FB
          E410C011D0D7C67FF0C0F76DA6F8083F8CF5E7BAF06391A646D790F92A85CB31
          61E464B15D919C11F2C6A319049FB16DD674B7896409BC280D8E99C734D09DBA
          1628A28A620A28A2800A28A2800A892DA28DCBA448AE7AB05009A968A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A291982296620281924
          F6A008EEAEA1B1B792E2E2548208D4B3C92305551EA49AF33D4BE360BDBD92C7
          C2BA35CF88275E0CCAA5635F7E99C7B9C0F7AE6FC47AF2FC4ABBD46F6FEF9F4A
          F0168C499A60706E5C761EA4F181CE3238C9AF1EF14FC78D5F56DDA4782E0FF8
          467418CED416A36DC4A3FBCEE3904FB1CFA935D70A5DD5D9C73ADD9D97E67BE7
          F6B7C58BAFDE0D2F4CB407911975CFFE866A393E27F8D3C283CCF127848CB680
          65AE6C0E420F56C171F9E2BE517D2756D4A4F3EEEF259A6273BE690B367D724D
          745E1CF17F8D3C11324BA5EB53B44A726D6673242DEC51B23F1183EF5BBA2EDB
          239D5657DD9F63F83BC7FA278E6D4CBA55D8924500C96EFF002C91FD47F51915
          D1D7CB9A2DFC1F12124D6BC3108F0DFC40D393CE9B4FB63B61BE51F79A31EA7B
          83EB839CEEAF70F859F1120F889E1D5BAD820BF80F95776FD0A483AF1D707FFA
          DDAB8E74F975476D3A9CDA33B3AE1CDB58DBF8A62985F99E520931E73E5F3D3F
          FAD5DC562AF852C57506BCDA7CD6EB589B92AF89AC24BE7B649D5D9172CCA720
          7E345BF89AC2E679A349D0AC470D267E5FCEA1B6F08D8DADC4D3229DD2821BF1
          A4B6F08585AC732229C4BF7A8026B5F1469F751CD209D5228C9064638538F7A6
          45E2BD3E4D3DEF0CC1225048DC71BBD85471F83EC22B292D554F96E72686F075
          83580B42A7CA0734012C9E29B08AC16E9E50AAD8DAA4F2D9F4A5BAF14585A430
          BBCA374A4058F3F373DF1515C7842C2E6DE18594EC8BEED2DD7846C6EDE16753
          98800B4012DCF89AC6D678216943492F440791F5A57F12D8A5FA5A0995E565DC
          769CEDFAD453784EC67BD8EE594F989D293FE116B186F1EF769F33049A00B16F
          E22B2BAD49ACA1944B228C92A722B4EB88D06E74C7F14CCB676EF19C72CDEBDE
          BB7A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
          A28A0028A28A0028A28A002B83F8D7AF3E85E01BB1092B717AEB69195EBF364B
          7FE3A187E35DE57957ED04445A1E853C8336F1EA91799F4C1FE80D6B495E6AE6
          555DA0EC7917C5FD3352D42EBC37F0C3C3F1ACB25B5B2DE5E462554F3AE18127
          25880703240CFF0017B0AE65FE1AEADE12B7B6FB6588884EE22495644742FF00
          DDDCA4807EA6BB1F1140B17ED5CD73797305ADBC525BCFE6DCCA23408204E849
          C67AF15C96BD79A46ADE15B9D17C3A74FF000C5E58EBAB2DCC6FA9F9D0EA0325
          5648A6763BF68620C63A673DABB61371B799C138295FC8D6BFF867E24D321796
          E34EC24782E5278DCA03D090AC7039EA78A80F8035F1E215D0CE9CFF00DA6C9E
          60837AE0AE339DD9DB8FC7DBAD5DF8A3ACE9FA1F892FE4D16D2CF50D6B59D3A3
          D31B53B4D644DE529852362D00F9621818DE73D09E2BD062F8956907C48FB0FD
          A74B92E15E353ACFDBE2F2A3B02031889DDFEB7CD56C2FF75AABDB4ED7B13EC6
          17B5CF1CB08353F0F6AFFDB7A74456EB4794492BA72ABF36D2AC4766CEDF7CD7
          AAD8EA50F837E39D8DF58FEEF45F17D8ADE2A03F289482C4E3D7233FF6D0D795
          F84BC6DA5F847E1678A2DEEB40B3D42FA1F2E391D750976EA520BB552410FC60
          7CFF00260103D2BB0F11DECBA8DD7C2291B4D6D26E0472C8B6A5F7EC87285003
          9270141EA7359D47CDBAFEAD734A71E55A3FEAF63EA80430047434B5C55CCBAE
          4F7B68B013F6318270053E36D7A5D747984FD95010A0002BCF3D23B2A2B8DB27
          D7E4D4EE5E727605223C00071D2A3D35FC427EDB34C4F9BC94E063F2A00EDA8A
          E26C5FC4316957323126ECB123201EBED4D27C4116800464FDA58E1B201E2803
          B8A2B87BDFF848174AB68E1277B63CCE066A5D4FFB7B3651424F978064E0673F
          5A00ECE9929C46E719E0F15C7DF9D79F57B65427ECAB827814A875D975FCC84F
          D954617000A402E917D7373E299BCDD3C5AA818CE304FBD7635C8E8A35897C43
          2C9783F71D01C01C575D4C028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A0028A28A002B91F8AFE167F18780F54D3A1
          50D7463F360FF7D4E401F5C11F8D75D475A69D9DD09A525667C8DF11ECDFC7BE
          0FD0FC6F6CAF25DD8C434BD6A203E78DD7A487D01CF5FF00697D0D79B5A78474
          B8B4F96D923668266F308672486F507B57D29E3AF08EABF0FBC4779E29F0CD9A
          6A3A75F295D5B4471F25CA9EACA3FBDC9EDDCF072457050782B40F1E17BAF036
          A9145393997C3FA8B7953C07B8427EF0CFD47FB5DABD1A552296BB1E655A726F
          4DCF2C8FC276116A9FDA0A25173C73E61C1C74E29E3C3162B7D7576164135CAE
          D90873835E813FC2AF16DBC9E5BE85745B38CA00E3F3048AD3B0F837AC2C26EF
          5B9AD7C3BA727325CDF4CA303D803D7EA4574F3D35D4E650A8DECCE33E1DFC33
          8BC41A8DBE83670B1B4793CD9D9CEE11A0396639FD3DC8AEFF00FB52D3C67F16
          2FB5A8A48E0F0DF87ADBEC16D70EC1630101DEF93C0503773E856AADD788A0BD
          D3E7F097C3A8E4FB35C61352F11CCA55A51DD63E87D47E27D771EAEFFE0849A8
          FC1ED5FC3FA4EDB7BB9A01E4997A48EAEAE439FF006B6E09F7AE39CD4A4A2F45
          B7A2EE77D0A76D59E89E06F8BFE0DF1CDD3699A0EBB05F5E411EF306C78D997A
          6E50EA370F75C8AEDB70F51F9D7CBEBA778ABC51E1DB9D174FF87A3C31AC5B69
          AF026B0F78A64F348C158CA0E030C8DC4E467A715E59E33F076B9A3E8DBADFC3
          57FA16892DD59433E932DD2937372A642EEA54955CA90BD79C64D358784DD94A
          DF34FF00CBFADCEFB1F798607B8AA1AC6BB63A0DBC53DF4DE4C52CC902B0467F
          9DCED51F2838E4F53C0EF5F18DEE83E29F0468ADE27D16C6EBC3B0DADFA45A56
          97773798C3CF88452018C8F99C09368E06CAD38FE04F8974CBE92EAD6C6E6668
          A4D2DEDA6332FCD1A18DA66C16EA0AE4E7938EF4BEAF4D6AE7FD7DFE7E7D7B05
          8FB0AFF52B6D32C2E2F6E6558AD6DE269A590F3B514649E3D8566DDF8D745B1F
          0C2788A7BF44D19D23905D6D620AB9010E00CF25876EF5F097D927D4355D3747
          B4B392E3C58B3DEC5A8DF47781DAEDBCA9132E9F7972CC4664031BB03835DBEA
          BFB3E6BD67E1C4B1D3F47B8921BCD16D64BA81A65DA6F927F98E0B7DE1193CF4
          C1C0356F0B4E0D29CFF2DAFEA163EC0BED45E27B710AF989280729824E5940C7
          B7CD927D074E6AB5EF89ED342D3EF2FB57B88EC2CED6233CB34AC311A0241271
          9F6C0E4E722A1D27C371DBE81A5DBC4CF6925B5B471290036005E8410471CE3B
          8C9E793587F107479B49F875AEFD83471E29D4648542D8DD32AACC430DA0F450
          AB92DB463A6072735E7C527248437FE17BF813FE11D1AE7FC24307F679B8FB28
          6F2A4F37CDC676795B77E71CFDDE9CF4A76A5F1D3C07A4C3A5CD73E25B448B53
          884F6CEBB9C3479DBBD8A83B1739196C0C823B1AF9A7C3FE02F12D8CBA4F89EE
          3C257DA85ED9EA52DCEA3612BC2A6E3CC84A078C062A02E400A7B01F5AA50FC2
          0F1AE83A24F6D2F859B529F5BD19EC22D9327FA04AF7324B96C9E81643D3B8AF
          4961E87F37E2BCFF00E1FCC763EB43F14BC303C603C2C35456D70E3FD1961908
          194DE32E1768CAF3C9EF5D5D7C9767F0CFC5FA3FC5CD3AEAC749BDB6BC4BC81E
          E355179BED2E2D5215465319E779DA074E31906BEB4AE3AD0842DC8EF7401451
          45738828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
          A28A0028A28A0028A28A0064B12CC851C0653D8D798F8E7E04685E2D9DAE8DA2
          C779D44F1131BE7D723AFE39A28A69B5AA1349E8CE31FE0F78A74DCC569E2EF1
          1C307408B7CC401ED8229B6BF009F53BA49F569750D6651D1F52B96931F871FA
          E68A2AB9E5DC8F671EC7AA7867E1E5A6871463CB440830B1A280A3E80576088B
          1A8551803A0A28A8341D515C5B4577118E68D648CF556191451400971670DDC3
          E54D12C91F076B0C8E2A50000001803B51450066C5E19D2E1D49F504B1856F1C
          E5A60BF313EB5A7451400514514005145140051451401FFFD9}
        mmHeight = 10848
        mmLeft = 134938
        mmTop = 1058
        mmWidth = 47890
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Pen.Color = clSilver
        Weight = 1
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 182827
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Printed On : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5000
        mmLeft = 0
        mmTop = 2117
        mmWidth = 21431
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtDateTime
        DisplayFormat = 'ddd dd mmmm yyyy @ [hh:nn]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 21696
        mmTop = 2117
        mmWidth = 53711
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 132821
        mmTop = 7144
        mmWidth = 27781
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Report Version'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 7673
        mmWidth = 14288
        BandType = 8
      end
      object ppDBText35: TppDBText
        UserName = 'DBText6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Major'
        DisplayFormat = '#"."'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 14288
        mmTop = 7673
        mmWidth = 2646
        BandType = 8
      end
      object ppDBText38: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Minor'
        DisplayFormat = '0"."'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 16669
        mmTop = 7673
        mmWidth = 2381
        BandType = 8
      end
      object ppDBText39: TppDBText
        UserName = 'DBText8'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Hi'
        DisplayFormat = '0"."'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 19050
        mmTop = 7673
        mmWidth = 2381
        BandType = 8
      end
      object ppDBText40: TppDBText
        UserName = 'DBText9'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'report_Version_Lo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 21431
        mmTop = 7673
        mmWidth = 2910
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'RPM +'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 132821
        mmTop = 4233
        mmWidth = 6615
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppPageStyle2: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList5: TppParameterList
    end
  end
  object qryProductPacksize: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * '
      'FROM tblProductPackSize '
      'ORDER BY packDescription_Str')
    Left = 88
    Top = 624
  end
  object dsqryProductPacksize: TDataSource
    DataSet = qryProductPacksize
    Left = 240
    Top = 624
  end
  object qryProductStockAvail: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductCodeID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DemanderID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT QtyOnHandUnits_dbl, QtyOnHand_int '
      'FROM tblDemanderStock '
      
        'WHERE (ProductCode_ID =:ProductCodeID) AND (Demander_ID =:Demand' +
        'erID)')
    Left = 696
    Top = 688
  end
  object qryDemanderID: TADOQuery
    Connection = conRx
    Parameters = <
      item
        Name = 'DemanderUniqueID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Demander_ID'
      'FROM tblDemander'
      'WHERE DemanderUnique_ID=:DemanderUniqueID')
    Left = 1000
    Top = 384
  end
  object qryProductID: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ProductPackID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT ProductCode_ID '
      'FROM tblProductPackSize '
      'WHERE productPackSize_ID=:ProductPackID')
    Left = 1000
    Top = 440
  end
  object qryPrescriberAll: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select tblPerson.*, tblPersonSignature.personSignatureImage_Img,' +
        ' tblPersonQualification.personQualificationName_Str'
      'from tblPerson '
      
        'left outer join tblPersonSignature on tblPersonSignature.person_' +
        'ID = tblPerson.person_ID'
      
        'left outer join tblPersonQualification on tblPersonQualification' +
        '.person_ID = tblPerson.person_ID'
      'where (personPrescriber_bol = 1)'
      
        'order by tblPerson.personLastName_Str, tblPerson.personFirstName' +
        '_Str')
    Left = 280
    Top = 16
  end
  object qryDispenserAll: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from tblPerson where (personDispenser_bol = 1) order by' +
        ' personLastName_Str, personFirstName_Str')
    Left = 480
    Top = 16
  end
  object ppDBRX: TppDBPipeline
    DataSource = dsqryRXPrint
    UserName = 'DBRX'
    Left = 816
    Top = 16
  end
  object ppRxDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($LocalAppData)\RBuilder\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 992
    Top = 8
  end
  object qrySystemUsers: TADOQuery
    Connection = conRx
    Parameters = <>
    SQL.Strings = (
      'SELECT * '
      'FROM tblSystem_User'
      'ORDER BY UserName_str')
    Left = 528
    Top = 504
  end
  object qryProtocolsDisplay: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    DataSource = dsqryRX
    Parameters = <
      item
        Name = 'RX_ID'
        DataType = ftString
        Size = 38
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @Protocols VARCHAR(250) '
      
        'SELECT @Protocols = COALESCE(@Protocols + '#39' & '#39', '#39#39') + B.Protoco' +
        'lICD10'
      'FROM '
      '('
      
        #9'(SELECT DISTINCT TblStdProtocol.Name_Str + '#39' ('#39' + ISNULL(TblStd' +
        'Protocol.IndicationCode_Str, '#39#39') + '#39')'#39' AS ProtocolICD10'
      
        #9'FROM TblStdProtocol INNER JOIN tblRxItem ON tblRxItem.FrmProtoc' +
        'ol_ID = TblStdProtocol.Protocol_ID'
      
        #9'WHERE (TblStdProtocol.Name_Str IS NOT NULL) AND (tblRxItem.RX_I' +
        'D =:RX_ID)) '
      ') B'
      'SELECT @Protocols AS Protocols')
    Left = 643
    Top = 280
    object qryProtocolsDisplayProtocols: TStringField
      FieldName = 'Protocols'
      ReadOnly = True
      Size = 250
    end
  end
  object dsProtocolsDisplay: TDataSource
    DataSet = qryProtocolsDisplay
    Left = 744
    Top = 280
  end
  object qryUserDetail: TADOQuery
    Connection = conRx
    Parameters = <
      item
        Name = 'userID'
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT UserID, dispenser_ID, prescriber_ID, lastName_str + '#39', '#39' ' +
        '+ firstname_str AS FullName, userNo_int'
      'FROM TblSystem_User'
      'WHERE userName_str =:userID')
    Left = 1000
    Top = 496
  end
  object qrySystemSettings: TADOQuery
    Connection = conRx
    Parameters = <>
    SQL.Strings = (
      
        'SELECT postRxBeforePrint_bol, requestPinBeforePostRx_bol, nonEdi' +
        'tableScriptDropDowns_bol'
      'FROM tblSystem')
    Left = 1008
    Top = 600
    object qrySystemSettingspostRxBeforePrint_bol: TBooleanField
      FieldName = 'postRxBeforePrint_bol'
    end
    object qrySystemSettingsrequestPinBeforePostRx_bol: TBooleanField
      FieldName = 'requestPinBeforePostRx_bol'
    end
    object qrySystemSettingsnonEditableScriptDropDowns_bol: TBooleanField
      FieldName = 'nonEditableScriptDropDowns_bol'
    end
  end
  object qryProductPacks: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    DataSource = dsqryProductFormulation
    Parameters = <
      item
        Name = 'GenericName_str'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = 'Albendazole'
      end
      item
        Name = 'route_str'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = 'PO'
      end
      item
        Name = 'DispensingUnit_str'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = 'tablet'
      end
      item
        Name = 'StrengthValue_dbl'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = 100
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM tblProductPackSize '
      
        'WHERE ((GenericName_str = :GenericName_str) and (route_str = :ro' +
        'ute_str)  AND (IsAvailableForDispensing_Bol = 1)  AND (Instituti' +
        'onEDL_bol = 1)  AND  (DispensingUnit_str =:DispensingUnit_str) A' +
        'ND (StrengthValue_dbl =:StrengthValue_dbl)) '
      'ORDER BY packDescription_Str')
    Left = 240
    Top = 368
  end
  object qryPatientWeight: TADOQuery
    Connection = conRx
    CursorType = ctStatic
    DataSource = dsqryRX
    Parameters = <
      item
        Name = 'patient_ID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TOP 1 personWeight_ID'
      '      ,person_ID'
      '      ,personWeightDateRecorded_Dat'
      '      ,personWeight_int'
      '      ,personHeight_Int'
      'FROM tblPersonWeight'
      'WHERE person_ID=:patient_ID'
      'ORDER BY personWeightDateRecorded_Dat DESC')
    Left = 472
    Top = 576
  end
  object dsPatientWeight: TDataSource
    DataSet = qryPatientWeight
    Left = 560
    Top = 576
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsPatientWeight
    UserName = 'DBPipeline1'
    Left = 904
    Top = 280
  end
  object ppDBProtocolsDisplay: TppDBPipeline
    DataSource = dsProtocolsDisplay
    UserName = 'DBProtocolsDisplay'
    Left = 1000
    Top = 280
  end
  object qryAllergiesDisplay: TADOQuery
    Connection = conRx
    Parameters = <
      item
        Name = 'patient_ID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @Allergies VARCHAR(250) '
      
        'SELECT @Allergies = COALESCE(@Allergies + '#39' & '#39', '#39#39') + B.Allergy' +
        'Description_str'
      'FROM '
      '('#9
      'SELECT TblAllergy.AllergyDescription_str'
      
        'FROM tblPerson LEFT OUTER JOIN tblPersonAllergy ON tblPerson.Per' +
        'son_ID = tblPersonAllergy.Person_ID'
      
        'LEFT OUTER JOIN TblAllergy ON tblAllergy.allergyCode_Str = tblPe' +
        'rsonAllergy.personAllergyDescription_Str'
      'WHERE tblPerson.person_ID=:patient_ID'
      ') B'
      'SELECT @Allergies AS Allergies')
    Left = 648
    Top = 344
    object qryAllergiesDisplayAllergies: TStringField
      FieldName = 'Allergies'
      ReadOnly = True
      Size = 250
    end
  end
  object dsAllergiesDisplay: TDataSource
    DataSet = qryAllergiesDisplay
    Left = 760
    Top = 344
  end
  object ppDBAllergiesDisplay: TppDBPipeline
    DataSource = dsAllergiesDisplay
    UserName = 'DBAllergiesDisplay'
    Left = 888
    Top = 344
  end
  object ppDBPrescriberNumber: TppDBPipeline
    DataSource = dsPrescriberNumber
    UserName = 'DBPrescriberNumber'
    Left = 888
    Top = 408
  end
  object qryPrescriberNumber: TADOQuery
    Connection = conRx
    DataSource = dsqryRX
    Parameters = <
      item
        Name = 'prescriber_ID'
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tblPerson.personRegistrationNo_str'
      'FROM tblPerson '
      
        'WHERE (tblPerson.personPrescriber_bol = 1) AND (tblPerson.person' +
        'Active_Bol = 1) AND (tblPerson.person_ID=:prescriber_ID)'
      '')
    Left = 648
    Top = 408
  end
  object dsPrescriberNumber: TDataSource
    DataSet = qryPrescriberNumber
    Left = 760
    Top = 408
  end
  object ppDBRXLabels: TppDBPipeline
    DataSource = dsqryRXPrintLabels
    UserName = 'DBRXLabels'
    Left = 832
    Top = 88
  end
  object qryRxEditHistory: TADOQuery
    Connection = conRx
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblPrescriptionEditHistory'
      'ORDER BY Change_Dat DESC')
    Left = 1016
    Top = 664
  end
  object QryInputNumberMax: TADOQuery
    Connection = conRx
    Parameters = <
      item
        Name = 'RX_ID'
        Attributes = [paNullable]
        DataType = ftGuid
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT ISNULL(MAX(InputOrder_int) , 0) AS ItemsMax'
      'FROM tblRxItem '
      'WHERE RX_ID =:RX_ID')
    Left = 472
    Top = 656
  end
end
