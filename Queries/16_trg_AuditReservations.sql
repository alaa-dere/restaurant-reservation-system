--Design a trigger to log an entry into a separate AuditLog table whenever a table get reserved. The AuditLog should capture ResturantId, TableId, ReservationDate and ChangeDate.
CREATE TABLE AuditLog
(
    AuditId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    TableId INT NOT NULL,
    ReservationDate DATETIME NOT NULL,
    ChangeDate DATETIME NOT NULL
)
GO
CREATE TRIGGER trg_AuditReservations
ON Reservations
AFTER INSERT
AS BEGIN
    INSERT INTO AuditLog
    (
      RestaurantId,
      TableId,
      ReservationDate,
      ChangeDate
    )
    SELECT
      RestaurantId,
      TableId,
      ReservationDate,
      GETDATE()
    FROM inserted
END
