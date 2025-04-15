
SELECT 
al.ID, AllergyIntoleranceCodeCodingDisplay, AllergyIntolerancePatientReference, al.Key, al.RowNum,patient.patientnamefamily
FROM aa.patient  inner join  AA.AllergyIntolerance al 
on al. AllergyIntolerancePatientReference = patient.key


-- SELECT 
-- al.ID, AllergyIntoleranceCodeCodingDisplay, AllergyIntolerancePatientReference, al.Key, al.RowNum,patient.patientnamefamily
-- FROM aa.patient  left outer join  AA.AllergyIntolerance al 
-- on al. AllergyIntolerancePatientReference = patient.key

-- ##
-- SELECT 
-- al.ID, AllergyIntoleranceCodeCodingDisplay, AllergyIntolerancePatientReference, al.Key, al.RowNum,patient.patientnamefamily
-- FROM AA.AllergyIntolerance al left outer join aa.patient 
-- on al. AllergyIntolerancePatientReference = patient.key