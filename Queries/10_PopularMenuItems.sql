with MenuItemPopularity as(
select
r.RestaurantId,
res.Name as RestaurantName,
m.ItemId,
m.Name as MenuItemName,
sum(oi.Quantity) as TotalOrdered,
rank() over(
partition by r.RestaurantId
order by sum(oi.Quantity) desc) as ItemRank
from Reservations r
join Orders o
on r.ReservationId = o.ReservationId
join OrderItems oi
on o.OrderId = oi.OrderId
join MenuItems m
on oi.ItemId = m.ItemId
join Restaurants res
on r.RestaurantId = res.RestaurantId
where MONTH(o.OrderDate) = 8
and YEAR(o.OrderDate) = 2026
group by r.RestaurantId,res.Name,m.ItemId,m.Name)

select
RestaurantId,
RestaurantName,
ItemId,
MenuItemName,
TotalOrdered
from MenuItemPopularity
where ItemRank = 1;