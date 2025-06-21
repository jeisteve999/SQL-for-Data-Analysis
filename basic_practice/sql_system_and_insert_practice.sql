-- ========================================
-- SQL Server System Info and Insert Practice
-- ========================================

-- 1. Basic Print and System Version Info
SELECT 'Hello, I am a SQL Server student from Skill';

-- SQL Server version
SELECT @@VERSION AS [SQL Server Version];

-- Naming columns in different ways
SELECT @@VERSION AS Version;
SELECT @@VERSION Version;
SELECT @@VERSION AS 'Version';
SELECT @@VERSION AS [This is my version];

-- 2. System Queries and Date Functions
USE master;
GO

-- Replication options (only if replication is enabled)
SELECT * FROM dbo.MSreplication_options;

-- Obsolete system view, replaced by sys.databases
SELECT * FROM sys.databases;

-- Current date and components
SELECT GETDATE() AS CurrentDate;
SELECT DATENAME(DAY, GETDATE()) AS Day;
SELECT DATENAME(MONTH, GETDATE()) AS Month;

-- Available system languages
SELECT * FROM sys.syslanguages;

-- Set session language
SET LANGUAGE 'Spanish';
GO

-- 3. Database Commands (examples - do not run without purpose)
-- CREATE DATABASE TestDB;
-- ALTER DATABASE [AdventureWorks2022] SET SINGLE_USER;
-- RESTORE DATABASE AdventureWorks2022 FROM DISK = 'C:\Backups\AdventureWorks2022.bak';

-- 4. Schema and Monitoring Views
USE AdventureWorks2022;
GO

SELECT * FROM dbo.spt_monitor;
SELECT * FROM sys.schemas;

-- 5. Table Creation: Employees and Students
CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(200),
    FechaNacimiento DATE,
    Salario DECIMAL(10, 2)
);

CREATE TABLE estudiantes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Edad INT,
    FechaIngreso DATE,
    Promedio DECIMAL(5, 2),
    Activo BIT
);

-- 6. Insert Data into Employees
INSERT INTO empleados (id_empleado, nombre, FechaNacimiento, Salario)
VALUES (1, 'Juan Perez', '1985-07-10', 3500.00);

SELECT * FROM empleados;

-- 7. Insert Data into Students
INSERT INTO estudiantes (ID, Nombre, Edad, FechaIngreso, Promedio, Activo)
VALUES 
    (1, 'Ana Gomez', 20, '2024-09-01', 8.75, 1),
    (2, 'Carlos Mendez', 22, NULL, 7.80, 1),
    (3, 'Luis Lopez', NULL, '2025-01-10', NULL, 0),
    (4, 'Paula Diaz', 19, '2024-09-15', 8.50, 1),
    (5, 'Jose Martinez', 23, '2023-11-05', 7.60, 1),
    (6, 'Laura Fernandez', 21, '2025-02-20', 9.30, 1);

-- Additional insertion with OUTPUT clause
INSERT INTO estudiantes (ID, Nombre, Edad, FechaIngreso, Promedio, Activo)
OUTPUT INSERTED.ID, INSERTED.Nombre
VALUES (7, 'Raul Sanchez', 25, '2025-03-17', 6.85, 1);

SELECT * FROM estudiantes;

-- Insert with missing column (will fail unless id_empleado is IDENTITY)
-- INSERT INTO empleados (Nombre, FechaNacimiento, Salario)
-- VALUES ('Lucia Rodriguez', '1990-03-25', 4000.00);

