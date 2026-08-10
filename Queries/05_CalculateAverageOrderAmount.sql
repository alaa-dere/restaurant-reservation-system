select 
e.EmployeeId,
e.FirstName, 
e.LastName,
avg(o.TotalAmount) as OrderAmount
from Orders o
join Employees e
on o.EmployeeId = e.EmployeeId
where o.EmployeeId = 20
group by e.EmployeeId,e.FirstName,e.LastName
