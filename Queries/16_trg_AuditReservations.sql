create table AuditLog
(
    AuditId int identity(1,1) primary key,
    RestaurantId int NOT NULL,
    TableId int NOT NULL,
    ReservationDate datetime NOT NULL,
    ChangeDate datetime NOT NULL
);
go
create trigger trg_AuditReservations
on Reservations
after insert
as begin
    insert into AuditLog
    (
      RestaurantId,
      TableId,
      ReservationDate,
      ChangeDate
    )
    select
      RestaurantId,
      TableId,
      ReservationDate,
      getdate()
    from inserted
end
