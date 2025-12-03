-- 06_category_performance.sql
-- Evaluates product category contribution to revenue and volume
-- Identifies high-margin categories vs. high-volume/low-margin categories
-- Informs marketing budget allocation and product portfolio strategy
SELECT 
    c.CategoryName,
    COUNT(DISTINCT p.ProductID) AS ProductCount,
    SUM(od.Quantity) AS TotalUnitsSold,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) / COUNT(DISTINCT o.OrderID), 2) AS RevenuePerOrder
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN "Order Details" od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalRevenue DESC;