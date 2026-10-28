SELECT 
	COUNT(DISTINCT household_id) AS no_households, 
	COUNT(DISTINCT store_id) AS no_stores,
	COUNT(DISTINCT basket_id) AS no_baskets, 
	COUNT(DISTINCT product_id) AS no_products
FROM transactions;
