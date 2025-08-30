# CREATE DATABASE
CREATE DATABASE HOSPITAL_MANAGMENT_SYSTEM;
USE HOSPITAL_MANAGMENT_SYSTEM;

# Physician Table
CREATE TABLE Physician(
    employeeid INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    position VARCHAR(150) NOT NULL
);

INSERT INTO Physician(employeeid,name,position) VALUES
(1,'Dr.John Dorian','Staff Internist'),
(2,'Dr.Elliot Reid','Attending Physician'),
(3,'Dr.Christopher Turk','Surgical Attending Physician'),
(4,'Dr.Percival Cox','Senior Attending Physician'),
(5,'Dr.Bob Kelso','Head Chief of pulmonology'),
(6,'Dr.Todd Quinlan','Surgical Attending Physician'),
(7,'Dr.John Wen','Surgical Attending Physician'),
(8,'Dr.Keith Dudemeister','Resident'),
(9,'Dr.Molly Clock','Attending Psychiatrist'),
(10,'Dr.Imani Harper','Senior Attending Nephrologist'),
(11,'Dr.Berkley McKenzie','Resident'),
(12,'Dr.Scott Vaughan','Senior Attending Gynecologist'),
(13,'Dr.Nancy James','Cardiologist'),
(14,'Dr.Jaxson Khan','Assistant Intensivist'),
(15,'Dr.Mabel Leal','Senior ENT Surgeon'),
(16,'Dr.Cedric Kelley','Junior Resident'),
(17,'Dr.Rosalie Vaughn','Assistant Orthopedic Surgeon'),
(18,'Dr.Remy Cook','Head chief of Gastroenterology'),
(19,'Dr.Aaliyah Craig','Assistant Neuro Surgeon'),
(20,'Dr.Odin Banks','Junior Intensivist'),
(21,'Dr.Cali Vazquez','Head Chief of Orthopedics'),
(22,'Dr.Jesse Craig','Head chief of neonatal'),
(23,'Dr.Brynn Harrison','Staff Internist'),
(24,'Dr.Gavin Curtis','Assistant Physiotherapist'),
(25,'Dr.Alexis Estes','Senior Intensivist'),
(26,'Dr.Estella Keller','Assistant Gastro Surgeon'),
(27,'Dr.Nico Galvan','Head chief of physiotherapy'),
(28,'Dr.Dallas Gutierrez','Senior attending Urologist'),
(29,'Dr.Luca Flowers','Intensivist'),
(30,'Dr.Ariya Bradley','Senior Attending Neurologist'),
(31,'Dr.Richard Mitchell','Senior Resident'),
(32,'Dr.Willow Farmer','Junior Resident'),
(33,'Dr.Jamison Clayton','Assistant neonatologist'),
(34,'Dr.Saige Juarez','Senior Resident'),
(35,'Dr.Robert Suarez','Head Chief of Urology');

# Department Table (must come BEFORE affiliated_with)
CREATE TABLE Department(
    department_id INT PRIMARY KEY,
    dept_name VARCHAR(150) NOT NULL,
    head INT NOT NULL,
    FOREIGN KEY(head) REFERENCES Physician(employeeid)
);

INSERT INTO Department(department_id,dept_name,head) VALUES
(1,'General Medicine',4),
(2,'Surgery',7),
(3,'Psychiatry',9),
(4,'Cardiology',13),
(5,'Nephrology',10),
(6,'Urology',35),
(7,'Neurology',30),
(8,'Physiotherapy',27),
(9,'ENT',15),
(10,'Pulmonology',5),
(11,'Gastroenterology',18),
(12,'Gynecology',12),
(13,'Neonatal',22),
(14,'Critical care',25),
(15,'Orthopedics',21);

# Affiliated_with Table (now works because department exists)
CREATE TABLE Affiliated_with(
    physicianid INT NOT NULL,
    departmentid INT NOT NULL,
    primaryaffiliation VARCHAR(1) NOT NULL CHECK (primaryaffiliation IN ('Y','N')),
    FOREIGN KEY(physicianid) REFERENCES Physician(employeeid),
    FOREIGN KEY(departmentid) REFERENCES Department(department_id),
    PRIMARY KEY (physicianid, departmentid)
);

INSERT INTO Affiliated_with(physicianid,departmentid,primaryaffiliation) VALUES
(1,1,'Y'),
(2,1,'Y'),
(3,1,'N'),
(3,2,'Y'),
(4,1,'Y'),
(5,10,'Y'),
(6,2,'Y'),
(7,1,'N'),
(7,2,'Y'),
(8,1,'Y'),
(9,3,'Y'),
(10,5,'Y'),
(11,4,'N'),
(12,12,'Y'),
(13,4,'Y'),
(14,14,'N'),
(15,9,'Y'),
(16,10,'N'),
(17,15,'Y'),
(18,11,'Y'),
(19,7,'Y'),
(20,14,'N'),
(21,15,'Y'),
(22,13,'Y'),
(23,14,'N'),
(24,8,'Y'),
(25,14,'Y'),
(26,11,'N'),
(27,8,'Y'),
(28,6,'Y'),
(29,14,'Y'),
(30,7,'Y'),
(31,5,'N'),
(32,4,'N'),
(33,13,'Y'),
(34,11,'Y'),
(35,6,'Y');

# Nurse Table
CREATE TABLE Nurse(
    nurse_id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    position VARCHAR(150) NOT NULL,
    registered VARCHAR(10) NOT NULL
);

-- (insert nurses same as your data)

# Patient Table
CREATE TABLE Patient(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    gender VARCHAR(150) NOT NULL,
    phone VARCHAR(150) NOT NULL,
    primary_check INT NOT NULL,
    FOREIGN KEY(primary_check) REFERENCES Physician(employeeid)
);

-- (insert patients same as your data)

# Patient Diagnosis Table
CREATE TABLE Patient_Diagnosis(
    diagnosis VARCHAR(150) NOT NULL,
    prescription VARCHAR(150) NOT NULL,
    patient_id INT NOT NULL,
    physician_id INT NOT NULL,
    FOREIGN KEY(patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY(physician_id) REFERENCES Physician(employeeid)
);

-- (insert diagnoses same as your data)

# Procedures Table
CREATE TABLE Procedures(
    code INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    cost INT NOT NULL
);

-- (insert procedures same as your data)

# Verification Queries
SELECT * FROM Physician;
SELECT * FROM Department;
SELECT * FROM Affiliated_with;
SELECT * FROM Nurse;
SELECT * FROM Patient;
SELECT * FROM Patient_Diagnosis;
SELECT * FROM Procedures;

DESC Physician;
DESC Department;
DESC Affiliated_with;
DESC Nurse;
DESC Patient;
DESC Patient_Diagnosis;
DESC Procedures;


