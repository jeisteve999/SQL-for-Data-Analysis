# SQL for Data Analysis

This repository contains SQL scripts and queries developed during my data analytics training. The exercises and mini-projects simulate real-world tasks such as data cleaning, transformation, joins, and business insight generation.

## 🔐 Security and Encryption Utilities

Inside the `sql` folder, you'll find scripts focused on basic SQL Server security and encryption setup. These are useful for:

- Auditing user roles at both the database and server level
- Viewing asymmetric keys
- Creating a master key and certificate for secure environments
- Verifying connection encryption status
- Referencing an encrypted SQL Server connection string

📄 **Script:** [https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/sql/security_audit.sql)

### 🧩 Script Contents

1. **Database Role Audit**  
   Lists roles assigned to the current database user.

2. **Server Role Audit**  
   Displays server-level roles for the connected login.

3. **Asymmetric Key Overview**  
   Shows all asymmetric keys in the system.

4. **Master Key and Certificate Creation**  
   Creates a master key and a test certificate.  
   ⚠️ *Make sure to replace the default password.*

5. **Connection Encryption Check**  
   Verifies whether the current session is encrypted.

6. **Encrypted Connection String Template**  
   Provides a basic example of a secure connection string.

---

### ⚠️ Notes

- Never commit real credentials or sensitive data.
- Run these scripts only in authorized and secure SQL Server environments.

### ✅ Requirements

- Microsoft SQL Server (2016 or later recommended)  
- SQL Server Management Studio (SSMS) or a compatible SQL client

---

Feel free to fork, use, or suggest improvements!

# Security and User Management in SQL Server

This script (https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/sql/security_and_users.sql) contains advanced SQL Server operations focused on encryption, login/user creation, and permission management.

## 🔐 Script Features

1. **Transparent Data Encryption (TDE) Setup**
   - Creates a database encryption key using AES_256.
   - Enables encryption on the target database.
   - Performs a secure database backup using a server certificate.

2. **Data Encryption with Passphrase**
   - Encrypts a string using `EncryptByPassPhrase`.
   - Decrypts it using `DecryptByPassPhrase`.

3. **User and Login Management**
   - Creates SQL logins and users.
   - Adds Windows-authenticated users.
   - Grants and revokes permissions.
   - Assigns roles at both database and server level.

## 🚧 Notes

- Replace passwords like `'Steve1023'` with secure, production-ready ones before use.
- Make sure that users and roles exist before running `GRANT`, `REVOKE`, or `EXEC sp_addrolemember`.
- Some sections (e.g., `REVOKE` or `ALTER AUTHORIZATION`) may require elevated privileges.

## ✅ Requirements

- SQL Server 2016 or later
- Administrative privileges for login/user creation and encryption setup

---

Feel free to use, modify, or expand this script for educational and training purposes.
