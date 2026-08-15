--15. Design a stored procedure that retrieves all tables which have future reservations. Store these tables in a temporary table, then join this temp table with the **`Restaurants`** table to list out the specific information about the associated restaurants.
CREATE PROCEDURE sp_FutureReservedTables
AS BEGIN
CREATE TABLE FutureReservedTables
(
	TableId INT,
	RestaurantId INT,
	ReservationDate DATETIME
)
INSERT INTO FutureReservedTables(TableId,RestaurantId,ReservationDate)
SELECT TableId,RestaurantId,ReservationDate
FROM Reservations
WHERE ReservationDate > GETDATE()
SELECT
	f.TableId,
	f.ReservationDate,
	r.RestaurantId,
	r.Name AS RestaurantName,
	r.Address,
	r.PhoneNumber,
	r.OpeningHours
FROM FutureReservedTables f
JOIN Restaurants r
ON f.RestaurantId = r.RestaurantId
DROP TABLE FutureReservedTables
END