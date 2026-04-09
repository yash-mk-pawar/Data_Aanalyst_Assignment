WITH monthly_orders AS (
    SELECT
        DATE_FORMAT(bc.bill_date, '%Y-%m') AS month,
        bc.item_id,
        i.item_name,
        SUM(bc.item_quantity)              AS total_quantity
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY
        DATE_FORMAT(bc.bill_date, '%Y-%m'),
        bc.item_id,
        i.item_name
),
ranked AS (
    SELECT
        month,
        item_name,
        total_quantity,
        RANK() OVER (PARTITION BY month ORDER BY total_quantity DESC) AS rank_most,
        RANK() OVER (PARTITION BY month ORDER BY total_quantity ASC)  AS rank_least
    FROM monthly_orders
)
SELECT
    month,
    MAX(CASE WHEN rank_most  = 1 THEN CONCAT(item_name, ' (', total_quantity, ')') END) AS most_ordered_item,
    MAX(CASE WHEN rank_least = 1 THEN CONCAT(item_name, ' (', total_quantity, ')') END) AS least_ordered_item
FROM ranked
WHERE rank_most = 1 OR rank_least = 1
GROUP BY month
ORDER BY month;
