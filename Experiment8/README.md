# Experiment 8: Stored Procedure using PL/pgSQL

## Aim
To understand the design and implementation of stored procedures in PL/pgSQL, focusing on the use of parameter modes (IN, OUT, INOUT) to encapsulate business logic.

---

## Objectives
- Create and execute a parameterized stored procedure  
- Use IN, OUT, and INOUT parameters  
- Demonstrate procedure execution using an anonymous block  
- Display results using RAISE NOTICE  

---

## Practical Steps

- Created `employees` table with required fields  
- Inserted sample employee data  
- Developed procedure `get_employee_count_by_gender`  
- Used parameter modes (IN, OUT, INOUT)  
- Implemented `SELECT INTO` logic  
- Executed procedure using DO block  

---

## Procedure

1. Connect to PostgreSQL  
2. Create employees table  
3. Insert records  
4. Define stored procedure  
5. Execute procedure using anonymous block  
6. Display result using RAISE NOTICE  

---

## I/O Analysis

### 1. Table Creation

```sql
CREATE TABLE EMPLOYEES(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(20),
gender VARCHAR(20),
salary NUMERIC(10, 2)
);
```

**Output:**  
<img width="606" height="254" alt="Screenshot 2026-03-28 104007" src="https://github.com/user-attachments/assets/9e830557-5215-408d-9f60-071f0c402898" />

---

### 2. Insert Data

```sql
INSERT INTO employees (emp_id, emp_name, gender, salary) VALUES
(101, 'Amit', 'Male', 30000),
(102, 'Sarah', 'Female', 55000),
(103, 'Riya', 'Female', 45000),
(104, 'Arjun', 'Male', 59000),
(105, 'Anjali', 'Female', 66000);
```

**Output:**  
<img width="610" height="221" alt="Screenshot 2026-03-28 104108" src="https://github.com/user-attachments/assets/eaeb14de-e373-4abe-b14a-0605567f0b59" />

---

### 3. Procedure

```sql
CREATE OR REPLACE PROCEDURE get_employee_count_by_gender (
IN IN_GENDER VARCHAR(20),
OUT OUT_COUNT INT,
INOUT STATUS VARCHAR(20)
)
AS
$$
BEGIN
SELECT COUNT(*) INTO OUT_COUNT FROM employees WHERE gender = IN_GENDER;
STATUS := 'SUCCESS';
END;
$$ LANGUAGE PLPGSQL;
```

**Output:**  
<img width="641" height="234" alt="Screenshot 2026-03-28 104224" src="https://github.com/user-attachments/assets/c07b0554-e5c3-4b26-b1e0-506100e165e1" />

---

### 4. Procedure Call

```sql
DO
$$
DECLARE
GEN VARCHAR(20) := 'Female';
COUNT_OF_EMPLOYEES INT;
STATUS VARCHAR(20) := 'PENDING';

BEGIN
CALL get_employee_count_by_gender(GEN, COUNT_OF_EMPLOYEES, STATUS);

RAISE NOTICE 'COUNT OF % EMPLOYEES IS % AND STATUS IS %',
GEN, COUNT_OF_EMPLOYEES, STATUS;
END;
$$;
```

**Output:**  
<img width="966" height="244" alt="Screenshot 2026-03-28 104330" src="https://github.com/user-attachments/assets/5988545c-1e09-47ff-9409-c8acf8327935" />

---

## Learning Outcomes

- Understood stored procedure creation in PostgreSQL  
- Learned usage of IN, OUT, INOUT parameters  
- Used SELECT INTO for variable assignment  
- Executed procedures via anonymous blocks  
- Displayed results using RAISE NOTICE  

---
