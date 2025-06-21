-- ================================================================
-- DATABASE: RESTAURANTE & LAB_SKILLSOFT
-- Description: Practice on SQL Server with table creation, views,
-- procedures, joins, XML, CASE expressions, and user-defined logic.
-- =================================================================

-- ========================================================
-- SECTION 1: Person Table and Course Instructor Relation
-- ========================================================

USE RESTAURANTE;
GO

CREATE TABLE Person (
    Id INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    EnrolmentDate DATE NOT NULL,
    PersonType NVARCHAR(30) NOT NULL
);
GO

INSERT INTO Person (Id, FirstName, LastName, HireDate, EnrolmentDate, PersonType)
VALUES 
(1, 'Tony', 'Greig', '2013-01-03', '2013-01-03', 'Student'),
(2, 'William', 'Charlie', '2012-01-03', '2012-01-03', 'Instructor');
GO

CREATE TABLE CourseInstructor (
    CourseId INT NOT NULL PRIMARY KEY,
    InstructorId INT,
    FOREIGN KEY (InstructorId) REFERENCES Person(Id)
);
GO

INSERT INTO CourseInstructor (CourseId, InstructorId) VALUES (1, 2);

-- INNER JOIN Example
SELECT * 
FROM Person 
INNER JOIN CourseInstructor 
ON Person.Id = CourseInstructor.InstructorId;
GO

-- ========================================================
-- SECTION 2: Department Table with HumanResources Schema
-- ========================================================

USE RESTAURANTE;
GO

-- Corrected column names and types
CREATE TABLE HumanResources.Department (
    DepartmentID SMALLINT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    GroupName NVARCHAR(50) NOT NULL,
    ModifiedDate DATETIME NOT NULL,
    CONSTRAINT PK_Department_DepartmentID PRIMARY KEY CLUSTERED (DepartmentID)
);
GO

-- ========================================================
-- SECTION 3: Employee Table in Sample Database
-- ========================================================

CREATE DATABASE Sample;
GO

USE Sample;
GO

CREATE TABLE Employee (
    Id INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Depart NVARCHAR(50) NOT NULL
);
GO

-- ========================================================
-- SECTION 4: Person and EmployeeDetails in Lab_skillsoft
-- ========================================================

USE Lab_skillsoft;
GO

-- Person Table with corrected column name (HireData ? HireDate)
CREATE TABLE Person (
    Id INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    EnrolmentDate DATE NOT NULL,
    PersonType NVARCHAR(30) NOT NULL
);

INSERT INTO Person (Id, FirstName, LastName, HireDate, EnrolmentDate, PersonType)
VALUES (1, 'Tony', 'Greig', '2013-01-03', '2013-01-01', 'Student');

SELECT * FROM Person WHERE Id = 1;
GO

-- ========================================================
-- SECTION 5: Extended EmployeeDetails Table with XML
-- ========================================================

CREATE TABLE EmployeeDetails (
    IdentificacionId INT NOT NULL,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    DOB DATE NOT NULL,
    HireDate DATE NOT NULL,
    MaritalStatus NCHAR(1) NOT NULL,
    Gender NCHAR(1) NOT NULL,
    Salary INT NOT NULL, -- corrected from tinyint
    PayFrequency TINYINT NOT NULL,
    VacationHours SMALLINT NOT NULL,
    ShiftInTime TIME NOT NULL,
    ShiftOutTime TIME NOT NULL,
    ModifiedDate DATETIME NOT NULL,
    Resume XML NULL
);

-- Insert sample data
INSERT INTO EmployeeDetails (
    IdentificacionId, FirstName, LastName, DOB, HireDate, MaritalStatus, Gender,
    Salary, PayFrequency, VacationHours, ShiftInTime, ShiftOutTime, ModifiedDate
)
VALUES 
(1, 'Harry', 'Wilson', '1972-09-09', '2000-10-09', 'M', 'S', 5000, 2, 25, '15:00', '09:00', '2012-06-02');
GO

