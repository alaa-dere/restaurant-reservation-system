--List of Ordered Menu Items: Lists the menu items ordered by a specific reservation.
SELECT 
	r.ReservationId,
	m.ItemId,
	m.Name,
	m.Description,
	oi.Quantity
FROM MenuItems m
JOIN OrderItems oi
ON m.ItemId = oi.ItemId
JOIN Orders o 
ON oi.OrderId = o.OrderId
JOIN Reservations r
ON o.ReservationId = r.ReservationId
WHERE r.ReservationId = 22;
