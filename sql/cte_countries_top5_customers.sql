-- Using Common Table Expressions (CTEs) to identify countries
-- with the highest number of top-paying customers

WITH top_10_countries AS
    -- Top 10 countries by number of customers
    (SELECT D.country
     FROM customer A
     INNER JOIN address B ON A.address_id = B.address_id
     INNER JOIN city C ON B.city_id = C.city_id
     INNER JOIN country D ON C.country_id = D.country_id
     GROUP BY D.country
     ORDER BY COUNT(A.customer_id) DESC
     LIMIT 10),

top_10_cities AS
    -- Top 10 cities within the top 10 countries, based on customer count
    (SELECT D.country, C.city
     FROM customer A
     INNER JOIN address B ON A.address_id = B.address_id
     INNER JOIN city C ON B.city_id = C.city_id
     INNER JOIN country D ON C.country_id = D.country_id
     WHERE D.country IN (SELECT country FROM top_10_countries)
     GROUP BY D.country, C.city
     ORDER BY COUNT(A.customer_id) DESC
     LIMIT 10),

top_5_customers AS
    -- Top 5 customers (by total payments) located in the top cities
    (SELECT B.customer_id, E.country, SUM(A.amount) AS total_amount_paid
     FROM payment A
     INNER JOIN customer B ON A.customer_id = B.customer_id
     INNER JOIN address C ON B.address_id = C.address_id
     INNER JOIN city D ON C.city_id = D.city_id
     INNER JOIN country E ON D.country_id = E.country_id
     WHERE D.city IN (SELECT city FROM top_10_cities)
     GROUP BY B.customer_id, E.country
     ORDER BY SUM(A.amount) DESC
     LIMIT 5)

-- Final result: count of all customers and top customers per country
SELECT D.country,
       COUNT(DISTINCT A.customer_id) AS all_customer_count,
       COUNT(DISTINCT top_5_customers.customer_id) AS top_5_customers_count
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
LEFT JOIN top_5_customers ON D.country = top_5_customers.country
GROUP BY D.country
ORDER BY top_5_customers_count DESC
LIMIT 5;
