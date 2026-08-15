DECLARE @Counter INT = 1;

WHILE @Counter <= 1500
BEGIN
    DECLARE @OrderId INT = NULL;
    DECLARE @RestaurantId INT = NULL;
    DECLARE @ItemId INT = NULL;
    DECLARE @Quantity INT;

    SELECT TOP 1
        @OrderId = o.OrderId,
        @RestaurantId = r.RestaurantId
    FROM Orders o
    JOIN Reservations r
        ON o.ReservationId = r.ReservationId
    ORDER BY NEWID();

    SELECT TOP 1
        @ItemId = ItemId
    FROM MenuItems
    WHERE RestaurantId = @RestaurantId
    ORDER BY NEWID();

    IF @ItemId IS NULL
        CONTINUE;

    SET @Quantity =
        1 + ABS(CHECKSUM(NEWID())) % 5;

    INSERT INTO OrderItems
    (
        OrderId,
        ItemId,
        Quantity
    )
    VALUES
    (
        @OrderId,
        @ItemId,
        @Quantity
    );

    SET @Counter = @Counter + 1;
END;