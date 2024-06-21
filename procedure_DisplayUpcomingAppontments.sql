-- Procedure heading 
CREATE OR REPLACE PROCEDURE ListPAppointments_S1511679(p_pName IN VARCHAR2)
IS
-- Declare variables
v_counter NUMBER := 0; 

-- Use Cursor to retrieve data one row at a time
CURSOR record_cursor IS

-- Retrieve upcoming appointment for a patient
SELECT a.AppointmentID, p.Name AS PatientName, d.Name AS DoctorName, a.AppointmentDate, a.AppointmentTime
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Patients p ON a.PatientID = p.PatientID
WHERE UPPER(p.Name) LIKE UPPER('%' || p_pName || '%')
ORDER BY a.AppointmentDate DESC;

-- print the records
BEGIN
DBMS_OUTPUT.PUT_LINE('Upcoming Appointments for ' || p_pName || ':');

FOR rc IN record_cursor LOOP
DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rc.AppointmentID || ', Patient Name: ' || rc.PatientName ||', Doctor Name: ' || rc.DoctorName ||', Appointment Date: ' || TO_CHAR(rc.AppointmentDate, 'DD-MM-YYYY') || ', Appointment Time: ' || TO_CHAR(rc.AppointmentTime, 'HH24:MI'));

-- Increase the value of counter by 1
v_counter := v_counter + 1;

-- End of the loop
END LOOP;

-- Check if no records were fetched. If not display the message
IF v_counter = 0 THEN
DBMS_OUTPUT.PUT_LINE('No Appointments found.');

-- End of the if else statement
END IF;

END;


-- Interactive Anonymous Block 
BEGIN

-- print upcoming appointments:
ListPAppointments_S1511679('James');

END;
