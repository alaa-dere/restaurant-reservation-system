select 
r.ReservationDate, 
o.OrderId,
o.OrderDate ,
o.TotalAmount,
r.TableId,
oi.Quantity,
m.name as MenuItem
from Reservations r
join Orders o
on r.ReservationId=o.ReservationId
join OrderItems oi
on o.OrderId= oi.OrderId
join MenuItems m
on oi.ItemId=m.ItemId
where r.ReservationId=20;