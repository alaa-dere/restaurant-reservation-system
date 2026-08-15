--11. **Database Function - Calculate Restaurant Revenue**:
--    **Function Name**: **`fn_CalculateRevenue`**
--    **Purpose**: Compute revenue made by a specific restaurant.
--    **Parameter**: `RestaurantId`
--    **Return**: total revenue amount for the `RestaurantId` .
CREATE FUNCTION fn_CalculateRevenue(@RestaurantId INT)
RETURNS DECIMAL(10,2)
AS BEGIN
DECLARE @Revenue DECIMAL(10,2)
SELECT @Revenue = ISNULL(SUM(o.TotalAmount), 0)
FROM Orders o
JOIN Reservations r
ON o.ReservationId = r.ReservationId
WHERE r.RestaurantId = @RestaurantId
RETURN @Revenue
END
