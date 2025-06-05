-- Mode summary of customer table columns
--(useful for categorical/non-numerical data)
SELECT 
    MODE() WITHIN GROUP (ORDER BY store_id) AS mode_store_id,
    MODE() WITHIN GROUP (ORDER BY address_id) AS mode_address_id,
    MODE() WITHIN GROUP (ORDER BY create_date) AS mode_create_date,
    MODE() WITHIN GROUP (ORDER BY activebool) AS mode_active_status,
    
    -- Total number of rows in the customer table
    COUNT(*) AS count_rows

FROM customer;
