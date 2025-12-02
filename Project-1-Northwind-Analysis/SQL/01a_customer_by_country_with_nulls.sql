-- 01a_customer_by_country_with_nulls.sql
-- Customer Distribution by Country (Full analysis including data quality issues)
-- Analysis Date: December 2, 2025
-- Database: Northwind Traders
-- Note: Found 2 customers with NULL country values

SELECT
	CASE
		WHEN Country IS NULL THEN '[Missing Data]'
		ELSE Country
	END AS Country,
	COUNT (*) as CustomerCount
FROM Customers
GROUP BY Country