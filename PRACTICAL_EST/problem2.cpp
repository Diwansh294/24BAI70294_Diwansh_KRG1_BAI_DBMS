CREATE OR REPLACE FUNCTION SwapCities(id1 INT, id2 INT)
RETURNS VOID AS
$$
DECLARE
    city1 VARCHAR(50);
    city2 VARCHAR(50);
BEGIN
   
    IF (SELECT COUNT(*) FROM Tbl_Suppliers WHERE sup_id IN (id1, id2)) < 2 THEN
        RAISE EXCEPTION 'One or both supplier IDs do not exist';
    END IF;

    
    SELECT city INTO city1 
    FROM Tbl_Suppliers 
    WHERE sup_id = id1;

    SELECT city INTO city2 
    FROM Tbl_Suppliers 
    WHERE sup_id = id2;

   
    UPDATE Tbl_Suppliers 
    SET city = city2 
    WHERE sup_id = id1;

    UPDATE Tbl_Suppliers 
    SET city = city1 
    WHERE sup_id = id2;

END;
$$ LANGUAGE plpgsql;
