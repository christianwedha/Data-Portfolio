-- 04_customer_order_frequency.sql
-- Analyzes customer purchasing patterns and lifetime value
-- Identifies high-value customers vs. at-risk low-frequency buyers
-- Used for customer retention strategy and account prioritization
SELECT 
    c.CompanyName,
    c.Country,
    COUNT(o.OrderID) AS OrderCount,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.Country
ORDER BY OrderCount DESC
LIMIT 20;