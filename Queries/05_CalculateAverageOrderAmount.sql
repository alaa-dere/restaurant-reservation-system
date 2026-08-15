--Calculate Average Order Amount: Calculate the average order amount made through a specific employee.
SELECT 
	e.EmployeeId,
	e.FirstName, 
	e.LastName,
	AVG(o.TotalAmount) AS OrderAmount
FROM Orders o
JOIN Employees e
ON o.EmployeeId = e.EmployeeId
WHERE o.EmployeeId = 20
GROUP BY e.EmployeeId,e.FirstName,e.LastName
