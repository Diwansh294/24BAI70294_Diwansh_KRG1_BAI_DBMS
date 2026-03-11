# Experiment 5 – SQL Conditional Logic Using Modulus Operator

## Aim
To understand and apply conditional logic in SQL by using the modulus operator (%) to analyze employee salary values and classify them as odd or even.

---

## Software Requirements

### Database Management System
- PostgreSQL
- Oracle Database Express Edition (Oracle XE)

### Database Client Tool
- pgAdmin
- Oracle SQL Developer
- Visual Studio Code (SQL Extension)

---

## Objectives
- To create an employees table in the database.
- To insert employee records with salary values.
- To use the modulus operator (%) to check whether salaries are odd or even.
- To implement a CASE statement for conditional classification.

---

## Practical / Experiment Steps

### Schema Architecture
Created a table named **employees** with three attributes:
- `emp_id` – Unique employee ID (Primary Key)
- `emp_name` – Employee name
- `emp_sal` – Employee salary

### Data Insertion
Inserted multiple employee records with different salary values to test odd and even conditions.

### Mathematical Operation
Used the modulus operator `%` to divide salary values by 2 and check the remainder.

### Conditional Classification
Used a **CASE statement** to evaluate the result of the modulus operation.

### Dynamic Column Generation
Generated a temporary column named **salary_type** that displays whether the salary is even or odd.

---

## Procedure
1. Open **VS Code** or any SQL client tool.
2. Create the employees table using the `CREATE TABLE` statement.
3. Insert records using `INSERT INTO`.
4. Write a SELECT query to retrieve employee details.
5. Apply the modulus operator `%` to the salary column.
6. Use a CASE statement to classify the salary.
7. Execute the query.
8. Observe the output displaying the salary type.

---

## I/O Analysis

### Input
```sql
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    emp_sal INT
);

INSERT INTO employees VALUES(1, 'Aman', 11001);
INSERT INTO employees VALUES(2, 'Riya', 15000);
INSERT INTO employees VALUES(3, 'Karan', 12555);
INSERT INTO employees VALUES(4, 'Neha', 20000);
INSERT INTO employees VALUES(5, 'Arjun', 17531);

SELECT *,
CASE
WHEN emp_sal % 2 = 0 THEN 'Even Salary'
ELSE 'Odd Salary'
END AS salary_type
FROM employees;
```
### Output
<img width="1368" height="1207" alt="image" src="https://github.com/user-attachments/assets/c341c4c4-cec3-4c78-8400-e9e8849e196a" />


### Learning Outcomes

Learned how to create tables and insert data in SQL.
Understood how to use the modulus operator (%).
Implemented CASE statements for conditional logic.
Generated a derived column to categorize employee salary values.


