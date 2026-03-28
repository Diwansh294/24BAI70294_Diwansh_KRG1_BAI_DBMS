CREATE TABLE STAFF (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(20),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);
INSERT INTO STAFF VALUES
(1, 'Rahul', 'Male', 40000),
(2, 'Sneha', 'Female', 50000),
(3, 'Karan', 'Male', 45000),
(4, 'Pooja', 'Female', 60000),
(5, 'Neha', 'Female', 55000);

CREATE OR REPLACE PROCEDURE get_avg_salary_by_gender(
    IN in_gender VARCHAR(10),
    OUT avg_salary NUMERIC,
    INOUT status VARCHAR(20)
)
AS
$$
BEGIN
    SELECT AVG(salary) INTO avg_salary
    FROM staff
    WHERE gender = in_gender;

    status := 'SUCCESS';
END;
$$ LANGUAGE plpgsql;

DO
$$
DECLARE
    gen VARCHAR(10) := 'Female';
    avg_sal NUMERIC;
    status VARCHAR(20) := 'PENDING';

BEGIN
    CALL get_avg_salary_by_gender(gen, avg_sal, status);

    RAISE NOTICE 'Average Salary of % employees is % and Status is %',
    gen, avg_sal, status;
END;
$$;
