-- Procedure heading
CREATE OR REPLACE PROCEDURE ListPatientDetails_S1511679(p_id IN NUMBER)
IS

-- Declare variables:
v_name Patients.Name%TYPE;
v_address Patients.Address%TYPE;
v_phone Patients.Phone%TYPE;

-- Beginning of Procedure body:
BEGIN

-- Fetch patient data from Name, Address, Phone column
SELECT Name, Address, Phone INTO v_name, v_address, v_phone FROM Patients
WHERE PatientID = p_id;

-- Display the patient details
DBMS_OUTPUT.PUT_LINE('Patient ID: ' || p_id);
DBMS_OUTPUT.PUT_LINE('Patient Name: ' || v_name);
DBMS_OUTPUT.PUT_LINE('Patient Address: ' || v_address);
DBMS_OUTPUT.PUT_LINE('Patient Phone: ' || v_phone);

-- Exception when no data is found:
EXCEPTION
WHEN NO_DATA_FOUND THEN

-- Print an error message: 
DBMS_OUTPUT.PUT_LINE('No patient data was found with ID: ' || TO_CHAR(p_id));

-- End of the Procedure
END;



-- Interactive Anonymous Block
BEGIN

-- Test with ID: 1001
ListPatientDetails_S1511679(1001);

END;
