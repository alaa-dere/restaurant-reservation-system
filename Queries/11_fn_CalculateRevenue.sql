create function fn_CalculateRevenue(@RestaurantId int)
returns decimal(10,2)
as
begin
declare @Revenue decimal(10,2);
select @Revenue = isnull(sum(o.TotalAmount), 0)
from Orders o
join Reservations r
on o.ReservationId = r.ReservationId
where r.RestaurantId = @RestaurantId;
return @Revenue;
end;
