# SQL for Data Analysis

This repository contains SQL scripts and queries developed during my data analytics training. The exercises and mini-projects simulate real-world tasks such as data cleaning, transformation, joins, and business insight generation.

---

## 🔐 Security and Encryption Utilities

Located in: [`security_audit.sql`](./sql/security_audit.sql)

These scripts cover:

- Auditing user roles at database and server level
- Viewing asymmetric keys
- Creating a master key and certificate
- Verifying encrypted connections
- Using encrypted connection strings

### Notes
- Replace any default passwords before using.
- Do not commit sensitive credentials.
- Use only in secure environments.

---

## 🛡️ Security and User Management in SQL Server

Script: [`security_and_users.sql`](./sql/security_and_users.sql)

Covers:

- Transparent Data Encryption (TDE) setup
- Encrypting and decrypting values using passphrases
- Creating SQL and Windows users
- Managing roles and permissions

### Notes
- Admin rights may be required.
- Passwords are placeholders—replace them before use.

---

## 🧪 Basic SQL Practice

Script: [`basic_sql_practice.sql`](./basic_practice/basic_sql_practice.sql)

This script provides hands-on SQL practice with:

1. Data Insertion
2. Basic Queries and Filters
3. Conditional Logic using `CASE`
4. Sorting and Grouping
5. Variables, `IF/ELSE`, `WHILE`, and `GOTO`
6. Joins and Subqueries
7. Temporary Tables
8. String Functions (`LEN`, `ASCII`, etc.)

### Notes
- All table names are illustrative.
- Adapt column names if reusing this script in your own environment.

- # SQL Server System and Insert Practice

This script includes fundamental operations in Microsoft SQL Server, combining system metadata queries with practical table creation and data insertion exercises. It's ideal for learners who want to explore built-in functions, system views, and DML operations.

--- https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/basic_practice/sql_system_and_insert_practice.sql

## 📘 Contents

### 1. System Information
- Print messages with `SELECT`
- View SQL Server version with `@@VERSION`
- Get current date and extract components (`DATENAME`, `GETDATE`)

### 2. System Metadata
- Explore views like `sys.databases`, `sys.schemas`, `sys.syslanguages`
- Use replication/system monitoring views (`spt_monitor`, `MSreplication_options`) where applicable

### 3. Language Settings
- Set query language context (e.g. `SET LANGUAGE 'Spanish'`)

### 4. Table Creation
- Create two example tables: `empleados` and `estudiantes` with relevant data types

### 5. Data Insertion
- Insert single and multiple rows
- Insert using `OUTPUT INSERTED` to return values after insert

---

## ✅ Requirements

- Microsoft SQL Server (2016 or later recommended)
- SQL Server Management Studio (SSMS) or any T-SQL compatible interface
- Optional: Access to AdventureWorks sample database for system views

---

## 🚧 Notes

- Some system tables (like `MSreplication_options`) only appear in certain SQL Server setups.
- Be cautious when modifying system databases such as `master`.
- Adapt column names and table structures if integrating into your own environment.
- Script uses English for all commands and comments for consistency and clarity.

---

Feel free to fork, learn, and adapt this script for educational purposes.


# SQL Server Flow Control and UNION Practice

This script demonstrates intermediate SQL Server features including control flow using labels and `GOTO`, conditional updates, use of the `RAND()` function, and combining result sets using `UNION`. It is designed for learners exploring logic and procedural behavior in T-SQL.

---  https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/basic_practice/sql_flow_and_union_practice.sql

## 📘 Contents

### 1. Insert Example (System Database)
- Demonstrates a template-style `INSERT INTO` on a system table (`msdb`)  
- ⚠️ For educational purposes only – avoid modifying system databases in production

### 2. Update Operations
- Updates `empleados` table with:
  - Automatic `fecha_baja` set to current date
  - Simultaneous update of multiple fields

### 3. UNION Query
- Combines results from three different tables (`bebidas`, `platos`, `camareros`)
- Uses `UNION` and `ORDER BY` to sort merged data

### 4. Random Loop with GOTO
- Simulates a loop using:
  - `DECLARE` and `SET` for variables
  - `RAND()` to generate random numbers
  - `GOTO` control flow to simulate iteration
  - Stops after 5 loops with final message

---

## ✅ Requirements

- Microsoft SQL Server 2016 or later
- Any T-SQL-compatible client (e.g., SSMS)
- Optional: Custom schema containing `empleados`, `bebidas`, `platos`, and `camareros`

---

## 🚧 Notes

- Some system tables used (`msdb`, `autoadmin_task_agents`) are reserved for SQL Server internal use.
- Always validate and test code in a development environment before using in production.
- Ensure tables like `empleados` and `camareros` exist in your database.

---

Feel free to fork, adapt, and extend this script to test your SQL logic and procedural thinking.
