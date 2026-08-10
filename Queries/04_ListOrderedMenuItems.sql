select 
r.ReservationId,
m.ItemId,
m.Name,
m.Description,
oi.Quantity
from MenuItems m
join OrderItems oi
on m.ItemId = oi.ItemId
join Orders o 
on oi.OrderId = o.OrderId
join Reservations r
on o.ReservationId = r.ReservationId
where r.ReservationId = 22;
