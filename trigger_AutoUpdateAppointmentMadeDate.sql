-- Part A8. Trigger heading
CREATE OR REPLACE TRIGGER SetAppoMadeDate_S1511679
-- Specify Trigger type
BEFORE INSERT ON Appointments
FOR EACH ROW

-- Set AppointmentMadeDate to the current system date
BEGIN
:NEW.AppointmentMadeDate := SYSDATE;

END;


-- testing the trigger  
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime)
VALUES (3006, 1002, 'D2002', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('10:20', 'HH24:MI'));


