





--i have taken another example in worksheet because i thought table was not given

SELECT 
    p.prod_name,
    COUNT(o.order_id) AS total_orders
FROM Tbl_Products p
JOIN Tbl_Orders o 
    ON p.prod_id = o.prod_id
GROUP BY p.prod_name;
