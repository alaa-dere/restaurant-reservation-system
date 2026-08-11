create procedure sp_FutureReservedTables
as begin
create table FutureReservedTables
(
	TableId int,
	RestaurantId int,
	ReservationDate datetime
)
insert into FutureReservedTables(TableId,RestaurantId,ReservationDate)
select TableId,RestaurantId,ReservationDate
from Reservations
where ReservationDate > getdate()
select
f.TableId,
f.ReservationDate,
r.RestaurantId,
r.Name AS RestaurantName,
r.Address,
r.PhoneNumber,
r.OpeningHours
from FutureReservedTables f
join Restaurants r
on f.RestaurantId = r.RestaurantId;
drop table FutureReservedTables
end