# Experiment 7 -- Materialized Views and Performance Analysis

## Aim

To design and implement a materialized view and to compare and analyse
execution time and performance differences between simple views, complex
views, and materialized views.

------------------------------------------------------------------------

## Objectives

To create simple views, complex views, and materialized views, and to
evaluate their performance by comparing query execution time.

------------------------------------------------------------------------

## Practical/Experiment Steps

Relational Schema Construction: Developed the depts and emps tables with
primary-foreign key relationship.\
Simple View Implementation: Created V_SIMPLE to filter employees based
on salary.\
Complex Logic Aggregation: Created V_COMPLEX using JOIN, SUM(), and
AVG().\
Materialized Storage Configuration: Created V_MATERIALIZED to store
computed results.\
Performance Benchmark Analysis: Used EXPLAIN ANALYZE to compare
performance.\
Data Refresh Synchronisation: Used REFRESH MATERIALIZED VIEW to update
data.

------------------------------------------------------------------------

## Procedure

1.  Open pgAdmin or SQL tool.\
2.  Create tables and insert data.\
3.  Create simple view.\
4.  Create complex view using JOIN and GROUP BY.\
5.  Create materialized view.\
6.  Execute SELECT queries.\
7.  Run EXPLAIN ANALYZE.\
8.  Refresh materialized view.

------------------------------------------------------------------------

## I/O Analysis

### 1. Input

``` sql
CREATE TABLE depts(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(20)
);

CREATE TABLE emps(
emp_id INT PRIMARY KEY,
name VARCHAR(20),
dept_id INT REFERENCES depts(dept_id),
salary NUMERIC
);
```

### Output
<img width="652" height="352" alt="Screenshot 2026-03-25 230252" src="https://github.com/user-attachments/assets/03de4205-942b-44d9-8da0-432a8906af70" />


------------------------------------------------------------------------

### 2. Input

``` sql
INSERT INTO depts VALUES(1, 'IT'), (2, 'HR'), (3, 'SALES');

INSERT INTO emps VALUES(101, 'Mary', 1, 95000);
INSERT INTO emps VALUES(102, 'Amit', 1, 85000);
INSERT INTO emps VALUES(103, 'Sarah', 2, 70000);
INSERT INTO emps VALUES(104, 'John', 2, 65000);
INSERT INTO emps VALUES(105, 'Jack', 3, 55000);
INSERT INTO emps VALUES(106, 'Rohan', 1, 88000);
```

### Output
<img width="776" height="806" alt="Screenshot 2026-03-25 230401" src="https://github.com/user-attachments/assets/617bf987-f412-4fd8-ad78-fdc899898eb0" />

------------------------------------------------------------------------

### 3. Input

``` sql
CREATE VIEW V_SIMPLE AS
SELECT name, salary FROM emps WHERE salary>75000;

SELECT * FROM V_SIMPLE;
```

### Output
<img width="806" height="298" alt="Screenshot 2026-03-25 230541" src="https://github.com/user-attachments/assets/f5901a77-e009-4414-8681-78a3f4ea14f3" />


------------------------------------------------------------------------

### 4. Input

``` sql
CREATE VIEW V_COMPLEX AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emps e JOIN depts d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_COMPLEX;
```

### Output
<img width="1014" height="278" alt="Screenshot 2026-03-25 230653" src="https://github.com/user-attachments/assets/b589589f-df6d-45bd-ac47-b130f0cc19b1" />

------------------------------------------------------------------------

### 5. Input

``` sql
CREATE MATERIALIZED VIEW V_MATERIALIZED AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emps e JOIN depts d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_MATERIALIZED;
```

### Output
<img width="1037" height="266" alt="Screenshot 2026-03-25 230820" src="https://github.com/user-attachments/assets/44f0eb57-5b40-4894-96af-1132e49cb53a" />

------------------------------------------------------------------------

### 6. Input

``` sql
REFRESH MATERIALIZED VIEW V_MATERIALIZED;
```

### Output
<img width="637" height="201" alt="Screenshot 2026-03-25 231159" src="https://github.com/user-attachments/assets/e3dbd604-0eb6-4776-8e1e-5d0a7eea25cf" />

------------------------------------------------------------------------

### 7. Input

``` sql
EXPLAIN ANALYZE SELECT * FROM V_SIMPLE;
```

### Output
<img width="981" height="319" alt="Screenshot 2026-03-25 231338" src="https://github.com/user-attachments/assets/20fbf7bb-f3cc-4ed0-91bb-3705c005d0b3" />

------------------------------------------------------------------------

### 8. Input

``` sql
EXPLAIN ANALYZE SELECT * FROM V_COMPLEX;
```

### Output
<img width="1150" height="729" alt="Screenshot 2026-03-25 231407" src="https://github.com/user-attachments/assets/29ee9e7f-b88b-482c-919b-623ab6c8b55a" />

------------------------------------------------------------------------

### 9. Input

``` sql
EXPLAIN ANALYZE SELECT * FROM V_MATERIALIZED;
```

### Output
<img width="1024" height="222" alt="Screenshot 2026-03-25 231433" src="https://github.com/user-attachments/assets/02f87ca7-a324-4455-98b8-c130ed5d570f" />

------------------------------------------------------------------------

## Learning Outcomes

-   Understood simple, complex, and materialized views.\
-   Learned performance comparison using EXPLAIN ANALYZE.\
-   Understood refresh mechanism of materialized views.\
-   Learned how materialized views improve query performance.
