# SQL-for-Data-Analysis
This repository contains SQL scripts and queries developed during my data analytics training. The exercises and mini-projects focus on real-world tasks like data cleaning, transformation, joins, and business insights generation.
# SQL for Data Analysis

This repository contains SQL scripts focused on security checks and encryption setup in Microsoft SQL Server. These utilities can be useful for auditing user roles, verifying encryption, and creating secure environments for backups.

## 📁 Folder: [#SQL for Data Analysis](https://github.com/jeisteve999/SQL-for-Data-Analysis/tree/main/sql)

### 🔐 File: https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/sql/SQLQuery14sql.sql

This script includes:

1. **Database Role Audit**
   - Lists roles assigned to the current database user.
2. **Server Role Audit**
   - Displays server-level roles for the connected login.
3. **Asymmetric Key Overview**
   - Shows all asymmetric keys in the system.
4. **Master Key and Certificate Creation**
   - Creates a master key and a test certificate (⚠️ change password before using in production).
5. **Connection Encryption Check**
   - Verifies if the current session is encrypted.
6. **Encrypted Connection String Example**
   - Template for securely connecting to SQL Server.

## 🚧 Notes

- Make sure to **replace default passwords** and avoid committing credentials.
- Run scripts in a **secure and authorized SQL Server environment** only.

## ✅ Requirements

- Microsoft SQL Server (2016+ recommended)
- SQL Server Management Studio or compatible SQL client

---

Feel free to fork or suggest improvements.
