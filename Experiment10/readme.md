# 📘 DBMS Experiment 10 – Trigger for Automatic Primary Key Generation

## 🎯 Aim
To design a trigger that automatically implements the functionality of a primary key, ensuring unique identification of records without manual intervention.

---

## 💻 Software Requirements

### Database Management System
- Oracle Database Express Edition (Oracle XE)  
- PostgreSQL  

### Client Tools
- Oracle SQL Developer  
- pgAdmin  

---

## 🎯 Objectives
- To create a database trigger that automatically generates unique primary key values  
- To replicate functionality similar to a stored procedure  
- To eliminate manual key assignment errors  

---

## ❓ Problem Statement
In enterprise databases, primary keys must be unique for every record. Manual assignment can lead to duplication and errors.

### Design Requirements:
- Automatically generate primary key during insertion  
- Use sequence for uniqueness  
- Implement trigger-based automation  

**Industry Relevance:** Amazon, Flipkart, Oracle systems  

---

## ⚙️ Practical / Experiment Steps
1. Created `orders` table without auto-increment  
2. Created sequence `order_seq`  
3. Designed `BEFORE INSERT` trigger `trg_order_pk`  
4. Implemented logic to assign `order_seq.NEXTVAL`  
5. Inserted records without specifying `order_id`  
6. Verified output using SELECT query  

---

## 🧪 Procedure
1. Connected to database using SQL Developer / pgAdmin  
2. Created table with primary key  
3. Created sequence starting from 1  
4. Created trigger for auto key generation  
5. Inserted records  
6. Verified results  

---

## 📊 Input / Output Analysis

### 🔹 Table Creation
```sql
CREATE TABLE orders (
    order_id   NUMBER PRIMARY KEY,
    item_name  VARCHAR2(100),
    quantity   NUMBER,
    order_date DATE
);
```
<img width="441" height="116" alt="Screenshot 2026-04-24 115817" src="https://github.com/user-attachments/assets/9e576cb4-f437-414a-a179-7cdede99ddbc" />


---

### 🔹 Sequence Creation
```sql
CREATE SEQUENCE order_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
```
<img width="493" height="117" alt="Screenshot 2026-04-24 115843" src="https://github.com/user-attachments/assets/986b66b3-7505-4ac6-9c84-0b2e148329ab" />


---

### 🔹 Trigger Creation
```sql
CREATE OR REPLACE TRIGGER trg_order_pk
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF :NEW.order_id IS NULL THEN
        :NEW.order_id := order_seq.NEXTVAL;
    END IF;
END;
/
```
<img width="546" height="134" alt="Screenshot 2026-04-24 115905" src="https://github.com/user-attachments/assets/2619764f-c903-4171-89ec-4c70a242c402" />


---

### 🔹 Data Insertion
```sql
INSERT INTO orders (item_name, quantity, order_date)
VALUES ('Laptop', 2, SYSDATE);

INSERT INTO orders (item_name, quantity, order_date)
VALUES ('Mobile', 5, SYSDATE);

INSERT INTO orders (item_name, quantity, order_date)
VALUES ('Tablet', 3, SYSDATE);

COMMIT;
```
<img width="612" height="166" alt="Screenshot 2026-04-24 115931" src="https://github.com/user-attachments/assets/895c8d73-77e7-42a9-915d-c55025a03e2e" />

---

### 🔹 Data Verification
```sql
SELECT order_id, item_name, quantity, order_date FROM orders;
```
<img width="498" height="271" alt="Screenshot 2026-04-24 120003" src="https://github.com/user-attachments/assets/5dab685f-b1ff-485c-b88e-c6120ce4f356" />

---

## 📈 Learning Outcomes
- Understood trigger-based automation  
- Learned sequence-based primary key generation  
- Ensured data integrity without manual intervention  
- Applied real-world database concepts  

---

## 🚀 Conclusion
Triggers combined with sequences provide a reliable mechanism for automatic primary key generation, widely used in enterprise-level database systems.
