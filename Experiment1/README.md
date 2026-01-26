# 🧪 Experiment 1

## 🎯 Aim

To design and implement a Library Management System database using appropriate tables, primary keys, foreign keys, and constraints, and to perform DML operations along with DCL commands such as role creation, privilege granting, and revoking to ensure database security.

## 📌 Objectives

To gain practical experience in implementing Data Definition Language (DDL), Data Manipulation Language (DML), and Data Control Language (DCL) operations in a real database environment. This will also include implementing role-based privileges to secure data.

## ⚙️ Practical/Experiment Steps

**Schema Architecture:** Designed the fundamental structure by creating books and library_visitors tables. Robust data integrity was enforced using constraints such as NOT NULL, UNIQUE, and CHECK (notably restricting visitor registration to ages 18 and above).
**Relational Mapping:** Established the book_issue table to serve as a transactional link, utilizing Foreign Keys to connect book records with visitor data.
**Data Seeding:** Populated the database with a foundational dataset to validate the schema design and relationship logic.
**Operational Validation:** Conducted stress tests on the data by performing updates and deletions to observe how the system handles referential integrity and constraints.
**Access Control Management:** Implemented a security layer by creating a specific Librarian role. Access levels were meticulously defined and managed using GRANT and REVOKE commands.

## 📝 Procedure

Authenticated into the database server and established a stable connection.
Initialized a dedicated database environment for the Library Management System.
Executed CREATE TABLE scripts in a hierarchical order, ensuring parent tables were established before dependent transaction tables.
Used INSERT statements to populate the system with diverse sample records for books and visitors.
Ran complex SELECT queries to verify cross-table consistency and ensure data was stored accurately.
Applied UPDATE and DELETE operations to confirm that the database maintains its rules (constraints) during data changes.
Defined the Librarian role and assigned granular permissions for specific database operations.
Validated the security model by attempting restricted actions before and after revoking permissions.
Compiled the final SQL scripts and captured visual evidence (screenshots) of the successful command executions.

## 💻 I/O Analysis

### 1. Table Creation: BOOKS

**Input:**

```sql
CREATE TABLE BOOKS(
    BOOK_ID INT PRIMARY KEY,
    BOOK_NAME VARCHAR(20) NOT NULL,
    AUTHOR_NAME VARCHAR(20) NOT NULL,
    BOOK_COUNT INT CHECK(BOOK_COUNT > 0) NOT NULL
);
```



**Output:**
Books Table Creation

---
<img width="548" height="191" alt="image" src="https://github.com/user-attachments/assets/0f94c211-e7cd-43cf-9201-d2384cdd1776" />


### 2. Insert and Select: BOOKS

**Input:**

```sql
INSERT INTO BOOKS VALUES(101, 'Harry Potter', 'JK Rowling', 3);
SELECT * FROM BOOKS;
```



**Output:**
Insert and Select Books


---
<img width="659" height="199" alt="image" src="https://github.com/user-attachments/assets/bef053d9-ccbb-4d65-a1de-12a2f941a217" />

### 3. Table Creation: LIBRARY_VISITORS

**Input:**

```sql
CREATE TABLE LIBRARY_VISITORS(
    USER_ID INT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    AGE INT CHECK(AGE >= 17) NOT NULL,
    EMAIL VARCHAR(20) NOT NULL UNIQUE
);
```



**Output:**
Visitors Table

---
<img width="441" height="205" alt="image" src="https://github.com/user-attachments/assets/75c7879d-2f74-497d-b22e-4463a46f3f2d" />

### 4. Insert and Select: LIBRARY_VISITORS

**Input:**

```sql
INSERT INTO LIBRARY_VISITORS(USER_ID, NAME, AGE, EMAIL)
VALUES(101, 'Vansh Sharma', 18, 'vansh12@gmail.com');
SELECT * FROM LIBRARY_VISITORS;
```



**Output:**
Visitors Table

---
<img width="622" height="188" alt="image" src="https://github.com/user-attachments/assets/cf6836bd-09f6-46c8-99ee-505d52dd4aae" />

### 5. Table Creation: BOOK_ISSUE

**Input:**

```sql
CREATE TABLE BOOK_ISSUE(
    BOOK_ISSUE_ID INT PRIMARY KEY,
    USER_ID INT NOT NULL,
    BOOK_ID INT NOT NULL,
    FOREIGN KEY(USER_ID) REFERENCES LIBRARY_VISITORS(USER_ID),
    FOREIGN KEY(BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
```


**Output:**
Book Issue Table



---
<img width="526" height="194" alt="image" src="https://github.com/user-attachments/assets/bfdb74ea-f533-4239-a421-e854511215c3" />

### 6. Insert and Select: BOOK_ISSUE

**Input:**

```sql
INSERT INTO BOOK_ISSUE VALUES(1001, 101, 101, '2026-01-09');
SELECT * FROM BOOK_ISSUE;
```



**Output:**
Book Issue Table

---
<img width="465" height="223" alt="image" src="https://github.com/user-attachments/assets/a8c7103c-7844-4d67-ae20-a0b36db93145" />

### 7. Creating Roles

**Input:**

```sql
CREATE ROLE LIBRARIAN WITH LOGIN PASSWORD 'mehak1234';
GRANT SELECT, INSERT, DELETE, UPDATE ON BOOKS TO LIBRARIAN;
REVOKE SELECT, INSERT, DELETE, UPDATE ON BOOKS, BOOK_ISSUE, LIBRARY_VISITORS FROM LIBRARIAN;
```


**Output:**
DCL Operations

---
<img width="540" height="175" alt="image" src="https://github.com/user-attachments/assets/6a41f18c-6763-426f-8aa8-d81f4723e4f4" />
<img width="698" height="214" alt="image" src="https://github.com/user-attachments/assets/0902e4e8-2d77-490c-8b77-9d2dd163bc66" />


## 📚 Learning Outcomes

Gained hands-on experience to work with PostgreSQL and pgAdmin
Writing queries to create and delete tables
Learnt to alter tables, view tables, create roles, granting and revoking access to the roles
Primary and foreign keys implementations and roles
