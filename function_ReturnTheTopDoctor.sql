-- Function heading 
CREATE OR REPLACE FUNCTION GetTopDoctors_S1511679(p_startDate IN DATE, p_endDate IN DATE) 
RETURN VARCHAR2 IS

-- Declare Variable
v_doctor_details VARCHAR2(4000) := '';

-- Use Cursor to retrieve data one row at a time
CURSOR record_cursor IS

-- Retrieve details of all top doctors
SELECT DoctorID, Name, Specialization
FROM (
SELECT d.DoctorID, d.Name, d.Specialization,
RANK() OVER (ORDER BY COUNT(a.AppointmentID) DESC) AS rank
FROM Doctors d
JOIN Appointments a ON d.DoctorID = a.DoctorID
WHERE a.AppointmentDate BETWEEN p_startDate AND p_endDate
GROUP BY d.DoctorID, d.Name, d.Specialization
) ranked_doctors
WHERE rank = 1;

BEGIN
-- For Loop to fetch details of each top doctor
FOR rc IN record_cursor LOOP
v_doctor_details := v_doctor_details || 'DoctorID: ' || rc.DoctorID ||
', Name: ' || rc.Name || ', Specialization: ' ||
rc.Specialization || CHR(10); -- Add newline 

END LOOP;

-- Check if any doctor details were found. If not assign a message
IF v_doctor_details IS NULL OR v_doctor_details = '' THEN
v_doctor_details := 'No doctors found within the specified range.';

-- End of if else statement
END IF;

-- Return the result
RETURN v_doctor_details;

END;


-- Interactive Anonymous Block 
DECLARE
result VARCHAR2(4000);

BEGIN
-- assign the result:
result := GetTopDoctors_S1511679(TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-30', 'YYYY-MM-DD'));

-- print the result:
DBMS_OUTPUT.PUT_LINE(result);

END;
