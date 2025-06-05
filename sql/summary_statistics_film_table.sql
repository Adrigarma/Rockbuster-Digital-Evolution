-- Summary statistics of the film table using aggregation functions

SELECT 
    -- Release year stats
    MIN(release_year) AS min_release_year,
    MAX(release_year) AS max_release_year,
    ROUND(AVG(release_year), 0) AS avg_release_year,

    -- Rental duration stats
    MIN(rental_duration) AS min_rental_duration,
    MAX(rental_duration) AS max_rental_duration,
    ROUND(AVG(rental_duration), 2) AS avg_rental_duration,

    -- Rental rate stats
    MIN(rental_rate) AS min_rental_rate,
    MAX(rental_rate) AS max_rental_rate,
    ROUND(AVG(rental_rate), 2) AS avg_rental_rate,

    -- Film length stats
    MIN(length) AS min_length,
    MAX(length) AS max_length,
    ROUND(AVG(length), 2) AS avg_length,

    -- Replacement cost stats
    MIN(replacement_cost) AS min_replacement_cost,
    MAX(replacement_cost) AS max_replacement_cost,
    ROUND(AVG(replacement_cost), 2) AS avg_replacement_cost,

    -- Mode (most frequent) values
    MODE() WITHIN GROUP (ORDER BY language_id) AS mode_language_id,
    MODE() WITHIN GROUP (ORDER BY rating) AS mode_rating,

    -- Row count
    COUNT(*) AS count_rows

FROM film;
