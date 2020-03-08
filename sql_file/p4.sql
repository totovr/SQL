SELECT
    DATE_PART('month', rent.rental_date) as Month_year,
    DATE_PART('year', rent.rental_date) as Rental_year,
    sta.store_id AS Store_ID,
    COUNT(*) AS Count_rentals
FROM
    rental AS rent
    JOIN staff AS sta ON rent.staff_id = sta.staff_id
GROUP BY
    1,
    2,
    3
ORDER BY
    4 DESC;