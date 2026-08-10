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