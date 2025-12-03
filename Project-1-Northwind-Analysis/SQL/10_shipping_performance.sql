-- 10_shipping_performance.sql
-- Measures order fulfillment speed by shipping company
-- Days to ship = ShippedDate minus OrderDate
-- Identifies delays (>7 days) that impact customer satisfaction
SELECT 
    s.CompanyName AS ShipperName,
    COUNT(o.OrderID) AS TotalOrders,
    ROUND(AVG(JULIANDAY(o.ShippedDate) - JULIANDAY(o.OrderDate)), 1) AS AvgDaysToShip,
    MIN(JULIANDAY(o.ShippedDate) - JULIANDAY(o.OrderDate)) AS FastestShipment,
    MAX(JULIANDAY(o.ShippedDate) - JULIANDAY(o.OrderDate)) AS SlowestShipment,
    SUM(CASE WHEN JULIANDAY(o.ShippedDate) - JULIANDAY(o.OrderDate) > 7 THEN 1 ELSE 0 END) AS DelayedOrders
FROM Orders o
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE o.ShippedDate IS NOT NULL
GROUP BY s.ShipperID, s.CompanyName
ORDER BY AvgDaysToShip;