CREATE TABLE Students (
    id NUMERIC(10,0) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    marks NUMERIC(10,0)
);
INSERT INTO Students VALUES (1, 'Aman', 'Mohali', 85);
INSERT INTO Students VALUES (2, 'Rohit', 'Mohali', 78);
INSERT INTO Students VALUES (3, 'Neha', 'Mohali', 92);
INSERT INTO Students VALUES (4, 'Simran', 'Amritsar', 88);
INSERT INTO Students VALUES (5, 'Karan', 'Amritsar', 75);
INSERT INTO Students VALUES (6, 'Diwansh', 'Chandigarh', 90);



SELECT city, COUNT(*) AS COUNT_STUDENTS
FROM Students
GROUP BY city;


SELECT city, COUNT(id) AS COUNT_STUDENTS
FROM Students
GROUP BY city
ORDER BY COUNT_STUDENTS ASC;


SELECT city, COUNT(*) AS COUNT_STUDENTS
FROM Students
GROUP BY city
HAVING COUNT(*) >= 3;


SELECT city, AVG(marks)::NUMERIC(10,2) AS AVERAGE_MARKS
FROM Students
GROUP BY city;




