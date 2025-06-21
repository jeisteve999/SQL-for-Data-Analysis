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
- 


# SQL Server Practice Lab: Database Design, Normalization & Security

## 📌 Overview

This project is a comprehensive SQL Server practice script designed to demonstrate essential skills in:

- **Database creation**
- **Table design and normalization (1NF, 2NF)**
- **Data manipulation (INSERT, SELECT, UPDATE, DELETE)**
- **Primary and foreign key constraints**
- **Composite keys and indexing**
- **User roles and permissions**
- **Database backups**

All scripts are written for learning purposes using a fictional dataset related to employees, faculty, courses, clients, and orders.

---

## 🧱 Structure

The script is divided into **8 key sections**:

### 1. Employee Table and Operations
- Create a basic employee table
- Insert single and multiple rows
- Update and delete data
- Query data by ID

### 2. Faculty and Course Relationship
- Create a non-normalized faculty table with course info
- Perform data cleanup
- Normalize course information into a separate table

### 3. Clients and Address Normalization
- Transition from a flat table to a 1-to-many relationship
- Use foreign key constraints to enforce integrity

### 4. 2NF Orders Example
- Refactor a table with partial dependencies
- Separate clients into a dedicated table and apply normalization rules

### 5. Referential Integrity with PK and FK
- Create `Faculty1` and `Courses1` with `IDENTITY` and proper foreign keys
- Perform INNER JOIN queries

### 6. Composite Primary Keys
- Demonstrate multi-column primary key with `SSN` and `EId`

### 7. Indexes and User Roles
- Add a unique non-clustered index
- Create SQL Server login and assign user roles
- Grant database-level access

### 8. Backup Instructions
- Backup database to local path
- Use INIT and STATS for clean backup

---

## 🛠️ Technologies Used

- **SQL Server Management Studio (SSMS)**
- **T-SQL**
- **SQL Server Authentication and Permissions**
- **Backup/Restore Functionality**

---

## ✅ How to Use

1. Open SQL Server Management Studio.
2. Run each section of the script step by step.
3. Make sure paths for backup (`C:\...`) exist on your machine or modify accordingly.
4. Observe normalization concepts and test queries using `SELECT`, `JOIN`, etc.

---

## 📂 File List

- https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/basic_practice/sql_lab_practice.sql


---

## 🔐 Disclaimer

This is an educational practice project. No real data is used, and user credentials (e.g., passwords) are fictional. Please avoid using real credentials in public repositories.

---

Feel free to fork, adapt, and extend this script to test your SQL logic and procedural thinking.


# SQL Server Practice: Restaurant & HR Database Scripts

https://github.com/jeisteve999/SQL-for-Data-Analysis/blob/main/basic_practice/restaurant_lab_practice2.sql

## 📌 Overview

This project contains a rich SQL Server practice script simulating operations in a **restaurant and HR context**. It covers key topics such as:

- Table creation with keys and relationships
- Views and data filtering
- Stored procedures (insert, update, delete)
- XML data types and `ALTER TABLE`
- `CASE` expressions for business logic
- Basic normalization principles

Designed for educational purposes, this script helps reinforce essential skills in T-SQL and database modeling.

---

## 🧱 Structure

The SQL script is divided into **8 main sections**:

### 1. Person and Instructor Relationship
- `Person` table for staff and students
- `CourseInstructor` table with foreign key relation
- Demonstrates JOIN between entities

### 2. Department Table (HR Schema)
- Creation of `HumanResources.Department` table
- Includes clustered primary key and column structure for HR grouping

### 3. Employee Table (Sample Database)
- Simple employee table design with department column

### 4. Person and EmployeeDetails in `Lab_skillsoft`
- Improved `Person` table
- `EmployeeDetails` table using `XML` for resumes
- Demonstrates `ALTER TABLE` for datatype correction

### 5. Views
- `PersonView` shows use of `CREATE VIEW` for filtered data

### 6. Employee2 Table and Stored Procedures
- Create and insert records using `sp_insertemployee`
- Update records via `sp_updateemployee`
- Delete records by department using `sp_deleteemployee`

### 7. Advanced Queries with CASE
- Conditional logic applied using `CASE`
- Adjusts `SafetyStockLevel` based on `Color` in `DimProduct`

---

## 🛠️ Technologies Used

- **SQL Server Management Studio (SSMS)**
- **T-SQL**
- **Stored Procedures and Views**
- **XML Fields**
- **CASE Logic**

---

## ✅ How to Use

1. Open SQL Server Management Studio.
2. Execute the script section by section.
3. Confirm database names exist or create them beforehand (`RESTAURANTE`, `Lab_skillsoft`, `Sample`).
4. Adapt XML and product data queries if needed.
5. Use `EXEC` commands to test procedures.

---

## 📂 File List

- `restaurant_lab_practice.sql`: Full practice script with comments
- `README.md`: This file

---
