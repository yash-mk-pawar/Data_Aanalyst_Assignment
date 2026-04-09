SELECT
    sales_channel,
    SUM(amount)   AS total_revenue,
    COUNT(oid)    AS total_orders,
    ROUND(SUM(amount) / SUM(SUM(amount)) OVER () * 100, 2) AS revenue_percentage
FROM clinic_sales
WHERE YEAR(datetime) = 2021         
GROUP BY sales_channel
ORDER BY total_revenue DESC;
