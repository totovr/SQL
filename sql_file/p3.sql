WITH t1 AS (
    SELECT
        cat.name AS category_name,
        NTILE(4) OVER (
            ORDER BY
                fil.rental_duration
        ) AS standard_quartile
    FROM
        category AS cat
        JOIN film_category AS film_cat ON cat.category_id = film_cat.category_id
        JOIN film AS fil ON film_cat.film_id = fil.film_id
    WHERE
        cat.name = 'Animation'
        OR cat.name = 'Children'
        OR cat.name = 'Classics'
        OR cat.name = 'Comedy'
        OR cat.name = 'Family'
        OR cat.name = 'Music'
)
SELECT
    t1.category_name,
    t1.standard_quartile,
    count(*) AS count
FROM
    t1
GROUP BY
    1,
    2
ORDER BY
    1,
    2;