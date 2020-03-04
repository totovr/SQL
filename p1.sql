SELECT
    fil.title AS film_title,
    cat.name AS category_name,
    count(to_char(rental_date, 'YYYY-MM-DD')) AS rental_day
FROM
    category AS cat
    JOIN film_category AS film_cat ON cat.category_id = film_cat.category_id
    JOIN film AS fil ON film_cat.film_id = fil.film_id
    JOIN inventory AS inv ON inv.film_id = fil.film_id
    JOIN rental AS rent ON rent.inventory_id = inv.inventory_id
WHERE
    cat.name = 'Animation'
    OR cat.name = 'Children'
    OR t1.name = 'Classics'
    OR cat.name = 'Comedy'
    OR cat.name = 'Family'
    OR cat.name = 'Music'
GROUP BY
    1,
    2
ORDER BY
    2