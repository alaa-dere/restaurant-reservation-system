--Retrieve Reservations Report with Views: Use a view to list all reservations information including restaurants and customers information.
CREATE VIEW [Reservations Report] AS
SELECT 
	r.ReservationId,
	r.TableId,
	r.ReservationDate,
	r.PartySize,
	c.CustomerId,
	c.Email,
	c.FirstName,
	c.LastName,
	c.PhoneNumber AS customerPhone,
	res.RestaurantId,
	res.PhoneNumber AS ResPhone,
	res.OpeningHours,
	res.Name AS RestaurantName,
	res.Address
FROM Reservations r
JOIN Restaurants res
ON r.RestaurantId = res.RestaurantId
JOIN Customers c
ON r.CustomerId = c.CustomerId