
-- ============================================================
-- DATABASE: Lab_skillsoft - PRACTICE SCRIPT ON SQL SERVER
-- Description: Practice with table creation, data manipulation,
-- normalization, indexing, user roles, and backups.
-- ============================================================

USE Lab_skillsoft;
GO

-- =========================================
-- SECTION 1: Employee Table and Operations
-- =========================================

CREATE TABLE EmployeeDetails2 (
    [Id] INT NOT NULL,
    [Name] NVARCHAR(70) NOT NULL,
    [DOB] DATE NOT NULL,
    [HireDate] DATE NOT NULL,
    [MaritalStatus] NCHAR(1),
    [Gender] NCHAR(1),
    [Salary] MONEY NOT NULL,
    [PayFrequency] TINYINT NOT NULL,
    [VacationHours] SMALLINT NOT NULL, -- Removed extra space
    [ShiftInTime] TIME(7),
    [ShiftOutTime] TIME(7),
    [ModifiedDate] DATETIME
);

-- Insert full record
INSERT INTO EmployeeDetails2
VALUES (1, 'Harry Wilson', '1972-09-09', '2000-09-09', 'M', 'S', 5000, 2, 25, '15:00', '09:00', '2012-06-02');

-- Insert partial record
INSERT INTO EmployeeDetails2 (Id, Name, DOB, HireDate, Salary, PayFrequency, VacationHours)
VALUES (2, 'Rachel Gilbert', '1970-01-01', '2000-09-01', 2000, 2, 25);

-- Insert multiple rows
INSERT INTO EmployeeDetails2 (Id, Name, DOB, HireDate, Salary, PayFrequency, VacationHours)
VALUES 
(3, 'Carney Stone', '1978-09-09', '2000-09-09', 2000, 1, 30),
(4, 'Wilson Justin', '1960-06-08', '2000-09-08', 1500, 2, 50),
(5, 'Gordon Deborah', '1975-07-09', '2000-09-09', 2000, 2, 79);

-- View all data
SELECT * FROM EmployeeDetails2;

-- Query by ID
SELECT * FROM EmployeeDetails2 WHERE Id = 3;

-- Update salary and vacation hours
UPDATE EmployeeDetails2
SET Salary = 6000, VacationHours = 60
WHERE Id = 3;

-- View record before deletion
SELECT * FROM EmployeeDetails2 WHERE Id = 2;

-- Delete a record
DELETE FROM EmployeeDetails2 WHERE Id = 2;

-- =========================================
-- SECTION 2: Faculty and Course Relationship
-- =========================================

CREATE TABLE Faculty (
    FacultyId INT NOT NULL,
    FacultyName NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    CourseName VARCHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Salary MONEY NOT NULL
);

-- Note: Duplicated FacultyId is allowed here (no PK defined)
INSERT INTO Faculty (FacultyId, FacultyName, HireDate, CourseName, Gender, Salary)
VALUES 
(1, 'George', '1990-09-09', 'CRID-1', 'M', 400),
(2, 'Martin', '1990-06-08', 'CRID-2', 'M', 700),
(3, 'Jane', '1991-07-09', 'CRID-3', 'F', 800),
(3, 'Jane', '1991-07-09', 'CRID-4', 'F', 800),
(4, 'Terry', '1992-08-09', 'CRID-5', 'M', 500);

SELECT * FROM Faculty;

-- Delete by course
DELETE FROM Faculty WHERE CourseName = 'CRID-2';

-- Filter by FacultyId
SELECT FacultyName, Salary FROM Faculty WHERE FacultyId = 2;

-- Create normalized Courses table
CREATE TABLE Courses (
    CourseId INT NOT NULL,
    CourseName NVARCHAR(30),
    FacultyId INT NOT NULL
);

-- Insert multiple records
INSERT INTO Courses (CourseId, CourseName, FacultyId)
VALUES
(1, 'CRID-1', 1),
(2, 'CRID-2', 2),
(3, 'CRID-3', 3),
(4, 'CRID-4', 3);

SELECT * FROM Courses;

-- Drop redundant column from Faculty
ALTER TABLE Faculty DROP COLUMN CourseName;

-- Clean up Faculty table
DELETE FROM Faculty;

-- Re-insert normalized Faculty
INSERT INTO Faculty (FacultyId, FacultyName, HireDate, Gender, Salary)
VALUES 
(1, 'George', '1990-09-09', 'M', 400),
(2, 'Martin', '1990-06-08', 'M', 700),
(3, 'Jane', '1991-07-09', 'F', 800);

-- =========================================
-- SECTION 3: Normalization Example (Clients)
-- =========================================

CREATE TABLE Clients (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Addresses NVARCHAR(200) NULL -- Flat field, not normalized
);

-- Dropped later for normalization
DROP TABLE Clients;

-- Normalized address table
CREATE TABLE Clients (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
);

