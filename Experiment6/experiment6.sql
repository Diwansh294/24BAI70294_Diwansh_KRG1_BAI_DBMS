CREATE TABLE Students(
    student_id NUMBER PRIMARY KEY,
    name VARCHAR(20),
    course VARCHAR(20),
    marks NUMBER
);

INSERT INTO Students VALUES (1, 'Rahul', 'BCA', 70);
INSERT INTO Students VALUES (2, 'Anita', 'BBA', 65);
INSERT INTO Students VALUES (3, 'Karan', 'BCA', 80);
INSERT INTO Students VALUES (4, 'Neha', 'BBA', 75);
COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_target_id NUMBER := 1;

BEGIN 
    UPDATE Students 
    SET marks = marks * 1.05
    WHERE student_id = v_target_id;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('SQL%FOUND is TRUE');
        DBMS_OUTPUT.PUT_LINE('Rows updated: ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No row updated');
    END IF;

END;

DECLARE
    CURSOR c_bca IS 
        SELECT name, course FROM Students WHERE course = 'BCA';

    v_name Students.name%TYPE;
    v_course Students.course%TYPE;

BEGIN

    OPEN c_bca;

    IF c_bca%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is OPEN');
    END IF;

    LOOP
        FETCH c_bca INTO v_name, v_course;

        IF c_bca%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('No more records');
            EXIT;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Student #' || c_bca%ROWCOUNT || ': ' 
        || v_name || ' | ' || v_course);

    END LOOP;

    CLOSE c_bca;

    IF NOT c_bca%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor CLOSED successfully');
    END IF;

END;
