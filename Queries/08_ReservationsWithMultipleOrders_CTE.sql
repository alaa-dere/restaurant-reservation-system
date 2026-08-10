with ReservationOrders
as
(
select ReservationId,
count(OrderId) as OrderCount
from Orders 
GROUP BY ReservationId
)
select ReservationId,OrderCount
from ReservationOrders
where OrderCount >= 2