DECLARE @Counter INT = 1;

WHILE @Counter <= 500
BEGIN
    DECLARE @ReservationId INT = NULL;
    DECLARE @RestaurantId INT = NULL;
    DECLARE @EmployeeId INT = NULL;
    DECLARE @ReservationDate DATETIME = NULL;
    DECLARE @OrderDate DATETIME;
    DECLARE @TotalAmount DECIMAL(10,2);

    SELECT TOP 1
        @ReservationId = ReservationId,
        @RestaurantId = RestaurantId,
        @ReservationDate = ReservationDate
    FROM Reservations
    ORDER BY NEWID();

    SELECT TOP 1
        @EmployeeId = EmployeeId
    FROM Employees
    WHERE RestaurantId = @RestaurantId
    ORDER BY NEWID();

    IF @EmployeeId IS NULL
        CONTINUE;

    SET @OrderDate =
        DATEADD(
            MINUTE,
            ABS(CHECKSUM(NEWID())) % 180,
            @ReservationDate
        );

    SET @TotalAmount =
        CAST(
            10 + (ABS(CHECKSUM(NEWID())) % 19000) / 100.0
            AS DECIMAL(10,2)
        );

    INSERT INTO Orders
    (
        ReservationId,
        EmployeeId,
        OrderDate,
        TotalAmount
    )
    VALUES
    (
        @ReservationId,
        @EmployeeId,
        @OrderDate,
        @TotalAmount
    );

    SET @Counter = @Counter + 1;
END;