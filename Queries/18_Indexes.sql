--Create the needed Indexes to the Tech-Lib project you built earlier.
CREATE INDEX IX_Reservations_CustomerId
ON Reservations(CustomerId);

CREATE INDEX IX_Reservations_RestaurantId
ON Reservations(RestaurantId);

CREATE INDEX IX_Orders_ReservationId
ON Orders(ReservationId);

CREATE INDEX IX_Orders_EmployeeId
ON Orders(EmployeeId);

CREATE INDEX IX_OrderItems_OrderId
ON OrderItems(OrderId);

CREATE INDEX IX_OrderItems_ItemId
ON OrderItems(ItemId);

CREATE INDEX IX_MenuItems_RestaurantId
ON MenuItems(RestaurantId);

CREATE INDEX IX_Employees_RestaurantId
ON Employees(RestaurantId);

CREATE INDEX IX_Orders_OrderDate
ON Orders(OrderDate);