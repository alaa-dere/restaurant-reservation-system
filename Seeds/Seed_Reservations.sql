DECLARE @Counter INT = 1;

WHILE @Counter <= 500
BEGIN
    DECLARE @CustomerId INT;
    DECLARE @RestaurantId INT;
    DECLARE @TableId INT;
    DECLARE @Capacity INT;
    DECLARE @PartySize INT;
    DECLARE @ReservationDate DATETIME;

    SELECT TOP 1
        @CustomerId = CustomerId
    FROM Customers
    ORDER BY NEWID();

    SELECT TOP 1
        @TableId = TableId,
        @RestaurantId = RestaurantId,
        @Capacity = Capacity
    FROM Tables
    ORDER BY NEWID();

    SET @PartySize = 1 + ABS(CHECKSUM(NEWID())) % @Capacity;

    SET @ReservationDate =
        DATEADD(
            DAY,
            (ABS(CHECKSUM(NEWID())) % 181) - 90,
            GETDATE()
        );

    INSERT INTO Reservations
    (
        CustomerId,
        RestaurantId,
        TableId,
        ReservationDate,
        PartySize
    )
    VALUES
    (
        @CustomerId,
        @RestaurantId,
        @TableId,
        @ReservationDate,
        @PartySize
    );

    SET @Counter = @Counter + 1;
END;