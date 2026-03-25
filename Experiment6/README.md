# Experiment 6 -- PL/SQL Cursor Handling for Row-by-Row Processing

## Aim

To understand the concept and working of cursors in PL/SQL for
row-by-row data processing, and to analyse how implicit cursors,
explicit cursors, and cursor attributes are used to implement business
logic on multiple rows in a database table.

------------------------------------------------------------------------

## Objectives

To implement and analyse the use of implicit cursors, explicit cursors,
and cursor attributes for processing multiple rows from a database table
and applying business logic effectively.

------------------------------------------------------------------------

## Practical/Experiment Steps

### Schema Provisioning

Created the Students table with specific data types for student ID,
name, course, and marks to simulate an academic database environment.

### Implicit Cursor Analysis

Implemented an anonymous PL/SQL block to perform a single-row UPDATE
operation, utilizing the internal SQL cursor to monitor DML success.

### Explicit Cursor Design

Defined a named cursor (c_bca) to fetch specific records based on the
'BCA' course, enabling structured row-by-row processing.

### Attribute Integration

Incorporated cursor attributes such as %FOUND, %NOTFOUND, %ROWCOUNT, and
%ISOPEN to programmatically control the execution flow.

### Business Logic Application

Developed logic to apply marks increment and format record-specific
output, demonstrating how rules are applied to individual data rows.

------------------------------------------------------------------------

## Procedure

1.  Logged into the database environment and ensured SERVEROUTPUT was
    enabled.
2.  Executed the CREATE TABLE and INSERT scripts.
3.  Used implicit cursor to update marks.
4.  Declared explicit cursor for BCA students.
5.  Opened cursor and fetched records using LOOP.
6.  Used cursor attributes for control.
7.  Displayed output.
8.  Closed the cursor.

------------------------------------------------------------------------

## I/O Analysis

### 1. Input

``` sql
CREATE TABLE Students(
    student_id NUMBER PRIMARY KEY,
    name VARCHAR(20),
    course VARCHAR(20),
    marks NUMBER
);
```

### Output

<img width="577" height="363" alt="Screenshot 2026-03-25 221629" src="https://github.com/user-attachments/assets/fc844204-0b7f-4471-aa7d-2cfe2dcae6a8" />


------------------------------------------------------------------------

### 2. Input

``` sql
INSERT INTO Students VALUES (1, 'Rahul', 'BCA', 70);
INSERT INTO Students VALUES (2, 'Anita', 'BBA', 65);
INSERT INTO Students VALUES (3, 'Karan', 'BCA', 80);
INSERT INTO Students VALUES (4, 'Neha', 'BBA', 75);
COMMIT;
```

### Output

<img width="825" height="785" alt="Screenshot 2026-03-25 221827" src="https://github.com/user-attachments/assets/77486c16-2f38-435e-8647-180854a04efb" />


------------------------------------------------------------------------

### 3. Input

``` sql
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
```

### Output

<img width="611" height="455" alt="Screenshot 2026-03-25 222034" src="https://github.com/user-attachments/assets/322e5086-70e9-4fd4-983e-2d8eac50c440" />


------------------------------------------------------------------------

### 4. Input

``` sql
DECLARE
    CURSOR c_bca IS SELECT name, course FROM Students WHERE course = 'BCA';
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

        DBMS_OUTPUT.PUT_LINE('Student #' || c_bca%ROWCOUNT|| ': ' 
        || v_name || ' | ' || v_course);

    END LOOP;

    CLOSE c_bca;

    IF NOT c_bca%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor CLOSED successfully');
    END IF;
END;
```

### Output

<img width="910" height="545" alt="Screenshot 2026-03-25 222242" src="https://github.com/user-attachments/assets/96d811f7-ac61-4b86-8cc9-505c1bf6ad08" />


------------------------------------------------------------------------

## Learning Outcomes

Gained proficiency in differentiating between implicit cursors for DML
and explicit cursors for multi-row queries.\
Learnt using %FOUND, %NOTFOUND, and %ROWCOUNT to manage loop iterations
and verify operation success.\
Understanding the importance of the OPEN, FETCH, and CLOSE lifecycle to
ensure efficient memory management.\
Ability to develop PL/SQL programs that apply business logic to
individual records within a dataset.
