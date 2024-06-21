DROP Table Prescriptions;
DROP Table MedicalRecords;
DROP Table Appointments;
DROP Table Doctors;
DROP Table Patients;

CREATE TABLE Patients (PatientID Number(5,0) PRIMARY KEY, Name VARCHAR2(50) NOT NULL, Address VARCHAR2(200) NOT NULL, Phone VARCHAR2(15) NOT NULL, DOB DATE NOT NULL, Active Char(1) default 'Y' );

CREATE TABLE Doctors ( DoctorID CHAR(5) PRIMARY KEY, Name VARCHAR2(50) NOT NULL, Specialization VARCHAR2(50) NOT NULL, Phone VARCHAR2(15) NOT NULL );

CREATE TABLE Appointments ( AppointmentID Number(5,0) PRIMARY KEY, PatientID Number(5,0) NOT NULL, DoctorID CHAR(5) NOT NULL, AppointmentMadeDate DATE NOT NULL, AppointmentDate DATE NOT NULL, AppointmentTime DATE NOT NULL, FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) );

CREATE TABLE MedicalRecords ( RecordID Number(5,0) PRIMARY KEY, PatientID Number(5,0) NOT NULL, DoctorID CHAR(5) NOT NULL, Diagnosis VARCHAR2(200), Treatment VARCHAR2(200),Notes VARCHAR2(200), dateofRecord DATE default sysdate, FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) );

CREATE TABLE Prescriptions ( PrescriptionID Number(5,0) PRIMARY KEY, RecordID Number(5,0) NOT NULL, Medication VARCHAR2(50) NOT NULL, Dosage VARCHAR2(50) NOT NULL, Frequency VARCHAR2(50) NOT NULL, FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID));

INSERT INTO Patients VALUES (1001, 'Peter Smith', '456 Main St Prahran VIC', '0430-123-134', TO_DATE( '1990-01-01', 'YYYY-MM-DD' ),'Y'); 
INSERT INTO Patients VALUES (1002, 'James Doe', '66 High St Prahran VIC', '0404-555-678', TO_DATE( '1995-03-28', 'YYYY-MM-DD' ), 'Y');
INSERT INTO Patients VALUES (1003, 'Aaron Brown', '23 Spencer Ave Prahran VIC', '0430-333-578', TO_DATE( '1988-05-06', 'YYYY-MM-DD' ), 'N');

INSERT INTO Doctors VALUES ('D2001', 'Dr. Maio', 'Cardiology', '555-0001'); 
INSERT INTO Doctors VALUES ('D2002', 'Dr. Kevin', 'Neurology', '555-0002');
INSERT INTO Doctors VALUES ('D2003', 'Dr. Andrew', 'Cardiology', '555-0005'); 

INSERT INTO Appointments VALUES (3001, 1001, 'D2001',TO_DATE( '2022-01-01', 'YYYY-MM-DD'),TO_DATE( '2022-01-02', 'YYYY-MM-DD'), TO_DATE( '10:00:00', 'HH24:MI:SS')); 
INSERT INTO Appointments VALUES (3002, 1002, 'D2002', TO_DATE( '2022-01-02', 'YYYY-MM-DD'),TO_DATE( '2022-01-02', 'YYYY-MM-DD'), TO_DATE( '14:20', 'HH24:MI'));
INSERT INTO Appointments VALUES (3003, 1002, 'D2002', TO_DATE( '2023-03-26', 'YYYY-MM-DD'),TO_DATE( '2023-06-02', 'YYYY-MM-DD'), TO_DATE( '11:20', 'HH24:MI'));
INSERT INTO Appointments VALUES (3004, 1001, 'D2001',TO_DATE( '2022-01-01', 'YYYY-MM-DD'),TO_DATE( '2022-06-05', 'YYYY-MM-DD'), TO_DATE( '11:00:00', 'HH24:MI:SS')); 
INSERT INTO Appointments VALUES (3005, 1001, 'D2001',TO_DATE( '2022-01-01', 'YYYY-MM-DD'),TO_DATE( '2022-12-02', 'YYYY-MM-DD'), TO_DATE( '10:30:00', 'HH24:MI:SS')); 


INSERT INTO MedicalRecords VALUES (4001, 1001, 'D2001', 'High Blood Pressure', 'Prescribed medication and advised to reduce salt intake',NULL,TO_DATE( '2022-01-02', 'YYYY-MM-DD')); 
INSERT INTO MedicalRecords VALUES (4002, 1001, 'D2001', 'Migraine', 'Prescribed medication and advised to reduce stress',NULL,TO_DATE( '2022-06-05', 'YYYY-MM-DD')); 
INSERT INTO MedicalRecords VALUES (4003, 1001, 'D2001', 'diabetes', 'further test advised to 
manage sugar levels',NULL,TO_DATE( '2022-12-02', 'YYYY-MM-DD'));
INSERT INTO MedicalRecords VALUES (4004, 1001, 'D2001', 'diabetes', 'test result discussed and prescribed medication',NULL,TO_DATE( '2022-06-05', 'YYYY-MM-DD'));
INSERT INTO MedicalRecords VALUES (4005, 1002, 'D2002', NULL, NULL, 'Address changed from 65 King St Darbin VIC to 456 High St Preston VIC',TO_DATE( '2022-06-05', 'YYYY-MM-DD'));

INSERT INTO Prescriptions VALUES (5001, 4001, 'Zestoretic', '10mg', 'Once daily'); 
INSERT INTO Prescriptions VALUES (5002, 4002, 'Imitrex', '50mg', 'As needed');
INSERT INTO Prescriptions VALUES (5003, 4003, 'Diabeta', '5mg', 'Once daily'); 
