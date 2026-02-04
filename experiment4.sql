-- =========================================
-- PROGRAM 1 : IF–ELSE (Weekday or Weekend)
-- =========================================

DECLARE
    day_no NUMBER := 6;
BEGIN
    IF day_no = 6 OR day_no = 7 THEN
        DBMS_OUTPUT.PUT_LINE('It is Weekend.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('It is a Weekday.');
    END IF;
END;
/

-- =========================================
-- PROGRAM 2 : IF–ELSIF–ELSE (Positive/Negative/Zero)
-- =========================================

DECLARE
    n NUMBER := 0;
BEGIN
    IF n > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || n || ' is Positive.');
    ELSIF n < 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || n || ' is Negative.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is Zero.');
    END IF;
END;
/

-- =========================================
-- PROGRAM 3 : ELSIF Ladder (Age Category)
-- =========================================

DECLARE
    age NUMBER := 22;
BEGIN
    IF age >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Category: Senior Citizen');
    ELSIF age >= 20 THEN
        DBMS_OUTPUT.PUT_LINE('Category: Adult');
    ELSIF age >= 13 THEN
        DBMS_OUTPUT.PUT_LINE('Category: Teenager');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Category: Child');
    END IF;
END;
/

-- =========================================
-- PROGRAM 4 : CASE Statement (Season by Month)
-- =========================================

DECLARE
    m NUMBER := 12;
    season VARCHAR2(20);
BEGIN
    season := CASE
                WHEN m IN (12, 1, 2) THEN 'Winter'
                WHEN m IN (3, 4, 5) THEN 'Summer'
                WHEN m IN (6, 7, 8) THEN 'Monsoon'
                WHEN m IN (9, 10, 11) THEN 'Autumn'
                ELSE 'Invalid Month'
              END;

    DBMS_OUTPUT.PUT_LINE('Season: ' || season);
END;
/
