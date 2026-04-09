WITH clinic_profit AS (
    SELECT
        cl.cid,
        cl.clinic_name,
        cl.state,
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
    GROUP BY cl.cid, cl.clinic_name, cl.state
),
ranked AS (
    SELECT
        state,
        cid,
        clinic_name,
        revenue,
        expense,
        profit,
        DENSE_RANK() OVER (PARTITION BY state ORDER BY profit ASC) AS rnk
    FROM clinic_profit
)
SELECT
    state,
    cid,
    clinic_name,
    revenue,
    expense,
    profit  AS second_least_profit
FROM ranked
WHERE rnk = 2
ORDER BY state;
