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


# Basic SQL Practice

https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/basic_practice/basic_sql_practice.sql

This script contains a variety of SQL operations designed to help beginners and intermediate users practice essential skills in Microsoft SQL Server. It includes real-life use cases and examples using variables, conditions, aggregation, control flow, and temporary tables.

## 📘 Contents

### 1. Data Insertion
- Insert rows into tables with different value types (dates, nulls, text)

### 2. Basic Queries and Filters
- `SELECT` with `WHERE`, `IN`, `BETWEEN`, `LIKE`, `NOT`, `<>`, etc.

### 3. Conditional Logic
- `CASE` expressions to classify stock levels and section behavior

### 4. Sorting and Grouping
- `ORDER BY` with multiple columns  
- `GROUP BY` with aggregate functions like `SUM`

### 5. Variables and Control Flow
- Use of `DECLARE`, `SET`, `IF/ELSE`, `WHILE`, and `GOTO`

### 6. Joins and Subqueries
- Inner and left joins  
- Subqueries with `IN` for filtered selection

### 7. Temporary Tables
- Creating and using temporary tables with `#` prefix

### 8. String Functions
- Use of `LEN`, `ASCII`, and `NCHAR` for text manipulation

---

## ✅ Requirements

- Microsoft SQL Server (2016+ recommended)
- SQL Server Management Studio (SSMS) or any T-SQL compatible client

---

## 🚧 Notes

- Table and column names are illustrative. You may need to adapt them to match your own database schema.
- The script uses English as the standard language for code and comments.
- Safe for educational and training use. No sensitive data included.

---

Feel free to fork, practice, and improve upon this script!
