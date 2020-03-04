WITH t1 AS (
    SELECT
        fil.title AS title,
        cat.name AS name,
        fil.rental_duration AS rental_duration,
        NTILE(4) OVER (
            PARTITION BY cat.name
            ORDER BY
                fil.rental_duration
        ) AS standard_quartile
    FROM
        category AS cat
        JOIN film_category AS film_cat ON cat.category_id = film_cat.category_id
        JOIN film AS fil ON film_cat.film_id = fil.film_id
)
SELECT
    *
FROM
    t1
WHERE
    t1.name = 'Animation'
    OR t1.name = 'Children'
    OR t1.name = 'Classics'
    OR t1.name = 'Comedy'
    OR t1.name = 'Family'
    OR t1.name = 'Music'
ORDER BY
    3