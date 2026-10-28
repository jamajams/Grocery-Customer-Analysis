SELECT
    p.department,
    ROUND(SUM(t.sales_value), 2) AS total_spend -- used round here to 2 decimal places as it is money!
FROM transactions AS t
INNER JOIN products AS p
    USING (product_id)
GROUP BY p.department
ORDER BY total_spend DESC
LIMIT 10;