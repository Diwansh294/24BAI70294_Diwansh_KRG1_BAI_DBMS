# Experiment 4

## Aim

To design and implement PL/SQL programs utilising conditional control
statements such as IF--ELSE, IF--ELSIF--ELSE, ELSIF ladder, and CASE
constructs in order to control the flow of execution based on logical
conditions and to analyse decision-making capabilities in PL/SQL blocks.

## Objectives

-   Implement control structures in PL/SQL (IF-ELSE, IF-ELSIF-ELSE,
    ELSIF LADDER, CASE STATEMENTS).
-   Understand decision-making flow in PL/SQL programs.

## Practical / Experiment Steps

-   Designed multiple PL/SQL blocks to explore conditional logic.
-   Utilised IF--ELSE and ELSIF ladders for data categorisation.
-   Implemented CASE statements for mapping discrete values.
-   Integrated dynamic output messages.
-   Tested multiple inputs to validate execution flow.

## Procedure

1.  Enabled server output for viewing results.
2.  Wrote IF--ELSE block for weekday/weekend check.
3.  Developed IF--ELSIF--ELSE block for number classification.
4.  Created ELSIF ladder for age category classification.
5.  Implemented CASE statement for season mapping.
6.  Executed each PL/SQL block and verified outputs.

## I/O Analysis

### 1. IF--ELSE (Weekday or Weekend)

``` sql
DECLARE
    day_no NUMBER := 6;
BEGIN
    IF day_no = 6 OR day_no = 7 THEN
        DBMS_OUTPUT.PUT_LINE('It is Weekend.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('It is a Weekday.');
    END IF;
END;
```
## OUTPUT
<img width="692" height="414" alt="Screenshot 2026-02-04 221939" src="https://github.com/user-attachments/assets/f340de8f-9757-4861-837c-6404f2fe1420" />


### 2. IF--ELSIF--ELSE (Positive/Negative/Zero)

``` sql
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
```
## OUTPUT
<img width="709" height="287" alt="Screenshot 2026-02-04 222130" src="https://github.com/user-attachments/assets/017b6c8c-90c2-4aaf-aa86-7c8cc8871f53" />


### 3. ELSIF Ladder (Age Category)

``` sql
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
```
## OUTPUT
<img width="747" height="423" alt="Screenshot 2026-02-04 222321" src="https://github.com/user-attachments/assets/697351ea-d4ce-4929-b2b6-f37c77bec958" />


### 4. CASE Statement (Season by Month)

``` sql
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
```
## OUTPUT
<img width="649" height="418" alt="Screenshot 2026-02-04 222439" src="https://github.com/user-attachments/assets/86ccfe69-3366-4b56-88c1-305ac5b3d5b3" />


## Learning Outcomes

-   Learned to use IF--ELSE, IF--ELSIF--ELSE, ELSIF ladder, and CASE
    statements.
-   Understood how conditional logic controls execution flow.
-   Developed structured PL/SQL programming skills.

  ## NAME-DIWANSH
  ## CLASS-24AIT_KRG_G1
  ## UID-24BAI70294
