# Experiment 9: PL/SQL Packages

## Aim
To create and implement PL/SQL packages by developing a package specification and package body containing procedures and shared cursors, in order to achieve modular, reusable, and efficient database programming.

---

## Objectives
- Design and implement a PL/SQL package with procedures and shared cursors.
- Enable structured and modular database programming.

---

## Practical / Experiment Steps
- Designed a two-part package: specification and body.
- Defined a shared cursor for reusable data access.
- Developed procedures for full and filtered data retrieval.
- Implemented encapsulation to hide internal logic.
- Tested functionality using anonymous blocks.

---

## Procedure

### 1. Create Table
```sql
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);
```
<img width="1245" height="547" alt="image" src="https://github.com/user-attachments/assets/70fe6054-3299-4376-aa45-627489ff0926" />

### 2. Insert Data
```sql
INSERT INTO employees VALUES (1, 'Amit', 30000);
INSERT INTO employees VALUES (2, 'Riya', 40000);
INSERT INTO employees VALUES (3, 'John', 50000);

COMMIT;
```
<img width="1226" height="1196" alt="image" src="https://github.com/user-attachments/assets/4325f1b9-5e10-4f45-ae12-b47c085d3d1b" />

### 3. Create Package Specification
```sql
CREATE OR REPLACE PACKAGE emp_package AS
    PROCEDURE show_employees;
    PROCEDURE get_employee(p_id NUMBER);
END emp_package;
/
```
<img width="1236" height="473" alt="image" src="https://github.com/user-attachments/assets/99ef8dc5-87c8-4a4d-9858-b4ff2b4c05fa" />

### 4. Create Package Body
```sql
CREATE OR REPLACE PACKAGE BODY emp_package AS

    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary FROM employees;

    PROCEDURE show_employees IS
    BEGIN
        FOR rec IN emp_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.emp_id ||
                                 ' Name: ' || rec.emp_name ||
                                 ' Salary: ' || rec.salary);
        END LOOP;
    END;

    PROCEDURE get_employee(p_id NUMBER) IS
    BEGIN
        FOR rec IN emp_cursor LOOP
            IF rec.emp_id = p_id THEN
                DBMS_OUTPUT.PUT_LINE('Employee Found -> ID: ' || rec.emp_id ||
                                     ' Name: ' || rec.emp_name ||
                                     ' Salary: ' || rec.salary);
            END IF;
        END LOOP;
    END;

END emp_package;
/
```
<img width="1242" height="471" alt="image" src="https://github.com/user-attachments/assets/01392dd2-8c73-4234-9627-9a618da59182" />

### 5. Execute Procedures
```sql
SET SERVEROUTPUT ON;

BEGIN
    emp_package.show_employees;
END;
/
```
<img width="1226" height="481" alt="image" src="https://github.com/user-attachments/assets/0549e9c1-b3a4-4d5a-8fbc-f684996563d8" />

```sql
BEGIN
    emp_package.get_employee(2);
END;
/
```
<img width="1243" height="448" alt="image" src="https://github.com/user-attachments/assets/a3ad02ca-cdde-49b5-93ec-261982fc3096" />

---

## Learning Outcomes
- Clear understanding of package specification vs body.
- Improved modular and organized database programming.
- Efficient use of shared cursors.
- Better encapsulation and abstraction in PL/SQL.
