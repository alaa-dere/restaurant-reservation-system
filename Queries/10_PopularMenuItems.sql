--Popular Menu Item Analysis using Joins and Window Functions: Identify the most popular menu item for each restaurant for a given month.
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