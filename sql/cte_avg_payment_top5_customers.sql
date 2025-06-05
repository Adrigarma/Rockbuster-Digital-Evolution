-- Using a Common Table Expression (CTE) to identify the average payment of the top 
-- 5 customers from the top 10 cities (within the top 10 countries by customer count)

WITH top_10_countries AS
   -- Top 10 countries based on number of customers
    (SELECT D.country
     FROM customer A
     INNER JOIN address B ON A.address_id = B.address_id
     INNER JOIN city C ON B.city_id = C.city_id
     INNER JOIN country D ON C.country_id = D.country_id
     GROUP BY D.country
     ORDER BY COUNT (A.customer_id) DESC
     LIMIT 10),
top_10_cities AS
    -- Top 10 cities within top 10 countires, by customer count 
    (SELECT C.city
     FROM customer A
     INNER JOIN address B ON A.address_id = B.address_id
     INNER JOIN city C ON B.city_id = C.city_id
     INNER JOIN country D ON C.country_id = D.country_id
     WHERE D.country IN (SELECT country
                         FROM top_10_countries)
     GROUP BY D.Country, C.city
     ORDER BY COUNT (A.customer_id) DESC
     LIMIT 10),
top_5_customers AS
    -- Top 5 customers (by total amount paid) located in the top 10 cities 
    (SELECT SUM(A.amount) AS total_amount_paid
     FROM payment A
     INNER JOIN customer B ON A.customer_id = B.customer_id
     INNER JOIN address C ON B.address_id = C.address_id
     INNER JOIN city D ON C.city_id = D.city_id
     INNER JOIN country E ON D.country_id = E.country_id
     WHERE D.city IN (SELECT city FROM top_10_cities)
     GROUP BY B.customer_id
     ORDER BY SUM(A.amount) DESC
     LIMIT 5)

-- Final result: average total payment from top 5 customers
SELECT AVG (total_amount_paid) AS avg_payment_top_5_customers
FROM top_5_customers;