-- ========================================================
-- SECTION 6: Views
-- ========================================================

CREATE VIEW PersonView AS
SELECT * FROM Person WHERE Id = 1;

SELECT * FROM PersonView;
GO

-- ========================================================
-- SECTION 7: Employee2 Table and Stored Procedures
-- ========================================================

CREATE TABLE Employee2 (
    EmployeeId INT NOT NULL,
    EmployeeStatus CHAR(4) NOT NULL,
    EmployeeType CHAR(8) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    StrtAddress VARCHAR(255) NOT NULL,
    City VARCHAR(40) NOT NULL,
    DepartmentCode CHAR(20) NOT NULL,
    JoiningDate DATE NOT NULL
);
GO

-- Procedure to insert employee
CREATE PROCEDURE dbo.sp_insertemployee (
    @EmployeeId INT,
    @EmployeeStatus CHAR(4),
    @EmployeeType CHAR(8),
    @LastName VARCHAR(30),
    @FirstName VARCHAR(30),
    @StrtAddress VARCHAR(255),
    @City VARCHAR(40),
    @DepartmentCode CHAR(20),
    @JoiningDate DATETIME
)
AS
BEGIN
    INSERT INTO Employee2 (EmployeeId, EmployeeStatus, EmployeeType, LastName, FirstName, StrtAddress, City, DepartmentCode, JoiningDate)
    VALUES (@EmployeeId, @EmployeeStatus, @EmployeeType, @LastName, @FirstName, @StrtAddress, @City, @DepartmentCode, @JoiningDate);
END
GO

-- Execute insert procedure
EXEC dbo.sp_insertemployee
    @EmployeeId = 1,
    @EmployeeStatus = 'ACTV',
    @EmployeeType = 'Parttime',
    @LastName = 'Jhon',
    @FirstName = 'Wilson',
    @StrtAddress = 'P.O Box 897, 2769 Vel Ave',
    @City = 'Turlock',
    @DepartmentCode = 'IT',
    @JoiningDate = '2009-09-09';

EXEC dbo.sp_insertemployee
    @EmployeeId = 2,
    @EmployeeStatus = 'ACTV',
    @EmployeeType = 'Fulltime',
    @LastName = 'Welch',
    @FirstName = 'Maggy',
    @StrtAddress = '691-9449 Curabitur Av.',
    @City = 'Bandon',
    @DepartmentCode = 'BPO',
    @JoiningDate = '2000-09-09';
GO

SELECT * FROM Employee2;
GO

-- Procedure to update address
CREATE PROCEDURE dbo.sp_updateemployee (
    @Id INT,
    @Address VARCHAR(255)
)
AS
BEGIN
    UPDATE Employee2
    SET StrtAddress = @Address
    WHERE EmployeeId = @Id;
END
GO

EXEC dbo.sp_updateemployee @Id = 1, @Address = 'P.O BOX 190, 3608 Auctor Rd.';
GO

-- Procedure to delete by department
CREATE PROCEDURE dbo.sp_deleteemployee (
    @DepartmentCode CHAR(20)
)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Employee2 WHERE DepartmentCode = @DepartmentCode;
END
GO

EXEC dbo.sp_deleteemployee @DepartmentCode = 'BPO';
GO

-- ========================================================
-- SECTION 8: Advanced Queries and CASE Statement
-- ========================================================

-- Example query using CASE on product table
SELECT 
    EnglishProductName,
    EnglishDescription,
    Color,
    SafetyStockLevel,
    CASE Color
        WHEN 'Black' THEN SafetyStockLevel * 2
        WHEN 'Red' THEN SafetyStockLevel * 3
        WHEN 'Silver' THEN SafetyStockLevel * 3.5
        ELSE SafetyStockLevel
    END AS AdjustedSafetyStock
FROM DimProduct
ORDER BY Color;
GO