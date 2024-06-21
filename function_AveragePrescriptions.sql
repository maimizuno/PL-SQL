-- Function heading 
CREATE OR REPLACE FUNCTION AvgScriptsPerPatient_S1511679(p_dId IN CHAR)
RETURN NUMBER IS
-- Declare variables
avg_scripts NUMBER;

BEGIN
-- Retrieve the average scripts per patient
SELECT AVG(script_count)
INTO avg_scripts
FROM (
 SELECT m.PatientID, COUNT(p.PrescriptionID) AS script_count
 FROM MedicalRecords m
 JOIN Prescriptions p ON m.RecordID = p.RecordID
 WHERE m.DoctorID = p_dId
 GROUP BY m.PatientID
 );
  
RETURN avg_scripts;

-- If no records, set the value NULL:
EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN NULL;

END;


-- Interactive Anonymous Block
DECLARE
-- Declare variables
v_avgScripts NUMBER;

BEGIN
-- print the calculated value:
v_avgScripts := AvgScriptsPerPatient_S1511679('D2001');  -- Call the function with a specific doctor ID
DBMS_OUTPUT.PUT_LINE('The average number of prescriptions per patient for the given doctor ID is: ' || v_avgScripts);

END;

