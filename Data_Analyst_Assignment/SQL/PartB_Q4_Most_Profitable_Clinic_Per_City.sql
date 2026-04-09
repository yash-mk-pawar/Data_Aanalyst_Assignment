WITH clinic_profit AS (
    SELECT
        cl.cid,
        cl.clinic_name,
        cl.city,
        COALESCE(SUM(cs.amount), 0)                                     AS revenue,
        COALESCE(SUM(ex.amount), 0)                                     AS expense,
        COALESCE(SUM(cs.amount), 0) - COALESCE(SUM(ex.amount), 0)      AS profit
    FROM clinics cl
    LEFT JOIN clinic_sales cs
           ON cl.cid = cs.cid
          AND DATE_FORMAT(cs.datetime, '%Y-%m') = '2021-09'
    LEFT JOIN expenses ex
           ON cl.cid = ex.cid
          AND DATE_FORMAT(ex.datetime, '%Y-%m') = '2021-09'
    GROUP BY cl.cid, cl.clinic_name, cl.city
),
ranked AS (
    SELECT
        city,
        cid,
        clinic_name,
        revenue,
        expense,
        profit,
        RANK() OVER (PARTITION BY city ORDER BY profit DESC) AS rnk
    FROM clinic_profit
)
SELECT
    city,
    cid,
    clinic_name,
    revenue,
    expense,
    profit  AS highest_profit
FROM ranked
WHERE rnk = 1
ORDER BY city;