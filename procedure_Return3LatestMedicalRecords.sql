-- Procedure heading 
CREATE OR REPLACE PROCEDURE Get3LatestRecords_S1511679(p_pId IN NUMBER) IS
-- Declare variables
v_counter NUMBER := 0; 

-- Use Cursor to retrieve data one row at a time
CURSOR record_cursor IS

-- Retrieve a medical record for a patient with the specified ID (3 rows only)
SELECT m.RecordID, m.Diagnosis, m.Treatment, p.Medication, p.Dosage, p.Frequency
FROM MedicalRecords m
JOIN Prescriptions p ON m.RecordID = p.RecordID
WHERE m.PatientID = p_pId AND ROWNUM <= 3
ORDER BY m.DateOfRecord DESC;

-- print the records
BEGIN
DBMS_OUTPUT.PUT_LINE('Latest 3 Medical Records for Patient ID ' || p_pId || ':');


DBMS_OUTPUT.PUT_LINE('Record ID: ' || rc.RecordID || ', Diagnosis: ' || rc.Diagnosis || ', Treatment: ' || rc.Treatment || ', Medication: ' || rc.Medication || ', Dosage: ' || rc.Dosage || ', Frequency: ' || rc.Frequency);

-- Increase the value of counter by 1
v_counter := v_counter + 1;

-- End of the loop
END LOOP;

-- Check if no records were fetched
IF v_counter = 0 THEN
DBMS_OUTPUT.PUT_LINE('No medical records found for this patient.');

-- End of the if else statement
END IF;

END;


-- Interactive Anonymous Block
BEGIN

-- print the 3 latest records:
Get3LatestRecords_S1511679(1001);

END;
