--14. **Stored Procedure - Add New Order**:
--    **Procedure Name**: **`sp_AddNewOrder`**
--    **Purpose**: Streamline the process of adding a new order.
--    **Parameters**: **`ReservationId`**, **`EmployeeId`**, **`OrderDate`**, and **`TotalAmount`**.
--    **Implementation**: Check if the specified reservation and employee exist, if not, return an error message, if existing, add new order.
--    **Return**: The new **`BorrowerID`** or an error message.
CREATE PROCEDURE sp_AddNewOrder(
@ReservationId INT,
@EmployeeId INT,
@OrderDate DATETIME,
@TotalAmount DECIMAL(10,2))
AS BEGIN
	IF NOT EXISTS
	(
	SELECT 1 FROM Reservations
	WHERE ReservationId = @ReservationId
	)
	BEGIN
		PRINT 'Reservation does not exists'
		RETURN
	END
	IF NOT EXISTS
	(
	SELECT 1 FROM Employees
	WHERE EmployeeId = @EmployeeId
	)
	BEGIN
		PRINT 'Employee does not exists'
		RETURN
	END
INSERT INTO Orders (ReservationId,EmployeeId,OrderDate,TotalAmount)
VALUES (@ReservationId,@EmployeeId,@OrderDate,@TotalAmount)
SELECT SCOPE_IDENTITY() AS NewOrderId
END