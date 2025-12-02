-- 01b_customer_by_country_clean.sql
-- Customer Distribution by Country (Clean data for Power BI visualization)
-- Analysis Date: December 2, 2025
-- Database: Northwind Traders
-- Note: 2 customers with NULL country values excluded from this analysis

SELECT Country, COUNT(*) AS CustomerCount
FROM Customers
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY CustomerCount DESC;