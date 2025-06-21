-- 1. Enable Transparent Data Encryption (TDE)
USE curso_sql;
GO
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE MiCertificado;
GO

ALTER DATABASE curso_sql SET ENCRYPTION ON;
GO

-- 2. Backup with encryption
BACKUP DATABASE curso_sql
TO DISK = 'C:\backups\curso_sql.bak'
WITH ENCRYPTION(ALGORITHM = AES_256, SERVER CERTIFICATE = MiCertificado);
GO

-- 3. Encrypting and decrypting a string using a passphrase
DECLARE @EncryptedData VARBINARY(MAX);
SET @EncryptedData = EncryptByPassPhrase('MySecretKey', '1234567890');

SELECT CONVERT(VARCHAR(100), DecryptByPassPhrase('MySecretKey', @EncryptedData));
GO

-- 4. Creating users
-- For an existing Windows login
USE GOTestDB;
GO
CREATE USER [DOMAIN\User]
FOR LOGIN [DOMAIN\User];
GO

-- For a new SQL login
USE master;
GO
CREATE LOGIN Newuser WITH PASSWORD = 'StrongPassword123!';
GO

USE curso_sql;
GO
CREATE USER Newuser FOR LOGIN Newuser;
GO

-- 5. Grant and revoke permissions (examples)
GRANT SELECT ON dbo.MyTable TO Newuser;
-- REVOKE SELECT ON dbo.MyTable TO Newuser;

-- 6. Assigning roles
EXEC sp_addrolemember 'db_datareader', 'jared';
EXEC sp_addsrvrolemember 'jared', 'sysadmin';
GO