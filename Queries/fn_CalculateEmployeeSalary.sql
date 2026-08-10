create function fn_CalculateEmployeeSalary(@EmployeeId int)
returns int
as
begin
declare @OrderCount int
declare @Rank int
declare @Salary int
declare @Position VARCHAR(50)
select @Position =Position
from Employees
where EmployeeId = @EmployeeId
set @Rank =
 case
   when @Position = 'VIPOrdersWaiter' then 5
   when @Position = 'StandardWaiter' then 4
   when @Position = 'AssistantWaiter' then 3
   else 0
 end
select @OrderCount= count(*)from Orders 
where EmployeeId = @EmployeeId;
set @Salary = @OrderCount * @Rank;
return @salary;
end;
