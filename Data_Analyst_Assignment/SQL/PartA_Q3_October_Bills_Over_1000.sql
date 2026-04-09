SELECT
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE DATE_FORMAT(bc.bill_date, '%Y-%m') = '2021-10'
GROUP BY bc.bill_id
HAVING bill_amount > 1000
ORDER BY bill_amount DESC;
