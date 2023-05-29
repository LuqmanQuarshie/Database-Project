CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR NOT NULL,
  Address VARCHAR NOT NULL,
  Contact VARCHAR,
  Payment VARCHAR NOT NULL
);



INSERT INTO Customers (CustomerID, Name, Address, Contact, Payment)
VALUES 
(1, 'John Smith', '123 Main St', '555-5555', 'Credit Card'),
(2, 'Jane Doe', '456 Broadway', '555-1234', 'Cash'),
(3, 'Bob Johnson', '789 Elm St', '555-9876', 'Debit Card'),
(4, 'Dave Wilson', '541 UG St', '555-0987', 'Cash'),
(5, 'John Doe', '59 Legon St', '555-2468', 'Cedit Card');



CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  Name VARCHAR NOT NULL,
  Description VARCHAR,
  Price DECIMAL NOT NULL
);


INSERT INTO Products (ProductID, Name, Description, Price)
VALUES 
(0010, 'Gasoline', 'Regular Unleaded', 2.89),
(0020, 'Snacks', 'Chips and Candy', 1.99),
(0030, 'Beverages', 'Soft Drinks and Energy Drinks', 1.49),
(0040, 'Pastries', 'Pies and Donuts', 2.00),
(0050, 'Toiletries', 'Antiseptics and Soaps', 3.00),
(0060, 'Hygeine and Body Care', 'ToothBrush, ToothPaste, Mouthwash, and Cosmetics', 3.49),
(0070, 'Foods', 'Canned Food, Desserts, and Ice Cream', 2.89);




CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT REFERENCES Customers(CustomerID),
  ProductID INT REFERENCES Products(ProductID),
  Quantity INT NOT NULL,
  Amount DECIMAL NOT NULL,
  Date DATE NOT NULL
);


INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, Amount, Date)
VALUES 
(1101, 1, 0040, 10, 28.90, '2023-04-01'),
(1102, 2, 0020, 5, 9.95, '2023-04-02'),
(1103, 3, 0060, 2, 2.98, '2023-04-03'),
(1104, 4, 0070, 7, 15.99, '2023-04-15'),
(1105, 5, 0030, 12, 42.67, '2023-04-21');


CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR NOT NULL,
  Contact VARCHAR NOT NULL,
  Role VARCHAR NOT NULL
);


INSERT INTO Employees (EmployeeID, Name, Contact, Role)
VALUES 
(555001, 'Mike Johnson', '555-1111', 'Manager'),
(555002, 'Sarah Lee', '555-2222', 'Cashier'),
(555003, 'David Smith', '555-3333', 'Attendant'),
(555004, 'Megan Welson', '555-5555', 'Stock keeper'),
(555005, 'Michael Williams', '555-4444','Shift supervisor'),
(555006, 'Freda Adams', '555-7777', 'Financial accountant'),
(555007, 'Luqman Samir', '555-6666', 'Attendant');


CREATE TABLE Shifts (
  ShiftID INT PRIMARY KEY,
  EmployeeID INT REFERENCES Employees(EmployeeID),
  Start_time TIMESTAMP NOT NULL,
  End_time TIMESTAMP NOT NULL,
  Da_te DATE NOT NULL
);

INSERT INTO Shifts (ShiftID, EmployeeID, Start_time, End_time, Da_te)
VALUES 
(701, 555002, '2023-04-01 08:00:00', '2023-04-01 16:00:00', '2023-04-01'),
(702, 555005, '2023-04-02 08:00:00', '2023-04-02 16:00:00', '2023-04-02'),
(703, 555004, '2023-04-03 08:00:00', '2023-04-03 16:00:00', '2023-04-03'),
(704, 555001, '2023-04-04 08:00:00', '2023-04-04 16:00:00', '2023-04-04'),
(705, 555003, '2023-04-05 08:00:00', '2023-04-05 16:00:00', '2023-04-05'),
(706, 555006, '2023-04-06 08:00:00', '2023-04-06 16:00:00', '2023-04-06'),
(707, 555007, '2023-04-07 08:00:00', '2023-04-07 16:00:00', '2023-04-07');


CREATE TABLE Sales (
  SaleID INT PRIMARY KEY,
  EmployeeID INT REFERENCES Employees(EmployeeID),
  OrderID INT REFERENCES Orders(OrderID),
  TotalAmount DECIMAL NOT NULL,
  Date DATE NOT NULL
);

INSERT INTO Sales (SaleID, EmployeeID, OrderID, TotalAmount, Date)
VALUES 
(1234, 555002, 1101, 28.90, '2023-04-01'),
(1243, 555004, 1102, 9.95, '2023-04-02'),
(1324, 555005, 1103, 34.98, '2023-04-03'),
(1342, 555005, 1104, 17.55, '2023-04-04'),
(1423, 555005, 1105, 22.99, '2023-04-05');


create table Supplier(
SupplierID varchar primary key not null,
SupplierName varchar not null,
QuantitySupplied int not null,  
PhoneNumber varchar not null,
SupplierEmail varchar not null  
);

insert into Supplier(SupplierID,SupplierName,QuantitySupplied,PhoneNumber,SupplierEmail)
values
('0010','Bel Company ltd',1000,'555-0011','mmabun@st.ug.edu.gh'),
('0020','Voltic company ltd',100,'555-0012','mmabun@st.ug.edu.gh'),
('0030','Lavish Company ltd',200,'555-0013','opeffiong@st.ug.edu.gh'),
('0040','Ghana candys ltd',200,'555-0014','opeffiong@st.ug.edu.gh'),
('0050','Car aid company',1200,'555-0015','gnanane002@st.ug.edu.gh'),
('Gas01','Chevron',148759175,'555-0017','kbaddoo@st.ug.edu.gh'),
('Gas02','Chevron',148759175,'555-0018','kbaddoo@st.ug.edu.gh'),
('Pod01','Gazprom',7856921,'555-0019','gazprom@st.ug.edu.gh');




create table Fuel(
FuelID varchar primary key not null,
FuelType varchar not null,
Price_per_litre decimal(10,2) not null,  
Quantity_ltr int not null
);

insert into Fuel(FuelID,FuelType,Price_per_litre,Quantity_ltr)
values
('Gas01','Petrol','20.12',784589),
('Gas02','Diesel','16.52',458759),
('Pod01','Kerosene','14.58',945823);


SELECT *
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT *
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT *
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


CREATE FUNCTION new_order_audit() 
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO Sales (EmployeeID, OrderID, TotalAmount, Date)
    VALUES (555002, NEW.OrderID, NEW.Amount, NEW.Date);
    RETURN NEW;
END;
$$;
create trigger new_order
after insert
on Sales
for each row
execute procedure  new_order_audit();


CREATE FUNCTION update_order_audit()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
    UPDATE Sales
    SET TotalAmount = NEW.Amount
    WHERE OrderID = NEW.OrderID;
    RETURN NEW;
END;
$$;

create trigger update_order
after update
on Sales
for each row
execute procedure update_order_audit();



CREATE FUNCTION delete_order_audit()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
    DELETE FROM Sales
    WHERE OrderID = OLD.OrderID;
    RETURN OLD;
END;
$$;


create trigger  delete_order
after delete
on Sales
for each row
	execute procedure delete_order_audit();
