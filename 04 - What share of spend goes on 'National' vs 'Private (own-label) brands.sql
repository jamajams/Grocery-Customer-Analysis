SELECT 
	p.brand, 
	SUM(t.sales_value) AS total_sales
FROM products AS p
INNER JOIN transactions AS t
	USING (product_id)
GROUP BY p.brand
LIMIT 10;
