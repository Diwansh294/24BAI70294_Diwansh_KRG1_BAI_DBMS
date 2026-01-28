# 🧮 SQL Aggregation Queries: GROUP BY, ORDER BY, HAVING

![SQL Badge](https://img.shields.io/badge/SQL-Structured%20Query%20Language-blue)
![Database Badge](https://img.shields.io/badge/Database-Students%20DB-orange)
![Experiment Badge](https://img.shields.io/badge/Experiment-Aggregation-green)

---

## 🧪 Aim
To understand and implement SQL `SELECT` queries using `GROUP BY`, `ORDER BY`, and `HAVING` clauses along with aggregation functions to organize, summarize, and analyze student data.

---

## 🎯 Objectives
- Group records using the `GROUP BY` clause  
- Count records using `COUNT()`  
- Calculate averages using `AVG()`  
- Sort grouped results using `ORDER BY`  
- Filter grouped data using `HAVING`  
- Generate summary reports from student records

---

## 🗂 Database Table Used

### Students Table Structure
```sql
CREATE TABLE Students (
    id NUMERIC(10,0) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    marks NUMERIC(10,0)
);
```
Sample Data Inserted
```sql
INSERT INTO Students VALUES (1, 'Aman', 'Mohali', 85);
INSERT INTO Students VALUES (2, 'Rohit', 'Mohali', 78);
INSERT INTO Students VALUES (3, 'Neha', 'Mohali', 92);
INSERT INTO Students VALUES (4, 'Simran', 'Amritsar', 88);
INSERT INTO Students VALUES (5, 'Karan', 'Amritsar', 75);
INSERT INTO Students VALUES (6, 'Diwansh', 'Chandigarh', 90);

```
📊 SQL Queries Performed
```sql
1. Count Students City-wise
SELECT city, COUNT(*) AS COUNT_STUDENTS
FROM Students
GROUP BY city;
```

Count Students City-wise with Sorting
```sql
SELECT city, COUNT(id) AS COUNT_STUDENTS
FROM Students
GROUP BY city
ORDER BY COUNT_STUDENTS ASC;
```

Cities Having 3 or More Students
```sql
SELECT city, COUNT(*) AS COUNT_STUDENTS
FROM Students
GROUP BY city
HAVING COUNT(*) >= 3;
```

Average Marks City-wise
```sql
SELECT city, AVG(marks)::NUMERIC(10,2) AS AVERAGE_MARKS
FROM Students
GROUP BY city;
```

## 🔍 Input-Output Analysis

### Input
The `Students` table contains the following records:

| id | name      | city        | marks |
|----|-----------|------------|-------|
| 1  | Aman      | Mohali     | 85    |
| 2  | Rohit     | Mohali     | 78    |
| 3  | Neha      | Mohali     | 92    |
| 4  | Simran    | Amritsar   | 88    |
| 5  | Karan     | Amritsar   | 75    |
| 6  | Diwansh   | Chandigarh | 90    |

These records include **student IDs, names, their city, and marks obtained**.

---

### Output Analysis

<img width="813" height="467" alt="sc1-exp2" src="https://github.com/user-attachments/assets/0315d6dc-3e7a-4117-9a58-7065cc88a84b" />
<img width="816" height="472" alt="sc2-exp2" src="https://github.com/user-attachments/assets/7e3f0dd5-961d-47df-a756-381ddb540ae4" />
<img width="766" height="480" alt="sc3-exp2" src="https://github.com/user-attachments/assets/dc41e0a8-a00f-4b03-a365-0e7d701027e5" />
<img width="733" height="370" alt="sc4-exp2" src="https://github.com/user-attachments/assets/4e3ce206-9b02-4815-a906-2375cbcac2fc" />

📈 Learning Outcomes

After completing this experiment, you will be able to:

Group data using GROUP BY

Perform aggregation using COUNT() and AVG()

Sort results using ORDER BY

Filter grouped data using HAVING

Generate analytical reports from database records

