SELECT
    cs.uid,
    c.name,
    c.mobile,
    SUM(cs.amount)  AS total_spend,
    COUNT(cs.oid)   AS total_orders,
    ROUND(AVG(cs.amount), 2) AS avg_order_value
FROM clinic_sales cs
JOIN customer c ON cs.uid = c.uid
WHERE YEAR(cs.datetime) = 2021  
GROUP BY cs.uid, c.name, c.mobile
ORDER BY total_spend DESC
LIMIT 10;