CREATE TABLE Addresses (
    ID INT PRIMARY KEY,
    ClientID INT,
    Address NVARCHAR(200),
    FOREIGN KEY (ClientID) REFERENCES Clients(ID)
);

-- Insert normalized data
INSERT INTO Clients (ID, Name)
VALUES (1, 'Juan Pérez'), (2, 'María López');

INSERT INTO Addresses (ID, ClientID, Address)
VALUES 
(1, 1, 'Calle 123'),
(2, 1, 'Avenida 45'),
(3, 2, 'Calle 78'),
(4, 2, 'Avenida 89'),
(5, 2, 'Calle 22');

-- =========================================
-- SECTION 4: 2NF Normalization Example
-- =========================================

CREATE TABLE Orders (
    OrderID INT,
    ProductID INT,
    ClientName NVARCHAR(50),
    Price DECIMAL,
    PRIMARY KEY (OrderID, ProductID)
);

CREATE TABLE Clients3 (
    ClientID INT PRIMARY KEY,
    ClientName NVARCHAR(50)
);

CREATE TABLE Orders2 (
    OrderID INT,
    ClientID INT,
    ProductID INT,
    Price DECIMAL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (ClientID) REFERENCES Clients3(ClientID)
);

-- =========================================
-- SECTION 5: Referential Integrity with PK/FK
-- =========================================

CREATE TABLE Faculty1 (
    FacultyId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(30),
    HireDate DATE,
    Gender NCHAR(1),
    Salary MONEY
);

CREATE TABLE Courses1 (
    CourseId INT IDENTITY PRIMARY KEY,
    CourseName NVARCHAR(30),
    Faculty INT,
    CONSTRAINT FK_FacultyId FOREIGN KEY (Faculty) REFERENCES Faculty1(FacultyId)
);

-- Insert into normalized Faculty
INSERT INTO Faculty1 (Name, HireDate, Gender, Salary)
VALUES 
('George', '1990-09-09', 'M', 400),
('Martin', '1990-06-08', 'M', 700),
('Jane', '1991-07-09', 'F', 800);

-- Insert courses with FK reference
INSERT INTO Courses1 (CourseName, Faculty)
VALUES 
('CRID-1', 1),
('CRID-1', 1),
('CRID-2', 2),
('CRID-3', 3),
('CRID-3', 3);

-- Join example
SELECT f.Name
FROM Faculty1 f
INNER JOIN Courses1 c ON c.Faculty = f.FacultyId
WHERE c.CourseId = 4;

-- =========================================
-- SECTION 6: Composite Primary Key Example
-- =========================================

CREATE TABLE Employee3 (
    SSN INT NOT NULL,
    EId INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    CONSTRAINT PK_SSN_EId PRIMARY KEY (SSN, EId)
);

-- =========================================
-- SECTION 7: Indexes and Security
-- =========================================

CREATE TABLE EmployeePower (
    Id INT IDENTITY NOT NULL,
    SSN INT NOT NULL,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Salary MONEY NOT NULL,
    Department NVARCHAR(20),
    CONSTRAINT PK_Employee PRIMARY KEY CLUSTERED (Id)
);

-- Create unique non-clustered index
CREATE UNIQUE NONCLUSTERED INDEX un_ssn ON EmployeePower(SSN);

-- Create login and user
CREATE LOGIN PracticeWorksDeveloper WITH PASSWORD = 'Jared33333*';
CREATE USER PracticeLabUser FOR LOGIN PracticeWorksDeveloper;

-- Assign roles to user
EXEC sp_addrolemember N'db_ddladmin', N'PracticeLabUser';
EXEC sp_addrolemember N'db_datareader', N'PracticeLabUser';
EXEC sp_addrolemember N'db_datawriter', N'PracticeLabUser';

-- Grant access to a database
GRANT SELECT ON DATABASE::Lab_skillsoft TO PracticeLabUser;

-- =========================================
-- SECTION 8: Backup Instructions
-- =========================================

-- Create practice database
CREATE DATABASE SQLPracticeWorks;

-- Backup to custom path (make sure the folder exists)
BACKUP DATABASE SQLPracticeWorks
TO DISK = 'C:\Users\NOMAK\Documents\SQL Server Management Studio\SQLPracticeWorks.bak'
WITH NOFORMAT, INIT, NAME = N'SQLPracticeWorks.bak', SKIP, NOREWIND, NOUNLOAD, STATS = 10;

-- Optional: Backup to another path
BACKUP DATABASE SQLPracticeWorks
TO DISK = 'C:\backups\SQLPracticeWorks.bak'
WITH NOFORMAT, INIT, NAME = N'SQLPracticeWorks.bak', SKIP, NOREWIND, NOUNLOAD, STATS = 10;

-- =========================================
-- END OF SCRIPT
-- =========================================
