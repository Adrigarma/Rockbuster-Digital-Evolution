-- Using subqueries to identify countries with top 5 paying customers
-- and count how many of those customers are in each country

SELECT D.country,
       COUNT(DISTINCT A.customer_id) AS all_customer_count,
       top_5_customers.top_5_customers AS top_5_customer_count
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
LEFT JOIN 
    -- Subquery: returns country and count of top 5 customers by total payment
    (
        SELECT E.country,
               COUNT(DISTINCT B.customer_id) AS top_5_customers
        FROM payment A
        INNER JOIN customer B ON A.customer_id = B.customer_id
        INNER JOIN address C ON B.address_id = C.address_id
        INNER JOIN city D ON C.city_id = D.city_id
        INNER JOIN country E ON D.country_id = E.country_id
        WHERE D.city IN (
            -- Subquery: top 10 cities based on customer count in top 10 countries
            SELECT C.city
            FROM customer A
            INNER JOIN address B ON A.address_id = B.address_id
            INNER JOIN city C ON B.city_id = C.city_id
            INNER JOIN country D ON C.country_id = D.country_id
            WHERE D.country IN (
                -- Subquery: top 10 countries by customer count
                SELECT D.country
                FROM customer A
                INNER JOIN address B ON A.address_id = B.address_id
                INNER JOIN city C ON B.city_id = C.city_id
                INNER JOIN country D ON C.country_id = D.country_id
                GROUP BY D.country
                ORDER BY COUNT(A.customer_id) DESC
                LIMIT 10
            )
            GROUP BY D.country, C.city
            ORDER BY COUNT(A.customer_id) DESC
            LIMIT 10
        )
        GROUP BY B.customer_id, B.first_name, B.last_name, D.city, E.country
        ORDER BY SUM(A.amount) DESC
        LIMIT 5
    ) AS top_5_customers
    ON D.country = top_5_customers.country
GROUP BY D.country, top_5_customers.top_5_customers
ORDER BY top_5_customers.top_5_customers DESC
LIMIT 5;
