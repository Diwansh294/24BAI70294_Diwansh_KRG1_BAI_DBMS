
# 🧪 Experiment 3 – PL/SQL Block Structure

## 📌 Aim
To understand the basic structure of a PL/SQL program by creating and executing a simple PL/SQL block that includes declaration and execution sections, performs calculations, and displays output using built-in procedures.

---

## 🎯 Objectives
- To create a simple PL/SQL program demonstrating the Declaration Section and Execution Section.  
- To perform arithmetic operations inside a PL/SQL block.  
- To use conditional statements (IF–ELSE) for decision-making.

---

## ⚙ Software Requirement
**Oracle FreeSQL**

---

## 🧩 Practical / Experiment Steps
1. Designed a PL/SQL block with DECLARE and BEGIN–END sections.  
2. Declared variables for Worker ID, Worker Name, Basic Pay, and HRA Amount.  
3. Assigned static values to simulate employee data.  
4. Performed an arithmetic calculation to compute HRA = 40% of Basic Pay.  
5. Used an IF–ELSE structure to determine tax applicability.  
6. Displayed all details using DBMS_OUTPUT.PUT_LINE.

---

## 📝 Procedure
1. Connected to the Oracle FreeSQL environment.  
2. Declared variables in the DECLARE section.  
3. Assigned values to variables (Worker Name = ANJALI, Basic Pay = 55,000).  
4. Started the BEGIN block to execute logic.  
5. Calculated HRA using arithmetic expression.  
6. Displayed worker details and HRA.  
7. Applied condition to check if salary exceeds ₹60,000.  
8. Displayed tax status based on the condition.  
9. Ended block using END; and executed the program.  
10. Verified output.

---

## 💻 Code

```sql
DECLARE
    WORKER_ID NUMBER := 555;
    WORKER_NAME VARCHAR2(25) := 'ANJALI';
    BASIC_PAY NUMBER := 55000;
    HRA_AMOUNT NUMBER;

BEGIN
    HRA_AMOUNT := BASIC_PAY * 0.40;

    DBMS_OUTPUT.PUT_LINE('WORKER ID: ' || WORKER_ID);
    DBMS_OUTPUT.PUT_LINE('WORKER NAME: ' || WORKER_NAME);
    DBMS_OUTPUT.PUT_LINE('BASIC PAY: RS. ' || BASIC_PAY);
    DBMS_OUTPUT.PUT_LINE('HOUSE RENT ALLOWANCE: RS. ' || HRA_AMOUNT);

    IF BASIC_PAY > 60000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX APPLICABLE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('TAX NOT APPLICABLE');
    END IF;

END;
/
```

---

## 🔍 I/O Analysis

### Input
Worker details and salary values are predefined in the DECLARE section.

### Processing
- HRA calculated as 40% of 55,000 = 22,000  
- Salary checked against ₹60,000 threshold

### Output
<img width="800" height="317" alt="sc2_exp3" src="https://github.com/user-attachments/assets/ffd9bf79-0b41-4f47-854f-068edc60b245" />


---

## 📚 Learning Outcomes
- Understood the structure of a PL/SQL block (Declaration & Execution sections).  
- Learned to declare and initialize variables in PL/SQL.  
- Performed arithmetic calculations inside a block.  
- Implemented IF–ELSE conditional logic.  
- Used DBMS_OUTPUT.PUT_LINE to display results.
