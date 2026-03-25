CREATE TABLE categories(
    cat_id INT PRIMARY KEY,
    cat_name VARCHAR(20)
);

CREATE TABLE products(
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(20),
    cat_id INT REFERENCES categories(cat_id),
    price NUMERIC
);

INSERT INTO categories VALUES(1, 'Electronics'), (2, 'Clothing'), (3, 'Furniture');

INSERT INTO products VALUES(201, 'Laptop', 1, 75000);
INSERT INTO products VALUES(202, 'Mobile', 1, 50000);
INSERT INTO products VALUES(203, 'Shirt', 2, 2000);
INSERT INTO products VALUES(204, 'Jeans', 2, 3000);
INSERT INTO products VALUES(205, 'Table', 3, 8000);
INSERT INTO products VALUES(206, 'Chair', 3, 4000);

CREATE VIEW V_SIMPLE AS
SELECT prod_name, price FROM products WHERE price > 5000;

SELECT * FROM V_SIMPLE;

CREATE VIEW V_COMPLEX AS
SELECT c.cat_name, SUM(p.price) AS total_price, AVG(p.price) AS avg_price
FROM products p JOIN categories c
ON p.cat_id = c.cat_id
GROUP BY c.cat_name;

SELECT * FROM V_COMPLEX;

CREATE MATERIALIZED VIEW V_MATERIALIZED AS
SELECT c.cat_name, SUM(p.price) AS total_price, AVG(p.price) AS avg_price
FROM products p JOIN categories c
ON p.cat_id = c.cat_id
GROUP BY c.cat_name;

SELECT * FROM V_MATERIALIZED;

REFRESH MATERIALIZED VIEW V_MATERIALIZED;

EXPLAIN ANALYZE SELECT * FROM V_SIMPLE;
EXPLAIN ANALYZE SELECT * FROM V_COMPLEX;
EXPLAIN ANALYZE SELECT * FROM V_MATERIALIZED;
