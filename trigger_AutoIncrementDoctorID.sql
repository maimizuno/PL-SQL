-- Create sequence
CREATE SEQUENCE Doc_doctorId_seq_S1511679

-- Start from the next number after the existing ID: D2003
START WITH 2004

-- automatically increase the number by 1
INCREMENT BY 1
NOCACHE;


-- Trigger heading 
CREATE OR REPLACE TRIGGER InsertDoctor_S1511679

-- Specify Trigger type
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN

-- Set DoctorID to the 'D' letter with next available number 
:NEW.DoctorID := 'D' || TO_CHAR(Doc_doctorId_seq_S1511679.NEXTVAL);

END;

-- Test the trigger
INSERT INTO Doctors (Name, Specialization, Phone)
VALUES ('Dr. New', 'Pediatrics', '555-0011');

