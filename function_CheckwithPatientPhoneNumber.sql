-- Function heading
CREATE OR REPLACE FUNCTION CheckPhoneNumExists_S1511679(p_phone IN VARCHAR2)
RETURN BOOLEAN IS
-- Declare variables
v_count NUMBER;
v_patient_exists BOOLEAN;

BEGIN
-- Normalize phone numbers and check if any record with the number exists
SELECT COUNT(*) INTO v_count FROM Patients
WHERE REGEXP_REPLACE(Phone, '[^0-9]', '') = REGEXP_REPLACE(p_phone, '[^0-9]', '');

-- If any records were found, set the Boolean value TRUE:
IF v_count > 0 THEN
v_patient_exists := TRUE;

-- If no records, set the value FALSE:
ELSE
v_patient_exists := FALSE;

-- End of the condition statement:
END IF;

-- Return the boolean result (TRUE or FALSE)
RETURN v_patient_exists;

END;


-- Interactive Anonymous Block
BEGIN

-- If true (patient exists), print the message:
IF CheckPhoneNumExists_S1511679(‘0404-555-678’) THEN
DBMS_OUTPUT.PUT_LINE('The patient with the phone number exists.');

-- If false (no data found), print the message:
ELSE
-- Print the message:
DBMS_OUTPUT.PUT_LINE('No record was found.');

END IF;

END;
