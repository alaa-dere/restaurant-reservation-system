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