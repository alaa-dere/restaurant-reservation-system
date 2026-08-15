--12. **Database Function - Calculate Employees Salary**:
--    **Function Name**: **`fn_CalculateEmployeeSalary`**
--    **Purpose**: Compute the salary for a given employee.
--    **Parameter**: `EmployeeId`
--    **Implementation**: Salary is defined as: # number of orders made by specific employee * employee rank.
--      - Employee’s rank based on position: Position = `VIPOrdersWaiter` = 5, `StandardWaiter` = 4, `AssistantWaiter`  = 3.
--    **Return**: salary for the `EmployeeId`.
CREATE FUNCTION fn_CalculateEmployeeSalary(@EmployeeId INT)
RETURNS INT
AS BEGIN
DECLARE @OrderCount INT
DECLARE @Rank INT
DECLARE @Salary INT
DECLARE @Position VARCHAR(50)
SELECT @Position =Position
FROM Employees
WHERE EmployeeId = @EmployeeId
SET @Rank =
 CASE
   WHEN @Position = 'VIPOrdersWaiter' THEN 5
   WHEN @Position = 'StandardWaiter' THEN 4
   WHEN @Position = 'AssistantWaiter' THEN 3
   ELSE 0
 END
SELECT @OrderCount= count(*)
FROM Orders 
WHERE EmployeeId = @EmployeeId;
SET @Salary = @OrderCount * @Rank
RETURN @salary;
END