create index IX_Reservations_CustomerId
on Reservations(CustomerId);

create index IX_Reservations_RestaurantId
on Reservations(RestaurantId);

create index IX_Orders_ReservationId
on Orders(ReservationId);

create index IX_Orders_EmployeeId
on Orders(EmployeeId);

create index IX_OrderItems_OrderId
on OrderItems(OrderId);

create index IX_OrderItems_ItemId
on OrderItems(ItemId);

create index IX_MenuItems_RestaurantId
on MenuItems(RestaurantId);

create index IX_Employees_RestaurantId
on Employees(RestaurantId);

create index IX_Orders_OrderDate
on Orders(OrderDate);