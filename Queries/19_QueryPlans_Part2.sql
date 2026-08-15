--Check the query plans for the 5 queries selected in Req #15 after adding some indexes.
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
WITH ReservationOrders
AS
(
SELECT
	ReservationId,
	COUNT(OrderId) AS OrderCount
FROM Orders 
GROUP BY ReservationId
)
SELECT ReservationId,OrderCount
FROM ReservationOrders
WHERE OrderCount >= 2

-- Query 9: Restaurant Popularity
SELECT
	res.RestaurantId,
	res.Name,
	COUNT(r.ReservationId) AS ReservationCount,
	RANK() OVER(
	ORDER BY COUNT(r.ReservationId) DESC) AS PopularityRank
FROM Restaurants res
JOIN Reservations r
ON res.RestaurantId = r.RestaurantId
GROUP BY res.RestaurantId,res.Name;

-- Query 10: Popular Menu Item Per Restaurant
WITH MenuItemPopularity AS(
SELECT
	r.RestaurantId,
	res.Name AS RestaurantName,
	m.ItemId,
	m.Name AS MenuItemName,
	SUM(oi.Quantity) AS TotalOrdered,
	RANK() OVER(
	PARTITION BY r.RestaurantId
	ORDER BY SUM(oi.Quantity) DESC) AS ItemRank
FROM Reservations r
JOIN Orders o
ON r.ReservationId = o.ReservationId
JOIN OrderItems oi
ON o.OrderId = oi.OrderId
JOIN MenuItems m
ON oi.ItemId = m.ItemId
JOIN Restaurants res
ON r.RestaurantId = res.RestaurantId
WHERE MONTH(o.OrderDate) = 8 AND YEAR(o.OrderDate) = 2026
GROUP BY r.RestaurantId,res.Name,m.ItemId,m.Name)

SELECT
	RestaurantId,
	RestaurantName,
	ItemId,
	MenuItemName,
	TotalOrdered
FROM MenuItemPopularity
WHERE ItemRank = 1;

-- Query 6: Reservations Report View
SELECT *FROM  [Reservations Report];