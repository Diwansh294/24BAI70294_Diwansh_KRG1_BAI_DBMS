CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

CREATE SEQUENCE student_seq
START WITH 100
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER student_trigger
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    IF :NEW.student_id IS NULL THEN
        SELECT student_seq.NEXTVAL INTO :NEW.student_id FROM dual;
    END IF;
END;
/

INSERT INTO student (name, marks) VALUES ('Riya', 85);
INSERT INTO student (name, marks) VALUES ('Karan', 78);
INSERT INTO student (name, marks) VALUES ('Anjali', 92);
INSERT INTO student (name, marks) VALUES ('Vikram', 88);

SELECT * FROM student;
