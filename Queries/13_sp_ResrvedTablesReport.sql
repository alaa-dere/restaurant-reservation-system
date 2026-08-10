create procedure sp_ResrvedTablesReport
(@StartDate datetime,@EndDate datetime)
as begin
select 
t.TableId,
t.Capacity,
r.ReservationId,
r.ReservationDate,
r.PartySize,
res.RestaurantId,
res.Name as RestaurantName,
res.Address,
res.PhoneNumber AS RestaurantPhone
from Reservations r
join Tables t
on r.TableId=t.TableId
join Restaurants res
on r.RestaurantId=res.RestaurantId
where r.ReservationDate between @StartDate and @EndDate
order by r.ReservationDate
end;