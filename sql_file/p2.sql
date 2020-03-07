SELECT
    fil.title AS title,
    cat.name AS name,
    fil.rental_duration AS rental_duration,
    NTILE(4) OVER (
        ORDER BY
            fil.rental_duration
    ) AS standard_quartile
FROM
    category AS cat
    JOIN film_category AS film_cat ON cat.category_id = film_cat.category_id
    JOIN film AS fil ON film_cat.film_id = fil.film_id
WHERE
    name = 'Animation'
    OR name = 'Children'
    OR name = 'Classics'
    OR name = 'Comedy'
    OR name = 'Family'
    OR name = 'Music'
ORDER BY
    3