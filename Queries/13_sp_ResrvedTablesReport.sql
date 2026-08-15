--13. **Stored Procedure - Borrowed Books Report**:
--    **Procedure Name**: **`sp_ResrvedTablesReport`**
--    **Purpose**: Generate a report of tables reserved within a specified date range.
--    **Parameters**: **`StartDate`**, **`EndDate`**
--    **Implementation**: Retrieve all tables reserved within the given range, with details like reservation date, party size and restaurant details.
--    **Return**: Tabulated report of reserved tables.
CREATE PROCEDURE sp_ResrvedTablesReport
(@StartDate DATETIME,@EndDate DATETIME)
AS BEGIN
SELECT 
	t.TableId,
	t.Capacity,
	r.ReservationId,
	r.ReservationDate,
	r.PartySize,
	res.RestaurantId,
	res.Name AS RestaurantName,
	res.Address,
	res.PhoneNumber AS RestaurantPhone
FROM Reservations r
JOIN Tables t
ON r.TableId=t.TableId
JOIN Restaurants res
ON r.RestaurantId=res.RestaurantId
WHERE r.ReservationDate between @StartDate and @EndDate
ORDER BY r.ReservationDate
END