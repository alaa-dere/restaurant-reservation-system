create view [Employees details] as
select 
e.EmployeeId,
e.FirstName,
e.LastName,
e.Position,
res.RestaurantId,
res.PhoneNumber as ResPhone,
res.OpeningHours,
res.Name as RestaurantName,
res.Address
from Employees e
join Restaurants res
on e.RestaurantId = res.RestaurantId