-- Part A3. Function heading
CREATE OR REPLACE FUNCTION CheckScriptExists_S1511679(p_paId IN NUMBER, p_medicine IN VARCHAR2)
RETURN BOOLEAN IS
-- Declare variables
v_count NUMBER;
v_script_exists BOOLEAN;

BEGIN
-- Normalize medicine name and check if any record exists
SELECT COUNT(p.PrescriptionID) INTO v_count FROM MedicalRecords m
WHERE m.PatientID = p_paId AND LOWER(p.Medication) = LOWER(p_medicine);

-- If any records were found, set the Boolean value TRUE:
IF v_count > 0 THEN
v_script_exists := TRUE;

-- If no records, set the value FALSE:
ELSE
v_script_exists := FALSE;

-- End of the condition statement:
END IF;

-- Return the boolean result (TRUE or FALSE)
RETURN v_script_exists;

END;


-- Interactive Anonymous Block
BEGIN

-- If true (script exists), print the message:
IF CheckScriptExists_S1511679(1001, 'Zestoretic') THEN
DBMS_OUTPUT.PUT_LINE('The Prescription for the patient exists.');

-- If false (no data found), print the message:
ELSE
DBMS_OUTPUT.PUT_LINE('No record was found.');

END IF;

END;


