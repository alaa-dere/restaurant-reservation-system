create view [Reservations Report] as
select 
r.ReservationId,
r.TableId,
r.ReservationDate,
r.PartySize,
c.CustomerId,
c.Email,
c.FirstName,
c.LastName,
c.PhoneNumber as customerPhone,
res.RestaurantId,
res.PhoneNumber as ResPhone,
res.OpeningHours,
res.Name as RestaurantName,
res.Address
from Reservations r
join Restaurants res
on r.RestaurantId = res.RestaurantId
join Customers c
on r.CustomerId = c.CustomerId