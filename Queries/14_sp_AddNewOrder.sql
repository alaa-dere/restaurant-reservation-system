create procedure sp_AddNewOrder(
@ReservationId int,
@EmployeeId int,
@OrderDate datetime,
@TotalAmount decimal(10,2))
as
begin
	if not exists
	(
	select 1 from Reservations
	where ReservationId = @ReservationId
	)
	begin
		print 'Reservation does not exists'
		return
	end
	if not exists
	(
	select 1 from Employees
	where EmployeeId = @EmployeeId
	)
	begin
		print 'Employee does not exists'
		return
	end
insert into Orders (ReservationId,EmployeeId,OrderDate,TotalAmount)
values (@ReservationId,@EmployeeId,@OrderDate,@TotalAmount)
select SCOPE_IDENTITY() as NewOrderId
end;
