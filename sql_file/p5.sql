SELECT
    DATE_TRUNC('Month', pay.payment_date) AS pay_mon,
    CONCAT(cus.first_name, ' ', cus.last_name) AS fullname,
    COUNT(*) AS pay_counterpermon,
    SUM(pay.amount) as pay_amount
FROM
    payment AS pay
    JOIN customer AS cus ON pay.customer_id = cus.customer_id
WHERE
    DATE_PART('year', pay.payment_date) = '2007'
    AND CONCAT(cus.first_name, ' ', cus.last_name) = 'Ana Bradley'
GROUP BY
    1,
    2
ORDER BY
    2,
    1
LIMIT
    10