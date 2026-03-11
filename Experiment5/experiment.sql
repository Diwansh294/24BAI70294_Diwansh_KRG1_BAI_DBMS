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
