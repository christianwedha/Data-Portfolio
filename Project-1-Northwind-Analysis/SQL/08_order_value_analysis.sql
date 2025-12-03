-- 08_order_value_analysis.sql
-- Segments orders by value to identify profitability patterns
-- Critical for setting minimum order thresholds and shipping policies
-- Breakeven shipping cost estimated at ~$200 per order
-- Note: Orders with missing country data are excluded from analysis
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CompanyName,
    c.Country,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS OrderValue,
    COUNT(od.ProductID) AS ItemsInOrder,
    CASE 
        WHEN SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) > 2000 THEN 'High Value'
        WHEN SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) > 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS OrderSegment
FROM Orders o
JOIN "Order Details" od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country IS NOT NULL
GROUP BY o.OrderID, o.OrderDate, c.CompanyName, c.Country
ORDER BY OrderValue DESC;