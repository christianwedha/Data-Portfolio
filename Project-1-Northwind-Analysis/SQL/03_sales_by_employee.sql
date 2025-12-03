-- 03_sales_by_employee.sql
-- Analyzes sales performance by employee
-- Helps identify top performers and training needs
-- Revenue includes discounts applied
SELECT 
    e.FirstName || ' ' || e.LastName AS EmployeeName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, EmployeeName
ORDER BY TotalSales DESC;