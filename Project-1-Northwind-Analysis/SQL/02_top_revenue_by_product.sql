-- 02_top_products_revenue.sql
-- Identifies top 10 products by total revenue
-- Revenue calculated as: UnitPrice * Quantity * (1 - Discount)
-- Used for inventory prioritization and supplier negotiation strategy
SELECT 
    p.ProductName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalRevenue
FROM Products p
JOIN "Order Details" od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 10;