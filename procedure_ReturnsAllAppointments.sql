-- Procedure heading
CREATE OR REPLACE PROCEDURE ListDAppointments_S1511679(p_dId IN CHAR, p_appDate IN DATE)
IS
-- Declare variables
v_counter NUMBER := 0; 

-- Use Cursor to retrieve data one row at a time
CURSOR record_cursor IS

-- Retrieve upcoming appointment for a doctor on a specific date
SELECT d.Name, d.specialization, a.AppointmentDate, a.AppointmentTime
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE d.DoctorID = p_dId AND TRUNC(a.AppointmentDate) = TRUNC(p_appDate)
ORDER BY a.AppointmentDate DESC;

-- print the records
BEGIN
DBMS_OUTPUT.PUT_LINE('Upcoming Appointments for ' || p_dId || ' on ' || p_appDate || ':');

FOR rc IN record_cursor LOOP
DBMS_OUTPUT.PUT_LINE('Doctor Name: ' || rc.Name || ', Specialization: ' || rc.Specialization ||', Appointment Date: ' || TO_CHAR(rc.AppointmentDate, 'DD-MM-YYYY') || ', Appointment Time: ' || TO_CHAR(rc.AppointmentTime, 'HH24:MI'));

-- Increase the value of counter by 1
v_counter := v_counter + 1;

-- End of the loop
END LOOP;

-- Check if no records were fetched
IF v_counter = 0 THEN
DBMS_OUTPUT.PUT_LINE('No Appointments found.');

-- End of the if else statement
END IF;

END;


-- Interactive Anonymous Block 
BEGIN

-- print upcoming appointments:
ListDAppointments_S1511679('D2002', TO_DATE('2023-06-02', 'YYYY-MM-DD'));

END;
