-- 07_geographic_distribution.sql
-- Maps customer and revenue distribution by country and city
-- Identifies market penetration opportunities and underperforming regions
-- Used for sales territory planning and expansion strategy
-- Note: Customers with missing city data are excluded from city-level analysis
SELECT 
    c.Country,
    c.City,
    COUNT(DISTINCT c.CustomerID) AS CustomerCount,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) / COUNT(DISTINCT c.CustomerID), 2) AS RevenuePerCustomer
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN "Order Details" od ON o.OrderID = od.OrderID
WHERE c.City IS NOT NULL
GROUP BY c.Country, c.City
ORDER BY TotalRevenue DESC;