--List of Orders and Menu Items: Lists the orders placed on a specific given reservation along with the associated menu items.
SELECT
	r.ReservationDate, 
	o.OrderId,
	o.OrderDate ,
	o.TotalAmount,
	r.TableId,
	oi.Quantity,
	m.name AS MenuItem
FROM Reservations r
JOIN Orders o
ON r.ReservationId=o.ReservationId
JOIN OrderItems oi
ON o.OrderId= oi.OrderId
JOIN MenuItems m
ON oi.ItemId=m.ItemId
WHERE r.ReservationId=20;