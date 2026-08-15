--Reservation’s Order with CTEs: Identify reservations which have 2 or more orders using CTEs.
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