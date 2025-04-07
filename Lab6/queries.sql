CREATE DATABASE IF NOT EXISTS lab6;
USE lab6;

CREATE TABLE DENTIST (
    id INT PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_phone VARCHAR(15),
    email VARCHAR(50),
    specialty VARCHAR(50)
);
CREATE TABLE PATIENT (
    id VARCHAR(50) PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_phone VARCHAR(15),
    email VARCHAR(50),
    is_banned BOOLEAN DEFAULT FALSE
);

CREATE TABLE SURGERY (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    location TEXT,
    telephone INT
);

CREATE TABLE APPOINTMENT (
    id INT PRIMARY KEY AUTO_INCREMENT
    appointment_date DATE,
    appointment_time TIME,
    request_origin VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES PATIENT(id),
    FOREIGN KEY (dentist_id) REFERENCES DENTIST(id),
    FOREIGN KEY (surgery_id) REFERENCES SURGERY(id)
);
CREATE TABLE BILL(
    id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(id),
);

INSERT INTO DENTIST(id, first_name, last_name, contact_phone, email, specialty) 
VALUES(1, 'TONY', 'SMITH', '18181818181', 'email@gmail.com', 'DENTAL'), 
(2, 'HELEN ', 'PEARSON', '18181818181', 'email@gmail.com', 'DENTAL'), 
(3, 'ROBIN ', 'PLEVIN', '18181818181', 'email@gmail.com', 'DENTAL');

INSERT INTO PATIENT(id, first_name, last_name, contact_phone, email) 
VALUES('P100', 'GILLIAN', 'WHITE', '18181818181', 'email@gmail.com'), 
('P105', 'JILL ', 'BELL', '18181818181', 'email@gmail.com'), 
('P108', 'IAN ', 'MACKAY', '18181818181', 'email@gmail.com');
('P110', 'JOHN ', 'WALKER', '18181818181', 'email@gmail.com');

INSERT INTO SURGERY(id, name, location, telephone) 
VALUES('S15', 'NAME1', '1ST FLOOR', '12345665432'), 
('S10', 'NAME2', '1ST FLOOR', '12345665432'), 
('S13', 'NAME3', '2ND FLOOR', '12345665432');

SELECT * FROM DENTIST ORDER BY last_name;

SELECT APPOINTMENT.id, APPOINTMENT.date, APPOINTMENT.status, APPOINTMENT.request_origin, PATIENT.first_name, PATIENT.last_name
FROM APPOINTMENT
JOIN DENTIST ON DENTIST.id = APPOINTMENT.dentist_id
JOIN PATIENT ON APPOINTMENT.patient_id = PATIENT.id
WHERE DENTIST.id = 1;

SELECT APPOINTMENT.id, APPOINTMENT.date, APPOINTMENT.status, APPOINTMENT.request_origin
FROM APPOINTMENT
JOIN SURGERY ON SURGERY.id = APPOINTMENT.surgery_id

SELECT APPOINTMENT.id, APPOINTMENT.date, APPOINTMENT.status, APPOINTMENT.request_origin
FROM APPOINTMENT
JOIN PATIENT ON PATIENT.id = APPOINTMENT.patient_id
WHERE PATIENT.id = 1 and APPOINTMENT.date = '2023-10-01';
