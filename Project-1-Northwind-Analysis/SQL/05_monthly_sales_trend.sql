-- 05_monthly_sales_trend.sql
-- Tracks revenue trends over time to identify seasonality and growth patterns
-- Critical for forecasting and inventory planning
-- Format: YYYY-MM for easy time-series analysis in Power BI
SELECT 
    strftime('%Y-%m', o.OrderDate) AS YearMonth,
    COUNT(DISTINCT o.OrderID) AS OrderCount,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS MonthlyRevenue
FROM Orders o
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY YearMonth
ORDER BY YearMonth;