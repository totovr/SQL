SELECT
    DATE_PART('month', rent.rental_date) as Month_year,
    DATE_PART('year', rent.rental_date) as Rental_year,
    invent.store_id AS Store_ID,
    COUNT(*) AS Count_rentals
FROM
    inventory AS invent
    JOIN rental AS rent ON rent.inventory_id = invent.inventory_id
GROUP BY
    1,
    2,
    3
ORDER BY
    4 DESC;