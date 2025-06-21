# SQL for Data Analysis

This repository contains SQL scripts and queries developed during my data analytics training. The exercises and mini-projects simulate real-world tasks such as data cleaning, transformation, joins, and business insight generation.

## 🔐 Security and Encryption Utilities

Inside the `sql` folder, you'll find scripts focused on basic SQL Server security and encryption setup. These are useful for:

- Auditing user roles at both the database and server level
- Viewing asymmetric keys
- Creating a master key and certificate for secure environments
- Verifying connection encryption status
- Referencing an encrypted SQL Server connection string

📄 **Script:** [`SQLQuery14sql.sql`](https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/sql/SQLQuery14sql.sql)

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
