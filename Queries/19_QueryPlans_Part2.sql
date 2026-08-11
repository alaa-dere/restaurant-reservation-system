-- Query 1: Orders and Menu Items
SELECT
    r.ReservationId,
    c.FirstName,
    c.LastName,
    res.Name AS RestaurantName,
    r.ReservationDate,
    r.PartySize
FROM Reservations AS r
JOIN Customers AS c
ON r.CustomerId = c.CustomerId
JOIN Restaurants AS res
ON r.RestaurantId = res.RestaurantId
WHERE r.CustomerId = 300;

-- Query 8: Reservations With Multiple Orders Using CTE
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

-- Query 9: Restaurant Popularity
select res.RestaurantId,
res.Name,
count(r.ReservationId) AS ReservationCount,
rank() over(
order by count(r.ReservationId) desc
)AS PopularityRank
from Restaurants res
join Reservations r
on res.RestaurantId = r.RestaurantId
group by
res.RestaurantId,
res.Name;

-- Query 10: Popular Menu Item Per Restaurant
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

-- Query 6: Reservations Report View
select *from  [Reservations Report];