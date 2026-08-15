--Restaurant Popularity using Aggregation: Rank restaurants by the reservation frequency.
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