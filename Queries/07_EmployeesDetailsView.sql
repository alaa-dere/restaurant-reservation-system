--Retrieve Employees details with Views: Use a view to list all employees information including their restaurants details
CREATE VIEW [Employees details] AS
SELECT 
	e.EmployeeId,
	e.FirstName,
	e.LastName,
	e.Position,
	res.RestaurantId,
	res.PhoneNumber AS ResPhone,
	res.OpeningHours,
	res.Name AS RestaurantName,
	res.Address
FROM Employees e
JOIN Restaurants res
ON e.RestaurantId = res.RestaurantId