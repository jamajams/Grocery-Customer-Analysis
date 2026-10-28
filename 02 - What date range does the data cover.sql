SELECT 
	MAX(transaction_timestamp) AS most_recent_timestamp,
	MIN(transaction_timestamp) as most_old_timestamp
FROM transactions;
