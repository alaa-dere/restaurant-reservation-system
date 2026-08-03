USE RestaurantReservationDB;
GO

DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Tables;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS MenuItems;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Restaurants;
GO

CREATE TABLE Restaurants (
    RestaurantId INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) ,
    PhoneNumber VARCHAR(20),
    OpeningHours VARCHAR(100)
);
GO

CREATE TABLE Customers (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);
GO

CREATE TABLE MenuItems (
    ItemId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(300),
    Price DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_MenuItems_Restaurants FOREIGN KEY (RestaurantId)
        REFERENCES Restaurants(RestaurantId)
);
GO

CREATE TABLE Employees (
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    CONSTRAINT FK_Employees_Restaurants FOREIGN KEY (RestaurantId)
        REFERENCES Restaurants(RestaurantId)
);
GO

CREATE TABLE Tables (
    TableId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT NOT NULL,
    Capacity INT NOT NULL,
    CONSTRAINT FK_Tables_Restaurants FOREIGN KEY (RestaurantId)
        REFERENCES Restaurants(RestaurantId)
);
GO

CREATE TABLE Reservations (
    ReservationId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    RestaurantId INT NOT NULL,
    TableId INT NOT NULL,
    ReservationDate DATETIME NOT NULL,
    PartySize INT NOT NULL,
    CONSTRAINT FK_Reservations_Customers FOREIGN KEY (CustomerId)
        REFERENCES Customers(CustomerId),
    CONSTRAINT FK_Reservations_Restaurants FOREIGN KEY (RestaurantId)
        REFERENCES Restaurants(RestaurantId),
    CONSTRAINT FK_Reservations_Tables FOREIGN KEY (TableId)
        REFERENCES Tables(TableId)
);
GO

CREATE TABLE Orders (
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    ReservationId INT NOT NULL,
    EmployeeId INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Orders_Reservations FOREIGN KEY (ReservationId)
        REFERENCES Reservations(ReservationId),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeId)
        REFERENCES Employees(EmployeeId)
);
GO

CREATE TABLE OrderItems (
    OrderItemId INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    ItemId INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId),
    CONSTRAINT FK_OrderItems_MenuItems FOREIGN KEY (ItemId)
        REFERENCES MenuItems(ItemId)
);
GO