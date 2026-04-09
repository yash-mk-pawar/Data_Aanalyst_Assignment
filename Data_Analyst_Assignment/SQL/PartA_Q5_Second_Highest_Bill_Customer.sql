WITH bill_totals AS (
    SELECT
        DATE_FORMAT(bc.bill_date, '%Y-%m')  AS month,
        b.user_id,
        u.name,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS bill_amount
    FROM booking_commercials bc
    JOIN items    i ON bc.item_id    = i.item_id
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN users    u ON b.user_id     = u.user_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY
        DATE_FORMAT(bc.bill_date, '%Y-%m'),
        b.user_id,
        u.name,
        bc.bill_id
),
ranked AS (
    SELECT
        month,
        user_id,
        name,
        bill_id,
        bill_amount,
        DENSE_RANK() OVER (PARTITION BY month ORDER BY bill_amount DESC) AS rnk
    FROM bill_totals
)
SELECT
    month,
    user_id,
    name         AS customer_name,
    bill_id,
    bill_amount  AS second_highest_bill_amount
FROM ranked
WHERE rnk = 2
ORDER BY month;