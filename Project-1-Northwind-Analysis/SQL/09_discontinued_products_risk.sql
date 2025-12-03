-- 09_discontinued_products_risk.sql
-- CRITICAL: Identifies revenue from products we can no longer restock
-- High-priority for customer communication and product substitution planning
-- Discontinued flag (1 = yes, 0 = no) indicates supplier availability
SELECT 
    p.ProductName,
    p.Discontinued,
    p.UnitsInStock,
    COUNT(DISTINCT o.OrderID) AS RecentOrders,
    SUM(od.Quantity) AS TotalUnitsSold,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM Products p
JOIN "Order Details" od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE p.Discontinued = 1
GROUP BY p.ProductID, p.ProductName, p.Discontinued, p.UnitsInStock
ORDER BY Revenue DESC;