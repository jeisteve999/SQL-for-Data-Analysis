-- 1. Database-level roles
SELECT dp.name AS RoleName, 
       mp.name AS UserName
FROM   sys.database_role_members drm
       INNER JOIN sys.database_principals dp ON drm.role_principal_id = dp.principal_id
       INNER JOIN sys.database_principals mp ON drm.member_principal_id = mp.principal_id
WHERE  mp.name = USER_NAME();

-- 2. Server-level roles
SELECT sp.name AS LoginName,
       sr.name AS ServerRole
FROM   sys.server_principals sp
       INNER JOIN sys.server_role_members srm ON sp.principal_id = srm.member_principal_id
       INNER JOIN sys.server_principals sr ON srm.role_principal_id = sr.principal_id
WHERE  sp.name = SUSER_NAME(); 

-- 3. View asymmetric keys
SELECT * FROM sys.asymmetric_keys;

-- 4. Create master key and certificate (⚠️ only in a secure environment)
USE master;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'pa$$word'; -- ⚠️ Replace with a secure password
GO

CREATE CERTIFICATE TestBackupCert
WITH SUBJECT = 'Test backup Encryption Certificate';
GO

-- 5. Check encryption status of the current connection
SELECT protocol_desc, encrypt_option 
FROM sys.dm_exec_connections
WHERE session_id = @@SPID;

-- 6. Example of encrypted connection string
-- Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;Encrypt=True;