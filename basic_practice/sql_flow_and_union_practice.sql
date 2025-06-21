-- ========================================
-- SQL Flow Control, Random Loop & UNION Practice
-- ========================================

-- 1. Example INSERT into msdb (placeholder values, DO NOT run in production)
USE [msdb];
GO

-- NOTE: Replace values with actual strings or comment out for demo purposes
-- INSERT INTO [dbo].[autoadmin_task_agents] (
--     task_assembly_name,
--     task_assembly_path,
--     className
-- )
-- VALUES (
--     'example_name',
--     'C:\\Program Files\\MyAgent\\agent.dll',
--     'Namespace.MyClass'
-- );
-- GO

-- 2. Updating employee data
USE [YourDatabase];
GO

UPDATE empleados
SET fecha_baja = GETDATE()
WHERE id = 6;

-- Fix: Added missing comma
UPDATE empleados
SET fecha_baja = GETDATE(),
    sueldo = 1000,
    apellidos = 'Montañez Gil'
WHERE id = 6;

-- 3. UNION example from multiple tables
SELECT description FROM bebidas
UNION
SELECT description FROM platos
UNION
SELECT nombre FROM camareros
ORDER BY description;

-- 4. Random number generator with GOTO (looping)
DECLARE @aleatorio FLOAT;
DECLARE @contador INT = 0;

StartLoop:
    SET @aleatorio = RAND();
    PRINT @aleatorio;

    SET @contador = @contador + 1;

    IF (@contador < 5)
        GOTO StartLoop;
    ELSE
        GOTO EndLoop;

EndLoop:
    PRINT 'We have reached the end.';

