SELECT
    r.month,
    r.revenue,
    COALESCE(e.expense, 0)                              AS expense,
    (r.revenue - COALESCE(e.expense, 0))                AS profit,
    CASE
        WHEN (r.revenue - COALESCE(e.expense, 0)) >= 0
            THEN 'Profitable'
        ELSE 'Not-Profitable'
    END                                                 AS status
FROM (
    SELECT
        DATE_FORMAT(datetime, '%Y-%m') AS month,
        SUM(amount)                    AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021   
    GROUP BY DATE_FORMAT(datetime, '%Y-%m')
) r
LEFT JOIN (
    SELECT
        DATE_FORMAT(datetime, '%Y-%m') AS month,
        SUM(amount)                    AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021       
    GROUP BY DATE_FORMAT(datetime, '%Y-%m')
) e ON r.month = e.month
ORDER BY r.month;
