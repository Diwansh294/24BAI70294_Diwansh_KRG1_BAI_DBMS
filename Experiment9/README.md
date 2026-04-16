# Experiment 9: PostgreSQL Triggers

## Aim
To understand and implement database triggers in PostgreSQL to automate data validation and computational logic, ensuring data integrity by enforcing business rules during DML operations.

---

## Objectives
- Create a trigger function that performs automatic calculations on row-level data.
- Define a BEFORE INSERT trigger that intercepts data entry for validation.
- Implement custom exception handling using the RAISE EXCEPTION command.
- Verify trigger behaviour by testing both valid and invalid data scenarios within a transaction.

---

## Practical / Experiment Steps
- Established the `employee` table with base and calculated columns.
- Developed a PL/pgSQL trigger function to calculate payable amount dynamically.
- Embedded validation logic to restrict entries exceeding a defined limit.
- Bound the function to a BEFORE INSERT trigger.
- Performed testing using anonymous DO blocks.

---

## Procedure

### 1. Create Table
```sql
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    working_hours INT,
    perhour_salary NUMERIC,
    total_payable_amount NUMERIC
);
```
<img width="1159" height="360" alt="image" src="https://github.com/user-attachments/assets/fde9d0b7-9aef-4327-977c-e30c9774580f" />


### 2. Create Trigger Function
```sql
CREATE OR REPLACE FUNCTION CALCULATE_AMOUNT()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.total_payable_amount = NEW.perhour_salary * NEW.working_hours;

    IF NEW.total_payable_amount > 25000 THEN
        RAISE EXCEPTION 'AMOUNT IS GREATER THAN 25000';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;
```
<img width="1234" height="382" alt="image" src="https://github.com/user-attachments/assets/5ac15f3e-8fbf-4a13-86df-2c12ea3074ba" />


### 3. Create Trigger
```sql
CREATE OR REPLACE TRIGGER CAL_PAYABLE_AMOUNT
BEFORE INSERT
ON EMPLOYEE
FOR EACH ROW
EXECUTE FUNCTION CALCULATE_AMOUNT();
```
<img width="1065" height="442" alt="image" src="https://github.com/user-attachments/assets/f272def9-6513-4ca9-8d25-a513e0dec105" />


### 4. Valid Insert Test
```sql
DO
$$
BEGIN
    INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, WORKING_HOURS, PERHOUR_SALARY)
    VALUES (1, 'AKASH', 10, 250);

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%', SQLERRM;
END;
$$;

SELECT * FROM EMPLOYEE;
```
<img width="905" height="380" alt="image" src="https://github.com/user-attachments/assets/03fdea22-2deb-4bea-a145-0056c69e0766" />
<img width="1706" height="363" alt="image" src="https://github.com/user-attachments/assets/1ab717db-0906-4831-b43f-2182db66f932" />


### 5. Invalid Insert Test
```sql
DO
$$
BEGIN
    INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, WORKING_HOURS, PERHOUR_SALARY)
    VALUES (1, 'AKASH', 10, 250000);

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%', SQLERRM;
END;
$$;

SELECT * FROM EMPLOYEE;
```
<img width="977" height="402" alt="image" src="https://github.com/user-attachments/assets/fc0058ca-4554-4a50-b0eb-aa29e631e43d" />
<img width="1647" height="407" alt="image" src="https://github.com/user-attachments/assets/21ae855d-ce2a-4763-ab4b-a85a4726c9d5" />


---

## Learning Outcomes
- Understanding of trigger lifecycle and execution timing.
- Ability to automate calculations at the database level.
- Implementation of advanced validation rules using triggers.
- Use of exception handling to enforce business constraints.
